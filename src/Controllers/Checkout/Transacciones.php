<?php

namespace Controllers\Checkout;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Cart\CarritoFlor;
use Utilities\Security;
use Utilities\Site;

class Transacciones extends PrivateController
{
    public function run(): void
    {
        Site::addLink("public/css/floristeria-carrito.css");

        $userId = intval(Security::getUserId());

        $trxList = CarritoFlor::getTransacciones($userId);

        foreach ($trxList as &$trx) {
            $trx['totalFmt'] = number_format($trx['total'], 2);
            $trx['esCompletado'] = $trx['paypal_status'] === 'COMPLETED';
            $trx['esPendiente']  = $trx['paypal_status'] !== 'COMPLETED';
        }

        $viewData = [
            'transacciones'    => $trxList,
            'hayTransacciones' => count($trxList) > 0,
            'noHayTransacc'    => count($trxList) === 0,
        ];

        Renderer::render("checkout/transacciones", $viewData, "privatelayout.view.tpl");
    }
}
?>
