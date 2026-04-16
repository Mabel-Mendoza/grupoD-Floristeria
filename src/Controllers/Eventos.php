<?php

namespace Controllers;

use Utilities\Site;
use Views\Renderer;

class Eventos extends PublicController
{
    public function run(): void
    {
        Site::addLink("public/css/eventos.css");

        $eventos = [
            [
                "title" => "Celebración Romántica",
                "date" => "Viernes 24 de mayo",
                "type" => "Bodas & Aniversarios",
                "image" => "eventos2.png",
                "description" => "Arreglos elegantes con rosas, margaritas y toques de verde para momentos inolvidables.",
                "price" => "Desde L.1,250"
            ],
            [
                "title" => "Entrega Express",
                "date" => "Sábado 25 de mayo",
                "type" => "Sorpresas & Detalles",
                "image" => "eventos1.png",
                "description" => "Bouquets frescos listos para entregar con diseño premium y papel de regalo personalizado.",
                "price" => "Desde L.699"
            ],
            [
                "title" => "Decoración de Evento",
                "date" => "Domingo 26 de mayo",
                "type" => "Eventos Corporativos",
                "image" => "eventos3.png",
                "description" => "Ambientaciones florales con estilo moderno, perfectas para lanzamientos y reuniones especiales.",
                "price" => "Cotización personalizada"
            ]
        ];

        $viewData = [
            "pageTitle" => "Eventos Florales",
            "pageSubtitle" => "Diseñamos experiencias únicas con flores frescas y detalles hechos a mano.",
            "introText" => "Convierte tu celebración en un recuerdo inolvidable con los arreglos de Promesa de Dios.",
            "events" => $eventos,
            "ctaUrl" => "index.php?page=Contactenos",
            "ctaLabel" => "Solicitar Cotización"
        ];

        Renderer::render("eventos", $viewData);
    }
}
