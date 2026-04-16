<section class="flor-hero herocontainer">
    <img src="https://images.pexels.com/photos/5410137/pexels-photo-5410137.jpeg" alt="Floristería" />
    <div class="flor-hero-content">
        <h2>Galería Floral</h2>
        <p>Inspiración floral para cada momento especial.<br>
           Descubre nuestras creaciones en bodas, cumpleaños y más.</p>
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

<section class="flor-collage">


    <div class="gallery-header">
        <h2>Galeria de locales, productos y eventos</h2>
        <p></p>
    </div>

    <div class="collage-grid">

        {{foreach galeria}}

        <div class="item">
            <img src="{{~BASE_DIR}}/public/{{img}}">
        </div>

        {{endfor galeria}}

    </div>
</section>

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

<div id="lightbox" class="lightbox">
    <span class="close" onclick="closeLightbox()">×</span>
    <span class="nav left" onclick="prevImage()">‹</span>
    <img id="lightbox-img">
    <span class="nav right" onclick="nextImage()">›</span>
</div>

<script src="{{~BASE_DIR}}/public/js/galeria.js"></script>