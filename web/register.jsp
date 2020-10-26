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

        <title>Register</title>
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

    <section class="engine"><a href="">ETTI</a></section><section class="mybackround mbr-fullscreen mbr-parallax-background" id="header2-1">

        <div class="container align-center">
            <div class="row justify-content-md-center">
                <div class="mbr-white col-md-10">
                    <%
                        int id;
                        String username, pass, nume, prenume, cnp, passTest, userTest;
                        username = request.getParameter("Username");
                        pass = request.getParameter("Password");
                        nume = request.getParameter("Surname");
                        prenume = request.getParameter("Name");
                        cnp = request.getParameter("Cnp");
                        ResultSet test;

                        if ((username != null) & (pass != null)) {
                            jb.connect();
                            test = jb.registerCheck(username, pass);
                            if (test.next()) {
                                userTest = test.getString("username");
                                passTest = test.getString("parola");
                                if ((userTest.equals(username)) & (passTest.equals(pass))) {
                    %>
                    <p>Ghinion exista duplicate.</p><%
                        }
                    } else {
                        jb.register(username, pass, nume, prenume, cnp);
                        jb.disconnect();
                    %>
                    <p>Datele au fost adaugate.</p><%
                        }

                    } else {

                    %>
                    <div class="frame-wrapper">  
                        <div class="frame">
                            <div class="camera"></div>
                            <div class="image">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-4 offset-4">
                                            <form action="register.jsp"  style="margin: 0 auto;" method="post">
                                                <p><font size="5">Enroll now</font> </p>

                                                <div class="form-group mb-2">
                                                    <input type="text" placeholder="Username" class="form-control" id="Username" name="Username" required>
                                                </div>

                                                <div class="form-group mb-2">
                                                    <input type="password" placeholder="Password" class="form-control" id="Password" name="Password" required>
                                                </div>

                                                <div class="form-group mb-2">
                                                    <input type="text" placeholder="Nume" class="form-control" id="Surname" name="Surname" required>
                                                </div>
                                                <div class="form-group mb-2">
                                                    <input type="text" placeholder="Prenume" class="form-control" id="Name" name="Name" required>
                                                </div>
                                                <div class="form-group mb-2">
                                                    <input type="text" placeholder="CNP" class="form-control" id="Cnp" name="Cnp" required>
                                                </div>

                                                <input  style="height:50px;width:175px;margin-left:0" class="mod-button btn btn-secondary "  type="submit" value="Register" />
                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="button"></div>
                        </div>
                        <div class="base"></div>
                        <div class="foot"></div>
                    </div>

                    <%            }
                    %>




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