<!DOCTYPE html>
<html>
<head>
  <meta name="layout" content="basic">
  <title>
  	Iniciar Registro
  </title>
  <asset:stylesheet src="registro/base.css" />
</head>
<body>
	<div class="container-fluid bg-dark-purp p-5">
		<div class="row align-items-center justify-content-center text-light " data-aos="flip-up"> 
			<div class="col-xl-5 col-lg-6 col-md-8">
				<div class="row ">
					<div class="col-xl-9 mx-auto">
						<asset:image class="img img-fluid" src="logo.png"/>
					</div>
				</div>
			</div>
			<div class="col-xl-7 col-lg-6 col-md-8 text-center">
				<div class="display-2 lobster lobster" >
					Inicie su registro
				</div>
			</div>
		</div>
	</div>
	<div class="container mt-4 cabin">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<g:form action="authenticate" controlle="login">
			 		<div class="px-4 pt-4 pb-2 cabin rounded shadow text-center bg-blue">
			 			<div class="h1 text-light mb-4 lobster">Iniciar Sesión</div>
			 			<div class="input-group mb-2">
			 				<div class="input-group-prepend">
			 					<div class="input-group-text">
			 						<i class="fas fa-user"></i>
			 					</div>
			 				</div>
			 				<input type="text" name="username" class="form-control" placeholder="Nombre del usuario" />
			 			</div>
			 			<div class="input-group mb-4">
			 				<div class="input-group-prepend">
			 					<div class="input-group-text">
			 						<i class="fas fa-lock"></i>
			 					</div>
			 				</div>
			 				<input type="password" name="password" class="form-control" placeholder="Contraseña">
			 			</div>
			 			<div class="form-group">
			 				<input type="submit" class="btn btn-md btn-primary" value="Entrar">	
			 			</div>
			 		</div>
		 		</g:form>
		 	</div>
		 	<div class="col-md-6">
		 		<g:if test="${flash.message}">
					<div class="alert alert-danger">
						${flash.message}
					</div>
		 		</g:if>	
		 		<div class="lead cabin text-justify">
		 			Si no posee una cuenta puede optar por crear una dando click en el siguiente botón:
		 		</div>
		 		<div class="m-4 text-center">
		 			<g:form action="iniciarRegistro">
			 			<button type="submit" class="btn text-light btn-lg cabin" style="background-color: #7A1854; color: white;" onclick="setAccessPass()">
			 				Crear cuenta personal
			 			</button>
			 			<div class="mt-3" id="toggleDiv">
			 				<input type="password" class="form-control" name="pass" onkeyup="checkpass()">
			 				<div class="mt-3">
			 					Clave de acceso otorgada por la agencia o palacio municipal de su comunidad
			 				</div>
			 			</div>
		 			</g:form>
		 		</div>
		 	</div>
		</div>
	</div>

	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

  <script type="text/javascript">
		AOS.init({
			easing: 'ease-out-back',
			duration: 1800
		});
	</script>

</body>
</html>