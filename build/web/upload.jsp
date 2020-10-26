<%@page import="java.sql.ResultSet"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Incarca documente</title>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            File file;
            String photo = null, id_card = null, id_app = null;
            int id_user = 0;
            int maxFileSize = 5000 * 1024;
            int maxMemSize = 5000 * 1024;
            String filePath = "/home";

            Cookie[] cookies = request.getCookies();

            for (int i = 0; i < cookies.length; i++) {
                Cookie c = cookies[i];
                if (c.getName().equals("userid")) {
                    id_user = Integer.parseInt(c.getValue());
                    break;
                }

            }

            jb.connect();
            ResultSet rs = jb.getMaxid2();
            if (rs.next()) {
                id_app = rs.getString("MAX(id)");
            }
            jb.disconnect();

            String contentType = request.getContentType();
            if ((contentType.indexOf("multipart/form-data") >= 0)) {

                DiskFileItemFactory factory = new DiskFileItemFactory();
                factory.setSizeThreshold(maxMemSize);
                factory.setRepository(new File("D:/NetBeansProjects/Upload/Temp"));
                ServletFileUpload upload = new ServletFileUpload(factory);
                upload.setSizeMax(maxFileSize);

                try {
                    List fileItems = upload.parseRequest(request);
                    Iterator i = fileItems.iterator();
                    while (i.hasNext()) {
                        FileItem fi = (FileItem) i.next();
                        InputStream input = fi.getInputStream();
                        if (!fi.isFormField()) {
                            String fieldName = fi.getFieldName();
                            System.out.println(fieldName + " ");
                            String fileName = fi.getName();
                            boolean isInMemory = fi.isInMemory();
                            long sizeInBytes = fi.getSize();
                            file = new File(filePath + fileName);
                            fi.write(file);
                            if (fieldName.equals("file")) {
                                photo = filePath + fileName;
                            } else {
                                id_card = filePath + fileName;
                            }
                        }
                    }
                } catch (Exception ex) {
                    System.out.println(ex);
                }
                if (photo != null) {
                    jb.connect();
                    jb.uploadFiles(photo, id_card, id_user, Integer.parseInt(id_app));
                    jb.disconnect();
                }
            }
        %>
        <script> location.replace("userProfile.jsp");</script>


    </body>
</html>