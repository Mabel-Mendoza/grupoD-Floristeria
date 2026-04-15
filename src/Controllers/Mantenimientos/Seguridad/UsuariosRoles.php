<?php
namespace Controllers\Mantenimientos\Seguridad;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Security\Security as SecurityDAO;
use Utilities\Site;

const USUARIOS_ROL_LISTADO_URL = "index.php?page=Mantenimientos-Seguridad-UsuariosRoles";

class UsuariosRoles extends PrivateController
{
    private array $viewData = [];

    public function run(): void
    {
        if ($this->isPostBack()) {
            $this->procesarAccion();
        }

        $usuarios = SecurityDAO::getUsuarios();

        foreach ($usuarios as &$usuario) {
            $rolesAsignados = SecurityDAO::getRolesByUsuario($usuario['usercod']);

            // El renderer solo evalúa si la clave existe y es truthy.
            // Preparamos flags booleanos por cada rol para poder usar {{if esActivo}}
            foreach ($rolesAsignados as &$rol) {
                $rol['esActivo']   = ($rol['roleuserest'] === 'ACT');
                $rol['esInactivo'] = ($rol['roleuserest'] !== 'ACT');
                // usercod del usuario padre, accesible dentro del foreach de roles con ~
                $rol['uid'] = $usuario['usercod'];
            }

            $rolesDisponibles = SecurityDAO::getUnAssignedRoles($usuario['usercod']);

            $usuario['roles']              = $rolesAsignados;
            $usuario['tieneRoles']         = count($rolesAsignados) > 0;
            $usuario['sinRoles']           = count($rolesAsignados) === 0;
            $usuario['rolesDisponibles']   = $rolesDisponibles;
            $usuario['hayDisponibles']     = count($rolesDisponibles) > 0;
        }

        $this->viewData = [
            "usuarios" => $usuarios,
            "msgExito" => $_GET['msg']   ?? '',
            "msgError" => $_GET['error'] ?? '',
        ];

        Renderer::render(
            "mantenimientos/seguridad/usuarios_roles",
            $this->viewData,
            "privatelayout.view.tpl"
        );
    }

    private function procesarAccion(): void
    {
        $accion   = $_POST['accion']   ?? '';
        $usercod  = intval($_POST['usercod']  ?? 0);
        $rolescod = trim($_POST['rolescod'] ?? '');

        if ($usercod <= 0 || $rolescod === '') {
            Site::redirectTo(USUARIOS_ROL_LISTADO_URL . '&error=Datos+invalidos');
            return;
        }

        switch ($accion) {
            case 'asignar':
                SecurityDAO::assignRolToUser($usercod, $rolescod);
                Site::redirectTo(USUARIOS_ROL_LISTADO_URL . '&msg=Rol+asignado+correctamente');
                break;
            case 'inactivar':
                SecurityDAO::removeRolFromUser($usercod, $rolescod);
                Site::redirectTo(USUARIOS_ROL_LISTADO_URL . '&msg=Rol+inactivado+correctamente');
                break;
            default:
                Site::redirectTo(USUARIOS_ROL_LISTADO_URL . '&error=Accion+no+reconocida');
        }
    }
}
?>
