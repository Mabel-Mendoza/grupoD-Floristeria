{{if msgAgregado}}
<div class="cart-msg-ok"><i class="fas fa-check-circle"></i> Arreglo agregado al carrito correctamente.</div>
{{endif msgAgregado}}

<div class="cart-page">
  <h1 class="cart-titulo"><i class="fas fa-shopping-cart"></i> Carretilla de Compras</h1>

  {{if noHayItems}}
  <div class="cart-vacio">
    <div class="cart-vacio__icono"><i class="fas fa-shopping-basket"></i></div>
    <h3>Tu carretilla está vacía</h3>
    <p>Agrega arreglos florales desde nuestro catálogo.</p>
    <a href="index.php?page=Catalogo" class="cart-btn-catalogo">
      <i class="fas fa-store"></i> Ver Catálogo
    </a>
  </div>
  {{endif noHayItems}}

  {{if hayItems}}
  <div class="cart-layout">

    <!-- LISTA DE ITEMS -->
    <div class="cart-items">
      {{foreach items}}
      <div class="cart-item">
        <div class="cart-item__img">
          <img src="{{~BASE_DIR}}/public/{{arrimgurl}}"
               alt="{{arrnombre}}"
               onerror="this.src='{{~BASE_DIR}}/public/imgs/hero/3.jpg'" />
        </div>
        <div class="cart-item__info">
          <h4>{{arrnombre}}</h4>
          <span class="cart-item__ocasion">{{arrocasion}}</span>
          <span class="cart-item__tamano">Tamaño: {{arrtamano}}</span>
          <span class="cart-item__precio-unit">L. {{precioFmt}} c/u</span>
        </div>
        <div class="cart-item__acciones">
          <!-- Actualizar cantidad -->
          <form method="POST" action="index.php?page=Checkout_Carretilla" class="cart-qty-form">
            <input type="hidden" name="accion"  value="actualizar" />
            <input type="hidden" name="arrcod"  value="{{arrcod}}" />
            <div class="cart-qty-ctrl">
              <button type="button" class="cart-qty-btn" onclick="cambiarCantidad(this,-1)">&#8722;</button>
              <input type="number" name="cantidad" class="cart-qty-input"
                     value="{{cantidad}}" min="1" max="{{arrstock}}" readonly />
              <button type="button" class="cart-qty-btn" onclick="cambiarCantidad(this,1)">&#43;</button>
            </div>
            <button type="submit" class="cart-btn-update">Actualizar</button>
          </form>
          <!-- Subtotal -->
          <span class="cart-item__subtotal">L. {{subtotalFmt}}</span>
          <!-- Eliminar -->
          <form method="POST" action="index.php?page=Checkout_Carretilla" style="display:inline;">
            <input type="hidden" name="accion"  value="eliminar" />
            <input type="hidden" name="arrcod"  value="{{arrcod}}" />
            <button type="submit" class="cart-btn-del" title="Eliminar">
              <i class="fas fa-trash-alt"></i>
            </button>
          </form>
        </div>
      </div>
      {{endfor items}}

      <!-- Vaciar carrito -->
      <form method="POST" action="index.php?page=Checkout_Carretilla" style="text-align:right; margin-top:0.5rem;">
        <input type="hidden" name="accion" value="vaciar" />
        <button type="submit" class="cart-btn-vaciar">
          <i class="fas fa-times"></i> Vaciar carretilla
        </button>
      </form>
    </div>

    <!-- RESUMEN / CHECKOUT -->
    <div class="cart-resumen">
      <h3>Resumen del pedido</h3>
      <div class="cart-resumen__linea">
        <span>Subtotal (HNL):</span>
        <strong>L. {{totalHNL}}</strong>
      </div>
      <div class="cart-resumen__linea cart-resumen__tasa">
        <span>Equivalente en USD:</span>
        <strong>$ {{totalUSD}}</strong>
      </div>
      <div class="cart-resumen__linea cart-resumen__nota">
        <small>* Tipo de cambio referencial: L. 26 por USD</small>
      </div>
      <div class="cart-resumen__sep"></div>
      <div class="cart-resumen__linea cart-resumen__total">
        <span>TOTAL:</span>
        <strong>L. {{totalHNL}}</strong>
      </div>

      <!-- Botón pagar con PayPal -->
      <a href="index.php?page=Checkout_PagarPayPal" class="cart-btn-paypal">
        <i class="fab fa-paypal"></i> Pagar con PayPal
      </a>

      <a href="index.php?page=Catalogo" class="cart-btn-seguir">
        <i class="fas fa-arrow-left"></i> Seguir comprando
      </a>

      <div class="cart-seguridad">
        <i class="fas fa-lock"></i>
        <span>Pago seguro con encriptación SSL</span>
      </div>
    </div>
  </div>
  {{endif hayItems}}
</div>

<script>
function cambiarCantidad(btn, delta) {
  var form  = btn.closest('.cart-qty-form');
  var input = form.querySelector('.cart-qty-input');
  var max   = parseInt(input.max) || 99;
  var val   = parseInt(input.value) + delta;
  if (val < 1)   val = 1;
  if (val > max) val = max;
  input.value = val;
}
</script>
