package Modelo;

/**

 * @author fredy
 */
public class Administrador {

    private String idAdmin;
    private String usuario;
    private String password;

   
    public Administrador(String idAdmin, String usuario, String password) {
        this.idAdmin  = idAdmin;
        this.usuario  = usuario;
        this.password = password;
    }

   
    public boolean login(String usuario, String password) {
        return this.usuario.equals(usuario) && this.password.equals(password);
    }

    public void gestionarInventario() {
        
    }

    public void generarReporte() {
      
    }


    public String getIdAdmin() { return idAdmin; }
    public void setIdAdmin(String idAdmin) { this.idAdmin = idAdmin; }

    public String getUsuario() { return usuario; }
    public void setUsuario(String usuario) { this.usuario = usuario; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
}
