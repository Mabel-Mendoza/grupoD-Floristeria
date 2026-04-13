<?php

namespace Dao\Mantenimientos;

use Dao\Table;

class Arreglos extends Table
{
    /*
    arreglos

    arrcod          INT(11) AI PK
    arrnombre       VARCHAR(255)    -- Nombre del arreglo
    arrdescripcion  TEXT            -- Descripción
    arrtamano       CHAR(3)         -- PEQ, MED, GRN
    arrprecio       DECIMAL(10,2)   -- Precio
    arrimgurl       VARCHAR(255)    -- URL imagen
    arrstock        INT(11)         -- Stock disponible
    arrocasion      VARCHAR(100)    -- Ocasión (Cumpleaños, Boda, etc.)
    arrest          CHAR(3)         -- ACT, INA
    */

    public static function getAllArreglos(): array
    {
        $sqlstr = "SELECT * FROM arreglos ORDER BY arrnombre, arrtamano;";
        return self::obtenerRegistros($sqlstr, []);
    }

    public static function getAllArreglosActivos(): array
    {
        $sqlstr = "SELECT * FROM arreglos WHERE arrest = 'ACT' ORDER BY arrnombre, arrtamano;";
        return self::obtenerRegistros($sqlstr, []);
    }

    public static function getArregloById(int $id): array
    {
        $sqlstr = "SELECT * FROM arreglos WHERE arrcod = :arrcod;";
        $param  = ["arrcod" => $id];
        return self::obtenerUnRegistro($sqlstr, $param);
    }

    public static function getAllTamanos(): array
    {
        $sqlstr = "SELECT * FROM tamanos WHERE tamest = 'ACT' ORDER BY tamcod;";
        return self::obtenerRegistros($sqlstr, []);
    }

    public static function crearArreglo(
        $arrnombre,
        $arrdescripcion,
        $arrtamano,
        $arrprecio,
        $arrimgurl,
        $arrstock,
        $arrocasion,
        $arrest
    ): int {
        $sqlstr = "INSERT INTO arreglos
                    (arrnombre, arrdescripcion, arrtamano, arrprecio, arrimgurl, arrstock, arrocasion, arrest)
                   VALUES
                    (:arrnombre, :arrdescripcion, :arrtamano, :arrprecio, :arrimgurl, :arrstock, :arrocasion, :arrest);";

        return self::executeNonQuery($sqlstr, [
            "arrnombre"      => $arrnombre,
            "arrdescripcion" => $arrdescripcion,
            "arrtamano"      => $arrtamano,
            "arrprecio"      => $arrprecio,
            "arrimgurl"      => $arrimgurl,
            "arrstock"       => $arrstock,
            "arrocasion"     => $arrocasion,
            "arrest"         => $arrest
        ]);
    }

    public static function actualizarArreglo(
        $arrcod,
        $arrnombre,
        $arrdescripcion,
        $arrtamano,
        $arrprecio,
        $arrimgurl,
        $arrstock,
        $arrocasion,
        $arrest
    ): int {
        $sqlstr = "UPDATE arreglos SET
                    arrnombre      = :arrnombre,
                    arrdescripcion = :arrdescripcion,
                    arrtamano      = :arrtamano,
                    arrprecio      = :arrprecio,
                    arrimgurl      = :arrimgurl,
                    arrstock       = :arrstock,
                    arrocasion     = :arrocasion,
                    arrest         = :arrest
                   WHERE arrcod = :arrcod;";

        return self::executeNonQuery($sqlstr, [
            "arrcod"         => $arrcod,
            "arrnombre"      => $arrnombre,
            "arrdescripcion" => $arrdescripcion,
            "arrtamano"      => $arrtamano,
            "arrprecio"      => $arrprecio,
            "arrimgurl"      => $arrimgurl,
            "arrstock"       => $arrstock,
            "arrocasion"     => $arrocasion,
            "arrest"         => $arrest
        ]);
    }

    public static function eliminarArreglo(int $arrcod): int
    {
        // Eliminación lógica: solo cambia el estado a INA
        $sqlstr = "UPDATE arreglos SET arrest = 'INA' WHERE arrcod = :arrcod;";
        return self::executeNonQuery($sqlstr, ["arrcod" => $arrcod]);
    }
}
