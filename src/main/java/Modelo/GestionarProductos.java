package Modelo;

import java.util.LinkedList;

/**
 * Clase GestionarProductos - Lógica de negocio para Software
 * Proyecto: SoftHub Solutions
 * @author Victor Raphael Cuaran Jossa - Freddy Andres Burbano
 */
public class GestionarProductos {

    private LinkedList<Producto> listaProductos;

    // Constructor
    public GestionarProductos() {
        this.listaProductos = new LinkedList<>();
    }

    // Agregar producto
    public void agregar(Producto producto) {
        listaProductos.add(producto);
    }

    // Listar todos
    public LinkedList<Producto> listarTodos() {
        return listaProductos;
    }

    // Buscar por ID
    public Producto buscar(String idProducto) {
        for (Producto p : listaProductos) {
            if (p.getIdProducto().equals(idProducto)) return p;
        }
        return null;
    }

    // Editar producto
    public void editar(String idProducto, String nombre, String version,
                       String tipoLicencia, int cantidadDisponible, String proveedor) {
        for (Producto p : listaProductos) {
            if (p.getIdProducto().equals(idProducto)) {
                p.setNombre(nombre);
                p.setVersion(version);
                p.setTipoLicencia(tipoLicencia);
                p.setCantidadDisponible(cantidadDisponible);
                p.setProveedor(proveedor);
                break;
            }
        }
    }

    // Eliminar producto
    public void eliminar(String idProducto) {
        listaProductos.removeIf(p -> p.getIdProducto().equals(idProducto));
    }

    // Filtrar por nombre
    public LinkedList<Producto> filtrarNombre(String nombre) {
        LinkedList<Producto> resultado = new LinkedList<>();
        for (Producto p : listaProductos) {
            if (p.getNombre().toLowerCase().contains(nombre.toLowerCase())) {
                resultado.add(p);
            }
        }
        return resultado;
    }

    // Filtrar por proveedor
    public LinkedList<Producto> filtrarProveedor(String proveedor) {
        LinkedList<Producto> resultado = new LinkedList<>();
        for (Producto p : listaProductos) {
            if (p.getProveedor().toLowerCase().contains(proveedor.toLowerCase())) {
                resultado.add(p);
            }
        }
        return resultado;
    }

    // Filtrar por version
    public LinkedList<Producto> filtrarVersion(String version) {
        LinkedList<Producto> resultado = new LinkedList<>();
        for (Producto p : listaProductos) {
            if (p.getVersion().equals(version)) resultado.add(p);
        }
        return resultado;
    }

    // Filtrar stock bajo
    public LinkedList<Producto> filtrarStockBajo(int umbral) {
        LinkedList<Producto> resultado = new LinkedList<>();
        for (Producto p : listaProductos) {
            if (p.getCantidadDisponible() < umbral) resultado.add(p);
        }
        return resultado;
    }
}
