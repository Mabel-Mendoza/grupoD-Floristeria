<?php

namespace Controllers;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Mantenimientos\Arreglos as ArreglosDAO;
use Utilities\Site;
use Utilities\Security;

class CatalogoDetalle extends PublicController
{
    public function run(): void
    {
        Site::addLink("public/css/floristeria-catalogo.css");

        $arrcod = intval($_GET['id'] ?? 0);

        if ($arrcod <= 0) {
            Site::redirectTo("index.php?page=Catalogo");
            return;
        }

        $arreglo = ArreglosDAO::getArregloById($arrcod);

        if (!$arreglo || ($arreglo['arrest'] ?? '') !== 'ACT') {
            Site::redirectTo("index.php?page=Catalogo");
            return;
        }

        // Estrellas fijas (no hay tabla de reviews aún)
        $arreglo['estrellasHtml'] = $this->_estrellas(4.8);
        $arreglo['rating']        = '4.8';
        $arreglo['numReviews']    = '245';
        $arreglo['estaLogueado']  = Security::isLogged();

        // Descripción larga (la misma descripción del arreglo)
        $arreglo['descripcionLarga'] = $arreglo['arrdescripcion'];

        // Reviews de ejemplo (hardcoded — cuando haya tabla se reemplaza)
        $reviews = [
            [
                'nombre'     => 'Ana García',
                'verificado' => true,
                'tiempo'     => 'Hace 1 semana',
                'titulo'     => '¡Hermoso arreglo!',
                'texto'      => 'El arreglo llegó en perfectas condiciones, muy bien presentado y las flores estaban muy frescas. Lo recomiendo totalmente.',
                'estrellas'  => $this->_estrellas(5),
                'rating'     => '5.0',
            ],
            [
                'nombre'     => 'Carlos Mejía',
                'verificado' => true,
                'tiempo'     => 'Hace 2 semanas',
                'titulo'     => 'Excelente calidad',
                'texto'      => 'Compré este arreglo para el cumpleaños de mi mamá y quedó encantada. Las flores eran exactamente como en la foto.',
                'estrellas'  => $this->_estrellas(5),
                'rating'     => '5.0',
            ],
            [
                'nombre'     => 'María Torres',
                'verificado' => false,
                'tiempo'     => 'Hace 1 mes',
                'titulo'     => 'Muy bonito y fresco',
                'texto'      => 'Me gustó mucho el arreglo, el color y el olor eran preciosos. Solo le doy 4 estrellas porque tardó un poco más de lo esperado.',
                'estrellas'  => $this->_estrellas(4),
                'rating'     => '4.0',
            ],
        ];
        foreach ($reviews as &$r) {
            $r['esVerificado'] = $r['verificado'];
        }

        // Barra de distribución de estrellas
        $distribucion = [
            ['num' => 5, 'pct' => 70, 'ancho' => 'width:70%'],
            ['num' => 4, 'pct' => 18, 'ancho' => 'width:18%'],
            ['num' => 3, 'pct' => 7,  'ancho' => 'width:7%'],
            ['num' => 2, 'pct' => 3,  'ancho' => 'width:3%'],
            ['num' => 1, 'pct' => 2,  'ancho' => 'width:2%'],
        ];

        // Productos relacionados (misma ocasión o aleatorios)
        $todos       = ArreglosDAO::getAllArreglosActivos();
        $relacionados = array_filter($todos, fn($a) =>
            $a['arrcod'] != $arrcod &&
            ($a['arrocasion'] === $arreglo['arrocasion'] || $a['arrtamano'] === $arreglo['arrtamano'])
        );
        $relacionados = array_values($relacionados);
        if (count($relacionados) < 3) {
            $resto = array_filter($todos, fn($a) => $a['arrcod'] != $arrcod);
            $relacionados = array_values($resto);
        }
        shuffle($relacionados);
        $relacionados = array_slice($relacionados, 0, 4);
        foreach ($relacionados as &$rel) {
            $rel['estrellasHtml'] = $this->_estrellas(4.5);
        }

        $viewData = [
            'arreglo'      => $arreglo,
            'reviews'      => $reviews,
            'distribucion' => $distribucion,
            'relacionados' => $relacionados,
            'estaLogueado' => Security::isLogged(),
            // flags de tab activo
            'tabDesc'      => true,
            'tabInfo'      => false,
            'tabReview'    => false,
        ];

        // merge arreglo al root para acceder con {{arrnombre}} directo
        $viewData = array_merge($viewData, $arreglo);

        Renderer::render("catalogo_detalle", $viewData);
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
