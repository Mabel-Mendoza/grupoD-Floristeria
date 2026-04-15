<?php
namespace Controllers\Mantenimientos\Seguridad;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Security\Security as SecurityDAO;
use Utilities\Site;

const ROLES_FUNCION_LISTADO_URL = "index.php?page=Mantenimientos-Seguridad-RolesFunciones";

class RolesFunciones extends PrivateController
{
    private array $viewData = [];

    public function run(): void
    {
        if ($this->isPostBack()) {
            $this->procesarAccion();
        }

        $roles = SecurityDAO::getAllRoles();

        foreach ($roles as &$rol) {
            $funcionesAsignadas = SecurityDAO::getFuncionesByRol($rol['rolescod']);

            foreach ($funcionesAsignadas as &$fn) {
                $fn['esActivo']   = ($fn['fnrolest'] === 'ACT');
                $fn['esInactivo'] = ($fn['fnrolest'] !== 'ACT');
                // rolescod del rol padre accesible desde dentro del foreach con ~
                $fn['rcod'] = $rol['rolescod'];
            }

            $funcionesDisponibles = SecurityDAO::getUnAssignedFeatures($rol['rolescod']);

            $rol['funciones']             = $funcionesAsignadas;
            $rol['tieneFunciones']        = count($funcionesAsignadas) > 0;
            $rol['sinFunciones']          = count($funcionesAsignadas) === 0;
            $rol['funcionesDisponibles']  = $funcionesDisponibles;
            $rol['hayDisponibles']        = count($funcionesDisponibles) > 0;
        }

        $this->viewData = [
            "roles"    => $roles,
            "msgExito" => $_GET['msg']   ?? '',
            "msgError" => $_GET['error'] ?? '',
        ];

        Renderer::render(
            "mantenimientos/seguridad/roles_funciones",
            $this->viewData,
            "privatelayout.view.tpl"
        );
    }

    private function procesarAccion(): void
    {
        $accion   = $_POST['accion']   ?? '';
        $rolescod = trim($_POST['rolescod'] ?? '');
        $fncod    = trim($_POST['fncod']    ?? '');

        if ($rolescod === '' || $fncod === '') {
            Site::redirectTo(ROLES_FUNCION_LISTADO_URL . '&error=Datos+invalidos');
            return;
        }

        switch ($accion) {
            case 'asignar':
                SecurityDAO::assignFeatureToRol($rolescod, $fncod);
                Site::redirectTo(ROLES_FUNCION_LISTADO_URL . '&msg=Funcion+asignada+correctamente');
                break;
            case 'inactivar':
                SecurityDAO::removeFeatureFromRol($fncod, $rolescod);
                Site::redirectTo(ROLES_FUNCION_LISTADO_URL . '&msg=Funcion+inactivada+correctamente');
                break;
            default:
                Site::redirectTo(ROLES_FUNCION_LISTADO_URL . '&error=Accion+no+reconocida');
        }
    }
}
?>
