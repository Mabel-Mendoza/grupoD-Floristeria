<?php

namespace Controllers;

use Views\Renderer;

class Faq
{
    public function run(): void
    {
        $preguntas = [
            [
                "pregunta" => "¿Cómo puedo realizar un pedido?",
                "respuesta" => "Puedes ingresar al catálogo, elegir el arreglo floral que más te guste, agregarlo a la carretilla de compra y luego completar el proceso de pedido dentro de la plataforma."
            ],
            [
                "pregunta" => "¿Hacen entregas a domicilio?",
                "respuesta" => "Sí, la floristería contempla entregas a domicilio para que los arreglos puedan enviarse al lugar indicado de forma segura y organizada."
            ],
            [
                "pregunta" => "¿Puedo personalizar un arreglo floral?",
                "respuesta" => "Sí, los arreglos pueden adaptarse según la ocasión, el tipo de flores disponibles y el estilo que el cliente desea transmitir."
            ],
            [
                "pregunta" => "¿Qué formas de pago se manejan?",
                 "respuesta" => "Puedes hacerlo mediante PayPal y efectivo."
            ],
             [
               "pregunta" => "¿Qué ocasiones cubren sus arreglos?",
              "respuesta" => "Nuestros arreglos florales pueden utilizarse para cumpleaños, aniversarios, bodas, agradecimientos y otras fechas especiales."
             ],
            [
                "pregunta" => "¿Cómo sé cuál flor elegir?",
                "respuesta" => "Puedes apoyarte en nuestro blog floral, donde explicamos el significado de cada flor, en qué fechas conviene regalarla y para qué ocasiones funciona mejor."
            ],
            [
                "pregunta" => "¿Necesito crear una cuenta para comprar?",
                "respuesta" => "Sí, crear una cuenta facilita el proceso de compra y permite llevar un mejor control del pedido y del historial de transacciones."
            ],
            [
                "pregunta" => "¿La disponibilidad de flores siempre es la misma?",
                "respuesta" => "La disponibilidad puede variar dependiendo de la temporada, el inventario y el tipo de arreglo floral seleccionado."
            ]
        ];

        Renderer::render("faq", [
            "preguntas" => $preguntas
        ]);
    }
}