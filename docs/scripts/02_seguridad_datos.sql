-- ── 1. FUNCIONES (tabla funciones) ───────────────────────────
INSERT INTO `funciones` (`fncod`, `fndsc`, `fnest`, `fntyp`) VALUES
    ('arreglos_listado_INS', 'Crear nuevo arreglo floral',    'ACT', 'WRT'),
    ('arreglos_listado_UDP', 'Editar arreglo floral',         'ACT', 'WRT'),
    ('arreglos_listado_DEL', 'Desactivar arreglo floral',     'ACT', 'WRT'),
    ('arreglos_listado_DSP', 'Ver detalle de arreglo floral', 'ACT', 'RDO');

-- módulo de seguridad
INSERT INTO `funciones` (`fncod`, `fndsc`, `fnest`, `fntyp`) VALUES
    ('Mantenimientos-Seguridad-UsuariosRoles', 'Gestión de roles por usuario', 'ACT', 'CTR'),
    ('Mantenimientos-Seguridad-RolesFunciones','Gestión de funciones por rol',  'ACT', 'CTR');

-- ── 2. ROLES ────────────────────────────────────
INSERT INTO `roles` (`rolescod`, `rolesdsc`, `rolesest`) VALUES
    ('ADMIN',    'Administrador',      'ACT'),
    ('VENDEDOR', 'Vendedor/Empleado',  'ACT'),
    ('CLIENTE',  'Cliente Registrado', 'ACT');

-- ── 3. FUNCIONES_ROLES ───────────────
-- ADMIN: acceso total
INSERT INTO `funciones_roles` (`rolescod`, `fncod`, `fnrolest`) VALUES
    ('ADMIN', 'arreglos_listado_INS',                        'ACT'),
    ('ADMIN', 'arreglos_listado_UDP',                        'ACT'),
    ('ADMIN', 'arreglos_listado_DEL',                        'ACT'),
    ('ADMIN', 'arreglos_listado_DSP',                        'ACT'),
    ('ADMIN', 'Mantenimientos-Seguridad-UsuariosRoles',      'ACT'),
    ('ADMIN', 'Mantenimientos-Seguridad-RolesFunciones',     'ACT');

-- VENDEDOR: puede crear, editar y ver
INSERT INTO `funciones_roles` (`rolescod`, `fncod`, `fnrolest`) VALUES
    ('VENDEDOR', 'arreglos_listado_INS', 'ACT'),
    ('VENDEDOR', 'arreglos_listado_UDP', 'ACT'),
    ('VENDEDOR', 'arreglos_listado_DSP', 'ACT');


-- ── 4. USUARIOS────────────────────
INSERT INTO `usuario`
    (`useremail`, `username`, `userpswd`, `userfching`,
     `userpswdest`, `userpswdexp`, `userest`, `useractcod`, `userpswdchg`, `usertipo`)
VALUES
    ('admin@floristeria.hn',   'Ana Administradora', '$2y$10$examplehashADMIN000000000000000000000000000', NOW(), 'ACT', DATE_ADD(NOW(), INTERVAL 90 DAY), 'ACT', SHA2(CONCAT('admin@floristeria.hn', UNIX_TIMESTAMP()), 256), NOW(), 'ADM'),
    ('vendedor@floristeria.hn','Carlos Vendedor',     '$2y$10$examplehashVEND000000000000000000000000000', NOW(), 'ACT', DATE_ADD(NOW(), INTERVAL 90 DAY), 'ACT', SHA2(CONCAT('vendedor@floristeria.hn', UNIX_TIMESTAMP()), 256), NOW(), 'NRM'),
    ('cliente@correo.hn',      'María Cliente',       '$2y$10$examplehashCLNT000000000000000000000000000', NOW(), 'ACT', DATE_ADD(NOW(), INTERVAL 90 DAY), 'ACT', SHA2(CONCAT('cliente@correo.hn', UNIX_TIMESTAMP()), 256), NOW(), 'NRM');

-- ── 5. ROLES_USUARIOS ────────────────────────────────────────
-- Obtener los usercod según email y asignar roles:
INSERT INTO `roles_usuarios` (`usercod`, `rolescod`, `roleuserest`, `roleuserfch`)
SELECT u.usercod, 'ADMIN', 'ACT', NOW()
FROM usuario u WHERE u.useremail = 'admin@floristeria.hn';

INSERT INTO `roles_usuarios` (`usercod`, `rolescod`, `roleuserest`, `roleuserfch`)
SELECT u.usercod, 'VENDEDOR', 'ACT', NOW()
FROM usuario u WHERE u.useremail = 'vendedor@floristeria.hn';

INSERT INTO `roles_usuarios` (`usercod`, `rolescod`, `roleuserest`, `roleuserfch`)
SELECT u.usercod, 'CLIENTE', 'ACT', NOW()
FROM usuario u WHERE u.useremail = 'cliente@correo.hn';

-- ── 6. FUNCIONES del módulo de seguridad en funciones_roles ──
INSERT INTO `funciones_roles` (`rolescod`, `fncod`, `fnrolest`)
VALUES
    ('ADMIN', 'Mantenimientos-Seguridad-UsuariosRoles',  'ACT'),
    ('ADMIN', 'Mantenimientos-Seguridad-RolesFunciones', 'ACT');


