<style>
.seg-card{background:#fff;border:1px solid #dde3ec;border-radius:8px;margin-bottom:1.5rem;box-shadow:0 1px 4px rgba(0,0,0,.06);overflow:hidden;}
.seg-card-header{background:#2c5f8a;color:#fff;padding:.7rem 1rem;}
.seg-card-header h3{margin:0;font-size:1rem;}
.seg-card-header small{font-size:.82rem;color:#c8dff0;}
.seg-card-body{padding:1rem;}
.seg-tabla{width:100%;border-collapse:collapse;font-size:.88rem;margin-top:.5rem;}
.seg-tabla th{background:#eef3f8;text-align:left;padding:.4rem .6rem;border-bottom:2px solid #b0c8e0;font-size:.8rem;color:#2c5f8a;}
.seg-tabla td{padding:.4rem .6rem;border-bottom:1px solid #eee;vertical-align:middle;}
.seg-tabla tr:last-child td{border-bottom:none;}
.badge-act{display:inline-block;background:#d4edda;color:#155724;border:1px solid #c3e6cb;padding:.15rem .5rem;border-radius:20px;font-size:.75rem;font-weight:600;}
.badge-ina{display:inline-block;background:#f8d7da;color:#721c24;border:1px solid #f5c6cb;padding:.15rem .5rem;border-radius:20px;font-size:.75rem;font-weight:600;text-decoration:line-through;}
.badge-typ{display:inline-block;background:#fff3cd;color:#856404;border:1px solid #ffc107;padding:.1rem .4rem;border-radius:3px;font-size:.72rem;font-weight:700;margin-left:.3rem;}
.btn-inact{background:#c0392b;color:#fff;border:none;padding:.22rem .6rem;border-radius:4px;cursor:pointer;font-size:.8rem;}
.btn-inact:hover{background:#96281b;}
.btn-asignar{background:#2c5f8a;color:#fff;border:none;padding:.32rem .9rem;border-radius:5px;cursor:pointer;font-size:.85rem;}
.btn-asignar:hover{background:#1a4266;}
.seg-form-nueva{display:flex;gap:.5rem;align-items:center;flex-wrap:wrap;margin-top:.75rem;padding-top:.75rem;border-top:1px dashed #ccd;}
.seg-form-nueva select{flex:1;min-width:220px;padding:.3rem .5rem;border:1px solid #bbb;border-radius:4px;}
.msg-ok{background:#d4edda;color:#155724;border:1px solid #c3e6cb;padding:.5rem 1rem;border-radius:5px;margin-bottom:1rem;}
.msg-err{background:#f8d7da;color:#721c24;border:1px solid #f5c6cb;padding:.5rem 1rem;border-radius:5px;margin-bottom:1rem;}
.roles-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(380px,1fr));gap:1.2rem;}
.sin-items{color:#999;font-size:.85rem;font-style:italic;}
</style>

<section class="container">
  <h1><i class="fas fa-shield-alt"></i> Gestión de Funciones por Rol</h1>

  {{if msgExito}}<div class="msg-ok">&#10004; {{msgExito}}</div>{{endif msgExito}}
  {{if msgError}}<div class="msg-err">&#10008; {{msgError}}</div>{{endif msgError}}

  <div class="roles-grid">
  {{foreach roles}}
    <div class="seg-card">
      <div class="seg-card-header">
        <h3><i class="fas fa-id-badge"></i> {{rolesdsc}}</h3>
        <small>C&oacute;digo: {{rolescod}} &nbsp;|&nbsp; Estado: {{rolesest}}</small>
      </div>
      <div class="seg-card-body">

        <strong style="font-size:.85rem;">Funciones asignadas:</strong>

        {{if tieneFunciones}}
        <table class="seg-tabla">
          <thead>
            <tr>
              <th>Funci&oacute;n</th>
              <th>Tipo</th>
              <th>Estado</th>
              <th>Acci&oacute;n</th>
            </tr>
          </thead>
          <tbody>
          {{foreach funciones}}
            <tr>
              <td>{{fndsc}}</td>
              <td><span class="badge-typ">{{fntyp}}</span></td>
              <td>
                {{if esActivo}}<span class="badge-act">ACT</span>{{endif esActivo}}
                {{if esInactivo}}<span class="badge-ina">INA</span>{{endif esInactivo}}
              </td>
              <td>
                {{if esActivo}}
                <form method="POST" action="index.php?page=Mantenimientos-Seguridad-RolesFunciones" style="display:inline">
                  <input type="hidden" name="accion"   value="inactivar" />
                  <input type="hidden" name="rolescod" value="{{rcod}}" />
                  <input type="hidden" name="fncod"    value="{{fncod}}" />
                  <button type="submit" class="btn-inact">Inactivar</button>
                </form>
                {{endif esActivo}}
                {{if esInactivo}}
                <form method="POST" action="index.php?page=Mantenimientos-Seguridad-RolesFunciones" style="display:inline">
                  <input type="hidden" name="accion"   value="asignar" />
                  <input type="hidden" name="rolescod" value="{{rcod}}" />
                  <input type="hidden" name="fncod"    value="{{fncod}}" />
                  <button type="submit" class="btn-asignar">Activar</button>
                </form>
                {{endif esInactivo}}
              </td>
            </tr>
          {{endfor funciones}}
          </tbody>
        </table>
        {{endif tieneFunciones}}

        {{if sinFunciones}}
        <p class="sin-items">Sin funciones asignadas.</p>
        {{endif sinFunciones}}

        {{if hayDisponibles}}
        <form method="POST" action="index.php?page=Mantenimientos-Seguridad-RolesFunciones" class="seg-form-nueva">
          <input type="hidden" name="accion"   value="asignar" />
          <input type="hidden" name="rolescod" value="{{rolescod}}" />
          <select name="fncod" required>
            <option value="">&#8212; Asignar nueva funci&oacute;n &#8212;</option>
            {{foreach funcionesDisponibles}}
            <option value="{{fncod}}">{{fndsc}} [{{fntyp}}]</option>
            {{endfor funcionesDisponibles}}
          </select>
          <button type="submit" class="btn-asignar"><i class="fas fa-plus"></i> Asignar</button>
        </form>
        {{endif hayDisponibles}}

      </div>
    </div>
  {{endfor roles}}
  </div>
</section>
