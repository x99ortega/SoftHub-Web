package Modelo;

/**
 * Clase Usuario (extends Persona)
 * Representa una Empresa en SoftHub Solutions
 * @author Victor Raphael Cuaran Jossa - Freddy Andres Burbano
 */
public class Usuario extends Persona {

    private String sector;
    private String tipoEmpresa;

    // Constructor
    public Usuario(String idEmpresa, String razonSocial, String nit,
                   String email, String ciudad, String telefono,
                   String sector, String tipoEmpresa) {
        super(idEmpresa, razonSocial, nit, email, ciudad, telefono);
        this.sector      = sector;
        this.tipoEmpresa = tipoEmpresa;
    }

    // Getters y Setters
    public String getSector() { return sector; }
    public void setSector(String sector) { this.sector = sector; }

    public String getTipoEmpresa() { return tipoEmpresa; }
    public void setTipoEmpresa(String tipoEmpresa) { this.tipoEmpresa = tipoEmpresa; }
}
