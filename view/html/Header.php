<div id="header" class="header navbar-default">
    <div class="navbar-header">
        <a href="#" class="navbar-brand"><span class="navbar-logo"></span> <b>Dashboard</b></a>
        <button type="button" class="navbar-toggle" data-click="sidebar-toggled">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
    </div>

    <ul class="navbar-nav navbar-right">
        <li class="navbar-form">

        </li>
        <li class="dropdown">

        </li>

        <input type="hidden" id="xusuarioId" name="xusuarioId" value="<?php echo $_SESSION["usuarioId"] ?>">

        <li class="dropdown navbar-user">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <img src="..\..\assets\img\user\user-13.jpeg" alt=""> 
                <span class="d-none d-md-inline"><?php echo $_SESSION["usuarioNombre"] ?></span> <b class="caret"></b>
            </a>
            <div class="dropdown-menu dropdown-menu-right">
                <a href="javascript:;" class="dropdown-item">Perfil</a>
                <a href="javascript:;" class="dropdown-item">Calendar</a>
                <div class="dropdown-divider"></div>
                <a href="../logout/logout.php" class="dropdown-item">Cerrar Sesion</a>
            </div>
        </li>
    </ul>

</div>
