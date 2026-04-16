CREATE TABLE `arreglos` (
    `arrcod`        INT(11)         NOT NULL AUTO_INCREMENT  COMMENT 'Código del arreglo',
    `arrnombre`     VARCHAR(255)    NOT NULL                 COMMENT 'Nombre del arreglo floral',
    `arrdescripcion` TEXT           NOT NULL                 COMMENT 'Descripción del arreglo',
    `arrtamano`     CHAR(3)         NOT NULL                 COMMENT 'Tamaño: PEQ, MED, GRN',
    `arrprecio`     DECIMAL(10,2)   NOT NULL                 COMMENT 'Precio en Lempiras',
    `arrimgurl`     VARCHAR(255)    NOT NULL                 COMMENT 'URL de la imagen',
    `arrstock`      INT(11)         NOT NULL DEFAULT 0       COMMENT 'Unidades disponibles',
    `arrocasion`    VARCHAR(100)    NOT NULL                 COMMENT 'Ocasión: Cumpleaños, Boda, etc.',
    `arrest`        CHAR(3)         NOT NULL DEFAULT 'ACT'   COMMENT 'Estado: ACT, INA',
    PRIMARY KEY (`arrcod`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4;


CREATE TABLE `tamanos` (
    `tamcod`    CHAR(3)         NOT NULL  COMMENT 'Código: PEQ, MED, GRN',
    `tamdsc`    VARCHAR(45)     NOT NULL  COMMENT 'Descripción: Pequeño, Mediano, Grande',
    `tamest`    CHAR(3)         NOT NULL  COMMENT 'Estado: ACT, INA',
    PRIMARY KEY (`tamcod`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;


INSERT INTO `tamanos` (`tamcod`, `tamdsc`, `tamest`) VALUES
    ('PEQ', 'Pequeño',  'ACT'),
    ('MED', 'Mediano',  'ACT'),
    ('GRN', 'Grande',   'ACT');

-- Datos para la floristería

INSERT INTO `arreglos`
    (`arrnombre`, `arrdescripcion`, `arrtamano`, `arrprecio`, `arrimgurl`, `arrstock`, `arrocasion`, `arrest`)
VALUES
    ('Ramo de Rosas Rojas',    'Hermoso ramo de 12 rosas rojas frescas con follaje verde.',        'PEQ', 250.00, 'imgs/arreglos/rosas_rojas_peq.jpg',    15, 'Romántico', 'ACT'),
    ('Ramo de Rosas Rojas',    'Elegante ramo de 24 rosas rojas con cinta y papel decorativo.',    'MED', 450.00, 'imgs/arreglos/rosas_rojas_med.jpg',    10, 'Romántico', 'ACT'),
    ('Ramo de Rosas Rojas',    'Lujoso ramo de 50 rosas rojas, ideal para ocasiones especiales.',  'GRN', 850.00, 'imgs/arreglos/rosas_rojas_grn.jpg',     5, 'Romántico', 'ACT'),
    ('Arreglo de Girasoles',   'Alegre arreglo de girasoles frescos con flores silvestres.',       'PEQ', 200.00, 'imgs/arreglos/girasoles_peq.jpg',      20, 'Cumpleaños','ACT'),
    ('Arreglo de Girasoles',   'Arreglo mixto de girasoles y margaritas en florero de vidrio.',   'MED', 380.00, 'imgs/arreglos/girasoles_med.jpg',      12, 'Cumpleaños','ACT'),
    ('Arreglo de Girasoles',   'Gran arreglo de girasoles en cesta de mimbre decorada.',           'GRN', 650.00, 'imgs/arreglos/girasoles_grn.jpg',       6, 'Cumpleaños','ACT'),
    ('Bouquet de Novia',       'Elegante bouquet blanco con rosas y lirios para el gran día.',     'PEQ', 500.00, 'imgs/arreglos/bouquet_novia_peq.jpg',   8, 'Boda',      'ACT'),
    ('Bouquet de Novia',       'Bouquet clásico con rosas blancas, peonías y eucalipto.',          'MED', 850.00, 'imgs/arreglos/bouquet_novia_med.jpg',   5, 'Boda',      'ACT'),
    ('Bouquet de Novia',       'Bouquet premium con flores importadas y cinta de seda.',           'GRN',1500.00, 'imgs/arreglos/bouquet_novia_grn.jpg',   3, 'Boda',      'ACT'),
    ('Arreglo de Condolencias','Arreglo blanco sobrio con crisantemos y lirios blancos.',          'MED', 400.00, 'imgs/arreglos/condolencias_med.jpg',    8, 'Condolencias','ACT');
