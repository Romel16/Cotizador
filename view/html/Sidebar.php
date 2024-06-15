<div id="sidebar" class="sidebar">

    <div data-scrollbar="true" data-height="100%">

        <ul class="nav">
            <li class="nav-profile">
                <a href="javascript:;" data-toggle="nav-profile">
                    <div class="cover with-shadow"></div>
                    <div class="image">
                        <img src="..\..\assets\img\user\user-13.jpeg" alt="">
                    </div>
                    <div class="info">
                        <b class="caret pull-right"></b>
                        <?php echo $_SESSION["usuarioNombre"] ?>
                        <small>Comercial</small>
                    </div>
                </a>
            </li>
            <li>
                <ul class="nav nav-profile">
                    <li><a href="javascript:;"><i class="fa fa-cog"></i> Perfil</a></li>
                    <li><a href="javascript:;"><i class="fa fa-pencil-alt"></i> Enviar Comentarios</a></li>
                    <li><a href="javascript:;"><i class="fa fa-question-circle"></i> Ayuda</a></li>
                </ul>
            </li>
        </ul>

        <ul class="nav">
            <li class="nav-header">Menu</li>

            <li class="has-sub">
                <a href="../Home/">
                    <i class="fa fa-th-large"></i>
                    <span>Dashboard</span>
                </a>
            </li>

            <li class="has-sub">
                <a href="javascript:;">
                    <b class="caret"></b>
                    <i class="fa fa-list-ol"></i>
                    <span>Mantenimiento</span> 
                </a>
                <ul class="sub-menu">
                    <li><a href="../mntCliente/">Cliente</a></li>
                    <li><a href="../mntContacto/">Contacto</a></li>
                    <li><a href="../mntCategoria/">Categoria</a></li>
                    <li><a href="../mntProducto/">Producto</a></li>
                    <li><a href="../mntEmpresa/">Empresa</a></li>
                    <li><a href="../mntUsuario/">Usuario</a></li>
                </ul>
            </li>

            <li class="has-sub">
                <a href="javascript:;">
                    <b class="caret"></b>
                    <i class="fa fa-gem"></i>
                    <span>Cotizacion</span> 
                </a>
                <ul class="sub-menu">
                    <li><a href="../NuevaCotizacion/">Nueva Cotizacion</a></li>
                    <li><a href="../ListCotizacion/">Listado Cotizacion</a></li>
                </ul>
            </li>
        
            <li><a href="javascript:;" class="sidebar-minify-btn" data-click="sidebar-minify"><i class="fa fa-angle-double-left"></i></a></li>

        </ul>

    </div>

</div>
<div class="sidebar-bg"></div>