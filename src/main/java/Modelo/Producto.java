package Modelo;

/**
 * Clase Producto (Clase Base para Software)
 * Proyecto: SoftHub Solutions
 * @author Victor Raphael Cuaran Jossa - Freddy Andres Burbano
 */
public class Producto {

    private String idProducto;
    private String nombre;
    private String version;
    private String tipoLicencia;
    private int    cantidadDisponible;
    private String proveedor;

    // Constructor
    public Producto(String idProducto, String nombre, String version,
                    String tipoLicencia, int cantidadDisponible, String proveedor) {
        this.idProducto         = idProducto;
        this.nombre             = nombre;
        this.version            = version;
        this.tipoLicencia       = tipoLicencia;
        this.cantidadDisponible = cantidadDisponible;
        this.proveedor          = proveedor;
    }

    // Getters y Setters
    public String getIdProducto() { return idProducto; }
    public void setIdProducto(String idProducto) { this.idProducto = idProducto; }

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
