<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>

<% 
    
    //Empieza rutina de subir archivo
   File file ;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   String filePath = "c:/prueba/";

   String contentType = request.getContentType();
   if ((contentType.indexOf("multipart/form-data") >= 0)) {

      DiskFileItemFactory factory = new DiskFileItemFactory();
      factory.setSizeThreshold(maxMemSize);
      String ruta = request.getRealPath("/css/images")+"\\";
      filePath=ruta;
      factory.setRepository(new File("c:\\temp"));
      //factory.setRepository(new File(ruta));
      ServletFileUpload upload = new ServletFileUpload(factory);
      upload.setSizeMax( maxFileSize );
      try{ 
          
         List fileItems = upload.parseRequest(request);
         Iterator i = fileItems.iterator();
         out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"   \"http://www.w3.org/TR/html4/loose.dtd\"><html>    <head>        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">        <title>JSP Page</title>        <link rel=\"stylesheet\" href=\"css/style.css\" type=\"text/css\" media=\"all\" />	<!--[if IE 6]>		<link rel=\"stylesheet\" href=\"css/ie6.css\" type=\"text/css\" media=\"all\" />	<![endif]-->	<script type=\"text/javascript\" src=\"js/jquery-3.0.0.min.js\"></script>	<script type=\"text/javascript\" src=\"js/jquery-func.js\"></script>                <script type=\"text/javascript\" src=\"js/jquery.rateit.min.js\"></script>        <link rel=\"stylesheet\" href=\"js/rateit.css\" type=\"text/css\" media=\"all\" />                    </head>    <body>                <!-- Shell -->        <div id=\"shell\">                <!-- Header -->                <div id=\"header\">                        <h1 id=\"logo\">Osigu Movie<a href=\"#\">Osigu Movie</a></h1>                        <div class=\"social\">                                <span>FOLLOW US ON:</span>                                <ul>                                    <li><a class=\"twitter\" href=\"#\">twitter</a></li>                                    <li><a class=\"facebook\" href=\"#\">facebook</a></li>                                    <li><a class=\"vimeo\" href=\"#\">vimeo</a></li>                                    <li><a class=\"rss\" href=\"#\">rss</a></li>                                </ul>                        </div>                        <!-- Navigation -->                        <div id=\"navigation\">                                <ul>                                    <li><a class=\"active\" href=\"#\">HOME</a></li>                                    <li><a href=\"#\">NEWS</a></li>                                    <li><a href=\"#\">IN THEATERS</a></li>                                    <li><a href=\"#\">COMING SOON</a></li>                                    <li><a href=\"#\">CONTACT</a></li>                                    <li><a href=\"#\">ADVERTISE</a></li>                                </ul>                        </div>                        <!-- end Navigation -->                        <!-- Sub-menu -->                        <div id=\"sub-navigation\">                                <ul>                                    <li><a href=\"index.jsp\">Por Rating</a></li>                                    <li><a href=\"nombres.jsp?nombre=\">Por Titulos</a></li>                                    <li><a href=\"pelicula.jsp\">Mantenimiento Peliculas</a></li>                                </ul>                                <div style=\"padding-top: 20px;\"></div>                        </div>                        <!-- end Sub-Menu -->                </div>                <!-- end Header -->                <!-- Main -->                <div id=\"main\">                        <!-- Content -->                        <div id=\"content\">                                <!-- Box -->                                <div class=\"box\">");
         
        String pelicula="";
        String titulo="";
        String año="";
        String estudio_grabacion="";
        String director="";
        String categoria="";
        String imagen="";
        String imagenHidden="";
         
         while ( i.hasNext () ) 
         {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () )  {
                String fieldName = fi.getFieldName();
                String fileName = fi.getName();
                
                if (fileName == null || "null".equals(fileName) || fileName.isEmpty()) {
                    
                }
                else
                {
                    boolean isInMemory = fi.isInMemory();
                    long sizeInBytes = fi.getSize();
                    file = new File( filePath + fileName) ;
                    fi.write( file ) ;
                    imagen=fileName;
                    out.println("Imagen subida al directorio: " + filePath + fileName + "<br>");
                }                
                
            }
            else
            {
                String name = fi.getFieldName();
                String value = fi.getString();
                 
                if(name.equals("idPelicula")){
                    pelicula=value;
                }
                if(name.equals("titulo")){
                    titulo=value;
                }
                if(name.equals("anio")){
                    año=value;
                }
                if(name.equals("idEstudio")){
                    estudio_grabacion=value;
                }
                if(name.equals("idDirector")){
                    director=value;
                }
                if(name.equals("idCategoria")){
                    categoria=value;
                }
                if(name.equals("imagenHidden")){
                    imagenHidden=value;
                }
                
            }
         }
         
         //Guardar la pelicula en la base de datos
         //http://localhost:8080/Movie/resources/greeting/insertarPelicula/{p_titulo}/{p_año}/{p_estudio_grabacion}/{p_director}/{p_categoria}/{p_imagen}
         
         titulo=URLEncoder.encode(titulo, "UTF-8");
         
         if (imagen == null || "null".equals(imagen) || imagen.isEmpty()) {
             imagen=imagenHidden;
        }
         
        String urlLinea="";
        if (pelicula == null || "null".equals(pelicula) || pelicula.isEmpty()) {
            urlLinea = "http://localhost:8080/Movie/resources/greeting/insertarPelicula/"+titulo+"/"+año+"/"+estudio_grabacion+"/"+director+"/"+categoria+"/" + URLEncoder.encode(imagen, "UTF-8");
        }
        else
        {
            urlLinea = "http://localhost:8080/Movie/resources/greeting/modificarPelicula/"+pelicula+"/"+titulo+"/"+año+"/"+estudio_grabacion+"/"+director+"/"+categoria+"/" + URLEncoder.encode(imagen, "UTF-8");
        }
         
        URL url = new URL(urlLinea);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

            String output;
            String todo = "";
            while ((output = br.readLine()) != null) {
                    todo += output;
            }
        conn.disconnect();
         
        out.println(todo);
        
         out.println("<div class=\"cl\">&nbsp;</div></div></div></div><div id=\"footer\"><p><a href=\"#\">HOME</a> <span>|</span><a href=\"#\">NEWS</a> <span>|</span><a href=\"#\">IN THEATERS</a> <span>|</span><a href=\"#\">COMING SOON </a> <span>|</span><a href=\"#\">LATERS TRAILERS</a> <span>|</span><a href=\"#\">TOP RATED TRAILERS</a> <span>|</span><a href=\"#\">MOST COMMENTED TRAILERS</a> <span>|</span><a href=\"#\">ADVERTISE</a> <span>|</span><a href=\"#\">CONTACT </a></p><p> &copy; 2016 Luis Diaz. All Rights Reserved. Osigu Prueba.</p></div></div></body></html>");
      }catch(Exception ex) {
         System.out.println(ex);
      }
   }else{
      out.println("<html>");
      out.println("<body>");
      out.println("<p>No se pudo subir la imagen.</p>"); 
      out.println("</body>");
      out.println("</html>");
   }
%>
