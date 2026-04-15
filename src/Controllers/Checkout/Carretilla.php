<?php

namespace Controllers\Checkout;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Cart\CarritoFlor;
use Dao\Mantenimientos\Arreglos as ArreglosDAO;
use Utilities\Security;
use Utilities\Site;
use Utilities\Context;

class Carretilla extends PrivateController
{
    private int $userId;

    public function __construct()
    {
        parent::__construct();
        $this->userId = intval(Security::getUserId());
        Site::addLink("public/css/floristeria-carrito.css");
    }

    public function run(): void
    {
        // ── Acción desde catálogo: agregar directo por GET ──────
        $addId = intval($_GET['add'] ?? 0);
        if ($addId > 0) {
            $qty = max(1, intval($_GET['qty'] ?? 1));
            $arr = ArreglosDAO::getArregloById($addId);
            if ($arr && $arr['arrest'] === 'ACT') {
                CarritoFlor::addItem($this->userId, $addId, $qty, (float)$arr['arrprecio']);
            }
            Site::redirectTo("index.php?page=Checkout_Carretilla&msg=agregado");
            return;
        }

        // ── Acciones POST (actualizar cantidad / eliminar) ───────
        if ($this->isPostBack()) {
            $accion = $_POST['accion'] ?? '';
            $arrcod = intval($_POST['arrcod'] ?? 0);

            switch ($accion) {
                case 'actualizar':
                    $cant = intval($_POST['cantidad'] ?? 1);
                    CarritoFlor::updateCantidad($this->userId, $arrcod, $cant);
                    break;
                case 'eliminar':
                    CarritoFlor::removeItem($this->userId, $arrcod);
                    break;
                case 'vaciar':
                    CarritoFlor::clearCart($this->userId);
                    break;
            }
            Site::redirectTo("index.php?page=Checkout_Carretilla");
            return;
        }

        // ── Leer ítems ───────────────────────────────────────────
        $items = CarritoFlor::getItems($this->userId);
        $total = 0.0;
        foreach ($items as &$item) {
            $item['subtotal']    = $item['precio'] * $item['cantidad'];
            $item['subtotalFmt'] = number_format($item['subtotal'], 2);
            $item['precioFmt']   = number_format($item['precio'], 2);
            $total += $item['subtotal'];
        }

        $totalUSD = round($total / 26.0, 2); // tipo de cambio aprox HNL→USD

        $viewData = [
            'items'       => $items,
            'hayItems'    => count($items) > 0,
            'noHayItems'  => count($items) === 0,
            'totalHNL'    => number_format($total, 2),
            'totalUSD'    => number_format($totalUSD, 2),
            'msgAgregado' => isset($_GET['msg']) && $_GET['msg'] === 'agregado',
            'baseUrl'     => Context::getContextByKey('BASE_DIR'),
        ];

        Renderer::render("checkout/carretilla", $viewData, "privatelayout.view.tpl");
    }
}
?>
