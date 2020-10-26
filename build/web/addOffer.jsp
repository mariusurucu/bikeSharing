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
                        String firma, model, moneda, detalii, constrangeri, maxid = null,pret;
                        int titlu;
                        ResultSet rs;

                        firma = request.getParameter("firma");
                        model = request.getParameter("model");
                        moneda = request.getParameter("moneda");
                        detalii = request.getParameter("detalii");
                        constrangeri = request.getParameter("constrangeri");
                        pret =request.getParameter("pret");
                        
                        jb.connect();
                        rs = jb.getMaxid();
                        if (rs.next()) {
                            maxid = rs.getString("MAX(id)");
                        }
                        jb.setAutoincrement((Integer.parseInt(maxid)+1));
                        titlu = (Integer.parseInt(maxid)+1);
                        System.out.println("o daaa " + titlu);

                        if (firma != null) {
                            jb.addOffer(firma, model, titlu, Integer.parseInt(pret), moneda, detalii, constrangeri);
                            jb.disconnect();
                    %>
                    <script> location.replace("oferte.jsp");</script><%
                    } else {

                    %>
                    <h1 class="" style="text-align: center;"> Adauga date personale.</h1>
                    <form action="addOffer.jsp" method="post">

                        <div class="container">
                            <div class="row">
                                <div class="col-4">
                                    <div class="form-group mb-2">
                                        <label for="firma">Firma:</label>
                                        <input type="text" class="form-control" id="firma" name="firma">
                                    </div>
                                </div>

                                <div class="col-4">
                                    <div class="form-group mb-2">
                                        <label for="model">Model:</label>
                                        <input type="text" class="form-control" id="model" name="model">
                                    </div>
                                </div>

                                <div class="col-4">
                                    <div class="form-group mb-2">
                                        <label for="pret">Pret:</label>
                                        <input type="text" class="form-control" id="pret" name="pret">
                                    </div>
                                </div> 

                                <div class="col-4">
                                    <div class="form-group mb-2">
                                        <label for="moneda">Moneda:</label>
                                        <select class="form-control" name="moneda" id="moneda">
                                            <option value="ron">Lei</option>
                                            <option value="euro">Euro</option>
                                            <option value="dolari">Dolari</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-4">
                                    <div class="form-group mb-2">
                                        <label for="detalii">Detalii:</label>
                                        <input type="text" class="form-control" id="detalii" name="detalii">
                                    </div>
                                </div>  

                                <div class="col-4">
                                    <div class="form-group mb-2">
                                        <label for="constrangeri">Constrangeri:</label>
                                        <input type="text" class="form-control" id="constrangeri" name="constrangeri">
                                    </div>
                                </div>         
                            </div>
                            <input style="height:50px;width:175px;margin-left:0" class="mod-button btn btn-secondary" type="submit" value="Adauga date" />
                            <button style="height:50px;width:175px;margin-left:0" class="mod-button btn btn-secondary" type="button" onclick="location.href = 'admin.html';">Back</button>
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