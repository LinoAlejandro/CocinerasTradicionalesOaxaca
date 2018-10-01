<!doctype html>
<html lang="en" class="no-js">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <title>
      <g:layoutTitle default="Grails"/>
  </title>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>

  <asset:javascript src="bootstrap/jquery-3.3.1.js"/>
  <asset:javascript src="bootstrap/pooper.min.js"/>
  <asset:javascript src="bootstrap/bootstrap.min.js"/>

  <asset:stylesheet  src="bootstrap/bootstrap.css" rel="stylesheet" media="screen" />
  
  <asset:stylesheet  src="fontAwesome/fa-svg-with-js.css" rel="stylesheet" media="screen" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Cabin" rel="stylesheet">
  <asset:stylesheet src="custom/layout/user.css"/>
  <asset:stylesheet src="custom/layout/admin.css"/>
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
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Concurso cocineras
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <g:link class="dropdown-item" action="index" controller="concursoCocineras">Ver lista</g:link>
            <g:link class="dropdown-item" action="create" controller="concursoCocineras">Crear</g:link>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Administradores
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <g:link class="dropdown-item" action="index" controller="admin">Ver lista</g:link>
            <g:link class="dropdown-item" action="create" controller="admin">Crear</g:link>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Cocineras
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="/cocinera/index">Ver lista</a>
            <a class="dropdown-item" href="/cocinera/create">Crear</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Noticias | Artículos
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="/noticia/index">Ver lista</a>
            <a class="dropdown-item" href="/noticia/create">Crear</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Actividades
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="/actividad/index">Ver lista</a>
            <a class="dropdown-item" href="/actividad/create">Crear</a>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/logoff">LogOut</a>
        </li>
      </ul>
    </div>
  </nav>
  <g:layoutBody />
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

  <script>
    AOS.init({
      duration: 1200,
    })
  </script>
</body>
</html>
