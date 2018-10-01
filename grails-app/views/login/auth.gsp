<html>
<head>
	<meta name="layout" content="basic">
	<title>Login</title>
  <asset:stylesheet  src="custom/login/auth.css" rel="stylesheet" media="screen" />
</head>
<body>
	<style>
		.border-purple {
				border: 3px solid #5E1240
		}
		.border-green{
				border: 3px solid #4F8E3A
		}
	</style>

	<g:if test="${flash.message}">
		<div class="alert alert-warning cabin">
			${flash.message}
		</div>
	</g:if>
	<div class="container my-5">
		<div class="container">
		  <div class="row justify-content-md-center" data-aos="flip-up">
		    <div class="col-md-5 py-5 rounded bg-dark-purp shadow">
					<div class="display-3 text-center rounded lobster text-light">
        		<span class="">Iniciar</span> <span class="">sesión</span>
	        </div>
	        <div class="row justify-content-center">
	        	<div class="col-md-10" >
		          <asset:image src="logo.png" class="img img-responsive img-fluid " style="filter:grayscale(100%);"/>
		        </div>
	        </div>
		      <form action="/login/authenticate" method="POST" id="loginForm" class="cabin mt-4 px-3">        
						<div class="input-group mb-3">
		          <div class="input-group-prepend">
		            <span class="input-group-text bg-purple border-purple" id="basic-addon1">
		              <i class="fas fa-user text-light"></i>
		            </span>
		          </div>
		          <input type="text" class="form-control rounded" name="username" placeholder="Nombre de usuario" aria-label="Username" aria-describedby="basic-addon1"/>
		        </div>
		        <div class="input-group mb-1">
		          <div class="input-group-prepend ">
		            <span class="input-group-text bg-green border-green" id="basic-addon2">
		              <i class="fas fa-lock text-light"></i>
		            </span>
		          </div>
		          <input type="password" class="form-control rounded" name="password" placeholder="Contraseña" aria-label="Username" aria-describedby="basic-addon2" />
		        </div>
		        <div class="mt-4 text-center">
		        	<button class="btn text-light bg-dark-purp border-light btn-block">Entrar</button>
							<a class="btn text-secondary bg-dark-purp border-secondary mt-3 btn-block" href="/">Regresar</a>
		        </div>
			 		</form>
		   	</div>
		  </div>
		</div>
	</div>
</body>
</html>
