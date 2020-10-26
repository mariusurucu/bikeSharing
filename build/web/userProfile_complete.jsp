<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>User Profile</title>
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
        <%
            jb.connect();
            int id_user = 0, docid = 0;
            Cookie[] cookies = request.getCookies();

            for (int i = 0; i < cookies.length; i++) {
                Cookie c = cookies[i];
                if (c.getName().equals("userid")) {
                    id_user = Integer.parseInt(c.getValue());
                    break;
                }

            }
            ResultSet rs = jb.intoarceLinieDupaId("user", "userid", id_user);
            ResultSet rs2, rs3;
            while (rs.next()) {

        %>
        <form action="" class="mod-table-mid" method="post" >
            <div id="page">
                <div id="sidebar">
                    <a href="http://facebook.com">
                        <div id="imageCircle">
                        </div></a>
                    <div id="nameDetails">
                        <div id="name"><h2><%= rs.getString("nume") + " " + rs.getString("prenume")%>  </h2></div>
                        <div style="width:180px;margin: auto;"><hr size="2px"></div>
                    </div>
                    <div id="contact">
                        <div class="phone"> 
                            <span class="glyphicon glyphicon-user" style="color:white;zoom:1.5;"></span><span style="color:white;text-align: right;">CNP: <%= rs.getString("CNP")%></span>
                        </div>                 
                    </div>
                   
                    <br></br>
                    <br></br>


                </div>
                <div id="mbody">
                    <div class="education">
                        <br>
                        <div class="title">
                            <span class="glyphicon glyphicon-certificate"></span><span>Adresa</span>
                        </div>

                        <div class="timeline">
                            <div class="line"></div>
                            <div class="eduDetails">
                                <%
                                    rs2 = jb.intoarceLinieDupaId("user_address", "id_user", id_user);
                                    if (rs2.next()) {%>
                                <div class="eduTitle">
                                    <div class="circle"></div>
                                    <ul>
                                        <li><span>Adresa: <%= rs2.getString("adresa")%></span></li>
                                    </ul>
                                </div>

                                <div class="eduTitle">
                                    <div class="circle"></div>
                                    <ul>
                                        <li><span>Oras,Tara: <%= rs2.getString("oras") + "," + rs2.getString("tara")%></span></li>


                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="education links">
                        <div class="title">
                            <span class="glyphicon glyphicon-link"></span><span>Contact</span>
                        </div>

                        <div class="timeline">
                            <div class="line"></div>
                            <div class="eduDetails">
                                <div class="eduTitle">
                                    <div class="circle"></div>
                                    <ul>
                                        <%
                                            rs3 = jb.intoarceLinieDupaId("user_contacts", "id_user", id_user);
                                            if (rs3.next()) {


                                        %>
                                        <li><span>Telefon: <%= "0" + rs3.getString("telefon")%></span></li>


                                    </ul>
                                </div>

                                <div class="eduTitle">
                                    <div class="circle"></div>
                                    <ul>
                                        <li>E-mail: <%= rs3.getString("email")%></li>


                                    </ul>
                                </div>

                            </div>

                        </div>
                    </div>


                </div>
            </div>
        </form>
        <%
                    }
                }
            }
        %>
    </body>


</html>

