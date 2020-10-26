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
        <title>Adauga Date</title>
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

    <section class="engine"><a href="https://mobiri.se">Mobirise</a></section><section class="mybackround mbr-fullscreen mbr-parallax-background" id="header2-1">





        <div class="container align-center">
            <div class="row justify-content-md-center">
                <div class="mbr-white col-md-10">
                    <%
                        String telefon, email, adresa, oras, tara;
                        int id_user = 0;

                        telefon = request.getParameter("telefon");
                        email = request.getParameter("email");
                        adresa = request.getParameter("adresa");
                        oras = request.getParameter("oras");
                        tara = request.getParameter("tara");
                        Cookie[] cookies = request.getCookies();

                        for (int i = 0; i < cookies.length; i++) {
                            Cookie c = cookies[i];
                            if (c.getName().equals("userid")) {
                                id_user = Integer.parseInt(c.getValue());
                                break;
                            }

                        }

                        if (telefon != null) {
                            jb.connect();
                            jb.userData(telefon, email, id_user, adresa, oras, tara);
                            jb.disconnect();
                    %>
                    <h1 class="text-center" style="margin-top: 200px">Datele au fost adaugate cu succes!</h1><%
                    } else {

                    %>
                    <h1 class="" style="text-align: center;"> Adauga date personale.</h1>

                    <form action="userdataAdd.jsp" method="post">

                        <div class="container">
                            <div class="row">
                                <div class="col-4">
                                    <div class="form-group mb-2">
                                        <label for="Telefon">Telefon:</label>
                                        <input type="text" class="form-control" id="Telefon" name="telefon">
                                    </div>
                                </div>

                                <div class="col-4">
                                    <div class="form-group mb-2">
                                        <label for="Email">E-mail:</label>
                                        <input type="text" class="form-control" id="Email" name="email">
                                    </div>
                                </div>

                                <div class="col-4">
                                    <div class="form-group mb-2">
                                        <label for="Adresa">Adresa</label>
                                        <input type="text" class="form-control" id="Adresa" name="adresa">
                                    </div>
                                </div>       

                                <div class="col-4">
                                    <div class="form-group mb-2">
                                        <label for="Oras">Oras</label>
                                        <input type="text" class="form-control" id="Oras" name="oras">
                                    </div>
                                </div>  

                                <div class="col-4">
                                    <div class="form-group mb-2">
                                        <label for="Tara">Tara</label>
                                        <input type="text" class="form-control" id="Tara" name="tara">
                                    </div>
                                </div>         
                            </div>
                            <input style="height:50px;width:175px;margin-left:0" class="mod-button btn btn-secondary" type="submit" value="Adauga date" />
                            <button style="height:50px;width:175px;margin-left:0" class="mod-button btn btn-secondary" type="button" onclick="location.href = 'userProfile.jsp';">Back</button>
                        </div>


                    </form>

                    <%        }
                    %>
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