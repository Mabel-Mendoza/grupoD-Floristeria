<link rel="stylesheet" href="{{~BASE_DIR}}public/css/floristeria-faq.css">

<section class="flor-hero herocontainer faq-hero-copy">
    <img src="https://images.pexels.com/photos/5414029/pexels-photo-5414029.jpeg" alt="Preguntas frecuentes floristería" />
    <div class="flor-hero-content faq-hero-content-copy">
        <span class="faq-badge">Preguntas frecuentes</span>
        <h2>Resolvemos tus dudas</h2>
        <p>
            Aquí encontrarás respuestas claras sobre pedidos, entregas,
            arreglos florales y el funcionamiento general de nuestra tienda.
        </p>
        <a href="#faq-listado" class="flor-btn">Ver preguntas</a>
        <a href="index.php?page=Catalogo" class="flor-btn flor-btn-outline">Ver catálogo</a>
    </div>
</section>

<!-- 👇 BORDE DECORATIVO (AGREGADO) -->
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

<section class="faq-intro reveal">
    <div class="faq-intro-card">
        <div class="faq-intro-left">
            <span class="faq-mini">Ayuda rápida</span>
            <h3>Todo lo que necesitas saber antes de comprar</h3>
            <p>
                Esta sección fue creada para brindar respuestas claras sobre el funcionamiento de la floristería,
                el proceso de compra, la personalización de arreglos y el servicio al cliente.
            </p>
            <p>
                La idea es que el usuario tenga más seguridad al momento de elegir flores, realizar pedidos
                y consultar cualquier información importante dentro de la tienda.
            </p>
        </div>

        <div class="faq-intro-right faq-intro-right--alt">
            <div class="faq-card-small faq-card-small--uno">
                <span class="faq-card-number">01</span>
                <h4>Información clara</h4>
                <p>Respuestas rápidas para orientar al cliente antes de comprar.</p>
            </div>

            <div class="faq-card-small faq-card-small--dos">
                <span class="faq-card-number">02</span>
                <h4>Compras más seguras</h4>
                <p>Conocer el proceso ayuda a realizar pedidos con más confianza.</p>
            </div>

            <div class="faq-card-wide">
                <div class="faq-card-wide__text">
                    <span class="faq-card-number">03</span>
                    <h4>Mejor experiencia</h4>
                    <p>Una sección pensada para resolver dudas comunes de forma sencilla y con un diseño más agradable para el usuario.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="faq-section reveal" id="faq-listado">
    <div class="faq-wrapper">
        <div class="faq-header">
            <span class="faq-mini">Sección informativa</span>
            <h3>Preguntas frecuentes</h3>
            <p>
                Consulta las respuestas más comunes sobre nuestra floristería.
            </p>
        </div>

        <div class="faq-list">
            {{foreach preguntas}}
            <details class="faq-item">
                <summary>{{pregunta}}</summary>
                <div class="faq-answer">
                    <p>{{respuesta}}</p>
                </div>
            </details>
            {{endfor preguntas}}
        </div>
    </div>
</section>

<section class="faq-cta reveal">
    <div class="faq-cta-content">
        <h3>¿Todavía tienes dudas?</h3>
        <p>
            Si necesitas más información, puedes comunicarte con nosotros
            y con gusto te ayudaremos.
        </p>
    </div>
    <a href="index.php?page=Contactenos" class="flor-btn">Contáctanos</a>
</section>

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