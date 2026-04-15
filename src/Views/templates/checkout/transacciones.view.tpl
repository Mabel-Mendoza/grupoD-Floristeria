<div class="trx-page">
  <h1 class="cart-titulo"><i class="fas fa-history"></i> Historial de Transacciones</h1>

  {{if noHayTransacc}}
  <div class="cart-vacio">
    <div class="cart-vacio__icono"><i class="fas fa-receipt"></i></div>
    <h3>Aún no tienes transacciones</h3>
    <p>Cuando realices un pago, aparecerá aquí el historial completo.</p>
    <a href="index.php?page=Catalogo" class="cart-btn-catalogo">
      <i class="fas fa-store"></i> Ir al Catálogo
    </a>
  </div>
  {{endif noHayTransacc}}

  {{if hayTransacciones}}
  <div class="trx-lista">
    {{foreach transacciones}}
    <div class="trx-card">
      <div class="trx-card__header">
        <div class="trx-card__id">
          <i class="fab fa-paypal" style="color:#003087; font-size:1.1rem;"></i>
          <span class="trx-card__num">Orden #{{paypal_order}}</span>
        </div>
        <div class="trx-card__meta">
          {{if esCompletado}}
          <span class="trx-badge trx-badge--ok"><i class="fas fa-check"></i> COMPLETADO</span>
          {{endif esCompletado}}
          {{if esPendiente}}
          <span class="trx-badge trx-badge--pen"><i class="fas fa-clock"></i> {{paypal_status}}</span>
          {{endif esPendiente}}
          <span class="trx-fecha">{{fching}}</span>
        </div>
      </div>
      <div class="trx-card__body">
        <div class="trx-dato">
          <span>Total pagado:</span>
          <strong class="trx-total">L. {{totalFmt}} <small>({{moneda}})</small></strong>
        </div>
      </div>
    </div>
    {{endfor transacciones}}
  </div>

  <div style="text-align:center; margin-top:2rem;">
    <a href="index.php?page=Catalogo" class="cart-btn-catalogo">
      <i class="fas fa-store"></i> Seguir comprando
    </a>
  </div>
  {{endif hayTransacciones}}
</div>
