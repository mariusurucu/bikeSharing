package db;

import java.sql.*;

/**
 *
 * @author Marius Urucu
 */
public class JavaBean {

    String error;
    Connection con;

    public JavaBean() {
    }

    public void connect() throws ClassNotFoundException, SQLException, Exception {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bikeSharing", "root", "Urucusql26!");
        } catch (ClassNotFoundException cnfe) {
            error = "ClassNotFoundException: Nu s-a gasit driverul bazei de date.";
            throw new ClassNotFoundException(error);
        } catch (SQLException cnfe) {
            error = "SQLException: Nu se poate conecta la baza de date.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "Exception: A aparut o exceptie neprevazuta in timp ce se stabilea legatura la baza de date.";
            throw new Exception(error);
        }
    } // connect()

    public void disconnect() throws SQLException {
        try {
            if (con != null) {
                con.close();
            }
        } catch (SQLException sqle) {
            error = ("SQLException: Nu se poate inchide conexiunea la baza de date.");
            throw new SQLException(error);
        }
    } // disconnect()

    public ResultSet loginResult(String username, String parola) throws SQLException, Exception {
        ResultSet rs = null;
        try {
            String queryString = ("Select * from admin WHERE username like '" + username + "' AND parola = '" + parola + "' LIMIT 1;");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString);
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }

        return rs;
    }

    public ResultSet userloginResult(String username, String parola) throws SQLException, Exception {
        ResultSet rs = null;
        try {
            String queryString = ("Select * from user WHERE username like '" + username + "' AND parola = '" + parola + "' LIMIT 1;");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString);
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }

        return rs;
    }

    public ResultSet registerCheck(String username, String parola) throws SQLException, Exception {
        ResultSet rs = null;
        try {
            String queryString = ("Select * from user WHERE username like '" + username + "' AND parola = '" + parola + "' LIMIT 1;");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString);
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }

        return rs;
    }

    public ResultSet vedeTabela(String tabel) throws SQLException, Exception {
        ResultSet rs = null;
        try {
            String queryString = ("select * from `bikeSharing`.`" + tabel + "`;");
            Statement stmt = con.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY*/);
            rs = stmt.executeQuery(queryString);
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // vedeTabela()

    public void register(String username, String pass, String nume, String prenume, String cnp) throws SQLException, Exception {
        if (con != null) {
            try {
// create a prepared SQL statement
                Statement stmt;
                stmt = con.createStatement();
                stmt.executeUpdate("INSERT INTO user(username,parola,nume,prenume,cnp) VALUES('" + username + "','" + pass + "','" + nume + "','" + prenume + "','" + cnp + "');");

            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of register()

    public void userData(String telefon, String email, int id_user, String adresa, String oras, String tara)
            throws SQLException, Exception {
        if (con != null) {
            try {
// create a prepared SQL statement
                int i;
                String[] queryString = new String[2];
                queryString[0] = ("INSERT INTO user_contacts(telefon,email,id_user) VALUES('" + telefon + "','" + email + "','" + id_user + "');");
                queryString[1] = ("INSERT INTO user_address(adresa,oras,tara,id_user) VALUES('" + adresa + "','" + oras + "','" + tara + "','" + id_user + "');");

                for (i = 0; i < 2; i++) {
                    Statement stmt;
                    stmt = con.createStatement();
                    stmt.executeUpdate(queryString[i]);
                }

            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of userData()

    public ResultSet intoarceLinieDupaId(String tabela, String denumireId, int ID) throws SQLException, Exception {
        ResultSet rs = null;
        try {
// Execute query
            String queryString = ("SELECT * FROM " + tabela + " where " + denumireId + "=" + ID + ";");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString);
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // end of intoarceLinieDupaId()

    public ResultSet checkuserData(int ID) throws SQLException, Exception {
        ResultSet rs = null;
        try {

            String queryString = ("SELECT * FROM user_address as ua \n"
                    + "INNER JOIN user_contacts as uc ON ua.id_user = uc.id_user AND ua.id_user = '" + ID + "' ");
            Statement stmt = con.createStatement(/*ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY*/);
            rs = stmt.executeQuery(queryString);
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // end of checkuserData();

    public void addApplication(String motiv, int oferta, String durata, String experienta, int id_user)
            throws SQLException, Exception {
        if (con != null) {
            try {
// create a prepared SQL statement
                String queryString = "INSERT INTO application(motiv,oferta_aleasa,durata,experienta_bic,id_user) VALUES('" + motiv + "','" + oferta + "','" + durata + "','" + experienta + "','" + id_user + "');";
                Statement stmt = con.createStatement();
                stmt.executeUpdate(queryString);

            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    }

    public void stergeDateTabela(String[] primaryKeys, String tabela, String dupaID) throws SQLException, Exception {
        if (con != null) {
            try {
// create a prepared SQL statement
                long aux;
                PreparedStatement delete;
                delete = con.prepareStatement("DELETE FROM " + tabela + " WHERE " + dupaID + "=?;");
                for (int i = 0; i < primaryKeys.length; i++) {
                    aux = java.lang.Long.parseLong(primaryKeys[i]);
                    delete.setLong(1, aux);
                    delete.execute();
                }
            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            } catch (Exception e) {
                error = "A aparut o exceptie in timp ce erau sterse inregistrarile.";
                throw new Exception(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    } // end of stergeDateTabela()

    public void addOffer(String firma, String model, int titlu, int pret, String moneda, String detalii, String constrangeri)
            throws SQLException, Exception {
        if (con != null) {
            try {

                int i;
                String[] queryString = new String[2];
                queryString[0] = ("INSERT INTO bikes(firma,model) VALUES('" + firma + "','" + model + "');");
                queryString[1] = ("INSERT INTO oferte(titlu,pret,moneda,detalii,constrangeri) VALUES('" + titlu + "','" + pret + "','" + moneda + "','" + detalii + "','" + constrangeri + "');");

                for (i = 0; i < 2; i++) {
                    Statement stmt;
                    stmt = con.createStatement();
                    stmt.executeUpdate(queryString[i]);
                }

            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    }

    public ResultSet getMaxid() throws SQLException, Exception {
        ResultSet rs = null;
        try {
// Execute query  
            String queryString = ("SELECT max(id) FROM bikes ");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString);
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // end of getMaxid

    public void setAutoincrement(int ID) throws SQLException, Exception {
        try {
            String queryString = ("ALTER TABLE bikes AUTO_INCREMENT = " + ID + " ");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            stmt.executeUpdate(queryString);

        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        } 
    }// end of setAutoincrement
    
    public void uploadFiles(String photo, String id_card, int id_user, int id_app)
            throws SQLException, Exception {
        if (con != null) {
            try {
// create a prepared SQL statement
                String queryString = "INSERT INTO documents(photo,id_card,id_user,id_app) VALUES('" + photo + "','" + id_card + "','" + id_user + "','" + id_app + "');";
                Statement stmt = con.createStatement();
                stmt.executeUpdate(queryString);

            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    }
    
    public ResultSet getMaxid2() throws SQLException, Exception {
        ResultSet rs = null;
        try {
// Execute query  
            String queryString = ("SELECT max(id) FROM application ");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            rs = stmt.executeQuery(queryString);
        } catch (SQLException sqle) {
            error = "SQLException: Interogarea nu a fost posibila.";
            throw new SQLException(error);
        } catch (Exception e) {
            error = "A aparut o exceptie in timp ce se extrageau datele.";
            throw new Exception(error);
        }
        return rs;
    } // end of getMaxid
    
    public void addFlux(int docid, String uploader, String status, String aprobat, String moderator, String mesaj)
            throws SQLException, Exception {
        if (con != null) {
            try {
// create a prepared SQL statement
                String queryString = "INSERT INTO flux(docid,uploader,status,aprobat,moderator,mesaj) VALUES('" + docid + "','" + uploader + "','" + status + "','" + aprobat + "','" + moderator + "','" + mesaj + "');";
                Statement stmt = con.createStatement();
                stmt.executeUpdate(queryString);

            } catch (SQLException sqle) {
                error = "ExceptieSQL: Reactualizare nereusita; este posibil sa existe duplicate.";
                throw new SQLException(error);
            }
        } else {
            error = "Exceptie: Conexiunea cu baza de date a fost pierduta.";
            throw new Exception(error);
        }
    }

}
