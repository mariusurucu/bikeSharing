<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="css/login.css" >
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />

    <body>


        <%
            jb.connect();

            String user, parola, functie;
            user = request.getParameter("username");
            parola = request.getParameter("password");

            ResultSet rs = jb.loginResult(user, parola);
            if (rs.first()) {
                functie = rs.getString("functie");
                if (functie.equals("admin")) {
                    javax.servlet.http.Cookie cookie = new javax.servlet.http.Cookie("admin", rs.getString("id"));
            response.addCookie(cookie); %>
        <script> location.replace("admin.html");</script>
        <%
            }
        %>

        <%
                        } else { %>
        <script> location.replace("index.html");</script>
        <%
            }
        %>







    </body>
</html>