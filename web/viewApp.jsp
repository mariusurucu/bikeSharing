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
        <title>Oferte</title>


        <link rel="stylesheet" href="css/mod.css">
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


            .button{
                color: green;
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
                <div class="navbar-buttons mbr-section-btn"><a class="btn btn-sm btn-secondary-outline display-4" href="admin.html"><span class="mbri-home mbr-iconfont mbr-iconfont-btn"></span>&nbsp;Home</a></div>
            </div>
        </nav>
    </section>

    <section class="engine"><a href=""></a></section><section class="mybackround mbr-fullscreen mbr-parallax-background" id="header2-1">





        <div class="container align-center">
            <div class="row justify-content-md-center">
                <div class="mbr-white col-md-10">
                    <h1 align="center" class="mod-title">Cereri:</h1>

                    <br/>

                    <form action="flux.jsp" class="mod-table-mid" method="post">
                        <div class="table-responsive">
                            <table border="1" align="center">
                                <tr class="mod-table-head">
                                    <td><b>Mark:</b></td>
                                    <td><b>Motiv</b></td>
                                    <td><b>Oferta</b></td>
                                    <td><b>Durata</b></td>
                                    <td><b>Experienta</b></td>
                                    <td><b>User</b></td>
                                </tr>
                                <%
                                    jb.connect();
                                    ResultSet rs,rs2,rs3,rs4;
                                    rs = jb.vedeTabela("application");
                                    int x;
                                    while (rs.next()) {
                                        x = rs.getInt("id");
                                        rs2 = jb.intoarceLinieDupaId("oferte", "id", rs.getInt("oferta_aleasa"));
                                        while(rs2.next()){
                                            rs3 = jb.intoarceLinieDupaId("bikes", "id", rs2.getInt("titlu"));
                                            while(rs3.next()){
                                                rs4 = jb.intoarceLinieDupaId("user", "userid", rs.getInt("id_user"));
                                                while(rs4.next()){

                                %>
                                <tr class="mod-table-line">
                                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
                                    <td><%= rs.getString("motiv")%></td>
                                    <td><%= rs3.getString("firma")+ " " + rs3.getString("model")%></td>
                                    <td><%= rs.getString("durata")%></td>
                                    <td><%= rs.getString("experienta_bic")%></td>
                                    <td><%= rs4.getString("nume") + " " + rs4.getString("prenume")%></td>

                                    <%
                                        }}}}
                                    %>
                                </tr>
                            </table></div><br/>
                        <p align="center">
                            <input type="submit" class="mod-button btn btn-sm display-4" value="Aproba">
                            
                        </p>
                    </form>
                    <%
                        rs.close();
                        jb.disconnect();
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


    <div id="scrollToTop" class="scrollToTop mbr-arrow-up"><a style="text-align: center;"><i></i></a></div>
    <input name="animation" type="hidden">


</body>
</html>