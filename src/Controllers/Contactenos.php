<?php

namespace Controllers;

use Views\Renderer;

class Contactenos extends PublicController
{
    public function run(): void
    {
        $viewData = [
            "telefono"   => "+504 9835-3151",
            "email"      => "floristeriapromesadedios@gmail.com",
            "instagram"  => "floristeria_promesa_de_dios_07",
            "facebook"   => "Floristería Promesa de Dios",
            "tiktok"     => "promesa_de_dios_hn",
            "direccion"  => "Tegucigalpa, Blvd. Suyapa frente a la rotonda"
        ];

        Renderer::render("contactenos", $viewData);
    }
}
