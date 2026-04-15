<?php

namespace Dao\Cart;

class CarritoFlor extends \Dao\Table
{
    // ── CARRETILLA ────────────────────────────────────────────

    public static function getItems(int $usercod): array
    {
        $sql = "SELECT cf.*, a.arrnombre, a.arrdescripcion, a.arrimgurl,
                       a.arrocasion, a.arrtamano, a.arrstock, a.arrest
                FROM carretilla_flor cf
                INNER JOIN arreglos a ON a.arrcod = cf.arrcod
                WHERE cf.usercod = :usercod
                ORDER BY cf.fching DESC;";
        return self::obtenerRegistros($sql, ['usercod' => $usercod]);
    }

    public static function getItem(int $usercod, int $arrcod): ?array
    {
        $sql = "SELECT * FROM carretilla_flor WHERE usercod=:usercod AND arrcod=:arrcod LIMIT 1;";
        $r = self::obtenerUnRegistro($sql, ['usercod' => $usercod, 'arrcod' => $arrcod]);
        return $r ?: null;
    }

    public static function addItem(int $usercod, int $arrcod, int $cantidad, float $precio): bool
    {
        $existing = self::getItem($usercod, $arrcod);
        if ($existing) {
            $nuevaCantidad = $existing['cantidad'] + $cantidad;
            $sql = "UPDATE carretilla_flor SET cantidad=:cantidad, fching=NOW()
                    WHERE usercod=:usercod AND arrcod=:arrcod;";
            return self::executeNonQuery($sql, [
                'cantidad' => $nuevaCantidad,
                'usercod'  => $usercod,
                'arrcod'   => $arrcod
            ]);
        }
        $sql = "INSERT INTO carretilla_flor (usercod, arrcod, cantidad, precio, fching)
                VALUES (:usercod, :arrcod, :cantidad, :precio, NOW());";
        return self::executeNonQuery($sql, [
            'usercod'  => $usercod,
            'arrcod'   => $arrcod,
            'cantidad' => $cantidad,
            'precio'   => $precio
        ]);
    }

    public static function updateCantidad(int $usercod, int $arrcod, int $cantidad): bool
    {
        if ($cantidad <= 0) {
            return self::removeItem($usercod, $arrcod);
        }
        $sql = "UPDATE carretilla_flor SET cantidad=:cantidad, fching=NOW()
                WHERE usercod=:usercod AND arrcod=:arrcod;";
        return self::executeNonQuery($sql, [
            'cantidad' => $cantidad,
            'usercod'  => $usercod,
            'arrcod'   => $arrcod
        ]);
    }

    public static function removeItem(int $usercod, int $arrcod): bool
    {
        $sql = "DELETE FROM carretilla_flor WHERE usercod=:usercod AND arrcod=:arrcod;";
        return self::executeNonQuery($sql, ['usercod' => $usercod, 'arrcod' => $arrcod]);
    }

    public static function clearCart(int $usercod): bool
    {
        $sql = "DELETE FROM carretilla_flor WHERE usercod=:usercod;";
        return self::executeNonQuery($sql, ['usercod' => $usercod]);
    }

    public static function getTotal(int $usercod): float
    {
        $items = self::getItems($usercod);
        $total = 0.0;
        foreach ($items as $item) {
            $total += $item['precio'] * $item['cantidad'];
        }
        return $total;
    }

    public static function countItems(int $usercod): int
    {
        $sql = "SELECT SUM(cantidad) as total FROM carretilla_flor WHERE usercod=:usercod;";
        $r = self::obtenerUnRegistro($sql, ['usercod' => $usercod]);
        return intval($r['total'] ?? 0);
    }

    // ── TRANSACCIONES ─────────────────────────────────────────

    public static function guardarTransaccion(
        int    $usercod,
        string $paypalOrder,
        string $paypalStatus,
        float  $total,
        string $moneda,
        string $detalleJson,
        array  $items
    ): int {
        // Insertar cabecera
        $sqlHead = "INSERT INTO transacciones
                    (usercod, paypal_order, paypal_status, total, moneda, detalle_json, fching)
                    VALUES (:usercod, :paypal_order, :paypal_status, :total, :moneda, :detalle_json, NOW());";
        self::executeNonQuery($sqlHead, [
            'usercod'       => $usercod,
            'paypal_order'  => $paypalOrder,
            'paypal_status' => $paypalStatus,
            'total'         => $total,
            'moneda'        => $moneda,
            'detalle_json'  => $detalleJson,
        ]);

        // Obtener el ID insertado
        $r = self::obtenerUnRegistro(
            "SELECT MAX(trxcod) as id FROM transacciones WHERE usercod=:usercod;",
            ['usercod' => $usercod]
        );
        $trxcod = intval($r['id'] ?? 0);

        // Insertar detalle por ítem
        foreach ($items as $item) {
            $sqlDet = "INSERT INTO transacciones_detalle
                       (trxcod, arrcod, arrnombre, cantidad, precio_unit, subtotal)
                       VALUES (:trxcod, :arrcod, :arrnombre, :cantidad, :precio_unit, :subtotal);";
            self::executeNonQuery($sqlDet, [
                'trxcod'      => $trxcod,
                'arrcod'      => $item['arrcod'],
                'arrnombre'   => $item['arrnombre'],
                'cantidad'    => $item['cantidad'],
                'precio_unit' => $item['precio'],
                'subtotal'    => $item['precio'] * $item['cantidad'],
            ]);
        }

        return $trxcod;
    }

    public static function getTransacciones(int $usercod): array
    {
        $sql = "SELECT * FROM transacciones WHERE usercod=:usercod ORDER BY fching DESC;";
        return self::obtenerRegistros($sql, ['usercod' => $usercod]);
    }

    public static function getTransaccionDetalle(int $trxcod, int $usercod): ?array
    {
        $sqlHead = "SELECT * FROM transacciones WHERE trxcod=:trxcod AND usercod=:usercod LIMIT 1;";
        $head = self::obtenerUnRegistro($sqlHead, ['trxcod' => $trxcod, 'usercod' => $usercod]);
        if (!$head) return null;

        $sqlDet = "SELECT * FROM transacciones_detalle WHERE trxcod=:trxcod ORDER BY trxdetcod;";
        $head['items'] = self::obtenerRegistros($sqlDet, ['trxcod' => $trxcod]);
        return $head;
    }

    // Todas las transacciones (para admin)
    public static function getAllTransacciones(): array
    {
        $sql = "SELECT t.*, u.username, u.useremail
                FROM transacciones t
                INNER JOIN usuario u ON u.usercod = t.usercod
                ORDER BY t.fching DESC;";
        return self::obtenerRegistros($sql, []);
    }
}
?>
