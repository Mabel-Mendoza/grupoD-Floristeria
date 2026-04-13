<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{SITE_TITLE}}</title>
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="{{BASE_DIR}}/public/css/appstyle.css" />
  <link rel="stylesheet" href="{{~BASE_DIR}}public/css/floristeria.css" />
<link rel="stylesheet" href="{{~BASE_DIR}}public/css/floristeria-extra.css" />
<link rel="stylesheet" href="{{~BASE_DIR}}public/css/floristeria-testimonios.css" />
<link rel="stylesheet" href="{{~BASE_DIR}}public/css/floristeria-contacto.css" />
  <script src="https://kit.fontawesome.com/{{FONT_AWESOME_KIT}}.js" crossorigin="anonymous"></script>
  {{foreach SiteLinks}}
  <link rel="stylesheet" href="{{~BASE_DIR}}/{{this}}" />
  {{endfor SiteLinks}}
  {{foreach BeginScripts}}
  <script src="{{~BASE_DIR}}/{{this}}"></script>
  {{endfor BeginScripts}}
</head>

<body>
  <header>
    <input type="checkbox" class="menu_toggle" id="menu_toggle" />
    <label for="menu_toggle" class="menu_toggle_icon">
      <div class="hmb dgn pt-1"></div>
      <div class="hmb hrz"></div>
      <div class="hmb dgn pt-2"></div>
    </label>
    <h1>{{SITE_TITLE}}</h1>
    <nav id="menu">
      <ul>
        <li><a href="index.php?page={{PRIVATE_DEFAULT_CONTROLLER}}"><i class="fas fa-home"></i>&nbsp;Inicio</a></li>
        {{foreach NAVIGATION}}
            <li><a href="{{nav_url}}">{{nav_label}}</a></li>
        {{endfor NAVIGATION}}
        <li><a href="index.php?page=sec_logout"><i class="fas fa-sign-out-alt"></i>&nbsp;Salir</a></li>
      </ul>
    </nav>
    {{with login}}
    <span class="username">{{userName}} <a href="index.php?page=sec_logout"><i class="fas fa-sign-out-alt"></i></a></span>
    {{endwith login}}
  </header>
  <main>
    {{{page_content}}}
  </main>


  <footer class="flor-footer">
    <div class="footer-grid">

        <!-- Columna izquierda: links -->
        <div class="footer-col">
            <h4>Navegación</h4>
            <ul>
                <li><a href="index.php?page=Index">Inicio</a></li>
                <li><a href="index.php?page=Catalogo">Tienda</a></li>
                <li><a href="index.php?page=Contactenos">Contáctenos</a></li>
                <li><a href="index.php?page=Sec_Login">Iniciar Sesión</a></li>
                <li><a href="index.php?page=Sec_Register">Crear Cuenta</a></li>
            </ul>
        </div>

        <!-- Columna central: logo y nombre -->
        <div class="footer-col footer-center">
            <div class="footer-logo">🌸</div>
            <h3>Promesa de Dios</h3>
            <p>Flores que hablan por ti</p>
        </div>

        <!-- Columna derecha: contacto y redes -->
        <div class="footer-col footer-right">
            <h4>Encuéntranos</h4>
            <p>📍 Tegucigalpa, Blvd. Suyapa<br>frente a la rotonda</p>
            <p>📞 +504 9835-3151</p>
            <div class="footer-redes">
                <a href="https://www.instagram.com/floristeria_promesa_de_dios_07/?hl=es" target="_blank" title="Instagram">
                    <svg viewBox="0 0 24 24" width="22" height="22" fill="none" stroke="currentColor" stroke-width="2">
                        <rect x="2" y="2" width="20" height="20" rx="5" ry="5"/>
                        <path d="M16 11.37A4 4 0 1112.63 8 4 4 0 0116 11.37z"/>
                        <line x1="17.5" y1="6.5" x2="17.51" y2="6.5"/>
                    </svg>
                </a>
                <a href="https://www.facebook.com/people/Florister%C3%ADa-Promesa-De-Dios/61551369051785/" target="_blank" title="Facebook">
                    <svg viewBox="0 0 24 24" width="22" height="22" fill="currentColor">
                        <path d="M18 2h-3a5 5 0 00-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 011-1h3z"/>
                    </svg>
                </a>
                <a href="https://www.tiktok.com/@promesa_de_dios_hn" target="_blank" title="TikTok">
                    <svg viewBox="0 0 24 24" width="22" height="22" fill="currentColor">
                        <path d="M19.59 6.69a4.83 4.83 0 01-3.77-4.25V2h-3.45v13.67a2.89 2.89 0 01-2.88 2.5 2.89 2.89 0 01-2.89-2.89 2.89 2.89 0 012.89-2.89c.28 0 .54.04.79.1V9.01a6.3 6.3 0 00-.79-.05 6.34 6.34 0 00-6.34 6.34 6.34 6.34 0 006.34 6.34 6.34 6.34 0 006.33-6.34V8.69a8.18 8.18 0 004.78 1.52V6.75a4.85 4.85 0 01-1.01-.06z"/>
                    </svg>
                </a>
            </div>
        </div>

    </div>
    <div class="footer-bottom">
        <p>Todo los Derechos Reservados {{~CURRENT_YEAR}} &copy; Floristería Promesa de Dios</p>
    </div>
</footer>




  {{foreach EndScripts}}
  <script src="{{~BASE_DIR}}/{{this}}"></script>
  {{endfor EndScripts}}
</body>
</html>
