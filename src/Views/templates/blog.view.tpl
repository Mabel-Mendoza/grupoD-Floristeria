<section class="flor-hero herocontainer blog-hero-copy">
    <img src="https://images.pexels.com/photos/5409768/pexels-photo-5409768.jpeg" alt="Blog floral" />
    <div class="flor-hero-content blog-hero-content-copy">
        <span class="blog-badge">Blog floral</span>
        <h2>El significado de cada flor</h2>
        <p>
            Conoce qué representa cada flor, en qué fechas conviene regalarla
            y cómo elegir la mejor opción según la ocasión.
        </p>
        <a href="#blog-articulos" class="flor-btn">Explorar flores</a>
        <a href="index.php?page=Catalogo" class="flor-btn flor-btn-outline">Ir al catálogo</a>
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

<section class="blog-intro" id="blog-articulos">
    <div class="blog-intro__card">
        <div class="blog-intro__left">
            <span class="blog-mini">Guía floral</span>
            <h2>Elegí flores con intención</h2>
            <p>
                En una floristería no solo importa que un arreglo se vea bonito.
                También importa el mensaje que transmite. Algunas flores se asocian
                con amor, amistad, respeto, alegría o agradecimiento.
            </p>
            <p>
                Esta sección fue pensada para ayudar al cliente a elegir mejor,
                entendiendo el significado de cada flor y cuándo conviene regalarla.
            </p>
        </div>

        <div class="blog-intro__right">
            <div class="blog-feature">
                <span class="blog-feature__line"></span>
                <h4>Significados florales</h4>
                <p>Descubre qué representa cada flor antes de elegir el arreglo ideal.</p>
            </div>

            <div class="blog-feature">
                <span class="blog-feature__line"></span>
                <h4>Ocasiones especiales</h4>
                <p>Encuentra opciones pensadas para cumpleaños, aniversarios y detalles de agradecimiento.</p>
            </div>

            <div class="blog-feature">
                <span class="blog-feature__line"></span>
                <h4>Elecciones con intención</h4>
                <p>Elige flores que no solo se vean bonitas, sino que también transmitan el mensaje correcto.</p>
            </div>
        </div>
    </div>
</section>

<section class="blog-cards">
    <div class="blog-cards__grid">
        {{foreach articulos}}
        <article class="blog-card">
            <div class="blog-card__img">
                <img src="{{~BASE_DIR}}public/{{imgurl}}" alt="{{flor}}">
            </div>
            <div class="blog-card__body">
                <h3>{{flor}}</h3>
                <p>{{resumen}}</p>
                <a href="index.php?page=BlogDetalle&id={{id}}" class="blog-link-btn">Leer artículo</a>
            </div>
        </article>
        {{endfor articulos}}
    </div>
</section>



<section class="blog-cta">
    <div class="blog-cta__content">
        <h2>¿No sabés cuál flor elegir?</h2>
        <p>
            Podemos ayudarte a escoger un arreglo según la ocasión, el mensaje
            que querés transmitir y el estilo que buscás.
        </p>
    </div>

    <a href="index.php?page=Contactenos" class="blog-btn">Contáctanos</a>
</section>