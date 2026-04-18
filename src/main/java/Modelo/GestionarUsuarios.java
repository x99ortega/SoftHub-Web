package Modelo;

import java.util.LinkedList;

/**
 * @author fredy
 */
public class GestionarUsuarios {

    private LinkedList<Usuario> listaUsuarios;

 
    public GestionarUsuarios() {
        this.listaUsuarios = new LinkedList<>();
    }

 
    public void agregar(Usuario usuario) {
        listaUsuarios.add(usuario);
    }


    public LinkedList<Usuario> listarTodos() {
        return listaUsuarios;
    }


    public Usuario buscar(String idEmpresa) {
        for (Usuario u : listaUsuarios) {
            if (u.getIdEmpresa().equals(idEmpresa)) return u;
        }
        return null;
    }

    
    public void editar(String idEmpresa, String razonSocial, String nit,
                       String email, String ciudad, String telefono,
                       String sector, String tipoEmpresa) {
        for (Usuario u : listaUsuarios) {
            if (u.getIdEmpresa().equals(idEmpresa)) {
                u.setRazonSocial(razonSocial);
                u.setNit(nit);
                u.setEmail(email);
                u.setCiudad(ciudad);
                u.setTelefono(telefono);
                u.setSector(sector);
                u.setTipoEmpresa(tipoEmpresa);
                break;
            }
        }
    }


    public void eliminar(String idEmpresa) {
        listaUsuarios.removeIf(u -> u.getIdEmpresa().equals(idEmpresa));
    }


    public LinkedList<Usuario> buscarPorNombre(String nombre) {
        LinkedList<Usuario> resultado = new LinkedList<>();
        for (Usuario u : listaUsuarios) {
            if (u.getRazonSocial().toLowerCase().contains(nombre.toLowerCase())) {
                resultado.add(u);
            }
        }
        return resultado;
    }
}
