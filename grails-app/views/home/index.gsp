<%--
  Created by IntelliJ IDEA.
  User: Kianjantsoa Jolivot RANDRIANARISAMY
  Date: 11/02/2022
  Time: 17:34
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Home | Lecoincoin</title>
    <asset:stylesheet href="bootstrap.css" />
    <asset:stylesheet href="all.min.css" />
    <asset:stylesheet href="font.css" />
    <asset:stylesheet href="front/prettyPhoto.css" />
    <asset:stylesheet href="front/price-range.css" />
    <asset:stylesheet href="front/animate.css" />
    <asset:stylesheet href="front/main.css" />
    <asset:stylesheet href="front/responsive.css" />

    <!--[if lt IE 9]
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
     [endif] -->


</head><!--/head-->

<body>
<header id="header"><!--header-->
    <div class="header_top"><!--header_top-->
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="contactinfo">
                        <ul class="nav nav-pills">
                            <li><a href="#"><i class="fa fa-phone"></i> +261 34 88 821 12</a></li>
                            <li><a href="#"><i class="fa fa-envelope"></i> lecoincoin@hotmail.com</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="social-icons pull-right">
                        <ul class="nav navbar-nav">
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                            <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header_top-->

    <div class="header-middle">
        <div class="container">
                <div class="col-md-4 clearfix">
                    <div class="logo pull-left">
                        <a href="#"><img src="${resource(dir: 'images', file: "grails.svg")}" alt="" /></a>
                    </div>

                </div>
                <div class="col-md-8 clearfix">
                    <div class="shop-menu clearfix pull-right">
                        <ul class="nav navbar-nav">
                            <li><a href="/home/index"><i class="fa fa-envelope"></i> Toutes les annonces </a></li>
                        </ul>
                    </div>
                </div>
        </div>
    </div>

    <!--
    <div class="header-bottom">
        <div class="container">
            <div class="row">
                <div class="col-sm-9">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>

                </div>

            </div>
        </div>
    </div> -->
</header><!--/header-->


<section id="slider" ><!--slider-->
    <div class="container">
    <h2 class="title text-center">Section Recherche</h2>
        <div class="row">
            <div class="col-sm-2"></div>
            <div class=" col-sm-8">
                <div class="form-group">
                    <form action="/home/index" method="get">
                    <ul class="user_info">

                        <li class="single_field zip-field">

                            <input class="form-control" type="text" name="title" placeholder="Titre de l'annonce">
                        </li>
                        <li class="single_field zip-field">

                            <input class="form-control" type="text" name="description" placeholder="Description de l'annonce">
                        </li>
                        <li class="single_field zip-field">

                            <button type="submit" class="btn-primary">Rechercher</button>
                        </li>

                    </ul>
                    </form>
                </div>
            </div>
    </div>
</section><!--/slider-->

<section>
    <div class="container">
        <div class="row">


            <div class="col-sm-12 padding-right">
                <div class="features_items"><!--features_items-->
                    <h2 class="title text-center">Listes des annonces</h2>
                    <g:each in="${annonceList}" var="annonce">
                        <div class="col-sm-4">
                        <div class="product-image-wrapper">
                            <div class="single-products">
                                <div class="productinfo text-center">
                                    <img src="${resource(dir: 'images', file: "${annonce.illustrations.get(0).filename}")}" style="width: 100px;height: 100px" alt="" />
                                    <h2>${annonce.price}</h2>
                                    <p>${annonce.title}</p>
                                    <a href="/home/detail/${annonce.id}" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Voir d??tail</a>
                                </div>
                                <div class="product-overlay">
                                    <div class="overlay-content">
                                        <<h2>${annonce.price}</h2>
                                        <p>${annonce.title}</p>
                                        <a href="/home/detail/${annonce.id}" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Voir d??tail</a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    </g:each>
                </div><!--features_items-->
                <div class="pagination">
                    <g:paginate total="${annonceCount ?: 0}" />
                </div>

            </div>
        </div>
    </div>
</section>

<footer id="footer"><!--Footer-->

    <!--
    <div class="footer-widget">
        <div class="container">
            <div class="row">
                <div class="col-sm-2">
                    <div class="single-widget">
                        <h2>Service</h2>
                        <ul class="nav nav-pills nav-stacked">
                            <li><a href="#">Online Help</a></li>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Order Status</a></li>
                            <li><a href="#">Change Location</a></li>
                            <li><a href="#">FAQ???s</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="single-widget">
                        <h2>Quock Shop</h2>
                        <ul class="nav nav-pills nav-stacked">
                            <li><a href="#">T-Shirt</a></li>
                            <li><a href="#">Mens</a></li>
                            <li><a href="#">Womens</a></li>
                            <li><a href="#">Gift Cards</a></li>
                            <li><a href="#">Shoes</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="single-widget">
                        <h2>Policies</h2>
                        <ul class="nav nav-pills nav-stacked">
                            <li><a href="#">Terms of Use</a></li>
                            <li><a href="#">Privecy Policy</a></li>
                            <li><a href="#">Refund Policy</a></li>
                            <li><a href="#">Billing System</a></li>
                            <li><a href="#">Ticket System</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="single-widget">
                        <h2>About Shopper</h2>
                        <ul class="nav nav-pills nav-stacked">
                            <li><a href="#">Company Information</a></li>
                            <li><a href="#">Careers</a></li>
                            <li><a href="#">Store Location</a></li>
                            <li><a href="#">Affillate Program</a></li>
                            <li><a href="#">Copyright</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-3 col-sm-offset-1">
                    <div class="single-widget">
                        <h2>About Shopper</h2>
                        <form action="#" class="searchform">
                            <input type="text" placeholder="Your email address" />
                            <button type="submit" class="btn btn-default"><i class="fa fa-arrow-circle-o-right"></i></button>
                            <p>Get the most recent updates from <br />our site and be updated your self...</p>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div> -->

    <div class="footer-bottom">
        <div class="container">
            <div class="row">
                <p class="pull-left">Copyright ?? 2022 LECOINCOIN Inc. All rights reserved.</p>
                <p class="pull-left">Copyright ?? 2022 LECOINCOIN Inc. All rights reserved.</p>
                <p class="pull-right">Designed by <span><a target="_blank" href="#">LCC_IT</a></span></p>
            </div>
        </div>
    </div>

</footer><!--/Footer-->


<asset:javascript src="jquery.min.js" />
<asset:javascript src="bootstrap.css" />
<asset:javascript src="front/jquery.scrollUp.min.js" />
<asset:javascript src="front/price-range.js" />
<asset:javascript src="front/jquery.prettyPhoto.js" />
<asset:javascript src="front/main.js" />

</body>
</html>