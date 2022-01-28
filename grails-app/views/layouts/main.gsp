<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
    <asset:stylesheet src="application.css"/>
    <g:layoutHead/>
</head>
<body  class="hold-transition sidebar-mini layout-fixed">
    <div class="wrapper">
        <div class="preloader flex-column justify-content-center align-items-center">
            <img class="animation__shake" src="${resource(dir: 'images', file: 'AdminLTELogo.png')}"  alt="AdminLTELogo" height="60" width="60">
        </div>
        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
                <!-- Left navbar links -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                    </li>
                    <li class="nav-item d-none d-sm-inline-block">
                        <a href="${createLink(uri: '/')}" class="nav-link">Home</a>
                    </li>
                </ul>
                <!-- Right navbar links -->
                <ul class="navbar-nav ml-auto">
                    <!-- Navbar Search -->
                    <li class="nav-item">

                            <g:link controller="Logout">Log out</g:link>
                    </li>
                </ul>
            </nav>
        <aside class="main-sidebar sidebar-dark-primary elevation-4">
                <!-- Brand Logo -->
                <a href="#" class="brand-link">
                    <img src="${resource(dir: 'images', file: 'AdminLTELogo.png')}" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
                    <span class="brand-text font-weight-light">Lecoincoin Admin</span>
                </a>
                <!-- Sidebar -->
                <div class="sidebar">
                    <!-- Sidebar user panel (optional) -->
                    <!-- SidebarSearch Form -->
                    <!-- Sidebar Menu -->
                    <nav class="mt-2">
                        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

                                <li class="nav-item">
                                    <a href="#" class="nav-link">
                                        <i class="nav-icon fas fa-user"></i>
                                        <p>
                                            Users
                                            <i class="right fas fa-angle-left"></i>
                                        </p>
                                    </a>
                                    <ul class="nav nav-treeview">
                                        <li class="nav-item">
                                            <a href="/user/index" class="nav-link">
                                                <i class="fa fa-list-alt nav-icon"></i>
                                                <p>Liste des utilisateurs</p>
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="/user/create" class="nav-link">
                                                <i class="fa fa-plus-circle nav-icon"></i>
                                                <p>Ajout utilisateur</p>
                                            </a>
                                        </li>

                                    </ul>
                                </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-bullhorn"></i>
                                    <p>
                                        Annonces
                                        <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="/annonce/index" class="nav-link">
                                            <i class="fa fa-list nav-icon"></i>
                                            <p>Liste des annonces</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="/annonce/create" class="nav-link">
                                            <i class="fa fa-plus nav-icon"></i>
                                            <p>Ajout annonce</p>
                                        </a>
                                    </li>

                                </ul>
                            </li>

                        </ul>
                    </nav>
                    <!-- /.sidebar-menu -->
                </div>
                <!-- /.sidebar -->
            </aside>
        <div class="content-wrapper">
        <!-- Content Header (Page header) -->
            <div class="content-header">
        </div>
            <section class="content">
                <div class="container-fluid">
                    <g:layoutBody/>
                </div><!-- /.container-fluid -->
            </section>

        <!-- /.content -->
        </div>
        <footer class="main-footer">
            <strong>Copyright &copy; 2021-2022 <a href="https://adminlte.io">AdminCoin.io</a>.</strong>
            All rights reserved.
            <div class="float-right d-none d-sm-inline-block">
                <b>Version</b> 1.0.0
            </div>
        </footer>
    </div>
    <asset:javascript src="application.js"/>
</body>
</html>
