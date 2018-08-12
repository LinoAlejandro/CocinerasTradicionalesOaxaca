<!DOCTYPE html>
<html>
  <head>
    <g:if test="${session.language == 'Español'}">
      <meta name="layout" content="user"/>
    </g:if>
    <g:if test="${session.language == 'English'}">
      <meta name="layout" content="userEnglish"/>
    </g:if>
    <meta charset="utf-8" />
    <title>Lista de noticias</title>
  </head>
  <body>
    <div class="container mt-4">
      <div class="row">
        <div class="col-md-10">
          <div class="text-left h1">
            <g:if test="${session.language == 'Español'}">
              Lista de noticias
            </g:if>
            <g:if test="${session.language == 'English'}">
              News list
            </g:if>
          </div>
        </div>
      </div>
    </div>

    <div class="container mb-3">
      <div class="row">
        <div class="col-xl-12" style="height:5px; background-color:#4F8E3A;">
        </div>
      </div>
    </div>

    <div class="container">
      <div class="row">
        <g:each var="" in="${noticias}">
          <div class="col-lg-4 col-md-6 py-2">
            <div class="">
              <div class="card mx-auto"  style="border: 4px solid #4F8E3A; box-shadow: 5px 10px #CB0A60;">
                <g:if test="${it.noticia.ubicacionImagen}">
                  <img class="card-img-top" src="${it.noticia.ubicacionImagen}">
                </g:if>
                <div class="card-body">
                  <h5 class="card-title">${it.traduccion?.titulo}</h5>
                  <hr class="px-1" style="border: 1px solid #CB0A60;">
                  <div class="card-text">
                    <g:if test="${it.traduccion?.contenido?.size() > 150}">
                      ${it.traduccion?.contenido.replaceAll(/<.*?>/, '').substring(0,150)}...
                    </g:if>
                    <g:else>
                      ${raw(it.traduccion?.contenido)}
                    </g:else>
                  </div>
                  <div>
                    <g:link action="show" params="[id:it.noticia.id]" class="btn-outline-dark">Seguir leyendo</g:link>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </g:each>
      </div>
    </div>
    <style media="screen">
      .paginate a {
        color: black;
        padding-left: 5px;
        padding-right: 5px;
      }
    </style>
    <div class="container">
      <div class="row justify-content-center">
        <div class="col text-center paginate">
          <g:paginate next="Siguiente" prev="Previo"
                    maxsteps="10" controller="noticia"
                    action="list" total="${noticiaCount}" class="mx-auto"/>
        </div>
      </div>
    </div>
  </body>
</html>
