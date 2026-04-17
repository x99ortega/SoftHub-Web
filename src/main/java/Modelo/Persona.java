package Modelo;

/**
 * Clase Persona (Clase Base)
 * Proyecto: SoftHub Solutions
 * @author Victor Raphael Cuaran Jossa - Freddy Andres Burbano
 */
public class Persona {

    private String idEmpresa;
    private String razonSocial;
    private String nit;
    private String email;
    private String ciudad;
    private String telefono;

    // Constructor
    public Persona(String idEmpresa, String razonSocial, String nit,
                   String email, String ciudad, String telefono) {
        this.idEmpresa   = idEmpresa;
        this.razonSocial = razonSocial;
        this.nit         = nit;
        this.email       = email;
        this.ciudad      = ciudad;
        this.telefono    = telefono;
    }

    // Getters y Setters
    public String getIdEmpresa() { return idEmpresa; }
    public void setIdEmpresa(String idEmpresa) { this.idEmpresa = idEmpresa; }

    public String getRazonSocial() { return razonSocial; }
    public void setRazonSocial(String razonSocial) { this.razonSocial = razonSocial; }

    public String getNit() { return nit; }
    public void setNit(String nit) { this.nit = nit; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getCiudad() { return ciudad; }
    public void setCiudad(String ciudad) { this.ciudad = ciudad; }

    public String getTelefono() { return telefono; }
    public void setTelefono(String telefono) { this.telefono = telefono; }
}
