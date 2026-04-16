-- 1. Agregar las funciones faltantes (PagarPayPal y AceptarPago)
INSERT IGNORE INTO `funciones` (`fncod`, `fndsc`, `fnest`, `fntyp`) VALUES
    ('Checkout_PagarPayPal',   'Iniciar pago con PayPal',           'ACT', 'CTR'),
    ('Checkout_AceptarPago',   'Capturar pago aceptado de PayPal',  'ACT', 'CTR');

-- 2. Asignar a todos los roles
INSERT IGNORE INTO `funciones_roles` (`rolescod`, `fncod`, `fnrolest`) VALUES
    ('ADMIN',    'Checkout_PagarPayPal',  'ACT'),
    ('ADMIN',    'Checkout_AceptarPago',  'ACT'),
    ('CLIENTE',  'Checkout_PagarPayPal',  'ACT'),
    ('CLIENTE',  'Checkout_AceptarPago',  'ACT'),
    ('VENDEDOR', 'Checkout_PagarPayPal',  'ACT'),
    ('VENDEDOR', 'Checkout_AceptarPago',  'ACT');

-- 3. Verificar resultado
SELECT fr.rolescod, fr.fncod, fr.fnrolest
FROM funciones_roles fr
WHERE fr.fncod IN (
    'Checkout_Carretilla',
    'Checkout_PagarPayPal',
    'Checkout_AceptarPago',
    'Checkout_Transacciones'
)
ORDER BY fr.rolescod, fr.fncod;
