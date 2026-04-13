<?php

namespace Controllers;

use Views\Renderer;
use Dao\Mantenimientos\Arreglos as ArreglosDAO;

class Index extends PublicController
{
    public function run(): void
    {
        $arreglos = ArreglosDAO::getAllArreglosActivos();

        // Mostrar solo los primeros 4 en la página de inicio
        $destacados = array_slice($arreglos, 0, 4);

        $viewData = [
            "destacados" => $destacados,
            "IS_LOGGED"  => \Utilities\Security::isLogged()
        ];

        Renderer::render("index", $viewData);
    }
}
