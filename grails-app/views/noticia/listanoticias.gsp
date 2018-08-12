<!DOCTYPE html>
<html>
<head>
  <g:if test="${session.language}">
    <meta name="layout" content="userEnglish"/>
    <title>
      News
    </title>
  </g:if>
  <g:else>
    <meta name="layout" content="userEspanol"/>
    <title>
      Noticias
    </title>
  </g:else>
  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
  <asset:stylesheet href="custom/noticia/listanoticia.css"/>
  <style>
    .bg-red {
      background-color: #9A031E;
    }

    .text-red {
      color: #9A031E;
    }
  </style>
</head>
<body>
  <div class="container-fluid bg-red p-5">
    <div class="row justify-content-center align-items-center">
      <div class="col-md-6">
        <div class="lobster text-light display-2 text-right"
        data-aos="flip-down">
          Noticias
        </div>
      </div>
      <div class="col-md-6 text-left">
        <div class="container">
          <div class="row">
            <div class="col-md-12 col-lg-10">
              <g:form action="listanoticias" method="GET">
                <div class="input-group"
                data-aos="flip-down">
                  <input id="searchParams" class="form-control" type="text" name="searchParams" value="" placeholder="Buscar en noticias" />
                  <div class="input-group-append">
                    <button class="btn" type="submit">
                      <i class="fa fa-search"></i>
                    </button>
                  </div>
                </div>
              </g:form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-8">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <g:if test="${noticias.size() > 0}">
              <g:each var="noticia" in="${noticias}">
                <div class="container-fluid mt-4" data-aos="flip-right">
                  <div class="row">
                    <div class="col-md-3">
                      <div class="lead cabin py-2 float-right">
                        ${noticia.fechaPublicacion}
                      </div>
                    </div>
                    <div class="col-md-9">
                      <div class="text-dark rounded">
                        <div class="">
                          <div class="lobster h2">
                            <g:link action="show" id="${noticia.id}">
                              <span class="text-red">${noticia.titulo}</span>
                            </g:link>
                          </div>
                        </div>
                        <hr style="background-color:#9A031E"/>
                        <div class="cabin">
                          ${noticia.contenido.size() > 300 ? raw(noticia.contenido.substring(0,300)) + "..." : raw(noticia.contenido) }
                        </div>
                        <hr style="background-color:#9A031E"/>
                        <div class="rounded ">
                          <img class="img img-fluid" src="${noticia.ubicacionImagen}" alt="">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </g:each>
            </g:if>
            <g:else>
              <div class="col-md-12">
                <div class="display-3 cabin text-center mt-5" style="color:rgb(220,220,220)">
                  No existen resultados
                </div>
                <div class="h2 cabin text-center mb-5 mt-1" style="color:rgb(220,220,220)">
                  *Puede intentar de nuevo con diferentes argumentos de búsqueda
                </div>
              </div>
            </g:else>
          </div>
        </div>
      </div>
      <div class="col-md-4 p-5">

        <div class="rounded border-red p-4">
          <div class="h4 lobster text-center text-red">
            Noticias
          </div>
          <div class="cabin text-justify mt-3">
            Todo lo más reciente y relevante, relativo a las cocineras
          </div>
        </div>

        <div class="rounded border-red p-4 mt-5">
          <div class="h4 lobster text-center text-red">
            Cocineras Tradicionales de Oaxaca
          </div>
          <div class="cabin text-justify mt-3">
            Cocineras Tradicionales de Oaxaca es una asociación civil cuyo propósito
            es el conservar el legado gastronómico de Oaxaca, nombrado oficialmente <strong> patrimonio cultural
            de la humanidad </strong>
          </div>
        </div>

        <div class="rounded p-4 mt-5">
          <div class="h4 cabin text-center text-red">
            Siguenos en redes sociales
          </div>
          <div class="d-flex justify-content-around mt-4">
            <a href="#">
              <div class="d-flex align-items-center justify-content-center bg-primary rounded" style="height:40px; width:40px">
                <i class="fab fa-facebook-f text-light h4 p-5"></i>
              </div>
            </a>
            <a href="#">
              <div class="d-flex align-items-center justify-content-center bg-info rounded" style="height:40px; width:40px">
                <i class="fab fa-twitter text-light h4"></i>
              </div>
            </a>
          </div>
        </div>

      </div>
      <div class="col-md-12 my-5" >
        <div id="paginate" class="text-center cabin">
          <g:paginate next="Siguiente" prev="Previo"
          maxsteps="6" controller="Noticia"
          action="listanoticias" total="${noticiaCount}" params="${[searchParams:params.searchParams]}"/>
        </div>
      </div>
    </div>
  </div>
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

  <script>
    AOS.init({
      easing: 'ease-out-back',
      duration: 1200
    });
  </script>

  <asset:javascript src="custom/noticia/listanoticias.js"/>
</body>
</html>
