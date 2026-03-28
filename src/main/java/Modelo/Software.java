package Modelo;

/**
 
 * @author fredy
 */
public class Software extends Empresa {

    private String idSoftware;
    private String nombre;
    private String version;
    private String tipoLicencia;
    private int    cantidadDisponible;
    private String proveedor;


    public Software(String idEmpresa, String razonSocial, String nit,
                    String email, String ciudad, String telefono,
                    String idSoftware, String nombre, String version,
                    String tipoLicencia, int cantidadDisponible, String proveedor) {
        super(idEmpresa, razonSocial, nit, email, ciudad, telefono);
        this.idSoftware         = idSoftware;
        this.nombre             = nombre;
        this.version            = version;
        this.tipoLicencia       = tipoLicencia;
        this.cantidadDisponible = cantidadDisponible;
        this.proveedor          = proveedor;
    }

 
    public String getIdSoftware() { return idSoftware; }
    public void setIdSoftware(String idSoftware) { this.idSoftware = idSoftware; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getVersion() { return version; }
    public void setVersion(String version) { this.version = version; }

    public String getTipoLicencia() { return tipoLicencia; }
    public void setTipoLicencia(String tipoLicencia) { this.tipoLicencia = tipoLicencia; }

    public int getCantidadDisponible() { return cantidadDisponible; }
    public void setCantidadDisponible(int cantidadDisponible) { this.cantidadDisponible = cantidadDisponible; }

    public String getProveedor() { return proveedor; }
    public void setProveedor(String proveedor) { this.proveedor = proveedor; }
}
