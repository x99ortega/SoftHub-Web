package Modelo;

import java.io.*;
import java.util.LinkedList;

public class GestionarUsuarios {

    private LinkedList<Usuario> listaUsuarios;
    private static final String ARCHIVO = "usuarios.txt";

    public GestionarUsuarios() {
        this.listaUsuarios = new LinkedList<>();
        cargarDesdeArchivo();
    }

    public void agregar(Usuario usuario) throws Exception {
        for (Usuario u : listaUsuarios) {
            if (u.getIdEmpresa().equals(usuario.getIdEmpresa())) {
                throw new Exception("Ya existe una empresa con el ID: " + usuario.getIdEmpresa());
            }
        }
        listaUsuarios.add(usuario);
        guardarEnArchivo();
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
                       String sector, String tipoEmpresa) throws Exception {
        Usuario encontrado = buscar(idEmpresa);
        if (encontrado == null) {
            throw new Exception("No se encontro la empresa con ID: " + idEmpresa);
        }
        encontrado.setRazonSocial(razonSocial);
        encontrado.setNit(nit);
        encontrado.setEmail(email);
        encontrado.setCiudad(ciudad);
        encontrado.setTelefono(telefono);
        encontrado.setSector(sector);
        encontrado.setTipoEmpresa(tipoEmpresa);
        guardarEnArchivo();
    }

    public void eliminar(String idEmpresa) throws Exception {
        Usuario encontrado = buscar(idEmpresa);
        if (encontrado == null) {
            throw new Exception("No se encontro la empresa con ID: " + idEmpresa);
        }
        listaUsuarios.remove(encontrado);
        guardarEnArchivo();
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

    private void guardarEnArchivo() throws Exception {
        File archivo = null;
        FileWriter writer = null;
        PrintWriter pw = null;
        try {
            archivo = new File(ARCHIVO);
            writer = new FileWriter(archivo, false);
            pw = new PrintWriter(writer);
            for (Usuario u : listaUsuarios) {
                pw.println(u.getIdEmpresa() + "|" + u.getRazonSocial() + "|" +
                           u.getNit() + "|" + u.getEmail() + "|" +
                           u.getCiudad() + "|" + u.getTelefono() + "|" +
                           u.getSector() + "|" + u.getTipoEmpresa());
            }
        } catch (IOException e) {
            throw new Exception("Error al guardar usuarios: " + e.getMessage());
        } finally {
            if (pw != null) pw.close();
            if (writer != null) {
                try { writer.close(); } catch (IOException e2) { e2.printStackTrace(); }
            }
        }
    }

    private void cargarDesdeArchivo() {
        File archivo = null;
        FileReader reader = null;
        BufferedReader buffer = null;
        try {
            archivo = new File(ARCHIVO);
            if (!archivo.exists()) return;
            reader = new FileReader(archivo);
            buffer = new BufferedReader(reader);
            String linea;
            while ((linea = buffer.readLine()) != null) {
                String[] datos = linea.split("\\|");
                if (datos.length == 8) {
                    Usuario u = new Usuario(
                        datos[0], datos[1], datos[2], datos[3],
                        datos[4], datos[5], datos[6], datos[7]
                    );
                    listaUsuarios.add(u);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (buffer != null) {
                try { buffer.close(); } catch (IOException e2) { e2.printStackTrace(); }
            }
            if (reader != null) {
                try { reader.close(); } catch (IOException e2) { e2.printStackTrace(); }
            }
        }
    }
}
