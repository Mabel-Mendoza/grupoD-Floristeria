<!-- ============================================================
     HERO
     ============================================================ -->
<section class="flor-hero herocontainer">
    <img src="https://images.pexels.com/photos/5410137/pexels-photo-5410137.jpeg" alt="Floristería" />
    <div class="flor-hero-content">
        <h2>Flores que hablan por ti</h2>
        <p>Arreglos florales únicos para cada momento especial.<br>
           Bodas, cumpleaños, aniversarios y mucho más.</p>
        <a href="index.php?page=Catalogo" class="flor-btn">Ver Catálogo</a>
        {{ifnot IS_LOGGED}}
        <a href="index.php?page=Sec_Register" class="flor-btn flor-btn-outline">Crear Cuenta</a>
        {{endifnot IS_LOGGED}}
    </div>
</section>



<!-- Borde decorativo abajo -->
    <div style="width:99.5vw; height:80px; margin-left:calc(-50vw + 50%); overflow:hidden; line-height:0; margin-bottom:-1px;">
        <svg viewBox="0 0 1200 80" preserveAspectRatio="none" width="100%" height="80" xmlns="http://www.w3.org/2000/svg">
            <path d="M0,40 C50,10 100,70 150,40 C200,10 250,70 300,40 C350,10 400,70 450,40 C500,10 550,70 600,40 C650,10 700,70 750,40 C800,10 850,70 900,40 C950,10 1000,70 1050,40 C1100,10 1150,70 1200,40 L1200,0 L0,0 Z" fill="#6a4e44"/>
            <ellipse cx="75"  cy="38" rx="12" ry="6" fill="#7a7959" transform="rotate(-20,75,38)"/>
            <ellipse cx="225" cy="38" rx="10" ry="5" fill="#ab9b9e" transform="rotate(15,225,38)"/>
            <ellipse cx="375" cy="38" rx="12" ry="6" fill="#7a7959" transform="rotate(-10,375,38)"/>
            <ellipse cx="525" cy="38" rx="10" ry="5" fill="#ab9b9e" transform="rotate(20,525,38)"/>
            <ellipse cx="675" cy="38" rx="12" ry="6" fill="#7a7959" transform="rotate(-15,675,38)"/>
            <ellipse cx="825" cy="38" rx="10" ry="5" fill="#ab9b9e" transform="rotate(10,825,38)"/>
            <ellipse cx="975" cy="38" rx="12" ry="6" fill="#7a7959" transform="rotate(-20,975,38)"/>
            <ellipse cx="1125" cy="38" rx="10" ry="5" fill="#ab9b9e" transform="rotate(15,1125,38)"/>
            <circle cx="150" cy="35" r="5" fill="#cb958e"/>
            <circle cx="300" cy="42" r="4" fill="#eac3bd"/>
            <circle cx="450" cy="36" r="5" fill="#cb958e"/>
            <circle cx="600" cy="43" r="4" fill="#eac3bd"/>
            <circle cx="750" cy="35" r="5" fill="#cb958e"/>
            <circle cx="900" cy="41" r="4" fill="#eac3bd"/>
            <circle cx="1050" cy="36" r="5" fill="#cb958e"/>
        </svg>
    </div>


    

<!-- ============================================================
     POR QUÉ ELEGIRNOS
     ============================================================ -->
<section class="flor-porque reveal">
    <h3>¿Por qué elegirnos?</h3>
    <p class="subtitulo">Cada arreglo está hecho con amor y dedicación 🌸</p>
    <div class="flor-iconos">
        <div class="flor-icono-item">
            <span class="icono">
                <svg viewBox="0 0 40 40" width="40" height="40" xmlns="http://www.w3.org/2000/svg">
                    <circle cx="20" cy="20" r="6" fill="#eac3bd"/>
                    <ellipse cx="20" cy="8" rx="5" ry="8" fill="#cb958e"/>
                    <ellipse cx="20" cy="32" rx="5" ry="8" fill="#cb958e"/>
                    <ellipse cx="8" cy="20" rx="8" ry="5" fill="#cb958e"/>
                    <ellipse cx="32" cy="20" rx="8" ry="5" fill="#cb958e"/>
                    <ellipse cx="11" cy="11" rx="5" ry="8" fill="#6a4e44" transform="rotate(45,11,11)"/>
                    <ellipse cx="29" cy="11" rx="5" ry="8" fill="#6a4e44" transform="rotate(-45,29,11)"/>
                    <ellipse cx="11" cy="29" rx="5" ry="8" fill="#6a4e44" transform="rotate(-45,11,29)"/>
                    <ellipse cx="29" cy="29" rx="5" ry="8" fill="#6a4e44" transform="rotate(45,29,29)"/>
                    <circle cx="20" cy="20" r="4" fill="#ffffff"/>
                </svg>
            </span>
            <p>Flores frescas todos los días</p>
        </div>

        <div class="flor-icono-item">
            <span class="icono">
                <svg viewBox="0 0 40 40" width="40" height="40" xmlns="http://www.w3.org/2000/svg">
                    <rect x="8" y="18" width="24" height="18" rx="3" fill="#cb958e"/>
                    <rect x="6" y="14" width="28" height="6" rx="2" fill="#6a4e44"/>
                    <path d="M20 14 Q14 8 12 12 Q10 16 20 14Z" fill="#7a7959"/>
                    <path d="M20 14 Q26 8 28 12 Q30 16 20 14Z" fill="#7a7959"/>
                    <rect x="18" y="14" width="4" height="22" fill="#eac3bd"/>
                </svg>
            </span>
            <p>Arreglos personalizados</p>
        </div>

        <div class="flor-icono-item">
            <span class="icono">
                <svg viewBox="0 0 40 40" width="40" height="40" xmlns="http://www.w3.org/2000/svg">
                    <polygon points="20,4 24,14 35,14 26,21 29,32 20,25 11,32 14,21 5,14 16,14" fill="#6a4e44"/>
                </svg>
            </span>
            <p>Más de 1,000 clientes felices</p>
        </div>

        <div class="flor-icono-item">
            <span class="icono">
                <svg viewBox="0 0 40 40" width="40" height="40" xmlns="http://www.w3.org/2000/svg">
                    <rect x="4" y="14" width="26" height="14" rx="3" fill="#6a4e44"/>
                    <rect x="4" y="14" width="26" height="6" rx="3" fill="#cb958e"/>
                    <circle cx="14" cy="30" r="4" fill="#ab9b9e"/>
                    <circle cx="26" cy="30" r="4" fill="#ab9b9e"/>
                    <path d="M30 20 Q38 20 36 26 L30 26Z" fill="#7a7959"/>
                </svg>
            </span>
            <p>Entrega a domicilio</p>
        </div>

        <div class="flor-icono-item">
            <span class="icono">
                <svg viewBox="0 0 40 40" width="40" height="40" xmlns="http://www.w3.org/2000/svg">
                    <rect x="4" y="10" width="32" height="22" rx="4" fill="#6a4e44"/>
                    <rect x="4" y="16" width="32" height="6" fill="#cb958e"/>
                    <rect x="8" y="24" width="10" height="4" rx="2" fill="#eac3bd"/>
                </svg>
            </span>
            <p>Pago seguro en línea</p>
        </div>
    </div>
    <!-- Borde decorativo abajo -->
    <div style="width:100vw; height:80px; margin-left:calc(-50vw + 50%); overflow:hidden; line-height:0; margin-bottom:-1px;">
        <svg viewBox="0 0 1200 80" preserveAspectRatio="none" width="100%" height="80" xmlns="http://www.w3.org/2000/svg">
            <path d="M0,40 C50,10 100,70 150,40 C200,10 250,70 300,40 C350,10 400,70 450,40 C500,10 550,70 600,40 C650,10 700,70 750,40 C800,10 850,70 900,40 C950,10 1000,70 1050,40 C1100,10 1150,70 1200,40 L1200,80 L0,80 Z" fill="#e4d5cd"/>
            <!-- Hojitas decorativas -->
            <ellipse cx="75"  cy="38" rx="12" ry="6" fill="#7a7959" transform="rotate(-20,75,38)"/>
            <ellipse cx="225" cy="38" rx="10" ry="5" fill="#ab9b9e" transform="rotate(15,225,38)"/>
            <ellipse cx="375" cy="38" rx="12" ry="6" fill="#7a7959" transform="rotate(-10,375,38)"/>
            <ellipse cx="525" cy="38" rx="10" ry="5" fill="#ab9b9e" transform="rotate(20,525,38)"/>
            <ellipse cx="675" cy="38" rx="12" ry="6" fill="#7a7959" transform="rotate(-15,675,38)"/>
            <ellipse cx="825" cy="38" rx="10" ry="5" fill="#ab9b9e" transform="rotate(10,825,38)"/>
            <ellipse cx="975" cy="38" rx="12" ry="6" fill="#7a7959" transform="rotate(-20,975,38)"/>
            <ellipse cx="1125" cy="38" rx="10" ry="5" fill="#ab9b9e" transform="rotate(15,1125,38)"/>
            <!-- Florecitas -->
            <circle cx="150" cy="35" r="5" fill="#cb958e"/>
            <circle cx="300" cy="42" r="4" fill="#eac3bd"/>
            <circle cx="450" cy="36" r="5" fill="#cb958e"/>
            <circle cx="600" cy="43" r="4" fill="#eac3bd"/>
            <circle cx="750" cy="35" r="5" fill="#cb958e"/>
            <circle cx="900" cy="41" r="4" fill="#eac3bd"/>
            <circle cx="1050" cy="36" r="5" fill="#cb958e"/>
        </svg>
    </div>
</section>

<!-- ============================================================
     CATÁLOGO — imagen de fondo + tarjetas polaroid
     ============================================================ -->
<section class="flor-catalogo-bg reveal">
    <!-- Borde decorativo arriba -->
    <div class="flor-divider-top">
        <svg viewBox="0 0 1200 80" width="100%" preserveAspectRatio="xMidYMid slice" xmlns="http://www.w3.org/2000/svg">
            <path d="M0,40 C50,70 100,10 150,40 C200,70 250,10 300,40 C350,70 400,10 450,40 C500,70 550,10 600,40 C650,70 700,10 750,40 C800,70 850,10 900,40 C950,70 1000,10 1050,40 C1100,70 1150,10 1200,40 L1200,0 L0,0 Z" fill="#e4d5cd"/>
            
            <ellipse cx="75"  cy="42" rx="12" ry="6" fill="#7a7959" transform="rotate(20,75,42)"/>
            <ellipse cx="225" cy="42" rx="10" ry="5" fill="#ab9b9e" transform="rotate(-15,225,42)"/>
            <ellipse cx="375" cy="42" rx="12" ry="6" fill="#7a7959" transform="rotate(10,375,42)"/>
            <ellipse cx="525" cy="42" rx="10" ry="5" fill="#ab9b9e" transform="rotate(-20,525,42)"/>
            <ellipse cx="675" cy="42" rx="12" ry="6" fill="#7a7959" transform="rotate(15,675,42)"/>
            <ellipse cx="825" cy="42" rx="10" ry="5" fill="#ab9b9e" transform="rotate(-10,825,42)"/>
            <ellipse cx="975" cy="42" rx="12" ry="6" fill="#7a7959" transform="rotate(20,975,42)"/>
            <circle cx="150" cy="45" r="5" fill="#cb958e"/>
            <circle cx="300" cy="38" r="4" fill="#eac3bd"/>
            <circle cx="450" cy="44" r="5" fill="#cb958e"/>
            <circle cx="600" cy="37" r="4" fill="#eac3bd"/>
            <circle cx="750" cy="45" r="5" fill="#cb958e"/>
            <circle cx="900" cy="39" r="4" fill="#eac3bd"/>
            <circle cx="1050" cy="44" r="5" fill="#cb958e"/>
        </svg>
    </div>

    <div class="flor-catalogo-inner">
        <h3>Nuestros Arreglos</h3>
        <p class="subtitulo">Descubre nuestra colección más especial</p>
        <div class="flor-cards">
            {{foreach destacados}}
            <div class="flor-card-polaroid reveal">
                <div class="polaroid-foto">
                    <img src="{{~BASE_DIR}}public/{{arrimgurl}}"
                         alt="{{arrnombre}}"
                         onerror="this.src='{{~BASE_DIR}}public/imgs/hero/1.jpg'" />
                    <span class="flor-card-badge">{{arrtamano}}</span>
                </div>
                <div class="polaroid-body">
                    <h4>{{arrnombre}}</h4>
                    <span class="ocasion">🌿 {{arrocasion}}</span>
                    <span class="precio">L. {{arrprecio}}</span>
                    <a href="index.php?page=Catalogo">Ver más</a>
                </div>
            </div>
            {{endfor destacados}}
        </div>
        <br><br>
        <a href="index.php?page=Catalogo" class="flor-btn flor-btn-blanco">Ver todos los arreglos</a>
    </div>

    <!-- Borde decorativo abajo -->
     <div class="flor-divider-bottom">
    <svg viewBox="0 0 1200 80" preserveAspectRatio="none" width="100%" height="80" xmlns="http://www.w3.org/2000/svg">
        <path d="M0,40 C50,10 100,70 150,40 C200,10 250,70 300,40 C350,10 400,70 450,40 C500,10 550,70 600,40 C650,10 700,70 750,40 C800,10 850,70 900,40 C950,10 1000,70 1050,40 C1100,10 1150,70 1200,40 L1200,80 L0,80 Z" fill="#e4d5cd"/>

        <ellipse cx="75"  cy="38" rx="12" ry="6" fill="#7a7959" opacity="0.5" transform="rotate(-20,75,38)"/>
        <ellipse cx="225" cy="38" rx="10" ry="5" fill="#ab9b9e" opacity="0.4" transform="rotate(15,225,38)"/>
        <ellipse cx="375" cy="38" rx="12" ry="6" fill="#7a7959" opacity="0.5" transform="rotate(-10,375,38)"/>
        <ellipse cx="525" cy="38" rx="10" ry="5" fill="#ab9b9e" opacity="0.4" transform="rotate(20,525,38)"/>
        <ellipse cx="675" cy="38" rx="12" ry="6" fill="#7a7959" opacity="0.5" transform="rotate(-15,675,38)"/>
        <ellipse cx="825" cy="38" rx="10" ry="5" fill="#ab9b9e" opacity="0.4" transform="rotate(10,825,38)"/>
        <ellipse cx="975" cy="38" rx="12" ry="6" fill="#7a7959" opacity="0.5" transform="rotate(-20,975,38)"/>

        <circle cx="150" cy="35" r="5" fill="#cb958e" opacity="0.6"/>
        <circle cx="300" cy="42" r="4" fill="#eac3bd" opacity="0.5"/>
        <circle cx="450" cy="36" r="5" fill="#cb958e" opacity="0.6"/>
        <circle cx="600" cy="43" r="4" fill="#eac3bd" opacity="0.5"/>
        <circle cx="750" cy="35" r="5" fill="#cb958e" opacity="0.6"/>
        <circle cx="900" cy="41" r="4" fill="#eac3bd" opacity="0.5"/>
        <circle cx="1050" cy="36" r="5" fill="#cb958e" opacity="0.6"/>
    </svg>
</div>
</section>


{{include testimonios}}



<!-- ============================================================
     BANNER CTA 
     ============================================================ -->
{{ifnot IS_LOGGED}}
<section class="flor-banner">
    <img src="{{~BASE_DIR}}public/imgs/hero/1.jpg" alt="Banner" />
    <div class="flor-banner-content">
        <h3>¿Listo para sorprender a alguien especial?</h3>
        <p>Crea tu cuenta y realiza tu pedido en minutos</p>
        <a href="index.php?page=Sec_Register" class="flor-btn flor-btn-outline">Comenzar ahora</a>
    </div>
</section>
{{endifnot IS_LOGGED}}

<!-- ============================================================
     SCRIPT — Animación al hacer scroll
     ============================================================ -->
<script>
    document.addEventListener("DOMContentLoaded", () => {
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add("visible");
                }
            });
        }, { threshold: 0.15 });

        document.querySelectorAll(".reveal").forEach(el => {
            observer.observe(el);
        });
    });
</script>
