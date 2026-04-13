<?php

namespace Controllers;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Mantenimientos\Arreglos as ArreglosDAO;

class Catalogo extends PublicController
{
    public function run(): void
    {
        $arreglos = ArreglosDAO::getAllArreglosActivos();

        $viewData = [
            "arreglos" => $arreglos
        ];

        Renderer::render("catalogo", $viewData);
    }
}
