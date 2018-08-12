<%@ import="java.text.SimpleDateFormat" %>
<g:set var="url" value="${request.getScheme() + '://' + request.getServerName() + request.getForwardURI()}"/>
<!DOCTYPE html>
<html>
  <head>
    <g:if test="${session.language}">
      <meta name="layout" content="userEnglish"/>
      <title>${noticia.traduccionIngles.titulo}</title>
    </g:if>
    <g:else>
      <meta name="layout" content="userEspanol"/>
      <title>${noticia.traduccionEspanol.titulo}</title>
    </g:else>
    <meta charset="utf-8" />
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <asset:stylesheet href="custom/noticia/showArticulo.css"/>

    <meta name="twitter:card" content="summary_large_image">
    <!--<meta name="twitter:site" content="@site_username">-->
    <meta name="twitter:title" content="${noticia.traduccionEspanol.titulo}">
    <meta name="twitter:description" content="${noticia.traduccionEspanol.contenido.size() <= 200 ? raw(noticia.traduccionEspanol.contenido) : raw(noticia.traduccionEspanol.contenido.substring(0,200))}">
    <!--<meta name="twitter:creator" content="@creator_username">-->
    <meta name="twitter:image" content="${noticia.ubicacionImagen}">
    <meta name="twitter:domain" content="http://cocinerastradicionalesoaxaca.org">

    <meta property="og:url"                content="${url}" />
    <meta property="og:type"               content="article" />
    <meta property="og:title"              content="${noticia.traduccionEspanol.titulo}" />
    <meta property="og:description"        content="${noticia.traduccionEspanol.contenido.size() <= 200 ? raw(noticia.traduccionEspanol.contenido) : raw(noticia.traduccionEspanol.contenido.substring(0,200))}" />
    <meta property="og:image"              content="${noticia.ubicacionImagen}" />
  </head>
  <body>

    <div id="fb-root"></div>
    <script>
      (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = 'https://connect.facebook.net/es_LA/sdk.js#xfbml=1&version=v3.1&appId=431453400672733&autoLogAppEvents=1';
        fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));
    </script>
    <div class="container-fluid bg-purp">
      <div class="row justify-content-center align-items-center">
        <div class="col-md-12 py-3">
          <div class="cabin text-light text-center d-flex justify-content-around">
            <div class="">
              <i class="fa fa-newspaper"></i> ${session.language ? "Article" : "Artículo"}
            </div>
            <div>
              <i class="fa fa-calendar-alt"></i> ${new SimpleDateFormat('yyyy-MM-dd').format(noticia.fechaPublicacion)}
            </div>
          </div>
        </div>
        <div class="col-md-12 pb-3">
          <div class="lobster text-light display-4 text-center" data-aos="zoom-out-down">
            ${session.language ? noticia.traduccionIngles.titulo : noticia.traduccionEspanol.titulo}
          </div>
        </div>
        <div class="col-md-12 text-left pb-3">
          <div class="d-flex justify-content-around cabin">
            <button type="button" class="btn btn-primary" onclick="shareFacebook()">
              <i class="fab fa-facebook-f"></i> ${session.language ? "Share" : "Compartir"}
            </button>

            <button type="button" class="btn btn-info" onclick="shareTwitter()">
              <i class="fab fa-twitter"></i> ${session.language ? "Share" : "Compartir"}
            </button>
          </div>
        </div>
      </div>
    </div>
    <div class="container-fluid pt-5">
      <div class="row" data-aos="zoom-out-up">
        <div class="col-lg-6 p-5">
          <div class="text-center" >
            <img src="${noticia.ubicacionImagen}" class="img-fluid img" alt="">
          </div>
        </div>
        <div class="col-lg-6 cabin text-dark">
          ${session.language ? noticia.traduccionIngles.contenido : noticia.traduccionEspanol.contenido}
        </div>
      </div>
    </div>
    <div class="container-fluid">
      <g:if test="${mediaFotos.size() > 0}">
        <div class="row px-5 pb-2 align-items-center" data-aos="zoom-out-left">
          <div class="col-md-5">
            <hr class="style">
          </div>
          <div class="col-md-2 text-purp lobster h1 text-center mt-4">
            ${session.language ? 'Images' : 'Imágenes' }
          </div>
          <div class="col-md-5">
            <hr class="style">
          </div>
        </div>
          <div class="row">
            <div class="container mb-3">
              <div class="col-md-12" data-aos="zoom-out-right">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                  <ol class="carousel-indicators">
                    <g:set var="c" value="${0}"/>
                    <g:each var="${foto}" in="${mediaFotos}">
                      <li data-target="#carouselExampleIndicators" data-slide-to="${c}" id="${c}"></li>
                      <g:set var="c" value="${c+1}"/>
                    </g:each>
                  </ol>
                  <g:set var="c" value="${0}"/>
                  <div class="carousel-inner">
                    <g:each var="${foto}" in="${mediaFotos}">
                      <div class="carousel-item" id="${c}img">
                        <img src="${foto.ubicacion}" alt="" class="d-block w-100">
                        <div class="carousel-caption d-none d-md-block">
                          <h5>${session.language ? foto.traduccionIngles.pieMedia : foto.traduccionEspanol.pieMedia} </h5>
                        </div>
                        <g:set var="c" value="${c+1}"/>
                      </div>
                    </g:each>
                  </div>
                  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">${session.language ? Previous : Previo}</span>
                  </a>
                  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">${session.language ? Next : Siguiente}</span>
                  </a>
                </div>
              </div>
            </div>
          </div>
          </g:if>
          <g:if test="${mediaVideo.size() > 0}">
            <div class="row px-5 pb-2 align-items-center" data-aos="zoom-out-right">
              <div class="col-md-5">
                <hr class="style">
              </div>
              <div class="col-md-2 text-purp lobster h1 text-center pt-4">
                Videos
              </div>
              <div class="col-md-5">
                <hr class="style">
              </div>
            </div>
            <div class="row">
              <div class="container" data-aos="zoom-out-left">
                <div class="row">
                  <g:each var="video" in="${mediaVideo}">
                    <div class="col-lg-6 mb-5">
                      <div class="embed-responsive embed-responsive-16by9">
                        <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/${video.ubicacion}"></iframe>
                      </div>
                    </div>
                  </g:each>
                </div>
              </div>
            </div>
          </g:if>
          <g:if test="${sugerencias.size() > 0}">
            <div class="row px-5 pt-2 pb-4">
              <div class="col-md-12">
                <div class="lobster h2 text-purp mb-3">
                  ${session.language ? "You may like" : "Te puede interesar:"}
                </div>
              </div>
            <div class="col-md-12">
              <div class="container">
                <div class="row justify-content-center">
                  <g:each var="sugerencia" in="${sugerencias}">
                  <div class="col-md-3">
                    <a href="${createLink(action:'show', id:sugerencia.id)}">
                      <div class="p-2 border-purp">
                        <img src="${sugerencia.ubicacionImagen}" alt="" class="img img-fluid img-responsive">
                        <div class="cabin text-center text-purp">
                          ${session.language ? sugerencia.traduccionIngles.titulo : sugerencia.traduccionEspanol.titulo}
                        </div>
                      </div>
                    </a>
                  </div>
                </g:each>
              </div>
            </div>
          </div>
        </div>
      </g:if>
    </div>

    <script type="text/javascript">
      $('#0').addClass('active')
    </script>
    <script type="text/javascript">
      $('#0img').addClass('active')
    </script>

    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

    <script>
			AOS.init({
				easing: 'ease-out-back',
				duration: 1000
			});
		</script>

  </body>
</html>
