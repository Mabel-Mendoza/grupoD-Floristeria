<section class="container">
    <table class="">
        <thead>
            <tr>
                <th>Código</th>
                <th>Nombre</th>
                <th>Tamaño</th>
                <th>Precio</th>
                <th>Stock</th>
                <th>Ocasión</th>
                <th>Estado</th>
                <th>
                    {{if showNew}}
                    <a href="index.php?page=Mantenimientos-Arreglos-Formulario&mode=INS&id=0">+ Nuevo Arreglo</a>
                    {{endif showNew}}
                </th>
            </tr>
        </thead>
        <tbody>
            {{foreach arreglos}}
            <tr>
                <td>{{arrcod}}</td>
                <td>{{arrnombre}}</td>
                <td>{{arrtamano}}</td>
                <td>L. {{arrprecio}}</td>
                <td>{{arrstock}}</td>
                <td>{{arrocasion}}</td>
                <td>{{arrest}}</td>
                <td>
                    <a href="index.php?page=Mantenimientos-Arreglos-Formulario&mode=DSP&id={{arrcod}}">Ver</a>
                    {{if ~showUpdate}}
                    <br/>
                    <a href="index.php?page=Mantenimientos-Arreglos-Formulario&mode=UPD&id={{arrcod}}">Editar</a>
                    {{endif ~showUpdate}}
                    {{if ~showDelete}}
                    <br/>
                    <a href="index.php?page=Mantenimientos-Arreglos-Formulario&mode=DEL&id={{arrcod}}">Desactivar</a>
                    {{endif ~showDelete}}
                </td>
            </tr>
            {{endfor arreglos}}
        </tbody>
    </table>
</section>
