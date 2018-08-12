<html><head>
	<meta name="layout" content="basic">
	<title>Login</title>
  <asset:stylesheet  src="custom/login/auth.css" rel="stylesheet" media="screen" />
</head>
<body>
	<g:if test="${flash.message}">
		<div class="alert alert-warning">
			${flash.message}
		</div>
	</g:if>
  <div class="container mt-5 pt-4">
    <div class="row justify-content-center">
      <div class="col-xl-4 col-lg-6 col-md-6 col-sm-8 justify-content-center rounded pt-3 login-box">
        <div class="display-4 text-center rounded">
					<div class="display-4 text-center">
	          Iniciar
	        </div>
					<div class="display-4 text-center">
	          sesión
	        </div>
        </div>
				<hr class="bg-light">
        <div class="mx-auto pb-5">
          <form action="/login/authenticate" method="POST" id="loginForm" autocomplete="off">
						<div class="my-4w">
							<div class="input-group mb-3">
	              <div class="input-group-prepend">
	                <span class="input-group-text text-light px-3 bg-dark" id="basic-addon1">
	                  <i class="fas fa-user"></i>
	                </span>
	              </div>
	              <input type="text" class="form-control" name="username" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
	            </div>
	            <div class="input-group mb-1">
	              <div class="input-group-prepend">
	                <span class="input-group-text text-light px-3 bg-dark" id="basic-addon1">
	                  <i class="fas fa-lock"></i>
	                </span>
	              </div>
	              <input type="password" class="form-control" name="password" placeholder="Password" aria-label="Username" aria-describedby="basic-addon1">
	            </div>
						</div>
            <hr class="bg-light">
						<div class="container">
								<div class="col">
									<div class="my-2">
										<button class="btn btn-md btn-dark text-light btn-block">Login</button>
			            </div>
									<div class="my-2">
										<a class="btn btn-md btn-dark btn-block" href="/">Regresar<a>
			            </div>
								</div>
							</div>
						</div>
      		</form>
        </div>
      </div>
  </div>
</body>
</html>
