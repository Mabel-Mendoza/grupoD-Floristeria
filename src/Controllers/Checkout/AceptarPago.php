<?php

namespace Controllers\Checkout;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Cart\CarritoFlor;
use Utilities\Security;
use Utilities\Site;
use Utilities\PayPal\PayPalRestApi;
use Utilities\Context;

class AceptarPago extends PrivateController
{
    public function run(): void
    {
        Site::addLink("public/css/floristeria-carrito.css");

        $token        = $_GET['token']  ?? '';
        $sessionOrder = $_SESSION['paypal_order_id'] ?? '';
        $userId       = intval($_SESSION['paypal_user_id'] ?? Security::getUserId());
        $items        = $_SESSION['paypal_items'] ?? [];

        // Validar que el token coincide con lo guardado en sesión
        if ($token === '' || $token !== $sessionOrder) {
            Site::redirectTo("index.php?page=Checkout_Carretilla&error=token");
            return;
        }

        // Capturar el pago en PayPal
        $api = new PayPalRestApi(
            Context::getContextByKey("PAYPAL_CLIENT_ID"),
            Context::getContextByKey("PAYPAL_CLIENT_SECRET")
        );
        $api->getAccessToken();
        $result = $api->captureOrder($sessionOrder);

        $status   = $result->status ?? 'ERROR';
        $paypalId = $result->id     ?? $sessionOrder;
        $moneda   = 'USD';
        $totalUSD = 0.0;

        if (isset($result->purchase_units[0]->payments->captures[0]->amount->value)) {
            $totalUSD = floatval($result->purchase_units[0]->payments->captures[0]->amount->value);
            $moneda   = $result->purchase_units[0]->payments->captures[0]->amount->currency_code ?? 'USD';
        }

        // Convertir a lempiras para guardar
        $totalHNL    = round($totalUSD * 26.0, 2);
        $detalleJson = json_encode($result, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);

        // Guardar transacción en BD
        $trxcod = 0;
        if ($status === 'COMPLETED') {
            $trxcod = CarritoFlor::guardarTransaccion(
                $userId,
                $paypalId,
                $status,
                $totalHNL,
                'HNL',
                $detalleJson,
                $items
            );
            // Vaciar carrito
            CarritoFlor::clearCart($userId);

            // Limpiar sesión PayPal
            unset($_SESSION['paypal_order_id'], $_SESSION['paypal_user_id'], $_SESSION['paypal_items']);
        }

        $esExitoso = ($status === 'COMPLETED');

        // Preparar items para la vista
        $itemsVista = $items;
        foreach ($itemsVista as &$it) {
            $it['subtotalFmt'] = number_format($it['precio'] * $it['cantidad'], 2);
            $it['precioFmt']   = number_format($it['precio'], 2);
        }
        unset($it);

        $viewData = [
            'esExitoso' => $esExitoso,
            'esError'   => !$esExitoso,
            'paypalId'  => $paypalId,
            'status'    => $status,
            'totalUSD'  => number_format($totalUSD, 2),
            'totalHNL'  => number_format($totalHNL, 2),
            'moneda'    => $moneda,
            'trxcod'    => $trxcod,
            'items'     => $itemsVista,
            'hayItems'  => count($itemsVista) > 0,
        ];

        Renderer::render("checkout/pago_exitoso", $viewData, "privatelayout.view.tpl");
    }
}
?>
