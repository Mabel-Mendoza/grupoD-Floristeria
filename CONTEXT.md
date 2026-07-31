# CONTEXT.md — Proyecto Floristería "Promesa de Dios"

> Documento de contexto para que una IA (o un desarrollador nuevo) entienda el proyecto completo:
> qué es, cómo está organizado, qué hace cada carpeta y cada archivo, y cómo se construye una nueva página.

---

## 1. Resumen del proyecto

Aplicación web de **tienda en línea para una floristería** (nombre comercial: *Floristería Promesa de Dios*, Tegucigalpa, Honduras). Es un proyecto académico del curso *Desarrollo de Negocios Web* (Grupo D).

El sitio permite:

- **Público sin sesión:** ver catálogo de arreglos florales, detalle de cada arreglo, galería, blog sobre flores, eventos, FAQ, "acerca de nosotros", cuidado de las flores y contactar a la floristería.
- **Usuarios registrados (clientes):** crear cuenta, iniciar sesión, agregar arreglos a la **carretilla de compras**, pagar con **PayPal**, y ver su **historial de transacciones**.
- **Administradores / vendedores:** CRUD de arreglos florales (mantenimiento) y administración de **seguridad (roles ↔ funciones, usuarios ↔ roles)**.

Se construyó sobre un **framework MVC propio y simple en PHP** (sin frameworks de terceros como Laravel), desarrollado a lo largo de varios períodos académicos. El patrón es **Modelo–Vista–Controlador (MVC)** con programación orientada a objetos (OOP).

---

## 2. Stack tecnológico

| Componente | Tecnología |
|---|---|
| Lenguaje | PHP 7.4+ (se declara compatibilidad desde 7.2) |
| Servidor | Apache (WAMP / XAMPP / MAMP / LAMP) |
| Base de datos | MySQL (`floristeria`), engine InnoDB, charset utf8 |
| Dependencias | Composer (solo `autoload` PSR-4) |
| Gestor de plantillas | Motor de plantillas propio (`src/Views/Renderer.php`) |
| CSS | CSS plano en `public/css` + fuentes **LESS** en `public/css_src` |
| Iconos / fuentes | Font Awesome (kit en `parameters.env`), Google Fonts (Roboto) |
| Pasarela de pago | PayPal REST API (sandbox) — integrada y funcional |
| Pasarela de pago | PixelPay — archivo base creado, **no funcional aún** |
| Control de versiones | Git (repositorio en la raíz) |

---

## 3. Cómo correr el proyecto

1. Tener PHP 7.4+ con extensiones `pdo_mysql` y `curl` activas, y un servidor Apache (WAMP/XAMPP/MAMP/LAMP).
2. Ejecutar `composer install` (genera `vendor/autoload.php`, obligatorio para la carga automática de clases).
3. Copiar/renombrar `parameters.env` y ajustar:
   - `BASE_DIR`: ruta relativa de la carpeta del proyecto dentro de `htdocs`/`www` (ej: `BASE_DIR = /floristeria/`).
   - `DB_*`: credenciales de MySQL.
4. Crear la base de datos ejecutando los scripts de `docs/scripts/` en orden (ver sección 12).
5. Acceder por el navegador a `http://localhost/{BASE_DIR}/index.php`.

> Nota: en este repositorio `vendor/` no existe todavía (está en `.gitignore`); hay que generar `vendor/autoload.php` con `composer install` antes de correr `index.php`.

---

## 4. Arquitectura y flujo de una petición

**Entrada única (`front controller`): `index.php`**

1. Carga `vendor/autoload.php` (autoload PSR-4 con raíz `src/`).
2. Inicia la sesión (`session_start()`).
3. `Site::configure()`: carga `parameters.env` con `DotEnv`, establece la zona horaria y el año actual en el `Context`.
4. `Site::getPageRequest()` calcula el controlador pedido:
   - Usa el controlador por defecto (`PUBLIC_DEFAULT_CONTROLLER` o `PRIVATE_DEFAULT_CONTROLLER`) si hay sesión iniciada.
   - Si llega `?page=...`, reemplaza `_`, `-`, `.` por `\` y antepone `Controllers\`. Ejemplo:
     - `?page=Catalogo` → `Controllers\Catalogo`
     - `?page=Sec_Login` → `Controllers\Sec\Login`
     - `?page=Mantenimientos-Arreglos-Listado` → `Controllers\Mantenimientos\Arreglos\Listado`
     - `?page=Checkout_Carretilla` → `Controllers\Checkout\Carretilla`
5. Instancia el controlador y llama `$instance->run()`.
6. **Manejo de excepciones global:**
   - `PrivateNoAuthException` → muestra `Controllers\NoAuth` (no autorizado).
   - `PrivateNoLoggedException` → redirige a login con `redirto` para volver después.
   - Cualquier `Exception` o `Error` → registra en `error_log`, muestra `Controllers\Error` con el código HTTP adecuado.

**La clase `Context`** (`Utilities\Context`) es el "bolsillo global" donde se guardan variables de configuración y de la petición (mezcla de `parameters.env`, `$_GET`, `$_SESSION`, etc.). Los controladores escriben ahí y el `Renderer` las expone a las plantillas.

---

## 5. Estructura de directorios (árbol)

```
grupoD-Floristeria/
├── index.php                    ← Punto de entrada (front controller / router)
├── composer.json                ← Autoload PSR-4 → "src/"
├── parameters.env               ← Variables de entorno (BD, PayPal, config)
├── nav.config.json              ← Definición de los menús público y privado
├── README.md                    ← Documentación del framework base
├── IntegrantesGrupoD.txt        ← Integrantes del grupo (nombres + DNI)
├── ConstanciaAutorizacion.pdf   ← Constancia de autorización del negocio
├── CONTEXT.md                   ← Este documento
│
├── src/                         ← Código PHP de la aplicación (MVC)
│   ├── Controllers/             ← Controladores (capa C)
│   ├── Dao/                     ← DAOs / modelos de acceso a datos (capa M)
│   ├── Utilities/               ← Clases de utilidad y servicios
│   └── Views/                   ← Motor de plantillas + templates (capa V)
│
├── public/                      ← Recursos estáticos accesibles por el navegador
│   ├── css/                     ← Hojas de estilo finales
│   ├── css_src/                 ← Fuentes LESS de estilos
│   └── imgs/                    ← Imágenes organizadas por sección
│
└── docs/
    └── scripts/                 ← Scripts SQL (esquema y datos de la BD)
```

---

## 6. Archivos de la raíz

| Archivo | Descripción |
|---|---|
| `index.php` | Único punto de entrada. Hace routing, instancia el controlador y ejecuta `run()`. También captura excepciones globales de seguridad y de error. |
| `composer.json` | Solo define el autoload PSR-4: la raíz `""` apunta a `src/`. Sin dependencias externas. |
| `parameters.env` | Configuración por variables de entorno: título del sitio, credenciales MySQL, SMTP, zona horaria, `PWD_HASH`, `DEVELOPMENT`, `BASE_DIR`, `PRIVATE_LAYOUT`, controladores por defecto, kit Font Awesome, y credenciales PixelPay / PayPal. **Está en `.gitignore`** (aunque en este repo está presente con datos). |
| `nav.config.json` | Define los ítems de los menús: sección `public` (menú para visitantes) y sección `private` (menú para usuarios con sesión, filtrado por permisos). Cada ítem tiene `id`, `nav_url`, `nav_label`. |
| `README.md` | Documentación original del framework MVC base (instalación y estructura). |
| `IntegrantesGrupoD.txt` | Lista del grupo D con nombres y números de identidad. |
| `ConstanciaAutorizacion.pdf` | Constancia de autorización de la floristería real (negocio). |
| `.gitignore` | Ignora `parameters.env`, `vendor`, `.htaccess`, `composer.lock`, etc. |

---

## 7. Capa de Controladores — `src/Controllers/`

### 7.1 Controladores base del framework

| Archivo | Descripción |
|---|---|
| `IController.php` | Interfaz que obliga a todo controlador a implementar `run(): void`. |
| `PublicController.php` | Clase base abstracta para páginas de acceso público. En el constructor carga el menú público (`Nav::setPublicNavContext()`) y, si el usuario está logueado, usa el layout privado. Provee `isPostBack()` (detecta peticiones POST). |
| `PrivateController.php` | Extiende `PublicController`. En el constructor exige: (1) sesión iniciada → si no, lanza `PrivateNoLoggedException`; (2) autorización → el controlador se trata como una *función* de tipo `CTR`; si el usuario no la tiene, lanza `PrivateNoAuthException`. Provee `isFeatureAutorized($feature)` para permisos finos. |
| `PrivateNoAuthException.php` | Excepción: sesión válida pero sin permiso para la función. |
| `PrivateNoLoggedException.php` | Excepción: sin sesión iniciada. |
| `NoAuth.php` | Página "no autorizado". Usada por `index.php` al capturar `PrivateNoAuthException`. |
| `Error.php` | Página de error genérica. Usa `ERROR_CODE` / `ERROR_MSG` del Context, responde con el código HTTP (404/500) y mensajes amigables. |
| `About.php` | Página mínima de autor del framework (nombre/correo). Sobra de la base del framework; no se enlaza en el menú. |

### 7.2 Controladores de páginas públicas (raíz de `Controllers/`)

| Archivo | Descripción |
|---|---|
| `Index.php` | Página de inicio. Muestra los primeros 4 arreglos activos como destacados. |
| `Catalogo.php` | Catálogo de arreglos: lista los activos, filtra por `?q=` (búsqueda por nombre/descripción/ocasión), genera HTML de estrellas, y arma una lista de recomendados aleatorios. Carga `floristeria-catalogo.css`. |
| `CatalogoDetalle.php` | Detalle de un arreglo (`?id=`). Redirige al catálogo si no existe o está inactivo. Agrega datos *hardcodeados*: rating 4.8, 3 reviews de ejemplo, distribución de estrellas y productos relacionados. |
| `Acerca.php` | Página "Acerca de Nosotros": servicios, estadísticas, especialidades y equipo (todo en arrays hardcodeados). Carga `floristeria-about.css`. |
| `Blog.php` | Listado de artículos del blog floral. Los 8 artículos (rosas, girasoles, lirios, tulipanes, gerberas, claveles, orquídeas, lavanda) están hardcodeados. Carga `floristeria-blog.css`. |
| `BlogDetalle.php` | Detalle de un artículo (`?id=`). Busca en el mismo array hardcodeado; si no existe, imprime "Artículo no encontrado". |
| `Contactenos.php` | Página de contacto con teléfono, email, redes y dirección de la floristería. |
| `CuidadoFlores.php` | Página estática "Cuidado de las Flores" (contenido en la plantilla). |
| `Eventos.php` | Página de eventos: 3 tarjetas de eventos florales hardcodeadas con CTA a "Contáctenos". Carga `eventos.css`. |
| `Faq.php` | Preguntas frecuentes (8 ítems hardcodeados). **Nota:** esta clase NO extiende `PublicController` (no carga menú/layout privado), pero funciona igual porque implementa `run()`. |
| `Galeria.php` | Galería de imágenes (13 fotos hardcodeadas). Carga `galeria.css`. |

### 7.3 Controladores de checkout — `Controllers/Checkout/`

| Archivo | Descripción |
|---|---|
| `Carretilla.php` | **Carretilla de compras** (privado). Soporta: agregar desde catálogo (`?add=id&qty=`), y acciones POST (`actualizar`, `eliminar`, `vaciar`). Muestra ítems, total en HNL y su equivalente aproximado en USD (÷26). |
| `PagarPayPal.php` | (Privado) Crea la orden PayPal con los ítems del carrito, calcula precios USD (÷26), redirige al usuario al flujo de aprobación de PayPal. Guarda `order id`, `user id` e ítems en sesión. |
| `AceptarPago.php` | (Privado) Callback de retorno de PayPal (`return_url`). Valida el `token` contra la sesión, **captura** la orden, guarda la transacción en BD (`CarritoFlor::guardarTransaccion`), vacía el carrito y muestra la vista de pago exitoso/fallido. |
| `Transacciones.php` | (Privado) Historial de transacciones del usuario logueado. |
| `Checkout.php` | **Demo del framework** (público): crea una orden PayPal de prueba con items fijos "Test". No se usa en el flujo real. |
| `Accept.php` | **Demo del framework** (público): callback de captura de la demo anterior. No se usa en el flujo real. |
| `Error.php` | **Demo del framework** (público): solo imprime `error`. No se usa en el flujo real. |

### 7.4 Controladores de mantenimiento — `Controllers/Mantenimientos/`

| Archivo | Descripción |
|---|---|
| `Arreglos/Listado.php` | (Privado) Listado de todos los arreglos (activos e inactivos). Muestra botones de Nuevo/Editar/Eliminar según los permisos `arreglos_listado_INS/UDP/DEL`. |
| `Arreglos/Formulario.php` | (Privado) CRUD completo de arreglos con modos `INS`, `UPD`, `DSP`, `DEL`. Valida token **XSRF** guardado en sesión, controla permisos por modo, y usa `Dao\Mantenimientos\Arreglos`. |
| `Seguridad/UsuariosRoles.php` | (Privado) Asignar/desasignar roles a usuarios (tablas `roles_usuarios`). Procesa POST `asignar`/`inactivar`. |
| `Seguridad/RolesFunciones.php` | (Privado) Asignar/desasignar funciones a roles (tablas `funciones_roles`). Procesa POST `asignar`/`inactivar`. |

### 7.5 Controladores de seguridad — `Controllers/Sec/`

| Archivo | Descripción |
|---|---|
| `Login.php` | Página de inicio de sesión. Valida email y contraseña con `Validators`, verifica estado de la cuenta, verifica el hash con `Security::verifyPassword` y crea la sesión con `Utilities\Security::login()`. Redirige a `redirto` si vino de una página protegida. |
| `Logout.php` | Cierra sesión (`Security::logout()`) y redirige a `index.php`. |
| `Register.php` | Registro de nuevo usuario: valida email y contraseña fuerte, crea el usuario con `Dao\Security\Security::newUsuario` y redirige al login con mensaje de éxito. |

---

## 8. Capa de Modelos/DAO — `src/Dao/`

### 8.1 Base del framework

| Archivo | Descripción |
|---|---|
| `Dao.php` | Fábrica de conexión **PDO** (singleton). Construye el DSN con `DB_*` del Context (provider, host, dbname, port, charset=utf8). Opciones: emular prepares, lanzar excepciones. |
| `Table.php` | Clase base abstracta de todos los DAOs. Expone métodos protegidos: `obtenerRegistros()`, `obtenerUnRegistro()`, `executeNonQuery()` (todos con bind de parámetros tipado por tipo de dato PHP → PDO), y `_getStructFrom()` (protege campos de un insert/update). |

### 8.2 DAOs de la aplicación

| Archivo | Descripción |
|---|---|
| `Mantenimientos/Arreglos.php` | DAO de la tabla `arreglos`: listar todos/activos, buscar por id, listar tamaños (`tamanos`), crear, actualizar y **eliminación lógica** (cambia `arrest='INA'`). |
| `Cart/CarritoFlor.php` | DAO del carrito real de la floristería y transacciones: `getItems`, `addItem` (inserta o acumula cantidad), `updateCantidad`, `removeItem`, `clearCart`, `getTotal`, `countItems`, `guardarTransaccion` (cabecera + detalle), `getTransacciones`, `getTransaccionDetalle`, `getAllTransacciones` (admin). Tablas: `carretilla_flor`, `transacciones`, `transacciones_detalle`. |
| `Cart/Cart.php` | DAO del carrito **genérico del framework base** (tablas `products`, `carretilla`, `carretillaanon`). Calcula stock disponible restando lo reservado por carretillas (autorizada/anon). **No se usa en el flujo actual** de la floristería. |
| `Security/Security.php` | DAO de seguridad completo y en uso: usuarios (`getUsuarios`, `newUsuario`, `getUsuarioByEmail`, `getUsuarioByCod`), hashing de contraseñas (HMAC-SHA256 + bcrypt), funciones, roles, asignaciones roles↔usuarios y funciones↔roles, con consultas de "no asignados" (`getUnAssignedRoles`, `getUnAssignedFeatures`). |
| `Security/SecurityC.php` | **Duplicado más antiguo/incompleto** de `Security.php`. No lo usa ningún controlador (los controladores importan `Dao\Security\Security`). Tiene métodos vacíos (`getUnAssignedFeatures`, `getUnAssignedRoles`). Podría eliminarse. |
| `Security/Estados.php` | Enum de estados (`ACT`, `INA`, `BLQ`, `SUS`). |
| `Security/UsuarioTipo.php` | Enum de tipos de usuario (`PBL` público, `ADM` administrador, `AUD` auditor). |

---

## 9. Capa de Utilidades — `src/Utilities/`

| Archivo | Descripción |
|---|---|
| `Context.php` | Contenedor global de estado (estático). Lee/escribe variables en memoria y opcionalmente en `$_SESSION`. `getContextByKey()` también consulta sesión como respaldo. |
| `DotEnv.php` | Parser de archivos `.env` estilo "clave=valor" (ignora líneas `#`), los carga a `$_ENV`/`$_SERVER`/`putenv` y devuelve el array. |
| `Site.php` | Utilidad estática central: `configure()` (carga env + timezone), `getPageRequest()` (routing), `redirectTo()`, `redirectToWithMsg()` (alert + redirect), `addLink()/addBeginScript()/addEndScript()` (registran assets extra para el layout), `logError()`. |
| `Security.php` | Utilidad de sesión/permisos: `login()`, `logout()`, `isLogged()`, `getUser()`, `getUserId()`, `isAuthorized()` y `isInRol()`. En modo `DEVELOPMENT=1` **autocrea** funciones/roles no existentes al consultarlos (útil para desarrollo). |
| `Nav.php` | Carga los menús desde `nav.config.json` hacia el Context. El menú privado filtra los ítems por autorización (`type MNU`). Tiene `invalidateNavData()` para forzar recarga. |
| `Paging.php` | Genera HTML de paginación usando la plantilla `utilities/pagination` (máx. 7 páginas visibles). Devuelve string listo para inyectar en una vista. |
| `ArrUtils.php` | Utilidades de arreglos: `mergeArrayTo` (copia solo llaves existentes), `mergeFullArrayTo`, `toOptionsArray` y `objectArrToOptionsArray` (generan opciones para `<select>` con selección). |
| `Validators.php` | Validaciones por regex: `IsEmpty`, `IsValidEmail`, `IsValidPassword` (8–32 chars, mayúscula, número y símbolo). |
| `Enum.php` | Clase base para enums: `toArray()`, `toFormatedArray()`, `isValid()`. |
| `NotSupportedException.php` | Excepción usada por `Enum` (operaciones no soportadas). |

### 9.1 Subcarpetas de `Utilities/`

| Archivo | Descripción |
|---|---|
| `Cart/CartFns.php` | Constantes de tiempo para carretillas del framework base: 6 horas (autorizada) y 10 min (anónima). Usado por `Dao\Cart\Cart`. |
| `PayPal/PayPalOrder.php` | **Builder** de la orden PayPal (v2/checkout). Permite `addItem(nombre, descripción, sku, precio, impuesto, cantidad, categoría)` y calcula automáticamente los totales. |
| `PayPal/PayPalRestApi.php` | Cliente REST de PayPal con `curl`: `getAccessToken()` (con caché por expiración), `createOrder(PayPalOrder)` y `captureOrder(orderId)`. Cambia de `sandbox` a producción según el entorno. |
| `PixelPay/PixelPayOrder.php` | Esqueleto de integración con PixelPay (pasarela hondureña). Solo inicializa `_key`, URL según entorno y el cuerpo base `_body` (campos con prefijo `_`, moneda HNL/USD). **No tiene métodos de pago implementados.** |

---

## 10. Capa de Vistas — `src/Views/`

### 10.1 Motor de plantillas: `Renderer.php`

Motor de plantillas **propio** (sin Blade/Twig). Funcionamiento:

- `Renderer::render($vista, $datos, $layoutFile, $render)`:
  1. Mezcla los datos recibidos con el `Context` global y con `$_SESSION`.
  2. Carga el **layout** (master page) desde `src/Views/templates/`, y reemplaza el marcador `{{{page_content}}}` por el contenido del archivo de vista (`src/Views/templates/{$vista}.view.tpl`).
  3. Soporta **partials** con `{{include nombre}}`.
  4. Parsea el HTML con un parser propio de bloques y reemplaza variables.
  5. Si `USE_URLREWRITE=1`, reescribe las URLs `index.php?page=...` a rutas limpias.
- Sintaxis soportada en las plantillas:
  - `{{variable}}` → valor en el contexto actual.
  - `{{~variable}}` → variable del contexto raíz (root).
  - `{{&variable}}` → variable del contexto padre.
  - `{{foreach lista}} ... {{endfor lista}}` → iteración (por defecto itera el contexto actual; `~` para root).
  - `{{if variable}} ... {{endif variable}}` y `{{ifnot variable}} ... {{endifnot variable}}` → condicional (evalúa que la clave exista y sea truthy).
  - `{{with variable}} ... {{endwith variable}}` → cambia el contexto interno.
  - `{{include parcial}}` → incluye otra plantilla (sin `.view.tpl`).
  - `{{{page_content}}}` → placeholder donde el layout inserta la vista.
- El layout puede elegirse por parámetro o por la clave `layoutFile` en el Context (los controladores privados usan `privatelayout.view.tpl`).

### 10.2 Plantillas — `src/Views/templates/`

| Plantilla | Página / uso |
|---|---|
| `layout.view.tpl` | Layout público (header con menú público, footer, assets). |
| `privatelayout.view.tpl` | Layout privado (header con menú filtrado por permisos + usuario logueado + botón salir). |
| `index.view.tpl` | Inicio: hero, sección "¿Por qué elegirnos?", destacados, testimonios (partial), banner. |
| `catalogo.view.tpl` | Catálogo de arreglos con búsqueda y recomendados. |
| `catalogo_detalle.view.tpl` | Detalle de arreglo (tabs descripción/info/reviews). |
| `acerca.view.tpl` | Acerca de nosotros. |
| `blog.view.tpl` | Listado del blog. |
| `blogdetalle.view.tpl` | Detalle del artículo del blog. |
| `contactenos.view.tpl` | Contacto. |
| `cuidado_flores.view.tpl` | Cuidado de las flores. |
| `eventos.view.tpl` | Eventos. |
| `faq.view.tpl` | Preguntas frecuentes. |
| `galeria.view.tpl` | Galería. |
| `testimonios.view.tpl` | Partial de testimonios (incluido en el index). |
| `error.view.tpl` | Página de error. |
| `noauth.view.tpl` | Página "no autorizado". |
| `about.view.tpl` | Página about del framework (sobra). |
| `security/login.view.tpl` | Formulario de login. |
| `security/sigin.view.tpl` | Formulario de registro. |
| `checkout/carretilla.view.tpl` | Carretilla de compras. |
| `checkout/pago_exitoso.view.tpl` | Confirmación del pago. |
| `checkout/transacciones.view.tpl` | Historial de transacciones. |
| `paypal/checkout.view.tpl`, `paypal/accept.view.tpl`, `paypal/error.view.tpl` | Vistas de la demo PayPal del framework (no usadas en el flujo real). |
| `mantenimientos/arreglos/listado.view.tpl` | Listado CRUD de arreglos. |
| `mantenimientos/arreglos/formulario.view.tpl` | Formulario CRUD de arreglos. |
| `mantenimientos/seguridad/usuarios_roles.view.tpl` | Gestión de roles por usuario. |
| `mantenimientos/seguridad/roles_funciones.view.tpl` | Gestión de funciones por rol. |
| `utilities/pagination.view.tpl` | Partial de paginación (usado por `Paging`). |
| `utilities/blanklayout.view.tpl` | Layout vacío (para renderizar parciales sin HTML completo). |
| `eventos/eventos1.png`, `eventos2.png`, `eventos3.png` | Imágenes de la página de eventos. |

---

## 11. Recursos estáticos — `public/`

### 11.1 `public/css/`

Hojas de estilo finales. Las principales del sitio:

| Archivo | Uso |
|---|---|
| `appstyle.css`, `appstyle2.css` | Estilos base del framework (menú, header, formularios, tablas). |
| `floristeria.css` | Estilos generales de la floristería (paleta, botones, secciones). |
| `floristeria-extra.css`, `floristeria-testimonios.css`, `floristeria-contacto.css` | Secciones específicas cargadas siempre por el layout. |
| `floristeria-catalogo.css` | Catálogo y detalle (cargado por `Catalogo`/`CatalogoDetalle`). |
| `floristeria-carrito.css` | Carretilla y transacciones. |
| `floristeria-about.css` | Página "Acerca de". |
| `floristeria-blog.css` | Blog. |
| `floristeria-faq.css`, `eventos.css`, `galeria.css`, `cuidadoflores.css` | Páginas FAQ, Eventos, Galería y Cuidado de flores. |
| `colors.css`, `grid.css`, `style.css`, `form.css`, `heropanel.css` | Utilidades/legacy del framework base. |

### 11.2 `public/css_src/`

Fuentes **LESS** del framework base (`style.less` es el archivo maestro que `@import` a los demás: `breakpoints.less`, `grid.less`, `modal.less`, `utilities.less`, `main.less`, `menu.less`, `form.less`, `table.less`, `hero.less`). Se compilan a CSS (los `.css` finales ya están generados en `public/css`).

### 11.3 `public/imgs/`

Imágenes organizadas por sección:
- `arreglos/` → fotos de arreglos (rosas, girasoles, tulipanes, margaritas, etc.).
- `flores_catalogo/` y `flores_catalogo_clasificado/` → fotos usadas en catálogo y blog (incluye `listado.txt` con nombres).
- `galeria/` → fotos de la galería (formatos jpg, avif, webp, jpeg).
- `hero/` → imágenes del banner/hero.
- `Cuidados/` → imágenes y video (`video.mp4`) de la página de cuidado de flores.
- `equipo/` → fotos del equipo (maría.jpg, josue.jpg, alejandra.jpg).

---

## 12. Base de datos — `docs/scripts/`

Los scripts SQL deben ejecutarse en orden (00 → 03). Algunos son acumulativos/reemplazan versiones anteriores.

| Script | Contenido |
|---|---|
| `00_database.sql` | Crea el esquema `floristeria` (utf8). |
| `01_security.sql` | Tablas de seguridad base: `usuario`, `roles`, `roles_usuarios`, `funciones`, `funciones_roles`, `bitacora`. |
| `01b_roles_floristeria.sql` | Inserta roles (ADMIN, VENDEDOR, CLIENTE) y funciones/permisos del CRUD de arreglos. |
| `02_carretillas.sql` | Tablas del carrito genérico del framework base (`products`, `carretilla`, `carretillaanon`). Usado por `Dao\Cart\Cart` (flujo antiguo). |
| `02_seguridad_datos.sql` | Datos de seguridad: funciones de seguridad, roles, funciones_roles, usuarios de ejemplo (admin/vendedor/cliente) y asignación de roles. |
| `03_arreglos.sql` | Tablas `arreglos` y `tamanos`, con datos de ejemplo (10 arreglos, 3 tamaños). |
| `03_carretilla_transacciones.sql` | Tablas del carrito real (`carretilla_flor`) y transacciones (`transacciones`, `transacciones_detalle`), más funciones/permisos del módulo checkout. |
| `03b_parche_permisos.sql` | Parche: agrega funciones `Checkout_PagarPayPal` y `Checkout_AceptarPago` a todos los roles. |

### Tablas principales

| Tabla | Propósito |
|---|---|
| `usuario` | Usuarios (email, nombre, hash de contraseña, estado, tipo). |
| `roles` | Roles del sistema (ADMIN, VENDEDOR, CLIENTE). |
| `funciones` | Funciones/permisos (CRUD de arreglos, menús, controladores). |
| `roles_usuarios` | Asignación de roles a usuarios (con estado y expiración). |
| `funciones_roles` | Asignación de funciones a roles (con estado y expiración). |
| `arreglos` | Productos del negocio (nombre, descripción, tamaño, precio HNL, imagen, stock, ocasión, estado). |
| `tamanos` | Catálogo de tamaños (PEQ, MED, GRN). |
| `carretilla_flor` | Carrito por usuario (usercod + arrcod + cantidad + precio). |
| `transacciones` | Cabecera de transacción PayPal (order id, status, total, moneda, detalle JSON). |
| `transacciones_detalle` | Líneas de cada transacción (ítems comprados). |
| `bitacora` | Bitácora del framework (no usada activamente). |
| `products`, `carretilla`, `carretillaanon` | Carrito genérico del framework base (flujo antiguo, no usado por el sitio actual). |

---

## 13. Seguridad y control de acceso (RBAC)

- **Autenticación:** sesión PHP (`$_SESSION["login"]`) con `isLogged`, `userId`, `userName`, `userEmail`.
- **Autorización por funciones:** todo recurso privado es una *función* (`fncod`) de tipo `CTR` (controlador) o `MNU` (menú). La verificación es:
  `usuario → roles_usuarios → funciones_roles → funciones`.
  La consulta clave es `Security::getFeatureByUsuario($userId, $fncod)`.
- **Auto-registro en desarrollo:** con `DEVELOPMENT=1`, `Utilities\Security::isAuthorized()` **crea automáticamente** la función si no existe, y `isInRol()` crea el rol. Esto hace que los controladores privados "se registren solos" al ser visitados por primera vez (luego hay que asignarlos al rol ADMIN).
- **Contraseñas:** `hash_hmac("sha256", $password, PWD_HASH)` + `password_hash()` con bcrypt (constante `PASSWORD_ALGORITHM='2y'`). Verificación con `password_verify()`.
- **XSRF/CSRF:** el formulario de arreglos genera un token en sesión (`GenerateXSRFToken`) y lo valida en POST (`ValidarDatos`).
- **Eliminación lógica:** los arreglos no se borran; pasan a `arrest='INA'`.

---

## 14. Pagos (PayPal y PixelPay)

**Flujo de pago PayPal (funcional):**
1. El cliente en la carretilla presiona pagar → `PagarPayPal` (`Controllers\Checkout\PagarPayPal`).
2. Se construye una `PayPalOrder` con los ítems del carrito (precios HNL → USD ÷ 26).
3. `PayPalRestApi::createOrder()` crea la orden y se redirige al link `approve` de PayPal.
4. PayPal redirige de vuelta a `Checkout_AceptarPago` con un `token`.
5. `AceptarPago` valida el token contra la sesión, llama `captureOrder()`, y si el status es `COMPLETED` guarda la transacción (cabecera + detalle) en BD, vacía el carrito y limpia la sesión de PayPal.
6. El cliente puede ver su historial en `Checkout_Transacciones`.

**Configuración PayPal** en `parameters.env`: `PAYPAL_CLIENT_ID`, `PAYPAL_CLIENT_SECRET`, `PAYPAL_CLIENT_ENV=sandbox`. La URL base del servidor se calcula automáticamente en `PagarPayPal` para evitar fallos con puertos distintos de 80.

**PixelPay:** solo existe el esqueleto `PixelPayOrder` (configura key y URL por entorno). No hay controlador ni vista que lo use todavía.

---

## 15. Configuración detallada

### 15.1 `parameters.env` (claves relevantes)

| Clave | Significado |
|---|---|
| `SITE_TITLE` | Título del sitio mostrado en el `<title>` y header. |
| `DB_PROVIDER`, `DB_SERVER`, `DB_USER`, `DB_PSWD`, `DB_DATABASE`, `DB_PORT` | Conexión MySQL. |
| `SMTP_HOST/USER/SECRET/PORT` | SMTP (no implementado). |
| `TIMEZONE` | Zona horaria (`America/Tegucigalpa`). |
| `PWD_HASH` | Secreto para el salado de contraseñas. |
| `DEVELOPMENT` | `1` = modo desarrollo (autocrea funciones/roles, no cachea menús en sesión). |
| `USE_URLREWRITE` | `1` = URLs limpias (`/BaseDir/Pagina/`), `0` = `index.php?page=...`. |
| `BASE_DIR` | Ruta relativa del proyecto en el servidor web. |
| `PRIVATE_LAYOUT` | Layout usado cuando hay sesión iniciada (`privatelayout`). |
| `PUBLIC_DEFAULT_CONTROLLER`, `PRIVATE_DEFAULT_CONTROLLER` | Página por defecto (público/privado) = `Index`. |
| `FONT_AWESOME_KIT` | Kit de Font Awesome (cargado en el layout). |
| `PIXELPAY_*` | Credenciales/URL PixelPay (no usadas aún). |
| `PAYPAL_*` | Credenciales PayPal y entorno (`sandbox`). |

### 15.2 `nav.config.json`

- `public`: menú para visitantes (Catálogo, Acerca, Contáctenos, Blog, Eventos, Cuidado de las Flores, Galería, FAQ, Iniciar Sesión, Crear Cuenta).
- `private`: menú para usuarios logueados, **filtrado por permisos** (Catálogo, Carretilla, Mis Transacciones, Arreglos Florales, Roles por Usuario, Funciones por Rol, Contáctenos). Los ítems de mantenimiento y seguridad solo aparecen si el usuario tiene la función `MNU` correspondiente.

---

## 16. Cómo agregar una página nueva (workflow para IA)

1. **Ruta:** la URL será `index.php?page=MiPagina` (o `Mi_Sub_Modulo` → `Controllers\Mi\Sub\Modulo`).
2. **Controlador:** crear `src/Controllers/MiPagina.php` con `class MiPagina extends PublicController { public function run(): void { ... } }`. Si es privada, extender `PrivateController`.
3. **Permisos (si es privada):** el controlador debe existir como función tipo `CTR` en BD (`funciones` + `funciones_roles` para el rol ADMIN). Con `DEVELOPMENT=1` se autocrea; luego asignarla al rol desde `Mantenimientos-Seguridad-RolesFunciones`.
4. **Vista:** crear `src/Views/templates/mipagina.view.tpl` usando la sintaxis del Renderer (`{{var}}`, `{{foreach}}`, `{{if}}`, `{{include}}`).
5. **Layout:** pasar datos con `Renderer::render("mipagina", $viewData)`; si es privada, usar `Renderer::render("mipagina", $viewData, "privatelayout.view.tpl")`.
6. **Menú:** agregar el ítem en `nav.config.json` (`public` y/o `private` con su `id`).
7. **CSS:** si necesita estilos propios, crear `public/css/xxx.css` y cargarlo con `Site::addLink("public/css/xxx.css")` dentro de `run()`.
8. **Modelo:** si necesita BD, crear/ampliar un DAO en `src/Dao/...` extendiendo `Dao\Table`.

---

## 17. Observaciones y deudas técnicas (importantes para trabajar con la IA)

- **Varias vistas y secciones tienen contenido hardcodeado** en los controladores (blog, detalle de arreglo con reviews, eventos, galería, testimonios, FAQ, equipo). No provienen de la base de datos. Si se quiere contenido dinámico, hay que migrarlos a tablas y DAOs.
- **`Dao\Cart\Cart` y `CartFns`, y las tablas `products`/`carretilla`/`carretillaanon`** son el carrito del framework base; el sitio real usa `carretilla_flor` con `CarritoFlor`. No eliminar sin revisar usos, pero no participan en el flujo actual.
- **`SecurityC.php`** es un duplicado incompleto de `Dao\Security\Security` y no se usa.
- **`Checkout.php`, `Accept.php`, `Error.php` (Checkout) y `about.view.tpl`/`About.php`** son demos/sobras del framework base.
- **`Faq.php` no extiende `PublicController`**, así que no hereda el menú ni el layout privado (consistente con el resto, pero es una inconsistencia de estilo).
- **PixelPay** está esqueletizado (solo `PixelPayOrder`), sin flujo de pago.
- **No hay `vendor/` en el repo** (ignorado): hay que correr `composer install`.
- **El tipo de cambio HNL→USD está fijo en ÷26** (y USD→HNL ×26) en `Carretilla.php`, `PagarPayPal.php` y `AceptarPago.php`. Idealmente debería ser configurable.
- **No hay pruebas automatizadas** en el repositorio.
- **`SecurityC` define dos veces la constante `PASSWORD_ALGORITHM`** con `define()`; si ambos archivos se cargan en la misma petición podría emitir un warning (hoy no ocurre porque `SecurityC` no se carga).
- **Los nombres de permisos de edición usan `arreglos_listado_UDP`** (typo histórico de "UPD") — es la convención ya establecida en BD y código, no cambiarla sin migración.
- **`parameters.env` está presente en el repo con credenciales reales de PayPal sandbox.** Está en `.gitignore` para futuras versiones, pero hay que cuidar de no subir credenciales de producción.
