<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                    //var table = $('#example').DataTable();
                    var table = $('#example').DataTable( {
                        "processing": true,
                        "pagingType": "full_numbers",
                        "ajax": "http://localhost:8080/Movie/resources/greeting/peliculaGrid",
                        "columnDefs": [
                            {
                                "targets": [ 0 ],
                                "visible": false,
                                "searchable": false
                            }
                        ]
                    } );
                    
                    var idPelicula="";
                    
                    $('#example tbody').on( 'click', 'tr', function () {
                        //seleccionar fila
                        if ( $(this).hasClass('selected') ) {
                            $(this).removeClass('selected');
                        }
                        else {
                            table.$('tr.selected').removeClass('selected');
                            $(this).addClass('selected');
                        }
                        
                        var data = table.row( this ).data();
                        idPelicula=data[0];
                        
                    } );
                    
                    //click del boton eliminar
                    $('#buttonEliminar').click( function () {
                        
                        if(idPelicula===""){
                            alert("No ha seleccionado ninguna pelicula.");
                        }
                        else
                        {
                            $.get( "http://localhost:8080/Movie/resources/greeting/eliminarPelicula/" + idPelicula, function( data ) {
                              //alert( "Data Loaded: " + data );
                              alert(data);
                              table.row('.selected').remove().draw( false );
                            });
                            //alert(idPelicula);
                            
                        }
                        
                    } );
                    
                    //click del boton modificar
                    $('#buttonModificar').click( function () {
                        
                        if(idPelicula===""){
                            alert("No ha seleccionado ninguna pelicula.");
                        }
                        else
                        {
                            
                            $.get( "http://localhost:8080/Movie/resources/greeting/peliculaModificar/" + idPelicula, function( data ) {
                              //alert( "Data Loaded: " + data );
                              window.location.href = "peliculaMantenimiento.jsp?" + data;
                            });
                            
                            
                        }
                        
                    } );
                    
                    //click del boton agregar
                    $('#buttonAgregar').click( function () {
                        
                        window.location.href = "peliculaMantenimiento.jsp";
                        
                    } );
                    
                    //$('#example tbody').on('click', 'tr', function () {
                    //    var data = table.row( this ).data();
                    //    alert( 'You clicked on '+data[0]+'\'s row' );
                    //} );

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

                                            <table id="example" class="display" cellspacing="0" width="100%">
                                            <thead>
                                                <tr>
                                                    <th>pelicula</th>
                                                    <th>Titulo</th>
                                                    <th>Año</th>
                                                    <th>Categoria</th>
                                                    <th>Director</th>
                                                    <th>Estudio de Grabacion</th>
                                                    <th>Imagen</th>
                                                </tr>
                                            </thead>
                                            <tfoot>
                                                <tr>
                                                    <th>pelicula</th>
                                                    <th>Titulo</th>
                                                    <th>Año</th>
                                                    <th>Categoria</th>
                                                    <th>Director</th>
                                                    <th>Estudio de Grabacion</th>
                                                    <th>Imagen</th>
                                                </tr>
                                            </tfoot>
                                            <tbody>
                                            </tbody>
                                        </table>
                                        
                                        <div style="float:right">
                                        <br>
                                        <button id="buttonAgregar" type="button">Agregar</button>
                                        <button id="buttonModificar" type="button">Modificar</button>
                                        <button id="buttonEliminar" type="button">Eliminar</button>
                                        <br>
                                        </div>


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
