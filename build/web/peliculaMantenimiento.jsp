<%@page import="java.io.*"%>
<%@page import="java.net.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Osigu Movie</title>
        <link rel="stylesheet" href="css/jquery.dataTables.min.css" type="text/css" media="all" />
        <script type="text/javascript" src="js/jquery-3.0.0.min.js"></script>
        <script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
        
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
        <!--[if IE 6]>
                <link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" />
        <![endif]-->
        <script type="text/javascript" src="js/jquery-func.js"></script>

        <script type="text/javascript" src="js/jquery.rateit.min.js"></script>
        <link rel="stylesheet" href="js/rateit.css" type="text/css" media="all" />
        
        <script type="text/javascript">
                $(document).ready(function () {
                    
                    $( "#aceptar" ).click(function() {
                        alert($("#idEstudio").find('option:selected').val(););
                        return false;
                    });
                    
                    
                    
                });
            </script>
                        
    </head>
    <body >

            <!-- Shell -->
            <div id="shell">
                    <!-- Header -->
                    <div id="header">
                            <h1 id="logo">Osigu Movie<a href="#">Osigu Movie</a></h1>
                            <div class="social">
                                    <span>FOLLOW US ON:</span>
                                    <ul>
                                        <li><a class="twitter" href="#">twitter</a></li>
                                        <li><a class="facebook" href="#">facebook</a></li>
                                        <li><a class="vimeo" href="#">vimeo</a></li>
                                        <li><a class="rss" href="#">rss</a></li>
                                    </ul>
                            </div>

                            <!-- Navigation -->
                            <div id="navigation">
                                    <ul>
                                        <li><a class="active" href="#">HOME</a></li>
                                        <li><a href="#">NEWS</a></li>
                                        <li><a href="#">IN THEATERS</a></li>
                                        <li><a href="#">COMING SOON</a></li>
                                        <li><a href="#">CONTACT</a></li>
                                        <li><a href="#">ADVERTISE</a></li>
                                    </ul>
                            </div>
                            <!-- end Navigation -->

                            <!-- Sub-menu -->
                            <div id="sub-navigation">
                                <ul>
                                    <li><a href="index.jsp">Por Rating</a></li>
                                    <li><a href="nombres.jsp?nombre=">Por Titulos</a></li>
                                    <li><a href="pelicula.jsp">Mantenimiento Peliculas</a></li>
                                </ul>
                                
                                <div style="padding-top: 20px;"></div>
                                
                            </div>
                            <!-- end Sub-Menu -->

                    </div>
                    <!-- end Header -->

                    <!-- Main -->
                    <div id="main">
                            <!-- Content -->
                            <div id="content">

                                    <!-- Box -->
                                    <div class="box">    
                                        
                                        <br>

                                        <form action="fileupload.jsp" method="post" enctype="multipart/form-data">
                                            
                                            <% 
                                                //Leer los parametros
                                                String pelicula=request.getParameter("pelicula");
                                                String titulo=request.getParameter("titulo");
                                                String año=request.getParameter("anio");
                                                String imagen=request.getParameter("imagen");
                                                
                                                if (pelicula == null || "null".equals(pelicula) || pelicula.isEmpty()) {
                                                    pelicula = "";
                                                }
                                                if (titulo == null || "null".equals(titulo) || titulo.isEmpty()) {
                                                    titulo = "";
                                                }
                                                if (año == null || "null".equals(año) || año.isEmpty()) {
                                                    año = "";
                                                }
                                                if (imagen == null || "null".equals(imagen) || imagen.isEmpty()) {
                                                    imagen = "";
                                                }
                                                
                                            %>
                                            
                                            <input type="hidden" name="idPelicula" value="<%= pelicula %>">
                                            <input type="hidden" name="imagenHidden" value="<%= imagen %>">
                                            <table>
                                                <tr><td>Titulo:</td><td><input type="text" name="titulo" value="<%= titulo %>"></td></tr>
                                                <tr><td>Año:</td><td><input type="text" name="anio" value="<%= año %>"></td></tr>
                                            <%          
                                                
                                                String parametroEstudio = request.getParameter("estudio_grabacion");
                                            
                                                if(parametroEstudio==null || "null".equals(parametroEstudio) || parametroEstudio.isEmpty())
                                                {
                                                    parametroEstudio="null";
                                                }
                                                
                                                //URL urlCategoria = new URL("http://localhost:8080/Movie/resources/greeting/categoria/" + parametroCategoria);
                                                URL urlEstudio = new URL("http://localhost:8080/Movie/resources/greeting/comboBox/" + parametroEstudio + "/estudio_grabacion/idEstudio/Estudio");
                                                HttpURLConnection conn = (HttpURLConnection) urlEstudio.openConnection();
                                                conn.setRequestMethod("GET");

                                                BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

                                                    String output;
                                                    String todo = "";
                                                    while ((output = br.readLine()) != null) {
                                                            todo += output;
                                                    }
                                                conn.disconnect();
                                            %>
                                            <%= todo %>
                                            <%          
                                                
                                                String parametroDirector = request.getParameter("director");
                                            
                                                if(parametroDirector==null || "null".equals(parametroDirector) || parametroDirector.isEmpty())
                                                {
                                                    parametroDirector="null";
                                                }
                                                
                                                //URL urlCategoria = new URL("http://localhost:8080/Movie/resources/greeting/categoria/" + parametroCategoria);
                                                URL urlDirector = new URL("http://localhost:8080/Movie/resources/greeting/comboBox/" + parametroDirector + "/director/idDirector/Director");
                                                conn = (HttpURLConnection) urlDirector.openConnection();
                                                conn.setRequestMethod("GET");

                                                br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

                                                    output="";
                                                    todo = "";
                                                    while ((output = br.readLine()) != null) {
                                                            todo += output;
                                                    }
                                                conn.disconnect();
                                            %>
                                            <%= todo %>
                                            <%          
                                                
                                                String parametroCategoria = request.getParameter("categoria");
                                            
                                                if(parametroCategoria==null || "null".equals(parametroCategoria) || parametroCategoria.isEmpty())
                                                {
                                                    parametroCategoria="null";
                                                }
                                                
                                                //URL urlCategoria = new URL("http://localhost:8080/Movie/resources/greeting/categoria/" + parametroCategoria);
                                                URL urlCategoria = new URL("http://localhost:8080/Movie/resources/greeting/comboBox/" + parametroCategoria + "/categorias/idCategoria/Categoria");
                                                conn = (HttpURLConnection) urlCategoria.openConnection();
                                                conn.setRequestMethod("GET");

                                                br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

                                                    output="";
                                                    todo = "";
                                                    while ((output = br.readLine()) != null) {
                                                            todo += output;
                                                    }
                                                conn.disconnect();
                                            %>
                                            <%= todo %> 
                                            
                                            <tr><td>Imagen:</td><td><input type="file" name="imagen" id="imagen" accept="image/*" value="<%= imagen %>"></td></tr>
                                            <tr><td></td><td><input type="image" name="image" src="css/images/<%= imagen %>" width="150"></td></tr>
                                            </table>
                                            <input type="submit" value="Aceptar" id="aceptar">
                                            
                                        </form>


                                            <div class="cl">&nbsp;</div>
                                    </div>
                                    <!-- end Box -->



                            </div>
                            <!-- end Content -->


                    </div>
                    <!-- end Main -->

                    <!-- Footer -->
                    <div id="footer">
                            <p>
                                    <a href="#">HOME</a> <span>|</span>
                                    <a href="#">NEWS</a> <span>|</span>
                                    <a href="#">IN THEATERS</a> <span>|</span>
                                    <a href="#">COMING SOON </a> <span>|</span>
                                    <a href="#">LATERS TRAILERS</a> <span>|</span>
                                    <a href="#">TOP RATED TRAILERS</a> <span>|</span>
                                    <a href="#">MOST COMMENTED TRAILERS</a> <span>|</span>
                                    <a href="#">ADVERTISE</a> <span>|</span>
                                    <a href="#">CONTACT </a>
                            </p>
                            <p> Luis Diaz 2016, Osigu Prueba.</p>
                    </div>
                    <!-- end Footer -->
            </div>
            <!-- end Shell -->
        </body>
    
        
    
</html>
