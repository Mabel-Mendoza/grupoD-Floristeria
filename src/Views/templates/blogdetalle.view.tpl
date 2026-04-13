{{with articulo}}

<section class="blog-post-detail">

    <div class="blog-post-detail__image">
        <img src="{{~BASE_DIR}}public/{{imgurl}}" alt="{{flor}}">
    </div>

    <div class="blog-post-detail__content">

        <span class="blog-chip">Guía floral</span>

        <h1>{{flor}}</h1>

        <div class="blog-info">
            <h4>¿Qué significa?</h4>
            <p>{{significado}}</p>
        </div>

        <div class="blog-info">
            <h4>¿En qué fechas conviene comprarla?</h4>
            <p>{{fechas}}</p>
        </div>

        <div class="blog-info">
            <h4>Un poco de historia</h4>
            <p>{{historia}}</p>
        </div>

        <div class="blog-info">
            <h4>¿Cuándo usarla?</h4>
            <p>{{ideal}}</p>
        </div>

        <div class="blog-post__actions">
            <a href="index.php?page=Blog" class="blog-btn">Volver al blog</a>
            <a href="index.php?page=Catalogo" class="blog-btn blog-btn--secondary-alt">Ver catálogo</a>
        </div>

    </div>

</section>

{{endwith articulo}}