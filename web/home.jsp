<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>

        <%
            Cookie[] cookies = request.getCookies();

            for (int i = 0; i < cookies.length; i++) {
                Cookie c = cookies[i];
                if (c.getName().equals("userid")){%>
                    <script> location.replace("userProfile.jsp");</script>
                <%}
                else if (c.getName().equals("admin")){%>
                    <script> location.replace("admin.html");</script>
                <%}

            }
        %>
        <script> location.replace("index.html");</script>


    </body>
</html>
