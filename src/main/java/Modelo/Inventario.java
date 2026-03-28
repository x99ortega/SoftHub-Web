package Modelo;

import java.util.LinkedList;

/**

 * @author fredy
 */
public class Inventario {

    private LinkedList<Software> listaSoftware;
    private LinkedList<Empresa> listaEmpresas;


    public Inventario() {
        this.listaSoftware  = new LinkedList<>();
        this.listaEmpresas  = new LinkedList<>();
    }

  
    public void registrarSoftware(Software software) {
        listaSoftware.add(software);
    }

    public Software consultarSoftware(String idSoftware) {
        for (Software s : listaSoftware) {
            if (s.getIdSoftware().equals(idSoftware)) return s;
        }
        return null;
    }

    public void actualizarSoftware(Software software) {
        for (int i = 0; i < listaSoftware.size(); i++) {
            if (listaSoftware.get(i).getIdSoftware().equals(software.getIdSoftware())) {
                listaSoftware.set(i, software);
                break;
            }
        }
    }

    public void eliminarSoftware(String idSoftware) {
        listaSoftware.removeIf(s -> s.getIdSoftware().equals(idSoftware));
    }

  
    public void registrarEmpresa(Empresa empresa) {
        listaEmpresas.add(empresa);
    }

    public Empresa consultarEmpresa(String idEmpresa) {
        for (Empresa e : listaEmpresas) {
            if (e.getIdEmpresa().equals(idEmpresa)) return e;
        }
        return null;
    }

    public void actualizarEmpresa(Empresa empresa) {
        for (int i = 0; i < listaEmpresas.size(); i++) {
            if (listaEmpresas.get(i).getIdEmpresa().equals(empresa.getIdEmpresa())) {
                listaEmpresas.set(i, empresa);
                break;
            }
        }
    }

    public void eliminarEmpresa(String idEmpresa) {
        listaEmpresas.removeIf(e -> e.getIdEmpresa().equals(idEmpresa));
    }


    public LinkedList<Software> filtrarNombre(String nombre) {
        LinkedList<Software> resultado = new LinkedList<>();
        for (Software s : listaSoftware) {
            if (s.getNombre().toLowerCase().contains(nombre.toLowerCase())) {
                resultado.add(s);
            }
        }
        return resultado;
    }

    public LinkedList<Software> filtrarProveedor(String proveedor) {
        LinkedList<Software> resultado = new LinkedList<>();
        for (Software s : listaSoftware) {
            if (s.getProveedor().toLowerCase().contains(proveedor.toLowerCase())) {
                resultado.add(s);
            }
        }
        return resultado;
    }

    public LinkedList<Software> filtrarVersion(String version) {
        LinkedList<Software> resultado = new LinkedList<>();
        for (Software s : listaSoftware) {
            if (s.getVersion().equals(version)) resultado.add(s);
        }
        return resultado;
    }

    public LinkedList<Software> filtrarStockBajo(int umbral) {
        LinkedList<Software> resultado = new LinkedList<>();
        for (Software s : listaSoftware) {
            if (s.getCantidadDisponible() < umbral) resultado.add(s);
        }
        return resultado;
    }

    public void actualizarStock(String idSoftware, int cantidad) {
        Software s = consultarSoftware(idSoftware);
        if (s != null) s.setCantidadDisponible(cantidad);
    }

  
    public LinkedList<Software> getListaSoftware() { return listaSoftware; }
    public LinkedList<Empresa> getListaEmpresas() { return listaEmpresas; }
}
