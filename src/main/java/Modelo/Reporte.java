package Modelo;

/**
 
 * @author fredy
 */
public class Reporte {

    private String idReporte;
    private String tipo;
    private String fecha;


    public Reporte(String idReporte, String tipo, String fecha) {
        this.idReporte = idReporte;
        this.tipo      = tipo;
        this.fecha     = fecha;
    }


    public void generarReporteStock() {
     
    }

    public void exportarDatos() {
       
    }


    public String getIdReporte() { return idReporte; }
    public void setIdReporte(String idReporte) { this.idReporte = idReporte; }

    public String getTipo() { return tipo; }
    public void setTipo(String tipo) { this.tipo = tipo; }

    public String getFecha() { return fecha; }
    public void setFecha(String fecha) { this.fecha = fecha; }
}
