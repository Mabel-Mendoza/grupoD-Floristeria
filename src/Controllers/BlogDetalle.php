<?php

namespace Controllers;

use Views\Renderer;
use Utilities\Site;

class BlogDetalle extends PublicController
{
    public function run(): void
    {
        Site::addLink("public/css/floristeria-blog.css");

        $id = $_GET["id"] ?? null;

        // Base de datos simulada (puedes luego moverla a DAO si quieres)
        $articulos = [
            [
                "id" => "rosas",
                "flor" => "Rosas",
                "imgurl" => "imgs/flores_catalogo_clasificado/flores_rosas.jpg",
                "significado" => "Las rosas representan amor, cariño y elegancia. Las rojas suelen expresar amor profundo; las rosadas, ternura y agradecimiento; y las blancas, pureza, respeto y paz.",
                "fechas" => "San Valentín, aniversarios, cumpleaños, Día de la Madre y ocasiones románticas.",
                "historia" => "La rosa ha sido una de las flores más valoradas desde la antigüedad, símbolo de belleza y sentimiento.",
                "ideal" => "Regalos románticos, detalles especiales y celebraciones de amor."
            ],
            [
                "id" => "girasoles",
                "flor" => "Girasoles",
                "imgurl" => "imgs/flores_catalogo_clasificado/girasoles.jpg",
                "significado" => "Representan felicidad, vitalidad, admiración y energía positiva.",
                "fechas" => "Cumpleaños, graduaciones, celebraciones y momentos de alegría.",
                "historia" => "Originarios de América, son conocidos por seguir la luz del sol y simbolizar optimismo.",
                "ideal" => "Regalos alegres y motivadores."
            ],
            [
                "id" => "lirios",
                "flor" => "Lirios",
                "imgurl" => "imgs/flores_catalogo_clasificado/lirios_rosas_rosas.jpg",
                "significado" => "Simbolizan pureza, respeto, elegancia y renovación.",
                "fechas" => "Bodas, eventos formales y celebraciones religiosas.",
                "historia" => "Muy usados en ceremonias por su forma elegante y aroma distintivo.",
                "ideal" => "Eventos elegantes y mensajes de respeto."
            ],
            [
                "id" => "tulipanes",
                "flor" => "Tulipanes",
                "imgurl" => "imgs/flores_catalogo_clasificado/tulipanes_rosas.jpg",
                "significado" => "Amor sincero, elegancia y afecto delicado.",
                "fechas" => "Aniversarios, cumpleaños y regalos románticos.",
                "historia" => "Originarios de Asia y popularizados en Europa por su forma elegante.",
                "ideal" => "Regalos suaves y románticos."
            ],
            [
                "id" => "gerberas",
                "flor" => "Gerberas",
                "imgurl" => "imgs/flores_catalogo_clasificado/gerberas_coral_rosa.jpg",
                "significado" => "Optimismo, alegría y amistad.",
                "fechas" => "Cumpleaños, felicitaciones y visitas.",
                "historia" => "Muy populares por sus colores vivos y apariencia alegre.",
                "ideal" => "Regalos para amigos y celebraciones casuales."
            ],
            [
                "id" => "claveles",
                "flor" => "Claveles",
                "imgurl" => "imgs/flores_catalogo_clasificado/rosas_claveles_canasta.jpg",
                "significado" => "Agradecimiento, cariño y admiración.",
                "fechas" => "Día de la Madre, eventos familiares y agradecimientos.",
                "historia" => "Flores tradicionales muy resistentes y usadas en arreglos clásicos.",
                "ideal" => "Regalos familiares y detalles duraderos."
            ],
            [
                "id" => "orquideas",
                "flor" => "Orquídeas",
                "imgurl" => "imgs/flores_catalogo_clasificado/orquideas.jpg",
                "resumen" => "Sofisticadas y exóticas, ideales para regalos únicos y especiales.",
                "significado" => "Las orquídeas representan lujo, belleza, fuerza y admiración. Son flores que transmiten elegancia y distinción.",
                "fechas" => "Aniversarios, cumpleaños especiales, eventos corporativos y celebraciones elegantes.",
                "historia" => "Las orquídeas son una de las familias de plantas más antiguas del mundo. Por su rareza y belleza fueron muy codiciadas en Europa durante el siglo XIX.",
                "ideal" => "Regalos sofisticados, decoración de espacios y detalles para personas con gusto refinado."
            ],
            [
                "id" => "lavanda",
                "flor" => "Lavanda",
                "imgurl" => "imgs/flores_catalogo_clasificado/lavanda.jpg",
                "resumen" => "Transmite calma, serenidad y un toque romántico y provenzal.",
                "significado" => "La lavanda simboliza tranquilidad, pureza y devoción. También se asocia con la calma y el descanso.",
                "fechas" => "Ideal para regalos de bienestar, cumpleaños relajados, bodas y detalles de agradecimiento.",
                "historia" => "La lavanda ha sido usada desde la antigüedad por su aroma. Los romanos la usaban en baños y ropa, y con el tiempo se volvió símbolo de Provenza en Francia.",
                "ideal" => "Arreglos aromáticos, regalos de bienestar y decoraciones con estilo campestre."
            ]
        ];

        // Buscar artículo por ID
        $articulo = null;

        foreach ($articulos as $item) {
            if ($item["id"] === $id) {
                $articulo = $item;
                break;
            }
        }

        // Si no existe el artículo
        if ($articulo === null) {
            echo "Artículo no encontrado";
            return;
        }

        $viewData = [
            "articulo" => $articulo,
            "IS_LOGGED" => \Utilities\Security::isLogged()
        ];

        Renderer::render("blogdetalle", $viewData);
    }
}