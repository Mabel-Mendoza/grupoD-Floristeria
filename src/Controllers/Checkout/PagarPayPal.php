<?php

namespace Controllers\Checkout;

use Controllers\PrivateController;
use Dao\Cart\CarritoFlor;
use Utilities\Security;
use Utilities\Site;
use Utilities\Context;
use Utilities\PayPal\PayPalRestApi;
use Utilities\Paypal\PayPalOrder;

class PagarPayPal extends PrivateController
{
    public function run(): void
    {
        $userId = intval(Security::getUserId());
        $items  = CarritoFlor::getItems($userId);

        if (empty($items)) {
            Site::redirectTo("index.php?page=Checkout_Carretilla");
            return;
        }

        // ── Construir la URL base del servidor automáticamente ──────────────
        // Esto evita el ERR_CONNECTION_REFUSED cuando el servidor corre en un
        // puerto distinto al 80 (ej: localhost:8080)
        $scheme   = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? 'https' : 'http';
        $host     = $_SERVER['HTTP_HOST']; // incluye el puerto si no es el default (ej: localhost:8080)
        $baseDir  = rtrim(Context::getContextByKey('BASE_DIR'), '/');
        $serverBase = $scheme . '://' . $host . $baseDir;

        $cancelUrl = $serverBase . "/index.php?page=Checkout_Carretilla";
        $returnUrl = $serverBase . "/index.php?page=Checkout_AceptarPago";

        $refId = "FLOR-" . $userId . "-" . time();

        $paypalOrder = new PayPalOrder($refId, $cancelUrl, $returnUrl);

        foreach ($items as $item) {
            $precioUSD = round($item['precio'] / 26.0, 2);
            $paypalOrder->addItem(
                $item['arrnombre'],
                substr($item['arrdescripcion'] ?? 'Arreglo floral', 0, 120),
                "ARR-" . $item['arrcod'],
                $precioUSD,
                0,
                intval($item['cantidad']),
                "PHYSICAL_GOODS"
            );
        }

        $api = new PayPalRestApi(
            Context::getContextByKey("PAYPAL_CLIENT_ID"),
            Context::getContextByKey("PAYPAL_CLIENT_SECRET")
        );
        $api->getAccessToken();
        $response = $api->createOrder($paypalOrder);

        if (!isset($response->id)) {
            Site::redirectTo("index.php?page=Checkout_Carretilla&error=paypal");
            return;
        }

        // Guardar en sesión para validar en AceptarPago
        $_SESSION['paypal_order_id'] = $response->id;
        $_SESSION['paypal_user_id']  = $userId;
        $_SESSION['paypal_items']    = $items;

        foreach ($response->links as $link) {
            if ($link->rel === "approve") {
                Site::redirectTo($link->href);
                return;
            }
        }

        Site::redirectTo("index.php?page=Checkout_Carretilla&error=paypal");
    }
}
?>
