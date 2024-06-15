<?php
    require_once("config/conexion.php");
    if (isset($_POST["enviar"]) and $_POST["enviar"] =="si"){
        require_once("models/usuarioModels.php");
        $usuario = new usuarioModels();
        $usuario->login();
    }

?>


<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="utf-8">
	<title>Cotizador </title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport">
	<meta content="" name="description">
	<meta content="" name="author">

	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
	<link href="assets\css\default\app.min.css" rel="stylesheet">
</head>
<body class="pace-top">

	<div id="page-loader" class="fade show"><span class="spinner"></span></div>

	<div class="login-cover">
		<div class="login-cover-image" style="background-image: url(assets/img/login-bg/login-bg-17.jpeg)" data-id="login-cover-image"></div>
		<div class="login-cover-bg"></div>
	</div>

	<div id="page-container" class="fade">
		<div class="login login-v2" data-pageload-addclass="animated fadeIn">
			<div class="login-header">
				<div class="brand">
					<span class="logo"></span> <b>Acceso</b> Cotizador
					<small>Ingrese Usuario y Contraseña</small>
				</div>
				<div class="icon">
					<i class="fa fa-lock"></i>
				</div>
			</div>

			<div class="login-content">
				<form action="" method="post" class="margin-bottom-0">

					<?php
						if(isset($_GET["m"])){
							switch($_GET["m"]){
								case "1":
									?>
										<div class="alert alert-danger fade show">
											<span class="close" data-dismiss="alert">×</span>
											<strong>Error:</strong> Datos Incorrectos</a>.
											</div>
									<?php
								break;

								case "2":
									?>
										<div class="alert alert-danger fade show">
											<span class="close" data-dismiss="alert">×</span>
											<strong>Error:</strong> Campos Vacios</a>.
											</div>
									<?php
								break;
							}
						}
					?>

					<div class="form-group m-b-20">
						<input type="text" id="usu_correo" name="usuarioCorreo" class="form-control form-control-lg" placeholder="Correo Electronico" required="">
					</div>
					<div class="form-group m-b-20">
						<input type="password" id="usu_pass" name="usuarioPassword" class="form-control form-control-lg" placeholder="Password" required="">
					</div>
					<div class="checkbox checkbox-css m-b-20">
						<input type="checkbox" id="remember_checkbox"> 
						<label for="remember_checkbox">
							Recuerdame
						</label>
					</div>
					<div class="login-buttons">
                        <input type="hidden" name="enviar" value="si">
						<button type="submit" class="btn btn-success btn-block btn-lg">Acceder</button>
					</div>
				</form>
			</div>
		</div>

		<ul class="login-bg-list clearfix">
			<li class="active"><a href="javascript:;" data-click="change-bg" data-img="assets/img/login-bg/login-bg-17.jpg" style="background-image: url(assets/img/login-bg/login-bg-17.jpeg)"></a></li>
		</ul>

	</div>

	<script src="assets\js\app.min.js"></script>
	<script src="assets\js\theme\default.min.js"></script>
	<script src="assets\js\demo\login-v2.demo.js"></script>
</body>
</html>
