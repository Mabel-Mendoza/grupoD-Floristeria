<div class="prod-breadcrumb">
  <a href="index.php?page=Catalogo">Catálogo</a>
  <span> / </span>
  <span>{{arrnombre}}</span>
</div>


<div class="prod-detalle">
  <div class="prod-grid">

    
    <div class="prod-imagen">
      <img id="prod-img-principal"
           src="{{~BASE_DIR}}/public/{{arrimgurl}}"
           alt="{{arrnombre}}"
           onerror="this.src='{{~BASE_DIR}}/public/imgs/hero/3.jpg'" />
      <!-- Miniaturas (misma imagen x3 como placeholder) -->
      <div class="prod-thumbs">
        <img src="{{~BASE_DIR}}/public/{{arrimgurl}}" alt="" class="prod-thumb active"
             onerror="this.src='{{~BASE_DIR}}/public/imgs/hero/3.jpg'"
             onclick="document.getElementById('prod-img-principal').src=this.src" />
        <img src="{{~BASE_DIR}}/public/imgs/hero/3.jpg" alt="" class="prod-thumb"
             onclick="document.getElementById('prod-img-principal').src=this.src" />
        <img src="{{~BASE_DIR}}/public/imgs/hero/4.jpg" alt="" class="prod-thumb"
             onclick="document.getElementById('prod-img-principal').src=this.src" />
      </div>
    </div>

   
    <div class="prod-info">
      <span class="prod-ocasion">{{arrocasion}}</span>
      <h2>{{arrnombre}}</h2>

      <div class="prod-floritas">
        {{{estrellasHtml}}}
        <span class="prod-reviews">({{numReviews}} reseñas)</span>
      </div>

      <div class="prod-precio">L. {{arrprecio}}</div>

      <p class="prod-descripcion">{{arrdescripcion}}</p>

      
      <div class="prod-tamano">
        <strong>Tamaño:</strong>
        <span class="prod-tamano-badge">{{arrtamano}}</span>
      </div>

      
      <div class="prod-stock">
        <i class="fas fa-check-circle" style="color:#7a7959;"></i>
        {{arrstock}} disponibles en inventario
      </div>

      
      <div class="prod-cantidad">
        <button class="prod-qty-btn" onclick="cambiarCantidad(-1)">&#8722;</button>
        <input type="number" id="prod-qty" value="1" min="1" max="{{arrstock}}" readonly />
        <button class="prod-qty-btn" onclick="cambiarCantidad(1)">&#43;</button>
      </div>

      
      <div class="prod-botones">
        {{if estaLogueado}}
        <a href="index.php?page=Checkout_Carretilla&add={{arrcod}}&qty=1" class="prod-btn-carrito">
          <i class="fas fa-shopping-cart"></i> Agregar al carrito
        </a>
        <a href="index.php?page=Checkout_Carretilla" class="prod-btn-comprar">
          Comprar ahora
        </a>
        {{endif estaLogueado}}
        {{ifnot estaLogueado}}
        <a href="index.php?page=Sec_Login" class="prod-btn-carrito">
          <i class="fas fa-sign-in-alt"></i> Iniciar sesión para comprar
        </a>
        {{endifnot estaLogueado}}
        <button class="prod-btn-fav" title="Agregar a favoritos"><i class="far fa-heart"></i></button>
      </div>

      
      <div class="prod-extras">
        <div class="prod-extra-item">
          <i class="fas fa-truck" style="color:#cb958e;"></i>
          <div><strong>Envío disponible</strong><p>Tegucigalpa y área metropolitana</p></div>
        </div>
        <div class="prod-extra-item">
          <i class="fas fa-leaf" style="color:#7a7959;"></i>
          <div><strong>100% natural</strong><p>Flores frescas de temporada</p></div>
        </div>
        <div class="prod-extra-item">
          <i class="fas fa-headset" style="color:#6a4e44;"></i>
          <div><strong>Atención 24/7</strong><p>Estamos para ayudarte</p></div>
        </div>
      </div>

    </div><!-- /prod-info -->
  </div><!-- /prod-grid -->

  
  <div class="prod-tabs">
    <div class="prod-tabs__nav">
      <button class="prod-tab-btn active" onclick="mostrarTab('desc', this)">Descripción</button>
      <button class="prod-tab-btn" onclick="mostrarTab('info', this)">Información adicional</button>
      <button class="prod-tab-btn" onclick="mostrarTab('reviews', this)">Reseñas ({{numReviews}})</button>
    </div>

    
    <div id="tab-desc" class="prod-tab-content active">
      <p>{{descripcionLarga}}</p>
      <ul class="prod-desc-lista">
        <li><i class="fas fa-check" style="color:#cb958e;"></i> Flores 100% naturales y frescas</li>
        <li><i class="fas fa-check" style="color:#cb958e;"></i> Seleccionadas y preparadas el mismo día</li>
        <li><i class="fas fa-check" style="color:#cb958e;"></i> Presentación cuidada con empaques especiales</li>
        <li><i class="fas fa-check" style="color:#cb958e;"></i> Disponibles para entrega o recogida en tienda</li>
      </ul>
    </div>

    
    <div id="tab-info" class="prod-tab-content" style="display:none;">
      <table class="prod-info-tabla">
        <tr><th>Ocasión</th><td>{{arrocasion}}</td></tr>
        <tr><th>Tamaño</th><td>{{arrtamano}}</td></tr>
        <tr><th>Estado</th><td>Disponible</td></tr>
        <tr><th>Stock</th><td>{{arrstock}} unidades</td></tr>
        <tr><th>Código</th><td>#{{arrcod}}</td></tr>
        <tr><th>Cuidados</th><td>Mantener en lugar fresco, cambiar agua cada 2 días</td></tr>
        <tr><th>Duración estimada</th><td>5 a 10 días con cuidados adecuados</td></tr>
      </table>
    </div>

   
    <div id="tab-reviews" class="prod-tab-content" style="display:none;">
      <div class="prod-reviews-resumen">
        <div class="prod-reviews-global">
          <span class="prod-reviews-num">{{rating}}</span>
          <div class="prod-reviews-estrellas">{{{estrellasHtml}}}</div>
          <span style="color:#ab9b9e; font-size:0.85rem;">({{numReviews}} reseñas)</span>
        </div>
        <div class="prod-reviews-barras">
          {{foreach distribucion}}
          <div class="prod-barra-row">
            <span>{{num}} <i class="fas fa-star" style="color:#f5a623; font-size:0.75rem;"></i></span>
            <div class="prod-barra-bg"><div class="prod-barra-fill" style="{{ancho}}"></div></div>
            <span>{{pct}}%</span>
          </div>
          {{endfor distribucion}}
        </div>
      </div>

      <h4 class="prod-reviews-lista-titulo">Reseñas de clientes</h4>
      {{foreach reviews}}
      <div class="prod-review-item">
        <div class="prod-review-header">
          <div class="prod-review-avatar">{{nombre}}</div>
          <div>
            <strong>{{nombre}}</strong>
            {{if esVerificado}}<span class="prod-verificado">(Verificado)</span>{{endif esVerificado}}
            <div class="prod-review-estrellas">{{{estrellas}}}</div>
          </div>
          <span class="prod-review-tiempo">{{tiempo}}</span>
        </div>
        <p class="prod-review-titulo">{{titulo}}</p>
        <p class="prod-review-texto">{{texto}}</p>
      </div>
      {{endfor reviews}}
    </div>
  </div>
</div>


<section class="prod-relacionados">
  <h3>Explorar productos relacionados</h3>
  <p class="subtitulo">Te pueden interesar también</p>
  <div class="cat-grid" style="justify-content:center;">
    {{foreach relacionados}}
    <div class="cat-card">
      <div class="cat-card__img">
        <img src="{{~BASE_DIR}}/public/{{arrimgurl}}"
             alt="{{arrnombre}}"
             onerror="this.src='{{~BASE_DIR}}/public/imgs/hero/3.jpg'" />
        <span class="cat-card__ocasion">{{arrocasion}}</span>
      </div>
      <div class="cat-card__body">
        <h4>{{arrnombre}}</h4>
        <div class="cat-card__estrellas">
          {{{estrellasHtml}}}
        </div>
        <div class="cat-card__footer">
          <span class="cat-card__precio">L. {{arrprecio}}</span>
          <a href="index.php?page=CatalogoDetalle&id={{arrcod}}" class="cat-btn-consultar">
            Ver detalle
          </a>
        </div>
      </div>
    </div>
    {{endfor relacionados}}
  </div>
</section>

<script>
function mostrarTab(tab, btn) {
  document.querySelectorAll('.prod-tab-content').forEach(function(el){ el.style.display='none'; el.classList.remove('active'); });
  document.querySelectorAll('.prod-tab-btn').forEach(function(b){ b.classList.remove('active'); });
  document.getElementById('tab-'+tab).style.display='block';
  document.getElementById('tab-'+tab).classList.add('active');
  btn.classList.add('active');
}
function cambiarCantidad(delta) {
  var input = document.getElementById('prod-qty');
  var val = parseInt(input.value) + delta;
  var max = parseInt(input.max) || 99;
  if (val < 1) val = 1;
  if (val > max) val = max;
  input.value = val;
}
// Thumbnails activos
document.querySelectorAll('.prod-thumb').forEach(function(thumb){
  thumb.addEventListener('click', function(){
    document.querySelectorAll('.prod-thumb').forEach(function(t){ t.classList.remove('active'); });
    this.classList.add('active');
  });
});
</script>
