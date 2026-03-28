package Modelo;

/**
 
 * @author fredy
 */
public class Reporte {

    private String idReporte;
    private String tipo;
    private String fecha;

    // Constructor
    public Reporte(String idReporte, String tipo, String fecha) {
        this.idReporte = idReporte;
        this.tipo      = tipo;
        this.fecha     = fecha;
    }

    // Métodos
    public void generarReporteStock() {
        // Lógica para generar reporte de stock bajo (a implementar)
    }

    public void exportarDatos() {
        // Lógica para exportar datos del inventario (a implementar)
    }

    // Getters y Setters
    public String getIdReporte() { return idReporte; }
    public void setIdReporte(String idReporte) { this.idReporte = idReporte; }

    public String getTipo() { return tipo; }
    public void setTipo(String tipo) { this.tipo = tipo; }

    public String getFecha() { return fecha; }
    public void setFecha(String fecha) { this.fecha = fecha; }
}
