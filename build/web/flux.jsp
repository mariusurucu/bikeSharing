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
            jb.connect();
            String key = request.getParameter("primarykey");
            String mesaj = "Aprobat", aprobat = "Da", status = "Aprobat", moderator = null,uploader = null;
            ResultSet rs, rs2,rs3;

            Cookie[] cookies = request.getCookies();

            for (int i = 0; i < cookies.length; i++) {
                Cookie c = cookies[i];
                if (c.getName().equals("admin")) {
                    rs = jb.intoarceLinieDupaId("admin", "id", Integer.parseInt(c.getValue()));
                    if (rs.next()) {
                        moderator = rs.getString("nume")+ " " + rs.getString("prenume");
                    }
                    break;
                }

            }

            rs = jb.intoarceLinieDupaId("application", "id", Integer.parseInt(key));
            if (rs.next()) {
                rs2 = jb.intoarceLinieDupaId("documents", "id_app", Integer.parseInt(key));
                if (rs2.next()) {
                    rs3 = jb.intoarceLinieDupaId("user", "userid", rs2.getInt("id_user"));
                    if(rs3.next()){
                        uploader = rs3.getString("nume")+ " " + rs3.getString("prenume");
                        jb.addFlux(rs2.getInt("id"), uploader, status, aprobat, moderator, mesaj);
                    }
                }
            }
            jb.disconnect();


        %>
        <script> location.replace("admin.html");</script>


    </body>
</html>
