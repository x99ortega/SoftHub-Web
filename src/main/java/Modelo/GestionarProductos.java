package Modelo;

import java.util.LinkedList;

/**
 * @author fredy
 */
public class GestionarProductos {

    private LinkedList<Producto> listaProductos;


    public GestionarProductos() {
        this.listaProductos = new LinkedList<>();
    }

 
    public void agregar(Producto producto) {
        listaProductos.add(producto);
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


    public void eliminar(String idProducto) {
        listaProductos.removeIf(p -> p.getIdProducto().equals(idProducto));
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
}
