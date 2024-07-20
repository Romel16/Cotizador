<?php
	require_once("../../config/conexion.php");
	if(isset($_SESSION["usuarioId"])){
?>
<!DOCTYPE html>
<html lang="es">
<head>
	<title>Nueva Cotizacion</title>
    <?php require_once("../Html/Head.php")?>
</head>
<body>

	<div id="page-loader" class="fade show"><span class="spinner"></span></div>

	<div id="page-container" class="page-container fade page-sidebar-fixed page-header-fixed">

        <?php require_once("../Html/Header.php")?>

        <?php require_once("../Html/Sidebar.php")?>

		<div id="content" class="content">

			<ol class="breadcrumb float-xl-right">
				<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
				<li class="breadcrumb-item active">Nueva Cotización</li>
			</ol>

			<h1 class="page-header">Nueva Cotización <small>Creación y registro de información</small></h1>

			<input type="hidden" id="cotizacionId" name="cotizacionId"/>

			<?php require_once("paso1.php")?>

            <?php require_once("paso2.php")?>

            <?php require_once("paso3.php")?>

            <?php require_once("paso4.php")?>

		</div>

		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>

	</div>

	<?php require_once ("../Html/modal.php")?>

	<?php require_once("mnt.php")?>

    <?php require_once("../Html/Js.php")?>

    <script type="text/javascript" src="nuevacotizacion.js"></script>

</body>
</html>
<?php
	}else{
		header("Location:".Conectar::ruta()."index.php");
	}
?>