package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.net.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("    <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n");
      out.write("       \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("\n");
      out.write("    <html>\n");
      out.write("        <head>\n");
      out.write("            <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("            <title>Osigu Movie</title>\n");
      out.write("            <link rel=\"stylesheet\" href=\"css/style.css\" type=\"text/css\" media=\"all\" />\n");
      out.write("            <!--[if IE 6]>\n");
      out.write("                    <link rel=\"stylesheet\" href=\"css/ie6.css\" type=\"text/css\" media=\"all\" />\n");
      out.write("            <![endif]-->\n");
      out.write("            <script type=\"text/javascript\" src=\"js/jquery-3.0.0.min.js\"></script>\n");
      out.write("            <script type=\"text/javascript\" src=\"js/jquery-func.js\"></script>\n");
      out.write("\n");
      out.write("            <script type=\"text/javascript\" src=\"js/jquery.rateit.min.js\"></script>\n");
      out.write("            <link rel=\"stylesheet\" href=\"js/rateit.css\" type=\"text/css\" media=\"all\" />\n");
      out.write("\n");
      out.write("            <script type=\"text/javascript\">\n");
      out.write("                $(document).ready(function () {\n");
      out.write("\n");
      out.write("\n");
      out.write("                    //$.get( \"http://localhost:8080/Movie/resources/greeting/get/Movie/Luis\", function( data ) {\n");
      out.write("                    //  alert( \"Data Loaded: \" + data );\n");
      out.write("                    //});\n");
      out.write("\n");
      out.write("\n");
      out.write("                });\n");
      out.write("            </script>\n");
      out.write("\n");
      out.write("        </head>\n");
      out.write("        <body>\n");
      out.write("\n");
      out.write("            <!-- Shell -->\n");
      out.write("            <div id=\"shell\">\n");
      out.write("                    <!-- Header -->\n");
      out.write("                    <div id=\"header\">\n");
      out.write("                            <h1 id=\"logo\">Osigu Movie<a href=\"#\">Osigu Movie</a></h1>\n");
      out.write("                            <div class=\"social\">\n");
      out.write("                                    <span>FOLLOW US ON:</span>\n");
      out.write("                                    <ul>\n");
      out.write("                                        <li><a class=\"twitter\" href=\"#\">twitter</a></li>\n");
      out.write("                                        <li><a class=\"facebook\" href=\"#\">facebook</a></li>\n");
      out.write("                                        <li><a class=\"vimeo\" href=\"#\">vimeo</a></li>\n");
      out.write("                                        <li><a class=\"rss\" href=\"#\">rss</a></li>\n");
      out.write("                                    </ul>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <!-- Navigation -->\n");
      out.write("                            <div id=\"navigation\">\n");
      out.write("                                    <ul>\n");
      out.write("                                        <li><a class=\"active\" href=\"#\">HOME</a></li>\n");
      out.write("                                        <li><a href=\"#\">NEWS</a></li>\n");
      out.write("                                        <li><a href=\"#\">IN THEATERS</a></li>\n");
      out.write("                                        <li><a href=\"#\">COMING SOON</a></li>\n");
      out.write("                                        <li><a href=\"#\">CONTACT</a></li>\n");
      out.write("                                        <li><a href=\"#\">ADVERTISE</a></li>\n");
      out.write("                                    </ul>\n");
      out.write("                            </div>\n");
      out.write("                            <!-- end Navigation -->\n");
      out.write("\n");
      out.write("                            <!-- Sub-menu -->\n");
      out.write("                            <div id=\"sub-navigation\">\n");
      out.write("                                    <ul>\n");
      out.write("                                        <li><a href=\"index.jsp\">Por Rating</a></li>\n");
      out.write("                                        <li><a href=\"nombres.jsp?nombre=\">Por Titulos</a></li>\n");
      out.write("                                        <li><a href=\"pelicula.jsp\">Mantenimiento Peliculas</a></li>\n");
      out.write("                                    </ul>\n");
      out.write("                                    <div id=\"search\">\n");
      out.write("                                        <form action=\"nombres.jsp\" method=\"get\" accept-charset=\"utf-8\">\n");
      out.write("                                                <label for=\"search-field\">SEARCH</label>\t\t\t\t\t\n");
      out.write("                                                <input type=\"text\" name=\"nombre\" value=\"\" id=\"search-field\" title=\"\" class=\"blink search-field\"  />\n");
      out.write("                                                <input type=\"submit\" value=\"GO!\" class=\"search-button\" />\n");
      out.write("                                        </form>\n");
      out.write("                                    </div>\n");
      out.write("                            </div>\n");
      out.write("                            <!-- end Sub-Menu -->\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                    <!-- end Header -->\n");
      out.write("\n");
      out.write("                    <!-- Main -->\n");
      out.write("                    <div id=\"main\">\n");
      out.write("                            <!-- Content -->\n");
      out.write("                            <div id=\"content\">\n");
      out.write("\n");
      out.write("                                    <!-- Box -->\n");
      out.write("                                    <div class=\"box\">\n");
      out.write("                                            <div class=\"head\">\n");
      out.write("                                                    <h2>Por Rating</h2>\n");
      out.write("                                                    <p class=\"text-right\"><a href=\"#\">Ver todas</a></p>\n");
      out.write("                                            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                                            ");
            
                                                        URL url2 = new URL("http://localhost:8080/Movie/resources/greeting/pelicula");
                                                        HttpURLConnection conn2 = (HttpURLConnection) url2.openConnection();
                                                        conn2.setRequestMethod("GET");

                                                        BufferedReader br2 = new BufferedReader(new InputStreamReader((conn2.getInputStream())));

                                                            String output2;
                                                            String todo2 = "";
                                                            while ((output2 = br2.readLine()) != null) {
                                                                    todo2 += output2;
                                                            }
                                                        conn2.disconnect();
                                            
      out.write("\n");
      out.write("                                            ");
      out.print( todo2 );
      out.write(" \n");
      out.write("\n");
      out.write("\n");
      out.write("                                            <div class=\"cl\">&nbsp;</div>\n");
      out.write("                                    </div>\n");
      out.write("                                    <!-- end Box -->\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                            <!-- end Content -->\n");
      out.write("\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                    <!-- end Main -->\n");
      out.write("\n");
      out.write("                    <!-- Footer -->\n");
      out.write("                    <div id=\"footer\">\n");
      out.write("                            <p>\n");
      out.write("                                    <a href=\"#\">HOME</a> <span>|</span>\n");
      out.write("                                    <a href=\"#\">NEWS</a> <span>|</span>\n");
      out.write("                                    <a href=\"#\">IN THEATERS</a> <span>|</span>\n");
      out.write("                                    <a href=\"#\">COMING SOON </a> <span>|</span>\n");
      out.write("                                    <a href=\"#\">LATERS TRAILERS</a> <span>|</span>\n");
      out.write("                                    <a href=\"#\">TOP RATED TRAILERS</a> <span>|</span>\n");
      out.write("                                    <a href=\"#\">MOST COMMENTED TRAILERS</a> <span>|</span>\n");
      out.write("                                    <a href=\"#\">ADVERTISE</a> <span>|</span>\n");
      out.write("                                    <a href=\"#\">CONTACT </a>\n");
      out.write("                            </p>\n");
      out.write("                            <p> Luis Diaz 2016, Osigu Prueba.</p>\n");
      out.write("                    </div>\n");
      out.write("                    <!-- end Footer -->\n");
      out.write("            </div>\n");
      out.write("            <!-- end Shell -->\n");
      out.write("        </body>\n");
      out.write("    </html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
