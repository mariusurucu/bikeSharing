<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="generator" content="Mobirise v4.8.0, mobirise.com">
        <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
        <link rel="shortcut icon" href="assets/images/mbr-2-192x192.jpg" type="image/x-icon">
        <meta name="description" content="">

        <title>Bike Sharing Project</title>
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
        <style>
            iframe:focus { 
                outline: none;
            }

            iframe[seamless] { 
                display: block;
            }
        </style>
        


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
        <div class="menu-logo">
            <div class="navbar-brand">
                <span class="navbar-logo">
                    <a href="index.html">
                         <img src="assets/images/mbr-2-192x192.jpg" alt="Mobirise" title="" style="height: 3.8rem;">
                    </a>
                </span>
                <span class="navbar-caption-wrap"><a class="navbar-caption text-secondary display-4" href="http://www.electronica.pub.ro/">ETTI</a></span>
            </div>
        </div>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav nav-dropdown" data-app-modern-menu="true">
                <li class="nav-item">
                    <a class="nav-link link text-secondary display-4" href="userLogout.jsp">
                        <span class="mbri-logout mbr-iconfont mbr-iconfont-btn"></span>
                        Log out
                    </a>                  
                </li>
                <li class="nav-item"> <a class="nav-link link text-secondary display-4" href="requestCheck.jsp">
                        <span class="mbri-preview mbr-iconfont mbr-iconfont-btn"></span>
                        Verifica cerere
                    </a></li></ul>            
            <div class="navbar-buttons mbr-section-btn"><a class="btn btn-sm btn-secondary-outline display-4" href="oferte.jsp"><span class="mbri-cursor-click mbr-iconfont mbr-iconfont-btn"></span>&nbsp;Vezi Oferte</a></div>
        </div>
    </nav>
        </section>

        <section class="engine"><a href=""></a></section><section class="mybackround mbr-fullscreen mbr-parallax-background" id="header2-1">





            <div class="container align-center">
                <div class="row justify-content-md-center">
                    <div class="mbr-white col-md-10">

                        <%
                            jb.connect();
                            ResultSet rs = null;
                            int id_user = 0;
                            Cookie[] cookies = request.getCookies();

                            for (int i = 0; i < cookies.length; i++) {
                                Cookie c = cookies[i];
                                if (c.getName().equals("userid")) {
                                    id_user = Integer.parseInt(c.getValue());
                                    break;
                                }

                            }
                            rs = jb.checkuserData(id_user);

                            if (rs.next()) {
                                %>
                                <br><br><br><br>
                                <iframe src="userProfile_complete.jsp" align="middle" width="603" height="850">
                            <p>Your browser does not support iframes.</p>
                        </iframe>
                        <%
                        } else {%>


                        <h1 align="center" class="mod-title">Bine ati venit!</h1><br><br>   
                        <p class="mod-table-mid" align="center">Bine ati venit!In zona aceasta iti poti personaliza profilul,adaugand cateva informatii
                        despre tine.<br>Ce mai astepti? Da-i bataie,completeaza-ti datele personale ca sa ne putem cunoaste</p><br>
                        
                        <div class="mod-table-middle">
                            <p align="center"> <button class="mod-button btn btn-sm display-4" type="button" onclick="location.href = 'userdataAdd.jsp';">Completeaza-ti datele!</button></p></div> 
                            <%
                                }

                            %>
                    </div>
                </div>
            </div>

        </section>

        <section class="cid-qTkAaeaxX5" id="footer1-2">





            <div class="container">
                <div class="media-container-row content text-white">
                    <div class="col-12 col-md-3">
                        <div class="media-wrap">
                            <a href="index.html">
                                <img src="assets/images/mbr-2-192x192.jpg" alt="Mobirise" title="">
                            </a>
                        </div>
                    </div>
                    <div class="col-12 col-md-3 mbr-fonts-style display-7">
                        <h5 class="pb-3">
                            Address
                        </h5>
                        <p class="mbr-text">Facultatea de Electronică, Telecomunicații și Tehnologia Informației</p>
                    </div>
                    <div class="col-12 col-md-3 mbr-fonts-style display-7">
                        <h5 class="pb-3">
                            Contacts
                        </h5>
                        <p class="mbr-text">
                            Email: support@etti.com
                            <br>Phone: 021 402 4618&nbsp;<br><br></p>
                    </div>
                </div></div>
        </section>     


        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

        <!-- Menu Toggle Script -->
        <script>
                                $("#menu-toggle").click(function (e) {
                                    e.preventDefault();
                                    $("#wrapper").toggleClass("toggled");
                                });
        </script>

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
