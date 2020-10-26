<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alege oferta</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>

        <%

            String oferta=null;
            String motiv, durata, experienta, id_app=null;
            
            int id_user = 0;

            oferta = request.getParameter("oferta");
            motiv = request.getParameter("motiv");
            durata = request.getParameter("durata");
            experienta = request.getParameter("experienta");

            Cookie[] cookies = request.getCookies();

            for (int i = 0; i < cookies.length; i++) {
                Cookie c = cookies[i];
                if (c.getName().equals("userid")) {
                    id_user = Integer.parseInt(c.getValue());
                    break;
                }

            }

            if (motiv != null) {
                jb.connect();
                jb.addApplication(motiv, Integer.parseInt(oferta), durata, experienta, id_user);
                jb.disconnect();
            }
            
           

        %>
        <script> location.replace("upload.html");</script>


    </body>
</html>
