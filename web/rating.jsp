<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
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
        
        
        
        <% 
            //Leer los parametros
            String pelicula=request.getParameter("pelicula");

            if (pelicula == null || "null".equals(pelicula) || pelicula.isEmpty()) {
                pelicula = "0";
            }

        %>
        
        <script type="text/javascript">
                $(document).ready(function () {
                    //var table = $('#example').DataTable();
                    var table = $('#example').DataTable( {
                        "processing": true,
                        "pagingType": "full_numbers",
                        "ajax": "http://localhost:8080/Movie/resources/greeting/RatingGrid/<%= pelicula %>",
                        "columnDefs": [
                            {
                                "targets": [ 0 ],
                                "visible": false,
                                "searchable": false
                            }
                        ]
                    } );
                    
                });
            </script>
    </head>
    <body>

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
                                        <h1>Detalle Pelicula</h1>
                                        <br>
                                        
                                        <%            
                                            URL url2 = new URL("http://localhost:8080/Movie/resources/greeting/getPeliculaDetalle/" + pelicula );
                                            HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
                                            conn2.setRequestMethod("GET");

                                            BufferedReader br2 = new BufferedReader(new InputStreamReader((conn2.getInputStream())));

                                                String output2;
                                                String todo2 = "";
                                                while ((output2 = br2.readLine()) != null) {
                                                        todo2 += output2;
                                                }
                                            conn2.disconnect();
                                        %>
                                        <%= todo2 %> 
                                        
                                        <br>
                                        <br>
                                        <h1>Detalle Rating</h1>
                                        <br>

                                            <table id="example" class="display" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>pelicula</th>
                                                    <th>Titulo</th>
                                                    <th>Calificacion</th>
                                                    <th>IP</th>
                                                    <th>Navegador</th>
                                                    <th>Fecha</th>
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                    <th>pelicula</th>
                                                    <th>Titulo</th>
                                                    <th>Calificacion</th>
                                                    <th>IP</th>
                                                    <th>Navegador</th>
                                                    <th>Fecha</th>
                                                </tr>
                                            </tfoot>
                                            <tbody>
                                            </tbody>
                                        </table>
                                        
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
