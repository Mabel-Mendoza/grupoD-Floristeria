<?php

namespace Controllers;

use Views\Renderer;

class About extends PublicController
{
    public function run(): void
    {
        $viewData = [
            "nombre" => "Mabel Mendoza",
            "correo" => "anaimabel39@gmail.com",
            "telefono" => "0000-0000"
        ];

        Renderer::render("about", $viewData);
    }
}
