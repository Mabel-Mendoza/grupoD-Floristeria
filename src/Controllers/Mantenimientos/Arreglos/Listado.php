<?php
// CRUD: (Create, Read, Update, Delete)
//       (INS,   DSP,  UPD,    DEL)

namespace Controllers\Mantenimientos\Arreglos;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Mantenimientos\Arreglos as ArreglosDAO;

const LIST_VIEW_TEMPLATE = "mantenimientos/arreglos/listado";

class Listado extends PrivateController
{
    private array $arreglosList = [];

    public function run(): void
    {
        $this->arreglosList = ArreglosDAO::getAllArreglos();
        Renderer::render(LIST_VIEW_TEMPLATE, $this->prepareViewData());
    }

    private function prepareViewData(): array
    {
        return [
            "arreglos"   => $this->arreglosList,
            "showNew"    => $this->isFeatureAutorized("arreglos_listado_INS"),
            "showUpdate" => $this->isFeatureAutorized("arreglos_listado_UDP"),
            "showDelete" => $this->isFeatureAutorized("arreglos_listado_DEL")
        ];
    }
}
