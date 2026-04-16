<section class="flor-hero herocontainer about-hero">
    <img src="https://images.pexels.com/photos/5414029/pexels-photo-5414029.jpeg" alt="Acerca de Floristería Promesa de Dios" />
    <div class="flor-hero-content about-hero-content">
        <h2>Acerca de Nosotros</h2>
        <p>Más de 8 años llevando flores y emociones a cada rincón de Tegucigalpa.<br>
           Cada arreglo es una promesa de amor, cuidado y dedicación.</p>
        <a href="index.php?page=Catalogo" class="flor-btn">Ver Catálogo</a>
        <a href="index.php?page=Contactenos" class="flor-btn flor-btn-outline">Contáctenos</a>
    </div>
</section>


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
     ABOUT US — Quiénes somos + 3 servicios destacados
     ============================================================ -->
<section class="about-quienes reveal">
    <div class="about-quienes-texto">
        <span class="about-chip">Nuestra Historia</span>
        <h3>Floristería Promesa de Dios</h3>
        <div class="about-decorador"></div>
        <p>
            Somos una floristería familiar con sede en Tegucigalpa, Honduras. Nacimos con la convicción
            de que las flores tienen el poder de expresar lo que las palabras no alcanzan.
        </p>
        <p>
            Nuestro objetivo principal es ayudarte a encontrar el arreglo que represente exactamente
            lo que sientes. Nos centramos en la frescura, la calidad y el detalle de cada creación, 
            porque sabemos que lo que regalas habla por ti.
        </p>
        <a href="index.php?page=Contactenos" class="flor-btn">Consúltanos</a>
    </div>

    <div class="about-quienes-cards">
        {{foreach servicios}}
        <div class="about-servicio-card reveal">
            <div class="about-servicio-icono">
                <i class="{{icono}}"></i>
            </div>
            <h4>{{titulo}}</h4>
            <p>{{descripcion}}</p>
        </div>
        {{endfor servicios}}
    </div>
</section>


<!-- ============================================================
     BANNER ESTADÍSTICAS — Fondo oscuro con números
     ============================================================ -->
<section class="about-stats">
    <div class="about-stats-overlay"></div>
    <div class="about-stats-content">
        <h3>Flores que hablan por ti</h3>
        <p class="about-stats-sub">Ayudamos a nuestros clientes a encontrar el arreglo ideal antes de que las palabras se agoten.</p>
        <div class="about-stats-grid">
            {{foreach estadisticas}}
            <div class="about-stat-item reveal">
                <span class="about-stat-numero">{{numero}}</span>
                <span class="about-stat-etiqueta">{{etiqueta}}</span>
            </div>
            {{endfor estadisticas}}
        </div>
    </div>
</section>


<!-- ============================================================
     ESPECIALIDADES — Nuestras industrias / servicios
     ============================================================ -->
<section class="about-especialidades reveal">
    <div class="about-section-header">
        <h3>Nuestras Especialidades</h3>
        <div class="about-decorador"></div>
        <p>Flores para cada momento importante de tu vida</p>
    </div>
    <div class="about-especialidades-grid">
        {{foreach especialidades}}
        <div class="about-esp-card reveal">
            <div class="about-esp-icono">
                <i class="{{icono}}"></i>
            </div>
            <h4>{{titulo}}</h4>
            <p>{{descripcion}}</p>
        </div>
        {{endfor especialidades}}
    </div>
</section>


<!-- ============================================================
     EQUIPO — Nuestro equipo
     ============================================================ -->
<section class="about-equipo">
    <div style="width:99.5vw; height:60px; margin-left:calc(-50vw + 50%); overflow:hidden; line-height:0; margin-bottom:-1px;">
        <svg viewBox="0 0 1200 60" preserveAspectRatio="none" width="100%" height="60" xmlns="http://www.w3.org/2000/svg">
            <path d="M0,30 C150,60 350,0 600,30 C850,60 1050,0 1200,30 L1200,0 L0,0 Z" fill="#e4d5cd"/>
        </svg>
    </div>

    <div class="about-equipo-inner">
        <div class="about-section-header">
            <h3>Conoce a Nuestro Equipo</h3>
            <div class="about-decorador"></div>
            <p>Estamos aquí para hacer de cada flor una experiencia inolvidable</p>
        </div>

        <div class="about-equipo-grid">
            {{foreach equipo}}
            <div class="about-equipo-card reveal">
                <div class="about-equipo-avatar">
                    <img src="{{foto}}" alt="{{nombre}}" class="about-equipo-img">
                </div>
                <div class="about-equipo-info">
                    <h4>{{nombre}}</h4>
                    <span class="about-equipo-cargo">{{cargo}}</span>
                    <p>{{descripcion}}</p>
                </div>
            </div>
            {{endfor equipo}}
        </div>
    </div>

    <div style="width:99.5vw; height:60px; margin-left:calc(-50vw + 50%); overflow:hidden; line-height:0; margin-top:-1px;">
        <svg viewBox="0 0 1200 60" preserveAspectRatio="none" width="100%" height="60" xmlns="http://www.w3.org/2000/svg">
            <path d="M0,30 C150,0 350,60 600,30 C850,0 1050,60 1200,30 L1200,60 L0,60 Z" fill="#e4d5cd"/>
        </svg>
    </div>
</section>


<!-- ============================================================
     CTA — Solicitar Contacto (equivalente a "Request a call back")
     ============================================================ -->
<section class="about-cta reveal">
    <div class="about-cta-content">
        <h3>¿Querés hablar con una de nuestras floristas?</h3>
        <p>
            Solo escríbenos con tus datos de contacto y te responderemos a la brevedad.
            También podés enviarnos un mensaje si preferís ese medio de comunicación.
        </p>
    </div>
    <div class="about-cta-actions">
        <a href="index.php?page=Contactenos" class="flor-btn">Contáctenos ahora</a>
        {{ifnot IS_LOGGED}}
        <a href="index.php?page=Sec_Register" class="flor-btn flor-btn-outline">Crear mi cuenta</a>
        {{endifnot IS_LOGGED}}
    </div>
</section>


<!-- Script de animación scroll -->
<script>
    document.addEventListener("DOMContentLoaded", () => {
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add("visible");
                }
            });
        }, { threshold: 0.12 });

        document.querySelectorAll(".reveal").forEach(el => observer.observe(el));
    });
</script>
