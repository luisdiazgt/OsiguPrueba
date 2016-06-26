package ws;

import java.sql.*;
import javax.ejb.Singleton;

@Singleton
public class Conexion {

    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    String DB_URL = "jdbc:mysql://localhost:3306/peliculas";
    String USER = "root";
    String PASS = "root";
    Connection conn = null;
    CallableStatement stmt = null;

        
    public String insertarRating(int intPelicula, int intCalificacion, String strIp, String strNavegador) {
        String strResultado = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            String strSql;
            strSql = "{CALL setRating(?, ?, ?, ?)}";
            stmt = conn.prepareCall(strSql);
            stmt.setInt("p_pelicula", intPelicula);
            stmt.setInt("p_calificacion", intCalificacion);
            stmt.setString("p_ip", strIp);
            stmt.setString("p_navegador", strNavegador);
            int intExito = stmt.executeUpdate();
            if (intExito == 1) {
                strResultado = "Se a votado correctamente.";
            } else {
                strResultado = "Ocurrió un error al votar.";
            }

            stmt.close();
            conn.close();

        } catch (Exception ex) {
            strResultado = ex.toString();
        }

        return strResultado;
    }
    
    public String eliminarPelicula(int intPelicula) {
        String strResultado = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            String strSql;
            strSql = "{CALL eliminarPelicula(?)}";
            stmt = conn.prepareCall(strSql);
            stmt.setInt("p_pelicula", intPelicula);
            int intExito = stmt.executeUpdate();
            if (intExito == 1) {
                strResultado = "Se a eliminado la pelicula correctamente.";
            } else {
                strResultado = "Ocurrió un error al eliminar la pelicula.";
            }

            stmt.close();
            conn.close();

        } catch (Exception ex) {
            strResultado = ex.toString();
        }

        return strResultado;
    }
    
    public String insertarPelicula(String strTitulo,int intAño, int intEstudioGrabacion, int intDirector, int intCategoria, String strImagen) {
        String strResultado = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            String strSql;
            strSql = "{CALL insertarPelicula(?, ?, ?, ?, ?, ?)}";
            stmt = conn.prepareCall(strSql);
            stmt.setString("p_titulo", strTitulo);
            stmt.setInt("p_anio", intAño);
            stmt.setInt("p_estudio_grabacion", intEstudioGrabacion);
            stmt.setInt("p_director", intDirector);
            stmt.setInt("p_categoria", intCategoria);
            stmt.setString("p_imagen", strImagen);
            int intExito = stmt.executeUpdate();
            if (intExito == 1) {
                strResultado = "Se a insertado pelicula correctamente.";
            } else {
                strResultado = "Ocurrió un error al insertar la pelicula.";
            }

            stmt.close();
            conn.close();

        } catch (Exception ex) {
            strResultado = ex.toString();
        }

        return strResultado;
    }
    
    public String modificarPelicula(int intPelicula, String strTitulo, int intAño, int intEstudio_grabacion,
                                   int intDirector, int intCategoria, String strImagen) {
        String strResultado = "";
        try{            
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL,USER,PASS);
            String strSql;
            strSql = "{CALL modificarPelicula(?, ?, ?, ?, ?, ?, ?)}";
            stmt = conn.prepareCall(strSql);
            stmt.setInt("p_pelicula", intPelicula);
            stmt.setString("p_titulo", strTitulo);
            stmt.setInt("p_anio", intAño);
            stmt.setInt("p_estudio_grabacion", intEstudio_grabacion);
            stmt.setInt("p_director", intDirector);
            stmt.setInt("p_categoria", intCategoria);
            stmt.setString("p_imagen", strImagen);
            int intExito = stmt.executeUpdate();
            if(intExito == 1)
                strResultado="Pelicula guardada correctamente.";
            else
                strResultado="Ocurrió un error al guardar.";

            stmt.close();
            conn.close();            
        }
        catch(Exception ex){
            strResultado = ex.toString();
        }
        return strResultado;
    }

    public String getPelicula() {
        int contador = 0;
        String strResultado = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            String strSql = "{CALL getPeliculas(NULL, NULL)}";
            stmt = conn.prepareCall(strSql);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                contador++;

                strResultado += "<div class=\"movie\">"
                        + "   <div class=\"movie-image\">"
                        + "       <a href=\"rating.jsp?pelicula=" + rs.getString("pelicula") + "\"><span class=\"play\"><span class=\"name\">" + rs.getString("titulo") + "</span></span><img src=\"css/images/" + rs.getString("imagen") + "\" alt=\"movie\" /></a>"
                        + "   </div>"
                        + "   <div class=\"rating\">"
                        + "       <p>RATING</p>"
                        + "       <div class=\"rateit\" id=\"rateit" + rs.getString("pelicula") + "\" data-rateit-value=\"" + rs.getString("calificacion") + "\" data-rateit-resetable=\"false\"></div>"
                        + "       <span class=\"comments\">" + rs.getString("cantidad") + "</span>\n"
                        + "   </div>"
                        + "</div>";

                strResultado += "<script type=\"text/javascript\">\n"
                        + "$(\"#rateit" + rs.getString("pelicula") + "\").bind('rated', function (event, value) { "
                        
                        + " $.get('https://api.ipify.org/', function( ip ) { "
                        + "             $.get( \"http://localhost:8080/Movie/resources/greeting/rating/" + rs.getString("pelicula") + "/\" + value + \"/\" + ip + \"/\" + navigator.appName, function( data ) {\n"
                        + "                  alert( data );\n"
                        + "             }); "
                        + "});"
                        + "         });\n"
                        + "</script>";

                if (contador == 6) {
                    contador = 0;
                    strResultado += "<div class=\"cl\">&nbsp;</div><br>";
                }

            }
            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception ex) {
            strResultado = ex.toString();
        }

        return strResultado;
    }

    public String getPeliculaPorNombre(String strTitulo) {
        int contador = 0;
        String strResultado = "";

        if (strTitulo == null || "null".equals(strTitulo) || strTitulo.isEmpty()) {
            strTitulo = "";
        }

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            String strSql = "{CALL getPeliculas_Nombre(NULL, ?)}";
            stmt = conn.prepareCall(strSql);
            stmt.setString("p_titulo", strTitulo);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                contador++;

                strResultado += "<div class=\"movie\">"
                        + "   <div class=\"movie-image\">"
                        + "       <a href=\"rating.jsp?pelicula=" + rs.getString("pelicula") + "\"><span class=\"play\"><span class=\"name\">" + rs.getString("titulo") + "</span></span><img src=\"css/images/" + rs.getString("imagen") + "\" alt=\"movie\" /></a>"
                        + "   </div>"
                        + "   <div class=\"rating\">"
                        + "       <p>RATING</p>"
                        + "       <div class=\"rateit\" id=\"rateit" + rs.getString("pelicula") + "\" data-rateit-value=\"" + rs.getString("calificacion") + "\" data-rateit-resetable=\"false\"></div>"
                        + "       <span class=\"comments\">" + rs.getString("cantidad") + "</span>\n"
                        + "   </div>"
                        + "</div>";

                strResultado += "<script type=\"text/javascript\">\n"
                        + "$(\"#rateit" + rs.getString("pelicula") + "\").bind('rated', function (event, value) { "
                        
                        + " $.get('https://api.ipify.org/', function( ip ) { "
                        + "             $.get( \"http://localhost:8080/Movie/resources/greeting/rating/" + rs.getString("pelicula") + "/\" + value + \"/\" + ip + \"/\" + navigator.appName, function( data ) {\n"
                        + "                  alert( data );\n"
                        + "             }); "
                        + "});"
                        + "         });\n"
                        + "</script>";

                if (contador == 6) {
                    contador = 0;
                    strResultado += "<div class=\"cl\">&nbsp;</div><br>";
                }

            }
            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception ex) {
            strResultado = ex.toString();
        }

        return strResultado;
    }
    
    public String getCategoria(String strSeleccionada) {
        
        String strResultado = "";

        if (strSeleccionada == null || "null".equals(strSeleccionada) || strSeleccionada.isEmpty()) {
            strSeleccionada = "";
        }

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            String strSql = "{CALL categorias()}";
            stmt = conn.prepareCall(strSql);

            ResultSet rs = stmt.executeQuery();
            
            strResultado="Categoría: <select name=\"categoria\">\n";

            while (rs.next()) {
                
                String categoria =rs.getString("categoria").trim();
                
                if(categoria.equals(strSeleccionada))
                {
                    strResultado+="<option value=\"" + rs.getString("categoria") + "\" selected>" + rs.getString("descripcion") + "</option>\n";
                }
                else
                {
                    strResultado+="<option value=\"" + rs.getString("categoria") + "\">" + rs.getString("descripcion") + "</option>\n";
                }
                

            }
            
            strResultado+="</select><br>";
            
            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception ex) {
            strResultado = ex.toString();
        }

        return strResultado;
    }
    
    public String getComboBox(String strSeleccionada, String strProcedimiento, String strIdCombo, String strLabel) {
        
        String strResultado = "";

        if (strSeleccionada == null || "null".equals(strSeleccionada) || strSeleccionada.isEmpty()) {
            strSeleccionada = "";
        }

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            String strSql = "{CALL "+strProcedimiento+"()}";
            stmt = conn.prepareCall(strSql);

            ResultSet rs = stmt.executeQuery();
            
            strResultado="<tr><td>"+strLabel+":</td><td><select name=\""+strIdCombo+"\">\n";

            while (rs.next()) {
                
                String categoria =rs.getString(1).trim();
                
                if(categoria.equals(strSeleccionada))
                {
                    strResultado+="<option value=\"" + rs.getString(1) + "\" selected>" + rs.getString(2) + "</option>\n";
                }
                else
                {
                    strResultado+="<option value=\"" + rs.getString(1) + "\">" + rs.getString(2) + "</option>\n";
                }
                

            }
            
            strResultado+="</select></td></tr>";
            
            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception ex) {
            strResultado = ex.toString();
        }

        return strResultado;
    }

    public String getPeliculaGrid() {
        String strJson = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            String strSql = "{CALL getPeliculasGrid()}";
            stmt = conn.prepareCall(strSql);

            ResultSet rs = stmt.executeQuery();
            
            int size =0;  
            if (rs != null)   
            {  
                rs.beforeFirst();  
                rs.last();  
                size = rs.getRow();
            }
            rs.beforeFirst();
            
            strJson = "{\n"
                    + "  \"draw\": 1,\n"
                    + "  \"recordsTotal\": "+Integer.toString(size)+",\n"
                    + "  \"recordsFiltered\": "+Integer.toString(size)+",\n"
                    + "  \"data\": " + Json(rs) + "]\n"
                    + "}";
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception ex) {
            strJson = ex.toString();
        }

        return strJson;
    }
    
    public String getPeliculaModificar(int intPelicula) {
        String strResultado = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            String strSql = "{CALL getPeliculasModificar(?)}";
            stmt = conn.prepareCall(strSql);
            stmt.setInt("p_pelicula", intPelicula);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                //rs.getString("titulo")
                strResultado += "pelicula=" + rs.getString("pelicula");
                strResultado += "&titulo=" + rs.getString("titulo");
                strResultado += "&anio=" + rs.getString("año");
                strResultado += "&estudio_grabacion=" + rs.getString("estudio_grabacion");
                strResultado += "&director=" + rs.getString("director");
                strResultado += "&categoria=" + rs.getString("categoria");
                strResultado += "&imagen=" + rs.getString("imagen");

            }
            rs.close();
            stmt.close();
            conn.close();
            
        } catch (Exception ex) {
            strResultado = ex.toString();
        }

        return strResultado;
    }
    
    public String getPeliculaDetalle(int intPelicula) {
        String strResultado = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            String strSql = "{CALL getPeliculaDetalle(?)}";
            stmt = conn.prepareCall(strSql);
            stmt.setInt("p_pelicula", intPelicula);

            ResultSet rs = stmt.executeQuery();
            
            strResultado += "<table style=\"width: 100%;border-collapse: collapse;\">";
            strResultado += "<tr style=\"background-color: #424242;color: white;text-align: left;padding: 8px;\">\n" +
                        "    <td>Pelicula</td>\n" +
                        "    <td>Titulo</td> \n" +
                        "    <td>A&#241;o</td>\n" +
                        "    <td>Estudio</td>\n" +
                        "    <td>Director</td>\n" +
                        "    <td>Categoria</td>\n" +
                        "  </tr>";

            while (rs.next()) {

                //rs.getString("titulo")
                strResultado += "<tr>\n" +
                        "    <td>"+rs.getString("pelicula")+"</td>\n" +
                        "    <td>"+rs.getString("titulo")+"</td> \n" +
                        "    <td>"+rs.getString("año")+"</td>\n" +
                        "    <td>"+rs.getString("Estudio")+"</td>\n" +
                        "    <td>"+rs.getString("Director")+"</td>\n" +
                        "    <td>"+rs.getString("Categoria")+"</td>\n" +
                        "  </tr>";
                

            }
            
            strResultado += "</table>";
            
            rs.close();
            stmt.close();
            conn.close();
            
        } catch (Exception ex) {
            strResultado = ex.toString();
        }

        return strResultado;
    }

    public String Json(ResultSet rs) throws SQLException {
        if (rs.first() == false) {
            return "[]";
        } else {
            rs.beforeFirst();
        }
        StringBuilder sb = new StringBuilder();
        Object item;
        String strValor;
        java.sql.ResultSetMetaData rsmd = rs.getMetaData();
        int numColumns = rsmd.getColumnCount();

        sb.append("[[");
        while (rs.next()) {

            for (int i = 1; i < numColumns + 1; i++) {
                String strColumnaId = rsmd.getColumnName(i);
                item = rs.getObject(i);
                if (item != null) {
                    strValor = item.toString();
                    strValor = strValor.replace('"', '\'');
                } else {
                    strValor = "null";
                }
                sb.append("\"" + strValor + "\",");
            }
            sb.setCharAt(sb.length() - 1, ']');
            sb.append(",[");
        }

        sb.delete(sb.length() - 3, sb.length());
        sb.append("]");

        return sb.toString();
    }
    
    public String getRatingGrid(int intPelicula) {
        String strJson = "";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);

            String strSql = "{CALL getRatingGrid(?)}";
            stmt = conn.prepareCall(strSql);
            stmt.setInt("p_pelicula", intPelicula);

            ResultSet rs = stmt.executeQuery();
            
            int size =0;  
            if (rs != null)   
            {  
                rs.beforeFirst();  
                rs.last();  
                size = rs.getRow();
            }
            rs.beforeFirst();
            
            strJson = "{\n"
                    + "  \"draw\": 1,\n"
                    + "  \"recordsTotal\": "+Integer.toString(size)+",\n"
                    + "  \"recordsFiltered\": "+Integer.toString(size)+",\n"
                    + "  \"data\": " + Json(rs) + "]\n"
                    + "}";
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception ex) {
            strJson = ex.toString();
        }

        return strJson;
    }

}
