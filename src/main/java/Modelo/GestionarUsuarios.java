package Modelo;

import java.util.LinkedList;

/**
 * Clase GestionarUsuarios - Lógica de negocio para Empresas/Usuarios
 * Proyecto: SoftHub Solutions
 * @author Victor Raphael Cuaran Jossa - Freddy Andres Burbano
 */
public class GestionarUsuarios {

    private LinkedList<Usuario> listaUsuarios;

    // Constructor
    public GestionarUsuarios() {
        this.listaUsuarios = new LinkedList<>();
    }

    // Agregar usuario
    public void agregar(Usuario usuario) {
        listaUsuarios.add(usuario);
    }

    // Listar todos
    public LinkedList<Usuario> listarTodos() {
        return listaUsuarios;
    }

    // Buscar por ID
    public Usuario buscar(String idEmpresa) {
        for (Usuario u : listaUsuarios) {
            if (u.getIdEmpresa().equals(idEmpresa)) return u;
        }
        return null;
    }

    // Editar usuario
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

    // Eliminar usuario
    public void eliminar(String idEmpresa) {
        listaUsuarios.removeIf(u -> u.getIdEmpresa().equals(idEmpresa));
    }

    // Buscar por razón social
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
