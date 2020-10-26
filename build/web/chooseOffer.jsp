<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="generator" content="Mobirise v4.8.0, mobirise.com">
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
        <link rel="shortcut icon" href="assets/images/mbr-2-192x192.jpg" type="image/x-icon">
        <meta name="description" content="">
        <title>Alege Oferta</title>
        <link href="css/simple-sidebar.css" rel="stylesheet">
        <link href="css/mod.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/web/assets/mobirise-icons/mobirise-icons.css">
        <link rel="stylesheet" href="assets/tether/tether.min.css">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-grid.min.css">
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap-reboot.min.css">
        <link rel="stylesheet" href="assets/socicon/css/styles.css">
        <link rel="stylesheet" href="assets/animatecss/animate.min.css">
        <link rel="stylesheet" href="assets/dropdown/css/style.css">
        <link rel="stylesheet" href="assets/theme/css/style.css">
        <link rel="stylesheet" href="assets/mobirise/css/mbr-additional.css" type="text/css">
        <link href="css/pcframe.css" rel="stylesheet">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>

    <section class="menu cid-qTkzRZLJNu" once="menu" id="menu1-0">



        <nav class="navbar navbar-expand beta-menu navbar-dropdown align-items-center navbar-fixed-top navbar-toggleable-sm">
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <div class="hamburger">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </button>
        </nav>
    </section>

    <section class="engine"><a href=""></a></section><section class="mybackround mbr-fullscreen mbr-parallax-background" id="header2-1">

        <div class="container align-center">
            <div class="row justify-content-md-center">
                <div class="mbr-white col-md-10">
                    <form action="chooseOffer2.jsp" method="post">
                        <% int oferta;%>
                        <div class="container">
                            <div class="row">
                                <div class="col-4">
                                    <div class="form-group mb-2">
                                        <label for="motiv">Motiv:</label>
                                        <input type="text" class="form-control" id="motiv" name="motiv">
                                    </div>
                                </div>

                                <div class="col-4">
                                    <div class="form-group mb-2">
                                        <label for="oferta">Oferta aleasa:</label>
                                        <input type="text" class="form-control" id="oferta" name="oferta" value="<%=oferta = Integer.parseInt(request.getParameter("primarykey"))%>">
                                    </div>
                                </div>

                                <div class="col-4">
                                    <div class="form-group mb-2">
                                        <label for="durata">Durata:</label>
                                        <input type="text" class="form-control" id="durata" name="durata" value="1 luna">
                                    </div>
                                </div>       

                                <div class="col-4">
                                    <div class="form-group mb-2">
                                        <label for="experienta">Experienta bicicleta:</label>
                                        <input type="text" class="form-control" id="experienta" name="experienta">
                                    </div>
                                </div>                               
                            </div>
                            <input style="height:50px;width:175px;margin-left:0" class="mod-button btn btn-secondary" type="submit" value="Next" />
                            <button style="height:50px;width:175px;margin-left:0" class="mod-button btn btn-secondary" type="button" onclick="location.href = 'oferte.jsp';">Back</button>
                        </div>
                    </form>
                    <br/>
                </div>
            </div>
        </div>

    </section>




    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>


    <script src="assets/web/assets/jquery/jquery.min.js"></script>
    <script src="assets/popper/popper.min.js"></script>
    <script src="assets/tether/tether.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/smoothscroll/smooth-scroll.js"></script>
    <script src="assets/touchswipe/jquery.touch-swipe.min.js"></script>
    <script src="assets/viewportchecker/jquery.viewportchecker.js"></script>
    <script src="assets/parallax/jarallax.min.js"></script>
    <script src="assets/dropdown/js/script.min.js"></script>
    <script src="assets/theme/js/script.js"></script>

</body>
</html>