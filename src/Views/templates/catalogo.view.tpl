<section class="container">
    <h2>Nuestros Arreglos Florales</h2>
    <div class="grid row">
        {{foreach arreglos}}
        <div class="col-12 col-m-6 col-l-4">
            <div class="depth-1" style="margin: 0.5rem; padding: 1rem;">
                <img src="{{~BASE_DIR}}/public/{{arrimgurl}}"
                     alt="{{arrnombre}}"
                     style="width:100%; height:200px; object-fit:cover;"
                     onerror="this.src='{{~BASE_DIR}}/public/imgs/hero/1.jpg'" />
                <h3>{{arrnombre}}</h3>
                <p>{{arrdescripcion}}</p>
                <p><strong>Tamaño:</strong> {{arrtamano}}</p>
                <p><strong>Ocasión:</strong> {{arrocasion}}</p>
                <p><strong>Precio:</strong> L. {{arrprecio}}</p>
                <p><strong>Disponibles:</strong> {{arrstock}}</p>
            </div>
        </div>
        {{endfor arreglos}}
    </div>
</section>
