<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
  <link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'logoIcono.png')}" type="image/x-icon" />
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <title>
    <g:layoutTitle default="Grails" />
  </title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <asset:javascript src="bootstrap/jquery-3.3.1.js" />
  <asset:javascript src="bootstrap/pooper.min.js" />
  <asset:javascript src="bootstrap/bootstrap.min.js" />
  <asset:stylesheet  src="bootstrap/bootstrap.css" rel="stylesheet" media="screen" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
  <asset:stylesheet  src="custom/layout/user.css" rel="stylesheet" media="screen" />
  <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css?family=Cabin" rel="stylesheet" />
  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
  
  <g:layoutHead />
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-dark custom-nav px-5">
    <div class="navbar-brand">
      <span>
        <a style="text-decoration:none; font-size:25px" href="${request.getContextPath()}/" class="text-light align-middle">
          <asset:image src="logoicon.png" width="80" height="40" class="align-middle"/>
          <span class="align-middle lobster" id="navbarBrand">Cocineras de Oaxaca</span>
        </a>
      </span>
    </div>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ml-auto cabin">
        <li class="nav-item mr-3 rounded custom-navbar-item-purp" >
          <a class="nav-link" href="${request.getContextPath()}/noticia/listarticulos">
            <span class="">
              Artículos
            </span>
          </a>
        </li>
        <li class="nav-item mr-3 custom-navbar-item-green" >
          <a class="nav-link" href="${request.getContextPath()}/noticia/listanoticias">
            <span class="">
              Noticias
            </span>
          </a>
        </li>
        <li class="nav-item mr-3 custom-navbar-item-purp">
          <a class="nav-link" href="/actividad/list">
            <span class="">
              Eventos
            </span>
          </a>
        </li>
        <li class="nav-item mr-3 custom-navbar-item-green ">
          <a class="nav-link" href="/cocinera/list">
            <span class="">
              Cocineras
            </span>
          </a>
        </li>
        <li class="nav-item dropdown ">
          <a class="nav-link dropdown-toggle custom-navbar-item-purp" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Español <i class="fas fa-language"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-right px-2" aria-labelledby="navbarDropdown" style="background-color: #221D23">
            <g:link action="index" controller="general" params="[language:'Español']" class="dropdown-item dropdown-item-custom-green">
              Español
            </g:link>
            <g:link action="index" controller="general" params="[language:'English']" class="dropdown-item dropdown-item-custom-purp">
              English
            </g:link>
          </div>
        </li>
      </ul>
    </div>
  </nav>
  <g:layoutBody />

  <asset:javascript src="custom/layout/user.js"/>
</body>
</html>
