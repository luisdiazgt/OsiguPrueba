package ws;

import javax.ejb.EJB;
import javax.ejb.Stateless;

import javax.ws.rs.Path;
import javax.ws.rs.GET;
import javax.ws.rs.PUT;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.PathParam;

@Stateless
@Path("/greeting")
public class WsPeliculas {

    @EJB
    private Conexion DB;
      
    @GET
    @Path("/pelicula")
    @Produces("text/html")
    public String getPelicula() {        
        return DB.getPelicula();        
    }
    
    @GET
    @Path("/categoria/{categoria}")
    @Produces("text/html")
    public String getCategoria(@PathParam("categoria") String strCategoria) {        
        return DB.getCategoria(strCategoria);        
    }
    
    @GET
    @Path("/peliculaModificar/{intPelicula}")
    @Produces("text/html")
    public String getPeliculaModificar(@PathParam("intPelicula") int intPelicula) {        
        return DB.getPeliculaModificar(intPelicula);        
    }
    
    @GET
    @Path("/comboBox/{seleccionado}/{procedimiento}/{idCombo}/{textoLabel}")
    @Produces("text/html")
    public String getComboBox(@PathParam("seleccionado") String strSeleccionada,@PathParam("procedimiento") String strProcedimiento,@PathParam("idCombo") String strIdCombo,@PathParam("textoLabel") String strLabel) {        
        return DB.getComboBox(strSeleccionada,strProcedimiento,strIdCombo,strLabel);        
    }
    
    @GET
    @Path("/peliculaGrid")
    @Produces("text/html")
    public String getJson() {
       return DB.getPeliculaGrid();
    }
    
    @GET
    @Path("/peliculapornombre/{pelicula}")
    @Produces("text/html")
    public String getPeliculaPorNombre(@PathParam("pelicula") String strPelicula) {        
        return DB.getPeliculaPorNombre(strPelicula);        
    }
    
    @GET
    @Path("/rating/{pelicula}/{calificacion}/{ip}/{navegador}")
    @Produces("text/html")
    public String setRating(@PathParam("pelicula") int intPelicula, @PathParam("calificacion") int intCalificacion,
                            @PathParam("ip") String strIp, @PathParam("navegador") String strNavegador) {
        
        return DB.insertarRating(intPelicula, intCalificacion, strIp, strNavegador);
        
    }
    
    @GET
    @Path("/insertarPelicula/{p_titulo}/{p_año}/{p_estudio_grabacion}/{p_director}/{p_categoria}/{p_imagen}")
    @Produces("text/html")
    public String insertarPelicula(@PathParam("p_titulo") String strTitulo, 
                                    @PathParam("p_año") int intAño, 
                                    @PathParam("p_estudio_grabacion") int intEstudioGrabacion, 
                                    @PathParam("p_director") int intDirector, 
                                    @PathParam("p_categoria") int intCategoria, 
                                    @PathParam("p_imagen") String strImagen) {
        
        return DB.insertarPelicula(strTitulo,intAño,intEstudioGrabacion,intDirector,intCategoria,strImagen);
        
    }
    
    @GET
    @Path("/modificarPelicula/{pelicula}/{titulo}/{anio}/{estudio_grabacion}/{director}/{categoria}/{imagen}")
    @Produces("text/html")
    public String modificarPelicula(@PathParam("pelicula") int intPelicula,
                                   @PathParam("titulo") String strTitulo, @PathParam("anio") int intAnio,
                                   @PathParam("estudio_grabacion")  int intEstudio_grabacion, 
                                   @PathParam("director") int intDirector, @PathParam("categoria") int intCategoria, 
                                   @PathParam("imagen") String strImagen) {
        return DB.modificarPelicula(intPelicula, strTitulo, intAnio, intEstudio_grabacion, intDirector, intCategoria, strImagen);
    }
    
    @GET
    @Path("/eliminarPelicula/{pelicula}")
    @Produces("text/html")
    public String eliminarPelicula(@PathParam("pelicula") int intPelicula) {
        return DB.eliminarPelicula(intPelicula);
    }
    
    @PUT
    @Consumes("text/plain")
    public void setName(String content) {
        //DB.setName(content);
    }
    
    @GET
    @Path("/RatingGrid/{pelicula}")
    @Produces("text/html")
    public String getRatingGrid(@PathParam("pelicula") int intPelicula) {
       return DB.getRatingGrid(intPelicula);
    }
    
    @GET
    @Path("/getPeliculaDetalle/{pelicula}")
    @Produces("text/html")
    public String getPeliculaDetalle(@PathParam("pelicula") int intPelicula) {
       return DB.getPeliculaDetalle(intPelicula);
    }
    
}
