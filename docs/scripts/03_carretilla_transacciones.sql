-- Carretilla de usuario autenticado 
CREATE TABLE IF NOT EXISTS `carretilla_flor` (
    `usercod`   BIGINT(10)      NOT NULL,
    `arrcod`    INT(11)         NOT NULL,
    `cantidad`  INT(5)          NOT NULL DEFAULT 1,
    `precio`    DECIMAL(10,2)   NOT NULL,
    `fching`    DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`usercod`, `arrcod`),
    CONSTRAINT `cf_user_key` FOREIGN KEY (`usercod`) REFERENCES `usuario`(`usercod`),
    CONSTRAINT `cf_arr_key`  FOREIGN KEY (`arrcod`)  REFERENCES `arreglos`(`arrcod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Historial de transacciones PayPal
CREATE TABLE IF NOT EXISTS `transacciones` (
    `trxcod`        INT(11)         NOT NULL AUTO_INCREMENT,
    `usercod`       BIGINT(10)      NOT NULL,
    `paypal_order`  VARCHAR(128)    NOT NULL COMMENT 'PayPal order ID',
    `paypal_status` VARCHAR(30)     NOT NULL COMMENT 'COMPLETED, APPROVED, etc.',
    `total`         DECIMAL(10,2)   NOT NULL,
    `moneda`        CHAR(3)         NOT NULL DEFAULT 'USD',
    `detalle_json`  MEDIUMTEXT      COMMENT 'JSON completo de la respuesta PayPal',
    `fching`        DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`trxcod`),
    KEY `trx_user_idx` (`usercod`),
    CONSTRAINT `trx_user_key` FOREIGN KEY (`usercod`) REFERENCES `usuario`(`usercod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Items de cada transacción
CREATE TABLE IF NOT EXISTS `transacciones_detalle` (
    `trxdetcod`     INT(11)         NOT NULL AUTO_INCREMENT,
    `trxcod`        INT(11)         NOT NULL,
    `arrcod`        INT(11)         NOT NULL,
    `arrnombre`     VARCHAR(255)    NOT NULL,
    `cantidad`      INT(5)          NOT NULL,
    `precio_unit`   DECIMAL(10,2)   NOT NULL,
    `subtotal`      DECIMAL(10,2)   NOT NULL,
    PRIMARY KEY (`trxdetcod`),
    KEY `trxdet_trx_idx` (`trxcod`),
    CONSTRAINT `trxdet_trx_key` FOREIGN KEY (`trxcod`) REFERENCES `transacciones`(`trxcod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Funciones del módulo carretilla en el menú
INSERT IGNORE INTO `funciones` (`fncod`, `fndsc`, `fnest`, `fntyp`) VALUES
    ('Menu_Carretilla',         'Menú Carretilla de Compra',    'ACT', 'MNU'),
    ('Menu_Transacciones',      'Menú Historial Transacciones', 'ACT', 'MNU'),
    ('Checkout_Carretilla',     'Ver carretilla de compras',    'ACT', 'CTR'),
    ('Checkout_Transacciones',  'Ver historial de transacciones','ACT', 'CTR');

-- Asignar al rol ADMIN y CLIENTE
INSERT IGNORE INTO `funciones_roles` (`rolescod`, `fncod`, `fnrolest`) VALUES
    ('ADMIN',    'Menu_Carretilla',        'ACT'),
    ('ADMIN',    'Menu_Transacciones',     'ACT'),
    ('ADMIN',    'Checkout_Carretilla',    'ACT'),
    ('ADMIN',    'Checkout_Transacciones', 'ACT'),
    ('CLIENTE',  'Menu_Carretilla',        'ACT'),
    ('CLIENTE',  'Menu_Transacciones',     'ACT'),
    ('CLIENTE',  'Checkout_Carretilla',    'ACT'),
    ('CLIENTE',  'Checkout_Transacciones', 'ACT'),
    ('VENDEDOR', 'Menu_Carretilla',        'ACT'),
    ('VENDEDOR', 'Menu_Transacciones',     'ACT'),
    ('VENDEDOR', 'Checkout_Carretilla',    'ACT'),
    ('VENDEDOR', 'Checkout_Transacciones', 'ACT');
