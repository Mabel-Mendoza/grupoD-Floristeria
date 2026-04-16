
<section class="flor-hero herocontainer">
    <img src="https://images.pexels.com/photos/5410137/pexels-photo-5410137.jpeg" alt="Nuestros Arreglos" />

    <div class="flor-hero-content">
        <h2>Nuestros Arreglos</h2>
        <p>Encuentra el arreglo perfecto para cada momento especial</p>

        <form class="cat-buscador" method="GET" action="index.php">
            <input type="hidden" name="page" value="Catalogo" />
            <input type="text" name="q" placeholder="Buscar arreglos, ocasiones..." value="{{busqueda}}" autocomplete="off" />
            <button type="submit">
                <i class="fas fa-search"></i>&nbsp;Buscar
            </button>
        </form>
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


<section class="cat-main">
  <div class="cat-header">
    <h3>
      {{if busqueda}}
        Resultados para &ldquo;{{busqueda}}&rdquo;
      {{endif busqueda}}
      {{ifnot busqueda}}
        Todos nuestros arreglos
      {{endifnot busqueda}}
    </h3>
    <span class="cat-contador">{{totalArreglos}} arreglo(s) encontrado(s)</span>
  </div>

  <div class="cat-grid">
    {{foreach arreglos}}
    <div class="cat-card">
      <div class="cat-card__img">
        <img src="{{~BASE_DIR}}/public/{{arrimgurl}}"
             alt="{{arrnombre}}"
             onerror="this.src='{{~BASE_DIR}}/public/imgs/hero/3.jpg'" />
        <span class="cat-card__ocasion">{{arrocasion}}</span>
        <button class="cat-card__fav" title="Agregar a favoritos">
          <i class="far fa-heart"></i>
        </button>
      </div>
      <div class="cat-card__body">
        <h4>{{arrnombre}}</h4>
        <div class="cat-card__estrellas">
          {{{estrellasHtml}}}
          <span class="cat-card__reviews">(4.8)</span>
        </div>
        <p class="cat-card__desc">{{arrdescripcion}}</p>
        <div class="cat-card__footer">
          <span class="cat-card__precio">L. {{arrprecio}}</span>
          <a href="index.php?page=CatalogoDetalle&id={{arrcod}}" class="cat-btn-consultar">
            Consultar ahora
          </a>
        </div>
      </div>
    </div>
    {{endfor arreglos}}
  </div>
</section>


<section class="cat-recomendados">
  <div class="cat-recomendados__header">
    <h3>Nuestras recomendaciones</h3>
    <p>Arreglos especialmente seleccionados para ti</p>
  </div>
  <div class="cat-recomendados__grid">
    {{foreach recomendados}}
    <div class="cat-card-mini">
      <div class="cat-card-mini__img">
        <img src="{{~BASE_DIR}}/public/{{arrimgurl}}"
             alt="{{arrnombre}}"
             onerror="this.src='{{~BASE_DIR}}/public/imgs/hero/3.jpg'" />
      </div>
      <div class="cat-card-mini__body">
        <h4>{{arrnombre}}</h4>
        <div class="cat-mini-footer">
          <span class="cat-card__precio" style="font-size:0.9rem;">L. {{arrprecio}}</span>
          <a href="index.php?page=CatalogoDetalle&id={{arrcod}}" class="cat-btn-mini">Ver</a>
        </div>
      </div>
    </div>
    {{endfor recomendados}}
  </div>
</section>
