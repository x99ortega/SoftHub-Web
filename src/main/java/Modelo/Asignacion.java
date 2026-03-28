package Modelo;

/**
 
 * @author fredy
 */
public class Asignacion {

    private String idAsignacion;
    private String idEmpresa;
    private String idSoftware;
    private String fechaAsignacion;
    private int    cantidadAsignada;
    private String estado;

 
    public Asignacion(String idAsignacion, String idEmpresa, String idSoftware,
                      String fechaAsignacion, int cantidadAsignada, String estado) {
        this.idAsignacion    = idAsignacion;
        this.idEmpresa       = idEmpresa;
        this.idSoftware      = idSoftware;
        this.fechaAsignacion = fechaAsignacion;
        this.cantidadAsignada = cantidadAsignada;
        this.estado          = estado;
    }

    
    public String getIdAsignacion() { return idAsignacion; }
    public void setIdAsignacion(String idAsignacion) { this.idAsignacion = idAsignacion; }

    public String getIdEmpresa() { return idEmpresa; }
    public void setIdEmpresa(String idEmpresa) { this.idEmpresa = idEmpresa; }

    public String getIdSoftware() { return idSoftware; }
    public void setIdSoftware(String idSoftware) { this.idSoftware = idSoftware; }

    public String getFechaAsignacion() { return fechaAsignacion; }
    public void setFechaAsignacion(String fechaAsignacion) { this.fechaAsignacion = fechaAsignacion; }

    public int getCantidadAsignada() { return cantidadAsignada; }
    public void setCantidadAsignada(int cantidadAsignada) { this.cantidadAsignada = cantidadAsignada; }

    public String getEstado() { return estado; }
    public void setEstado(String estado) { this.estado = estado; }
}
