<?php
namespace Dao\Security;

if (version_compare(phpversion(), '7.4.0', '<')) {
    define('PASSWORD_ALGORITHM', 1);  //BCRYPT
} else {
    define('PASSWORD_ALGORITHM', '2y');  //BCRYPT
}

use Exception;

class Security extends \Dao\Table
{
    static public function getUsuarios($filter = "", $page = -1, $items = 0)
    {
        $sqlstr = "SELECT * FROM usuario;";
        return self::obtenerRegistros($sqlstr, array());
    }

    static public function newUsuario($email, $password)
    {
        if (!\Utilities\Validators::IsValidEmail($email)) {
            throw new Exception("Correo no es válido");
        }
        if (!\Utilities\Validators::IsValidPassword($password)) {
            throw new Exception("Contraseña debe ser almenos 8 caracteres, 1 número, 1 mayúscula, 1 símbolo especial");
        }

        $newUser = self::_usuarioStruct();
        $hashedPassword = self::_hashPassword($password);

        unset($newUser["usercod"]);
        unset($newUser["userfching"]);
        unset($newUser["userpswdchg"]);

        $newUser["useremail"]    = $email;
        $newUser["username"]     = "Mabel Mendoza";
        $newUser["userpswd"]     = $hashedPassword;
        $newUser["userpswdest"]  = Estados::ACTIVO;
        $newUser["userpswdexp"]  = date('Y-m-d', time() + 7776000);
        $newUser["userest"]      = Estados::ACTIVO;
        $newUser["useractcod"]   = hash("sha256", $email . time());
        $newUser["usertipo"]     = UsuarioTipo::PUBLICO;

        $sqlIns = "INSERT INTO `usuario` (`useremail`, `username`, `userpswd`,
            `userfching`, `userpswdest`, `userpswdexp`, `userest`, `useractcod`,
            `userpswdchg`, `usertipo`)
            VALUES
            ( :useremail, :username, :userpswd,
            now(), :userpswdest, :userpswdexp, :userest, :useractcod,
            now(), :usertipo);";

        return self::executeNonQuery($sqlIns, $newUser);
    }

    static public function getUsuarioByEmail($email)
    {
        $sqlstr = "SELECT * from `usuario` where `useremail` = :useremail ;";
        $params = array("useremail" => $email);
        return self::obtenerUnRegistro($sqlstr, $params);
    }

    static public function getUsuarioByCod($usercod)
    {
        $sqlstr = "SELECT * FROM usuario WHERE usercod = :usercod;";
        return self::obtenerUnRegistro($sqlstr, array("usercod" => $usercod));
    }

    static private function _saltPassword($password)
    {
        return hash_hmac(
            "sha256",
            $password,
            \Utilities\Context::getContextByKey("PWD_HASH")
        );
    }

    static private function _hashPassword($password)
    {
        return password_hash(self::_saltPassword($password), PASSWORD_ALGORITHM);
    }

    static public function verifyPassword($raw_password, $hash_password)
    {
        return password_verify(
            self::_saltPassword($raw_password),
            $hash_password
        );
    }

    static private function _usuarioStruct()
    {
        return array(
            "usercod"     => "",
            "useremail"   => "",
            "username"    => "",
            "userpswd"    => "",
            "userfching"  => "",
            "userpswdest" => "",
            "userpswdexp" => "",
            "userest"     => "",
            "useractcod"  => "",
            "userpswdchg" => "",
            "usertipo"    => "",
        );
    }

    // ─── FUNCIONES ────────────────────────────────────────────────────────────

    static public function getAllFunciones()
    {
        $sqlstr = "SELECT * FROM funciones ORDER BY fncod;";
        return self::obtenerRegistros($sqlstr, array());
    }

    static public function getFeature($fncod)
    {
        $sqlstr = "SELECT * from funciones where fncod=:fncod;";
        $featuresList = self::obtenerRegistros($sqlstr, array("fncod" => $fncod));
        return count($featuresList) > 0;
    }

    static public function addNewFeature($fncod, $fndsc, $fnest, $fntyp)
    {
        $sqlins = "INSERT INTO `funciones` (`fncod`, `fndsc`, `fnest`, `fntyp`)
            VALUES (:fncod , :fndsc , :fnest , :fntyp );";

        return self::executeNonQuery(
            $sqlins,
            array(
                "fncod" => $fncod,
                "fndsc" => $fndsc,
                "fnest" => $fnest,
                "fntyp" => $fntyp
            )
        );
    }

    static public function getFeatureByUsuario($userCod, $fncod)
    {
        $sqlstr = "select * from
        funciones_roles a inner join roles_usuarios b on a.rolescod = b.rolescod
        where a.fnrolest = 'ACT' and b.roleuserest='ACT' and b.usercod=:usercod
        and a.fncod=:fncod limit 1;";
        $resultados = self::obtenerRegistros(
            $sqlstr,
            array(
                "usercod" => $userCod,
                "fncod"   => $fncod
            )
        );
        return count($resultados) > 0;
    }

    // ─── ROLES ────────────────────────────────────────────────────────────────

    static public function getAllRoles()
    {
        $sqlstr = "SELECT * FROM roles ORDER BY rolescod;";
        return self::obtenerRegistros($sqlstr, array());
    }

    static public function getRol($rolescod)
    {
        $sqlstr = "SELECT * from roles where rolescod=:rolescod;";
        $featuresList = self::obtenerRegistros($sqlstr, array("rolescod" => $rolescod));
        return count($featuresList) > 0;
    }

    static public function addNewRol($rolescod, $rolesdsc, $rolesest)
    {
        $sqlins = "INSERT INTO `roles` (`rolescod`, `rolesdsc`, `rolesest`)
        VALUES (:rolescod, :rolesdsc, :rolesest);";

        return self::executeNonQuery(
            $sqlins,
            array(
                "rolescod" => $rolescod,
                "rolesdsc" => $rolesdsc,
                "rolesest" => $rolesest
            )
        );
    }

    // ─── ROLES ↔ USUARIOS ─────────────────────────────────────────────────────

    static public function isUsuarioInRol($userCod, $rolescod)
    {
        $sqlstr = "SELECT * FROM roles_usuarios
        WHERE usercod=:usercod AND rolescod=:rolescod LIMIT 1;";
        $resultados = self::obtenerRegistros(
            $sqlstr,
            array("usercod" => $userCod, "rolescod" => $rolescod)
        );
        return count($resultados) > 0;
    }

    static public function getRolesByUsuario($userCod)
    {
        $sqlstr = "SELECT r.*, ru.roleuserest, ru.roleuserfch, ru.roleuserexp
        FROM roles r
        INNER JOIN roles_usuarios ru ON r.rolescod = ru.rolescod
        WHERE ru.usercod = :usercod
        ORDER BY r.rolescod;";
        return self::obtenerRegistros($sqlstr, array("usercod" => $userCod));
    }

    /**
     * Roles que aún NO están asignados al usuario (para el selector de agregar)
     */
    static public function getUnAssignedRoles($userCod)
    {
        $sqlstr = "SELECT * FROM roles
        WHERE rolescod NOT IN (
            SELECT rolescod FROM roles_usuarios WHERE usercod = :usercod
        )
        ORDER BY rolescod;";
        return self::obtenerRegistros($sqlstr, array("usercod" => $userCod));
    }

    static public function assignRolToUser($userCod, $rolescod)
    {
        // Si ya existía el registro (fue removido antes) lo reactiva; si no, lo inserta
        $existing = self::obtenerRegistros(
            "SELECT * FROM roles_usuarios WHERE usercod=:usercod AND rolescod=:rolescod LIMIT 1;",
            array("usercod" => $userCod, "rolescod" => $rolescod)
        );

        if (count($existing) > 0) {
            $sql = "UPDATE roles_usuarios SET roleuserest='ACT', roleuserfch=NOW(), roleuserexp=NULL
                    WHERE usercod=:usercod AND rolescod=:rolescod;";
        } else {
            $sql = "INSERT INTO roles_usuarios (usercod, rolescod, roleuserest, roleuserfch)
                    VALUES (:usercod, :rolescod, 'ACT', NOW());";
        }
        return self::executeNonQuery($sql, array("usercod" => $userCod, "rolescod" => $rolescod));
    }

    static public function removeRolFromUser($userCod, $rolescod)
    {
        $sqldel = "UPDATE roles_usuarios SET roleuserest='INA'
        WHERE rolescod=:rolescod AND usercod=:usercod;";
        return self::executeNonQuery(
            $sqldel,
            array("rolescod" => $rolescod, "usercod" => $userCod)
        );
    }

    // ─── FUNCIONES ↔ ROLES ────────────────────────────────────────────────────

    static public function getFuncionesByRol($rolescod)
    {
        $sqlstr = "SELECT f.*, fr.fnrolest, fr.fnexp
        FROM funciones f
        INNER JOIN funciones_roles fr ON f.fncod = fr.fncod
        WHERE fr.rolescod = :rolescod
        ORDER BY f.fncod;";
        return self::obtenerRegistros($sqlstr, array("rolescod" => $rolescod));
    }

    /**
     * Funciones que aún NO están asignadas al rol (para el selector de agregar)
     */
    static public function getUnAssignedFeatures($rolescod)
    {
        $sqlstr = "SELECT * FROM funciones
        WHERE fncod NOT IN (
            SELECT fncod FROM funciones_roles WHERE rolescod = :rolescod
        )
        ORDER BY fncod;";
        return self::obtenerRegistros($sqlstr, array("rolescod" => $rolescod));
    }

    static public function assignFeatureToRol($rolescod, $fncod)
    {
        $existing = self::obtenerRegistros(
            "SELECT * FROM funciones_roles WHERE rolescod=:rolescod AND fncod=:fncod LIMIT 1;",
            array("rolescod" => $rolescod, "fncod" => $fncod)
        );

        if (count($existing) > 0) {
            $sql = "UPDATE funciones_roles SET fnrolest='ACT', fnexp=NULL
                    WHERE rolescod=:rolescod AND fncod=:fncod;";
        } else {
            $sql = "INSERT INTO funciones_roles (rolescod, fncod, fnrolest)
                    VALUES (:rolescod, :fncod, 'ACT');";
        }
        return self::executeNonQuery($sql, array("rolescod" => $rolescod, "fncod" => $fncod));
    }

    static public function removeFeatureFromRol($fncod, $rolescod)
    {
        $sqldel = "UPDATE funciones_roles SET fnrolest='INA'
        WHERE fncod=:fncod AND rolescod=:rolescod;";
        return self::executeNonQuery(
            $sqldel,
            array("fncod" => $fncod, "rolescod" => $rolescod)
        );
    }

    private function __construct()
    {
    }
    private function __clone()
    {
    }
}
?>
