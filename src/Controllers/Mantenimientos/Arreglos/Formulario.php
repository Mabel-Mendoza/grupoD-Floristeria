<?php

namespace Controllers\Mantenimientos\Arreglos;

use Dao\Mantenimientos\Arreglos as ArreglosDAO;
use Controllers\PrivateController;
use Views\Renderer;
use Utilities\Site;
use Controllers\PrivateNoAuthException;

const ARREGLOS_FORMULARIO_URL = "index.php?page=Mantenimientos-Arreglos-Formulario";
const ARREGLOS_LISTADO_URL    = "index.php?page=Mantenimientos-Arreglos-Listado";
const XSRF_KEY                = "Mantenimientos_Arreglos_Formulario";

class Formulario extends PrivateController
{
    private array $viewData = [];

    private array $modes = [
        "INS" => "Nuevo Arreglo Floral",
        "UPD" => "Actualizar Arreglo #%s — %s",
        "DSP" => "Detalle del Arreglo #%s — %s",
        "DEL" => "Eliminar Arreglo #%s — %s"
    ];

    private array $accessControl = [
        "INS" => "arreglos_listado_INS",
        "UPD" => "arreglos_listado_UDP",
        "DEL" => "arreglos_listado_DEL"
    ];

    private array $confirmTooltips = [
        "INS" => "",
        "UPD" => "",
        "DSP" => "",
        "DEL" => "¿Está seguro de desactivar este arreglo? Quedará inactivo en el sistema."
    ];

    // Campos del formulario
    private $arrcod;
    private $arrnombre;
    private $arrdescripcion;
    private $arrtamano;
    private $arrprecio;
    private $arrimgurl;
    private $arrstock;
    private $arrocasion;
    private $arrest;

    private $xsrfToken = '';
    private $mode;

    public function run(): void
    {
        $this->LoadPage();

        if ($this->isPostBack()) {
            $this->CapturarDatos();
            if ($this->ValidarDatos()) {
                switch ($this->mode) {
                    case "INS":
                        if (ArreglosDAO::crearArreglo(
                            $this->arrnombre,
                            $this->arrdescripcion,
                            $this->arrtamano,
                            $this->arrprecio,
                            $this->arrimgurl,
                            $this->arrstock,
                            $this->arrocasion,
                            'ACT'
                        ) !== 0) {
                            Site::redirectToWithMsg(ARREGLOS_LISTADO_URL, "Arreglo creado satisfactoriamente");
                        }
                        break;

                    case "UPD":
                        if (ArreglosDAO::actualizarArreglo(
                            $this->arrcod,
                            $this->arrnombre,
                            $this->arrdescripcion,
                            $this->arrtamano,
                            $this->arrprecio,
                            $this->arrimgurl,
                            $this->arrstock,
                            $this->arrocasion,
                            $this->arrest
                        ) !== 0) {
                            Site::redirectToWithMsg(ARREGLOS_LISTADO_URL, "Arreglo actualizado satisfactoriamente");
                        }
                        break;

                    case "DEL":
                        if (ArreglosDAO::eliminarArreglo($this->arrcod) !== 0) {
                            Site::redirectToWithMsg(ARREGLOS_LISTADO_URL, "Arreglo desactivado satisfactoriamente");
                        }
                        break;
                }
            }
        }

        $this->GenerarViewData();
        Renderer::render("mantenimientos/arreglos/formulario", $this->viewData);
    }

    private function LoadPage(): void
    {
        $this->mode = $_GET["mode"] ?? '';

        if (!isset($this->modes[$this->mode])) {
            Site::redirectToWithMsg(ARREGLOS_LISTADO_URL, "Error al cargar formulario, intente de nuevo");
        }

        if (isset($this->accessControl[$this->mode]) && !$this->isFeatureAutorized($this->accessControl[$this->mode])) {
            throw new PrivateNoAuthException();
        }

        $this->arrcod = intval($_GET["id"] ?? '0');

        if ($this->mode !== "INS" && $this->arrcod <= 0) {
            Site::redirectToWithMsg(ARREGLOS_LISTADO_URL, "Error: se requiere el código del arreglo");
        } elseif ($this->mode !== "INS") {
            $this->CargarDatos();
        }
    }

    private function CargarDatos(): void
    {
        $tmp = ArreglosDAO::getArregloById($this->arrcod);
        if (count($tmp) <= 0) {
            Site::redirectToWithMsg(ARREGLOS_LISTADO_URL, "No se encontró el arreglo");
        }
        $this->arrnombre      = $tmp["arrnombre"];
        $this->arrdescripcion = $tmp["arrdescripcion"];
        $this->arrtamano      = $tmp["arrtamano"];
        $this->arrprecio      = $tmp["arrprecio"];
        $this->arrimgurl      = $tmp["arrimgurl"];
        $this->arrstock       = $tmp["arrstock"];
        $this->arrocasion     = $tmp["arrocasion"];
        $this->arrest         = $tmp["arrest"];
    }

    private function CapturarDatos(): void
    {
        $this->arrcod         = intval($_POST["arrcod"] ?? '0');
        $this->arrnombre      = $_POST["arrnombre"]      ?? '';
        $this->arrdescripcion = $_POST["arrdescripcion"] ?? '';
        $this->arrtamano      = $_POST["arrtamano"]      ?? '';
        $this->arrprecio      = $_POST["arrprecio"]      ?? '';
        $this->arrimgurl      = $_POST["arrimgurl"]      ?? '';
        $this->arrstock       = intval($_POST["arrstock"] ?? '0');
        $this->arrocasion     = $_POST["arrocasion"]     ?? '';
        $this->arrest         = $_POST["arrest"]         ?? 'ACT';
        $this->xsrfToken      = $_POST["uuid"]           ?? '';
    }

    private function ValidarDatos(): bool
    {
        $sessionToken = $_SESSION[XSRF_KEY] ?? '';
        if ($this->xsrfToken !== $sessionToken) {
            Site::redirectToWithMsg(ARREGLOS_LISTADO_URL, "Error de seguridad en la petición");
        }

        $validateId = intval($_GET["id"] ?? '0');
        if ($validateId !== $this->arrcod) {
            return false;
        }
        return true;
    }

    private function GenerarViewData(): void
    {
        $tamanos = ArreglosDAO::getAllTamanos();

        $this->viewData["mode"]          = $this->mode;
        $this->viewData["modeDsc"]       = sprintf($this->modes[$this->mode], $this->arrcod, $this->arrnombre);
        $this->viewData["arrcod"]        = $this->arrcod;
        $this->viewData["arrnombre"]     = $this->arrnombre;
        $this->viewData["arrdescripcion"]= $this->arrdescripcion;
        $this->viewData["arrtamano"]     = $this->arrtamano;
        $this->viewData["arrprecio"]     = $this->arrprecio;
        $this->viewData["arrimgurl"]     = $this->arrimgurl;
        $this->viewData["arrstock"]      = $this->arrstock;
        $this->viewData["arrocasion"]    = $this->arrocasion;
        $this->viewData["arrest"]        = $this->arrest;
        $this->viewData["tamanos"]       = $tamanos;
        $this->viewData["isReadonly"]    = ($this->mode === 'DEL' || $this->mode === 'DSP') ? 'readonly' : '';
        $this->viewData["isDisabled"]    = ($this->mode === 'DEL' || $this->mode === 'DSP') ? 'disabled' : '';
        $this->viewData["hideConfirm"]   = ($this->mode === 'DSP');
        $this->viewData["confirmToolTip"]= $this->confirmTooltips[$this->mode];
        $this->viewData["xsrf_token"]    = $this->GenerateXSRFToken();
    }

    private function GenerateXSRFToken(): string
    {
        $tmpStr          = "arreglos_formulario" . time() . rand(10000, 99999);
        $this->xsrfToken = md5($tmpStr);
        $_SESSION[XSRF_KEY] = $this->xsrfToken;
        return $this->xsrfToken;
    }
}
