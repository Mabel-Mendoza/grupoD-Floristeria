<?php

namespace Controllers;

use Views\Renderer;
use Utilities\Site;

class CuidadoFlores extends PublicController
{
    public function run(): void
    {
        Site::addLink("public/css/cuidadoflores.css");

        $viewData = [
            "titulo" => "Cuidado de las Flores",
            "imagen" => "public/imgs/cuidados/Flores1.png"
        ];

        Renderer::render("cuidado_flores", $viewData);
    }
}
