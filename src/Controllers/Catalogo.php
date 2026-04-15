<?php

namespace Controllers;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Mantenimientos\Arreglos as ArreglosDAO;
use Utilities\Site;
use Utilities\Security;

class Catalogo extends PublicController
{
    public function run(): void
    {
        Site::addLink("public/css/floristeria-catalogo.css");

        $busqueda = trim($_GET['q'] ?? '');

        $todosLosArreglos = ArreglosDAO::getAllArreglosActivos();

        // Filtrar por búsqueda si hay texto
        if ($busqueda !== '') {
            $arreglosFiltrados = array_filter($todosLosArreglos, function ($a) use ($busqueda) {
                return stripos($a['arrnombre'], $busqueda) !== false
                    || stripos($a['arrdescripcion'], $busqueda) !== false
                    || stripos($a['arrocasion'], $busqueda) !== false;
            });
            $arreglos = array_values($arreglosFiltrados);
        } else {
            $arreglos = $todosLosArreglos;
        }

        // Preparar estrellas y flags para cada arreglo
        foreach ($arreglos as &$arr) {
            $arr['estrellasHtml'] = $this->_estrellas(4.5);
            $arr['estaLogueado'] = Security::isLogged();
        }

        // Recomendaciones: 4 aleatorios del total
        $recomendados = $todosLosArreglos;
        shuffle($recomendados);
        $recomendados = array_slice($recomendados, 0, 4);
        foreach ($recomendados as &$rec) {
            $rec['estrellasHtml'] = $this->_estrellas(4.8);
        }

        $viewData = [
            'arreglos'      => $arreglos,
            'recomendados'  => $recomendados,
            'busqueda'      => $busqueda,
            'totalArreglos' => count($arreglos),
            'estaLogueado'  => Security::isLogged(),
        ];

        Renderer::render("catalogo", $viewData);
    }

    private function _estrellas(float $rating): string
    {
        $html = '';
        for ($i = 1; $i <= 5; $i++) {
            if ($i <= floor($rating)) {
                $html .= '<i class="fas fa-star"></i>';
            } elseif ($i - $rating < 1) {
                $html .= '<i class="fas fa-star-half-alt"></i>';
            } else {
                $html .= '<i class="far fa-star"></i>';
            }
        }
        return $html;
    }
}
