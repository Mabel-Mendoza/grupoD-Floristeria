<?php

namespace Controllers;

use Views\Renderer;
use Utilities\Site;

class Blog extends PublicController
{
    public function run(): void
    {
        Site::addLink("public/css/floristeria-blog.css");

        $articulos = [
            [
                "id" => "rosas",
                "flor" => "Rosas",
                "imgurl" => "imgs/flores_catalogo_clasificado/flores_rosas.jpg",
                "resumen" => "Un clásico para expresar amor, ternura y admiración.",
                "significado" => "Las rosas representan amor, cariño y elegancia. Las rojas suelen expresar amor profundo; las rosadas, ternura y agradecimiento; y las blancas, pureza, respeto y paz.",
                "fechas" => "Se compran bastante en San Valentín, aniversarios, cumpleaños, Día de la Madre, pedidas de mano y celebraciones románticas durante todo el año.",
                "historia" => "La rosa ha sido una de las flores más valoradas desde hace siglos. Se cultivó en jardines antiguos de Asia, Medio Oriente y Europa, y con el tiempo se convirtió en una flor símbolo de belleza y sentimiento.",
                "ideal" => "Se usa mucho para detalles románticos, aniversarios, reconciliaciones y regalos elegantes."
            ],
            [
                "id" => "girasoles",
                "flor" => "Girasoles",
                "imgurl" => "imgs/flores_catalogo_clasificado/girasoles.jpg",
                "resumen" => "Transmiten alegría, energía positiva y buenos deseos.",
                "significado" => "Los girasoles suelen representar felicidad, vitalidad, admiración y esperanza. Son flores que proyectan luz y optimismo.",
                "fechas" => "Son ideales para cumpleaños, graduaciones, celebraciones de logros, bienvenida a una nueva etapa o simplemente para regalar algo alegre.",
                "historia" => "El girasol es originario de América y ha sido apreciado tanto por su belleza como por sus semillas. Su color amarillo intenso hizo que se volviera una flor muy popular en decoraciones modernas.",
                "ideal" => "Se usa para felicitar, levantar el ánimo o dar un detalle lleno de vida y color."
            ],
            [
                "id" => "lirios",
                "flor" => "Lirios",
                "imgurl" => "imgs/flores_catalogo_clasificado/lirios_rosas_rosas.jpg",
                "resumen" => "Aportan elegancia, delicadeza y distinción.",
                "significado" => "Los lirios se relacionan con pureza, renovación, respeto y admiración. Dependiendo del color, también pueden expresar delicadeza y feminidad.",
                "fechas" => "Se compran para bodas, eventos formales, cumpleaños elegantes, celebraciones religiosas, detalles de agradecimiento y arreglos de respeto.",
                "historia" => "El lirio ha sido una flor muy apreciada en distintas culturas por su forma estilizada y su aroma. Por eso suele aparecer en arreglos elegantes y ceremoniales.",
                "ideal" => "Sirve para eventos especiales, arreglos finos y mensajes de respeto o admiración."
            ],
            [
                "id" => "tulipanes",
                "flor" => "Tulipanes",
                "imgurl" => "imgs/flores_catalogo_clasificado/tulipanes_rosas.jpg",
                "resumen" => "Son delicados, modernos y muy usados en detalles románticos.",
                "significado" => "Los tulipanes suelen representar amor sincero, afecto, elegancia y buenos deseos. Los rosados transmiten ternura, mientras que los rojos reflejan pasión.",
                "fechas" => "Son una buena opción para aniversarios, cumpleaños, Día de la Madre, sorpresas románticas y arreglos suaves en temporadas frescas.",
                "historia" => "Aunque hoy se asocian mucho con Europa, los tulipanes se difundieron desde Asia y llegaron a ser flores muy apreciadas por su forma simple y elegante.",
                "ideal" => "Se usan para regalar algo fino, romántico y delicado."
            ],
            [
                "id" => "gerberas",
                "flor" => "Gerberas",
                "imgurl" => "imgs/flores_catalogo_clasificado/gerberas_coral_rosa.jpg",
                "resumen" => "Llenan cualquier arreglo de frescura y alegría.",
                "significado" => "Las gerberas representan optimismo, amistad, entusiasmo y energía positiva. Por sus colores vivos, transmiten cercanía y buen ánimo.",
                "fechas" => "Se compran bastante para cumpleaños, visitas, felicitaciones, recuperación de una persona y detalles amistosos.",
                "historia" => "La gerbera ganó mucha popularidad en la floristería moderna por la gran variedad de colores que tiene y por su apariencia limpia y juvenil.",
                "ideal" => "Sirven para amistades, celebraciones casuales y arreglos coloridos."
            ],
            [
                "id" => "claveles",
                "flor" => "Claveles",
                "imgurl" => "imgs/flores_catalogo_clasificado/rosas_claveles_canasta.jpg",
                "resumen" => "Son duraderos, versátiles y muy apreciados en arreglos clásicos.",
                "significado" => "Los claveles suelen expresar cariño, admiración y gratitud. Los rosados se relacionan con agradecimiento; los rojos con amor y aprecio; y los blancos con sinceridad y respeto.",
                "fechas" => "Se compran mucho en el Día de la Madre, cumpleaños, celebraciones familiares, agradecimientos y arreglos religiosos.",
                "historia" => "El clavel es una flor tradicional en muchos arreglos porque resiste bastante y luce bien en diferentes combinaciones. Por eso sigue siendo muy usada en floristería.",
                "ideal" => "Sirve para regalos familiares, detalles de agradecimiento y arreglos duraderos."
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

        $viewData = [
            "articulos" => $articulos,
            "IS_LOGGED" => \Utilities\Security::isLogged()
        ];

        Renderer::render("blog", $viewData);
    }
}