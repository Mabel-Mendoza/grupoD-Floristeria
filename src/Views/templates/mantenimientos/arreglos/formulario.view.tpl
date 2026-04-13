<h1>{{modeDsc}}</h1>
<section class="grid row">
    <form class="depth-0 offset-3 col-6"
          action="index.php?page=Mantenimientos-Arreglos-Formulario&mode={{mode}}&id={{arrcod}}"
          method="POST">

        <!-- Código (solo lectura) -->
        <div class="row align-center">
            <div class="col-4">
                <label for="arrcod">Código</label>
            </div>
            <div class="col-8">
                <input type="text" value="{{arrcod}}" disabled name="arrcod_ux" id="arrcod" readonly />
                <input type="hidden" name="arrcod" value="{{arrcod}}" />
                <input type="hidden" name="uuid"   value="{{xsrf_token}}" />
            </div>
        </div>

        <!-- Nombre -->
        <div class="row align-center">
            <div class="col-4">
                <label for="arrnombre">Nombre del Arreglo</label>
            </div>
            <div class="col-8">
                <input type="text" name="arrnombre" id="arrnombre"
                       value="{{arrnombre}}" {{isReadonly}}
                       placeholder="Ej: Ramo de Rosas Rojas" />
            </div>
        </div>

        <!-- Descripción -->
        <div class="row align-start">
            <div class="col-4">
                <label for="arrdescripcion">Descripción</label>
            </div>
            <div class="col-8">
                <textarea name="arrdescripcion" id="arrdescripcion"
                          placeholder="Descripción del arreglo floral"
                          cols="40" rows="5" {{isReadonly}}>{{arrdescripcion}}</textarea>
            </div>
        </div>

        <!-- Tamaño (select dinámico desde BD) -->
        <div class="row align-center">
            <div class="col-4">
                <label for="arrtamano">Tamaño</label>
            </div>
            <div class="col-8">
                <select name="arrtamano" id="arrtamano" {{isDisabled}}>
                    {{foreach tamanos}}
                    <option value="{{tamcod}}" {{if arrtamano}}selected{{endif arrtamano}}>{{tamdsc}}</option>
                    {{endfor tamanos}}
                </select>
            </div>
        </div>

        <!-- Precio -->
        <div class="row align-center">
            <div class="col-4">
                <label for="arrprecio">Precio (L.)</label>
            </div>
            <div class="col-8">
                <input type="number" name="arrprecio" id="arrprecio"
                       value="{{arrprecio}}" {{isReadonly}}
                       placeholder="0.00" step="0.01" min="0" />
            </div>
        </div>

        <!-- URL de imagen -->
        <div class="row align-center">
            <div class="col-4">
                <label for="arrimgurl">URL de Imagen</label>
            </div>
            <div class="col-8">
                <input type="text" name="arrimgurl" id="arrimgurl"
                       value="{{arrimgurl}}" {{isReadonly}}
                       placeholder="imgs/arreglos/nombre.jpg" />
            </div>
        </div>

        <!-- Stock -->
        <div class="row align-center">
            <div class="col-4">
                <label for="arrstock">Stock Disponible</label>
            </div>
            <div class="col-8">
                <input type="number" name="arrstock" id="arrstock"
                       value="{{arrstock}}" {{isReadonly}}
                       placeholder="0" min="0" />
            </div>
        </div>

        <!-- Ocasión -->
        <div class="row align-center">
            <div class="col-4">
                <label for="arrocasion">Ocasión</label>
            </div>
            <div class="col-8">
                <input type="text" name="arrocasion" id="arrocasion"
                       value="{{arrocasion}}" {{isReadonly}}
                       placeholder="Ej: Cumpleaños, Boda, Romántico" />
            </div>
        </div>

        <!-- Estado (solo en modo UPD) -->
        {{if ~hideConfirm}}
        <div class="row align-center">
            <div class="col-4">
                <label for="arrest">Estado</label>
            </div>
            <div class="col-8">
                <select name="arrest" id="arrest" {{isDisabled}}>
                    <option value="ACT">Activo</option>
                    <option value="INA">Inactivo</option>
                </select>
            </div>
        </div>
        {{endif ~hideConfirm}}

        <!-- Mensaje de confirmación para DEL -->
        {{if confirmToolTip}}
        <div class="error">
            {{confirmToolTip}}
        </div>
        {{endif confirmToolTip}}

        <!-- Botones -->
        <div class="right">
            {{ifnot hideConfirm}}
            <button type="submit" name="btnEnviar">Confirmar</button>
            {{endifnot hideConfirm}}
            &nbsp;
            <button id="btnCancelar">Cancelar</button>
        </div>

    </form>
</section>

<script>
    document.addEventListener("DOMContentLoaded", () => {
        document.getElementById("btnCancelar").addEventListener("click", (e) => {
            e.preventDefault();
            e.stopPropagation();
            window.location.assign("index.php?page=Mantenimientos-Arreglos-Listado");
        });
    });
</script>
