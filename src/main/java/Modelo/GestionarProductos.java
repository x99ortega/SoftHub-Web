package Modelo;

import java.io.*;
import java.util.LinkedList;

public class GestionarProductos {

    private LinkedList<Producto> listaProductos;
    private static final String ARCHIVO = "productos.txt";

    public GestionarProductos() {
        this.listaProductos = new LinkedList<>();
        cargarDesdeArchivo();
    }

    public void agregar(Producto producto) throws Exception {
        for (Producto p : listaProductos) {
            if (p.getIdProducto().equals(producto.getIdProducto())) {
                throw new Exception("Ya existe un producto con el ID: " + producto.getIdProducto());
            }
        }
        listaProductos.add(producto);
        guardarEnArchivo();
    }

    public LinkedList<Producto> listarTodos() {
        return listaProductos;
    }

    public Producto buscar(String idProducto) {
        for (Producto p : listaProductos) {
            if (p.getIdProducto().equals(idProducto)) return p;
        }
        return null;
    }

    public void editar(String idProducto, String nombre, String version,
                       String tipoLicencia, int cantidadDisponible, String proveedor) throws Exception {
        Producto encontrado = buscar(idProducto);
        if (encontrado == null) {
            throw new Exception("No se encontro el producto con ID: " + idProducto);
        }
        encontrado.setNombre(nombre);
        encontrado.setVersion(version);
        encontrado.setTipoLicencia(tipoLicencia);
        encontrado.setCantidadDisponible(cantidadDisponible);
        encontrado.setProveedor(proveedor);
        guardarEnArchivo();
    }

    public void eliminar(String idProducto) throws Exception {
        Producto encontrado = buscar(idProducto);
        if (encontrado == null) {
            throw new Exception("No se encontro el producto con ID: " + idProducto);
        }
        listaProductos.remove(encontrado);
        guardarEnArchivo();
    }

    public LinkedList<Producto> filtrarNombre(String nombre) {
        LinkedList<Producto> resultado = new LinkedList<>();
        for (Producto p : listaProductos) {
            if (p.getNombre().toLowerCase().contains(nombre.toLowerCase())) {
                resultado.add(p);
            }
        }
        return resultado;
    }

    public LinkedList<Producto> filtrarProveedor(String proveedor) {
        LinkedList<Producto> resultado = new LinkedList<>();
        for (Producto p : listaProductos) {
            if (p.getProveedor().toLowerCase().contains(proveedor.toLowerCase())) {
                resultado.add(p);
            }
        }
        return resultado;
    }

    public LinkedList<Producto> filtrarVersion(String version) {
        LinkedList<Producto> resultado = new LinkedList<>();
        for (Producto p : listaProductos) {
            if (p.getVersion().equals(version)) resultado.add(p);
        }
        return resultado;
    }

    public LinkedList<Producto> filtrarStockBajo(int umbral) {
        LinkedList<Producto> resultado = new LinkedList<>();
        for (Producto p : listaProductos) {
            if (p.getCantidadDisponible() < umbral) resultado.add(p);
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
            for (Producto p : listaProductos) {
                pw.println(p.getIdProducto() + "|" + p.getNombre() + "|" +
                           p.getVersion() + "|" + p.getTipoLicencia() + "|" +
                           p.getCantidadDisponible() + "|" + p.getProveedor());
            }
        } catch (IOException e) {
            throw new Exception("Error al guardar productos: " + e.getMessage());
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
                if (datos.length == 6) {
                    Producto p = new Producto(
                        datos[0], datos[1], datos[2],
                        datos[3], Integer.parseInt(datos[4]), datos[5]
                    );
                    listaProductos.add(p);
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
