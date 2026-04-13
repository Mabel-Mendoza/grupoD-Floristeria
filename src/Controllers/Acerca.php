<?php

namespace Controllers;

use Views\Renderer;
use Utilities\Site;

class Acerca extends PublicController
{
    public function run(): void
    {
        Site::addLink("public/css/floristeria-about.css");

        $servicios = [
            [
                "icono"     => "fas fa-leaf",
                "titulo"    => "Arreglos Personalizados",
                "descripcion" => "Cada arreglo es creado a mano, pensando en la ocasión y en la persona que lo recibirá. Nos adaptamos a tu presupuesto y visión."
            ],
            [
                "icono"     => "fas fa-truck",
                "titulo"    => "Entrega a Domicilio",
                "descripcion" => "Llevamos tus flores directo a la puerta de quien más quieres, con cuidado y puntualidad, dentro de Tegucigalpa."
            ],
            [
                "icono"     => "fas fa-headset",
                "titulo"    => "Asesoría Floral",
                "descripcion" => "No sabes qué flor elegir? Te orientamos para encontrar el arreglo perfecto según la ocasión, el mensaje y el estilo."
            ]
        ];

        $estadisticas = [
            ["numero" => "500+",  "etiqueta" => "Clientes satisfechos"],
            ["numero" => "8",     "etiqueta" => "Años de experiencia"],
            ["numero" => "1200+", "etiqueta" => "Arreglos entregados"],
            ["numero" => "100%",  "etiqueta" => "Flores frescas"]
        ];

        $especialidades = [
            [
                "icono"     => "fas fa-ring",
                "titulo"    => "Bodas y Eventos",
                "descripcion" => "Centros de mesa, bouquets de novia, arcos florales y decoración completa para el día más especial."
            ],
            [
                "icono"     => "fas fa-birthday-cake",
                "titulo"    => "Cumpleaños",
                "descripcion" => "Sorprende a esa persona especial con un arreglo vibrante y alegre, lleno de color y frescura."
            ],
            [
                "icono"     => "fas fa-heart",
                "titulo"    => "Detalles Románticos",
                "descripcion" => "Rosas, tulipanes y más, perfectos para San Valentín, aniversarios o simplemente para decir te quiero."
            ],
            [
                "icono"     => "fas fa-dove",
                "titulo"    => "Condolencias",
                "descripcion" => "Arreglos sobrios y elegantes para acompañar con respeto en momentos difíciles."
            ],
            [
                "icono"     => "fas fa-graduation-cap",
                "titulo"    => "Graduaciones",
                "descripcion" => "Celebra los logros con flores que transmitan orgullo, alegría y buenos deseos para el futuro."
            ],
            [
                "icono"     => "fas fa-spa",
                "titulo"    => "Decoración de Espacios",
                "descripcion" => "Transformamos hogares, oficinas y negocios con arreglos florales semanales o para ocasiones especiales."
            ]
        ];

        $equipo = [
            [
                "nombre"   => "María Esperanza",
                "cargo"    => "Fundadora & Florista Principal",
                "foto"     => "public/imgs/equipo/maria.jpg",
                "descripcion" => "Con más de 8 años de experiencia, María es el corazón de la floristería. Su amor por las flores se refleja en cada arreglo."
            ],
            [
                "nombre"   => "Josué Hernández",
                "cargo"    => "Diseñador Floral",
                "foto"     => "public/imgs/equipo/josue.jpg",
                "descripcion" => "Especialista en arreglos para bodas y eventos corporativos. Convierte cada idea en una creación única."
            ],
            [
                "nombre"   => "Alejandra Torres",
                "cargo"    => "Atención al Cliente",
                "foto"     => "public/imgs/equipo/alejandra.jpg",
                "descripcion" => "Garantiza que cada cliente se vaya con la solución perfecta. Su calidez es tan especial como nuestras flores."
            ]
        ];

        $viewData = [
            "servicios"      => $servicios,
            "estadisticas"   => $estadisticas,
            "especialidades" => $especialidades,
            "equipo"         => $equipo,
            "IS_LOGGED"      => \Utilities\Security::isLogged()
        ];

        Renderer::render("acerca", $viewData);
    }
}
