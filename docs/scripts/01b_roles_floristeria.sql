-- Roles del sistema
INSERT INTO `roles` (`rolescod`, `rolesdsc`, `rolesest`) VALUES
    ('ADMIN',   'Administrador',       'ACT'),
    ('VENDEDOR','Vendedor / Empleado', 'ACT'),
    ('CLIENTE', 'Cliente Registrado',  'ACT');

-- Funciones para el CRUD de arreglos
INSERT INTO `funciones` (`fncod`, `fndsc`, `fnest`, `fntyp`) VALUES
    ('arreglos_listado_INS', 'Crear nuevo arreglo floral',    'ACT', 'WRT'),
    ('arreglos_listado_UDP', 'Editar arreglo floral',         'ACT', 'WRT'),
    ('arreglos_listado_DEL', 'Desactivar arreglo floral',     'ACT', 'WRT'),
    ('arreglos_listado_DSP', 'Ver detalle de arreglo floral', 'ACT', 'RDO');

-- Asignar funciones al rol ADMIN (acceso total)
INSERT INTO `funciones_roles` (`rolescod`, `fncod`, `fnrolest`) VALUES
    ('ADMIN', 'arreglos_listado_INS', 'ACT'),
    ('ADMIN', 'arreglos_listado_UDP', 'ACT'),
    ('ADMIN', 'arreglos_listado_DEL', 'ACT'),
    ('ADMIN', 'arreglos_listado_DSP', 'ACT');

-- Asignar funciones al rol VENDEDOR (puede editar pero no eliminar)
INSERT INTO `funciones_roles` (`rolescod`, `fncod`, `fnrolest`) VALUES
    ('VENDEDOR', 'arreglos_listado_INS', 'ACT'),
    ('VENDEDOR', 'arreglos_listado_UDP', 'ACT'),
    ('VENDEDOR', 'arreglos_listado_DSP', 'ACT');

-- El CLIENTE solo puede ver (catálogo público, no requiere función especial)
