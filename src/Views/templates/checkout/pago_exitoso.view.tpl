<div class="pago-page">

  {{if esExitoso}}
  <!-- ✔ PAGO EXITOSO -->
  <div class="pago-card pago-card--ok">
    <div class="pago-icono pago-icono--ok">
      <i class="fas fa-check-circle"></i>
    </div>
    <h2>¡Pago realizado con éxito!</h2>
    <p class="pago-sub">Gracias por tu compra en Floristería Promesa de Dios.</p>

    <div class="pago-detalle-grid">
      <div class="pago-dato">
        <span class="pago-dato__label">N° de transacción PayPal</span>
        <span class="pago-dato__val">{{paypalId}}</span>
      </div>
      <div class="pago-dato">
        <span class="pago-dato__label">Estado</span>
        <span class="pago-dato__val pago-badge-ok">{{status}}</span>
      </div>
      <div class="pago-dato">
        <span class="pago-dato__label">Total cobrado (USD)</span>
        <span class="pago-dato__val">$ {{totalUSD}}</span>
      </div>
      <div class="pago-dato">
        <span class="pago-dato__label">Total (HNL referencial)</span>
        <span class="pago-dato__val">L. {{totalHNL}}</span>
      </div>
    </div>

    {{if hayItems}}
    <h4 class="pago-items-titulo">Artículos comprados</h4>
    <table class="pago-tabla">
      <thead>
        <tr>
          <th>Arreglo</th>
          <th>Cant.</th>
          <th>Precio unit.</th>
          <th>Subtotal</th>
        </tr>
      </thead>
      <tbody>
      {{foreach items}}
        <tr>
          <td>{{arrnombre}}</td>
          <td>{{cantidad}}</td>
          <td>L. {{precioFmt}}</td>
          <td>L. {{subtotalFmt}}</td>
        </tr>
      {{endfor items}}
      </tbody>
    </table>
    {{endif hayItems}}

    <div class="pago-acciones">
      <a href="index.php?page=Checkout_Transacciones" class="pago-btn-historial">
        <i class="fas fa-history"></i> Ver historial de transacciones
      </a>
      <a href="index.php?page=Catalogo" class="pago-btn-catalogo">
        <i class="fas fa-store"></i> Seguir comprando
      </a>
    </div>
  </div>
  {{endif esExitoso}}

  {{if esError}}
  <!-- ✖ ERROR EN EL PAGO -->
  <div class="pago-card pago-card--err">
    <div class="pago-icono pago-icono--err">
      <i class="fas fa-times-circle"></i>
    </div>
    <h2>Hubo un problema con el pago</h2>
    <p class="pago-sub">El estado de la transacción es: <strong>{{status}}</strong></p>
    <p>Por favor intenta nuevamente o contacta a soporte.</p>
    <div class="pago-acciones">
      <a href="index.php?page=Checkout_Carretilla" class="pago-btn-historial">
        <i class="fas fa-arrow-left"></i> Volver a la carretilla
      </a>
    </div>
  </div>
  {{endif esError}}

</div>
