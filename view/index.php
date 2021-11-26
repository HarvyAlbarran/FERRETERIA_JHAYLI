<?php 
    session_start();

    if (!isset($_SESSION['S_IDUSUARIO'])) {
        header('Location: login.php');
    }
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width initial-scale=1.0">
    <title>Ferretería JHAYLI</title>
    <!-- GLOBAL MAINLY STYLES-->
    <link href="plantilla/assets/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="plantilla/assets/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="plantilla/assets/vendors/themify-icons/css/themify-icons.css" rel="stylesheet" />
    <!-- PLUGINS STYLES-->
    <link href="plantilla/assets/vendors/jvectormap/jquery-jvectormap-2.0.3.css" rel="stylesheet" />
    <!-- THEME STYLES-->
    <link href="plantilla/assets/css/main.min.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.11.3/b-2.0.1/b-html5-2.0.1/r-2.2.9/sl-1.3.3/datatables.min.css"/>

    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />

    <link href="plantilla/assets/css/estilo.css" rel="stylesheet" />

    <!-- PAGE LEVEL STYLES-->
</head>

<body class="fixed-navbar">
    <div class="page-wrapper">
        <!-- START HEADER-->
        <header class="header">
            <div class="page-brand">
                <a class="link" href="index.php">
                    <span class=" brand brand-tip">JHAYLI</span>
                    <span class="brand-mini">JH</span>
                </a>
            </div>
            <div class="flexbox flex-1">
                <!-- START TOP-LEFT TOOLBAR-->
                <ul class="nav navbar-toolbar">
                    <li>
                        <a class="nav-link sidebar-toggler js-sidebar-toggler"><i class="ti-menu"></i></a>
                    </li>
                    <li>
                        <form class="navbar-search" action="javascript:;">
                            <div class="rel">
                                <span class="search-icon"><i class="ti-search"></i></span>
                                <input class="form-control" placeholder="Buscar...">
                            </div>
                        </form>
                    </li>
                </ul>
                <!-- END TOP-LEFT TOOLBAR-->
                <!-- START TOP-RIGHT TOOLBAR-->
                <ul class="nav navbar-toolbar">
                    <li class="dropdown dropdown-user">
                        <a class="nav-link dropdown-toggle link" style="color: white;" data-toggle="dropdown">
                            <img src="plantilla/assets/img/admin-avatar.png" />
                            <span></span>Administrador<i class="fa fa-angle-down m-l-5"></i></a>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" onclick="cargar_contenido('contenido_principal','usuario/vista_profile.php')"><i class="fa fa-user"></i>Perfil</a>
                            <a class="dropdown-item" href="profile.html"><i class="fa fa-cog"></i>Configuraciones</a>
                            <li class="dropdown-divider"></li>
                            <a class="dropdown-item" href="../controller/usuario/controlador_cerrar_session.php"><i class="fa fa-power-off"></i>Salir</a>
                        </ul>
                    </li>
                </ul>
                <!-- END TOP-RIGHT TOOLBAR-->
            </div>
        </header>
        <!-- END HEADER-->
        <!-- START SIDEBAR-->
        <nav class="page-sidebar" id="sidebar">
            <div id="sidebar-collapse">
                <div class="admin-block d-flex">
                    <div>
                        <img src="plantilla/assets/img/admin-avatar.png" width="45px" />
                    </div>
                    <div class="admin-info">
                        <div class="font-strong"><label for="" id="usu_sidebar"></div><small id="rol_sidebar"></small></div>
                </div>
                <ul class="side-menu metismenu">
                    <li>
                        <a class="active" onclick="cargar_contenido('contenido_principal','rol/vista_mantenimiento_rol.php')"><i class="sidebar-item-icon fa fa-th-large"></i>
                            <span class="nav-label">Inicio</span>
                        </a>
                    </li>
                    <li class="heading">PÁGINAS</li>
                    <li>
                        <a href="javascript:cargar_contenido('contenido_principal','rol/vista_mantenimiento_rol.php')"><i class="sidebar-item-icon ti-comment-alt"></i>
                            <span class="nav-label">Rol</span><i class="fa fa-angle-left arrow"></i></a>
                    </li>
                    <li>
                        <a href="javascript:cargar_contenido('contenido_principal','persona/vista_mantenimiento_persona.php')"><i class="sidebar-item-icon ti-id-badge"></i>
                            <span class="nav-label">Persona</span><i class="fa fa-angle-left arrow"></i></a>
                    </li>
                    <li>
                        <a href="javascript:cargar_contenido('contenido_principal','usuario/vista_mantenimiento_usuario.php')"><i class="sidebar-item-icon fa fa-users"></i>
                            <span class="nav-label">Usuario</span><i class="fa fa-angle-left arrow"></i></a>
                    </li>
                    <li>
                        <a href="javascript:cargar_contenido('contenido_principal','categoria/vista_mantenimiento_categoria.php')"><i class="sidebar-item-icon fa fa-cubes"></i>
                            <span class="nav-label">Categoría</span><i class="fa fa-angle-left arrow"></i></a>
                    </li>
                </ul>
            </div>
        </nav>
        <!-- END SIDEBAR-->
        <div class="content-wrapper">
            <input type="text" value="<?php echo $_SESSION['S_IDUSUARIO'];?>" id="txt_codigo_principal" hidden>
            <!-- START PAGE CONTENT-->
            <div class="page-content fade-in-up">
                <div id="contenido_principal">
                    <div class="row">
                        <div class="col-lg-3 col-md-6">
                            <div class="ibox bg-success color-white widget-stat">
                                <div class="ibox-body">
                                    <h2 class="m-b-5 font-strong">20.00</h2>
                                    <div class="m-b-5">TOTAL DE VENTAS</div><i class="ti-shopping-cart widget-stat-icon"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="ibox bg-info color-white widget-stat">
                                <div class="ibox-body">
                                    <h2 class="m-b-5 font-strong">348.00</h2>
                                    <div class="m-b-5">TOTAL INGRESO</div><i class="ti-bar-chart widget-stat-icon"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="ibox bg-warning color-white widget-stat">
                                <div class="ibox-body">
                                    <h2 class="m-b-5 font-strong">1</h2>
                                    <div class="m-b-5">VENTAS REALIZADAS</div><i class="ti-bar-chart widget-stat-icon"></i>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="ibox bg-danger color-white widget-stat">
                                <div class="ibox-body">
                                    <h2 class="m-b-5 font-strong">2</h2>
                                    <div class="m-b-5">INGRESOS REALIZADOS</div><i class="ti-bar-chart widget-stat-icon"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END PAGE CONTENT-->
            <footer class="page-footer">
                <div class="font-13">2021 © <b>Grupo 6</b> - Todos los derechos reservados</div>
            </footer>
        </div>
    </div>
    
    <!-- BEGIN PAGA BACKDROPS-->
    <div class="sidenav-backdrop backdrop"></div>
    <div class="preloader-backdrop">
        <div class="page-preloader">Cargando</div>
    </div>
    <!-- END PAGA BACKDROPS-->
    <!-- CORE PLUGINS-->
    <script src="plantilla/assets/vendors/jquery/dist/jquery.min.js" type="text/javascript"></script>
    <script src="plantilla/assets/vendors/popper.js/dist/umd/popper.min.js" type="text/javascript"></script>
    <script src="plantilla/assets/vendors/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="plantilla/assets/vendors/metisMenu/dist/metisMenu.min.js" type="text/javascript"></script>
    <script src="plantilla/assets/vendors/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- PAGE LEVEL PLUGINS-->
    <script src="plantilla/assets/vendors/chart.js/dist/Chart.min.js" type="text/javascript"></script>
    <script src="plantilla/assets/vendors/jvectormap/jquery-jvectormap-2.0.3.min.js" type="text/javascript"></script>
    <script src="plantilla/assets/vendors/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
    <script src="plantilla/assets/vendors/jvectormap/jquery-jvectormap-us-aea-en.js" type="text/javascript"></script>
    <!-- CORE SCRIPTS-->
    <script src="plantilla/assets/js/app.min.js" type="text/javascript"></script>

    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.11.3/b-2.0.1/b-html5-2.0.1/r-2.2.9/sl-1.3.3/datatables.min.js"></script>

    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    
    <script src="../js/console_usuario.js"></script>
    <!-- PAGE LEVEL SCRIPTS-->
    <script>
        TraerDatosUsuario();
        function cargar_contenido(contenedor, contenido){
            $("#"+contenedor).load(contenido);
        }

        var idioma_espanol = {
			select: {
			rows: "%d fila seleccionada"
			},
			"sProcessing":     "Procesando...",
			"sLengthMenu":     "Mostrar MENU registros",
			"sZeroRecords":    "No se encontraron resultados",
			"sEmptyTable":     "Ning&uacute;n dato disponible en esta tabla",
			"sInfo":           "Registros del (_START_ al END_) total de _TOTAL registros",
			"sInfoEmpty":      "Registros del (0 al 0) total de 0 registros",
			"sInfoFiltered":   "(filtrado de un total de MAX registros)",
			"sInfoPostFix":    "",
			"sSearch":         "Buscar:",
			"sUrl":            "",
			"sInfoThousands":  ",",
			"sLoadingRecords": "<b>No se encontraron datos</b>",
			"oPaginate": {
					"sFirst":    "Primero",
					"sLast":     "Último",
					"sNext":     "Siguiente",
					"sPrevious": "Anterior"
			},
			"oAria": {
					"sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
					"sSortDescending": ": Activar para ordenar la columna de manera descendente"
			}
        }

        function sololetras(e) {
                key=e.keyCode || e.which;
        
                teclado=String.fromCharCode(key).toLowerCase();
        
                letras="qwertyuiopasdfghjklñzxcvbnm ";
        
                especiales="8-37-38-46-164";
        
                teclado_especial=false;
        
                for(var i in especiales){
                    if(key==especiales[i]){
                        teclado_especial=true;
                        break;
                    }
                }
        
                if(letras.indexOf(teclado)==-1 && !teclado_especial){
                    return false;
                }
        }


        function soloNumeros(e){
            tecla = (document.all) ? e.keyCode : e.which;
            if (tecla==8){
                return true;
            }
            // Patron de entrada, en este caso solo acepta numeros
            patron =/[0-9]/;
            tecla_final = String.fromCharCode(tecla);
            return patron.test(tecla_final);
        }
    </script>
</body>

</html>