<!-- ============================================================
     HERO
     ============================================================ -->
<section class="flor-hero herocontainer">
    <img src="https://images.pexels.com/photos/5410137/pexels-photo-5410137.jpeg" alt="Floristería" />
    <div class="flor-hero-content">
        <h2>{{pageTitle}}</h2>
        <p>{{pageSubtitle}}</p>
        <a href="{{ctaUrl}}" class="flor-btn">{{ctaLabel}}</a>
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

<section class="eventos-intro">
  <div class="section-heading">
    <h3>Creaciones llenas de emoción</h3>
    <p>{{introText}}</p>
  </div>
  <div class="eventos-grid">
    {{foreach events}}
      <article class="eventos-card">
        <img class="eventos-card-img" src="src/Views/templates/eventos/{{image}}" alt="{{type}}" />
        <div class="eventos-card-tag">{{type}}</div>
        <h3>{{title}}</h3>
        <span class="eventos-card-date">{{date}}</span>
        <p>{{description}}</p>
        <div class="eventos-card-footer">
          <strong>{{price}}</strong>
          <a href="index.php?page=Contactenos" class="eventos-btn">Reservar</a>
        </div>
      </article>
    {{endfor events}}
  </div>
</section>

<section class="eventos-highlight">
  <div class="eventos-highlight-card">
    <h3>¿Por qué elegir nuestros eventos?</h3>
    <ul>
      <li><strong>Diseño exclusivo</strong> con flores de la mejor calidad.</li>
      <li><strong>Servicio rápido</strong> para pedidos a última hora.</li>
      <li><strong>Atención personalizada</strong> desde el primer mensaje.</li>
    </ul>
    <a href="{{ctaUrl}}" class="flor-btn flor-btn-blanco">Habla con un especialista</a>
  </div>
</section>

<div class="flor-divider-bottom">
    <svg viewBox="0 0 1200 80" preserveAspectRatio="none" width="100%" height="80" xmlns="http://www.w3.org/2000/svg">
        <path d="M0,40 C50,10 100,70 150,40 C200,10 250,70 300,40 C350,10 400,70 450,40 C500,10 550,70 600,40 C650,10 700,70 750,40 C800,10 850,70 900,40 C950,10 1000,70 1050,40 C1100,10 1150,70 1200,40 L1200,80 L0,80 Z" fill="#6a4e44"/>

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


<section class="eventos-testimonial">
  <div class="eventos-testimonial-card">
    <h4>"Las flores hicieron brillar nuestra boda. Servicio impecable y diseño encantador."</h4>
    <p>— Ana & Carlos</p>
  </div>
</section>


