<?php

namespace Controllers;

use Controllers\PublicController;
use Views\Renderer;
use Utilities\Site;  

class Galeria extends PublicController
{
    public function run(): void
    {
        Site::addLink("public/css/galeria.css");
        $galeria = [
            ["img" => "imgs/galeria/14.jpeg"],
            ["img" => "imgs/galeria/1.avif"],
            ["img" => "imgs/galeria/2.avif"],
            ["img" => "imgs/galeria/13.jpeg"],
            ["img" => "imgs/galeria/4.jpg"],
            ["img" => "imgs/galeria/5.avif"],
            ["img" => "imgs/galeria/6.webp"],
            ["img" => "imgs/galeria/7.jpg"],
            ["img" => "imgs/galeria/8.avif"],
            ["img" => "imgs/galeria/9.jpeg"],
            ["img" => "imgs/galeria/10.jpeg"],
            ["img" => "imgs/galeria/11.jpeg"],
            ["img" => "imgs/galeria/12.jpeg"]
        ];

        Renderer::render("galeria", [
            "galeria" => $galeria
        ]);
    }
}