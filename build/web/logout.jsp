<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home redirect</title>
    </head>
    <%
        Cookie[] cookies = request.getCookies();
        

        for(int i = 0; i < cookies.length; i++) { 
            Cookie c = cookies[i];
            if (c.getName().equals("admin")) {
                c.setMaxAge(0);
                response.addCookie(c);
                session.invalidate();
                response.sendRedirect("index.html");
                break;
            }
        }  
        
    
    %>
        
</html>
