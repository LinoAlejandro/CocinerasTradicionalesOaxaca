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
  <asset:javascript src="fontAwesome/fontawesome-all.js"/>

  <asset:stylesheet  src="bootstrap/bootstrap.css" rel="stylesheet" media="screen" />
  <asset:stylesheet  src="fontAwesome/fa-svg-with-js.css" rel="stylesheet" media="screen" />

  <g:layoutHead />
</head>
<body>
  <nav class="navbar navbar-expand-md navbar-light bg-light px-5">
    <button class="navbar-toggler mx-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <div class="container">
        <ul class="navbar-nav justify-content-md-center">
          <li class="nav-item">
            <a class="nav-link" href="/">Inicio <span class="sr-only">(current) </span></a>
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
    </div>
  </nav>
  <g:layoutBody />
</body>
</html>
