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
                    
                    String user,parola,userTest,passTest;               
                    user = request.getParameter("username");
                    parola = request.getParameter("password");
                    int id;
                    
                    ResultSet rs = jb.userloginResult(user, parola);
                    if(rs.first()){
                        userTest=rs.getString("username");
                        passTest=rs.getString("parola");
                        
      
                        if(userTest.equals(user) & passTest.equals(parola)){
                            javax.servlet.http.Cookie cookie = new javax.servlet.http.Cookie("userid",rs.getString("userid"));
                            response.addCookie(cookie); %>
                            <script> location.replace("userProfile.jsp"); </script>
                        <%
                        }
                        else {
                             %>
                            <script> location.replace("userloginFail.html"); </script>
                        <%
                        }

                        
                    }
                    else{ %>
                            <script> location.replace("index.html"); </script>
                    <%

                    }
                    
                    
                    
                    
                %>







</body>
</html>