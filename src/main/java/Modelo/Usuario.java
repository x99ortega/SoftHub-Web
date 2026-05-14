package Modelo;

/**

 * @author fredy
 */
public class Usuario extends Persona {

    private String sector;
    private String tipoEmpresa;

   
    public Usuario(String idEmpresa, String razonSocial, String nit,
                   String email, String ciudad, String telefono,
                   String sector, String tipoEmpresa) {
        super(idEmpresa, razonSocial, nit, email, ciudad, telefono);
        this.sector      = sector;
        this.tipoEmpresa = tipoEmpresa;
    }

  
    public String getSector() { return sector; }
    public void setSector(String sector) { this.sector = sector; }

    public String getTipoEmpresa() { return tipoEmpresa; }
    public void setTipoEmpresa(String tipoEmpresa) { this.tipoEmpresa = tipoEmpresa; }
}
