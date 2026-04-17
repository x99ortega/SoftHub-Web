package Servlets;

import Modelo.GestionarProductos;
import Modelo.Producto;
import java.io.IOException;
import java.util.LinkedList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * ServletProductos - CRUD completo de Software en memoria
 * Proyecto: SoftHub Solutions
 * @author Victor Raphael Cuaran Jossa - Freddy Andres Burbano
 */
@WebServlet(name = "ServletProductos", urlPatterns = {"/ServletProductos"})
public class ServletProductos extends HttpServlet {

    private static GestionarProductos gestor = new GestionarProductos();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");
        if (accion == null) accion = "";

        switch (accion) {
            case "agregar":
                agregar(request);
                break;
            case "eliminar":
                eliminar(request);
                break;
            case "editar":
                editar(request);
                break;
        }

        response.sendRedirect("ServletProductos");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String filtroNombre    = request.getParameter("filtroNombre");
        String filtroProveedor = request.getParameter("filtroProveedor");
        String filtroVersion   = request.getParameter("filtroVersion");
        String filtroStock     = request.getParameter("filtroStock");
        String editarId        = request.getParameter("editar");

        LinkedList<Producto> lista = gestor.listarTodos();

        if (filtroNombre != null && !filtroNombre.isEmpty()) {
            lista = gestor.filtrarNombre(filtroNombre);
        } else if (filtroProveedor != null && !filtroProveedor.isEmpty()) {
            lista = gestor.filtrarProveedor(filtroProveedor);
        } else if (filtroVersion != null && !filtroVersion.isEmpty()) {
            lista = gestor.filtrarVersion(filtroVersion);
        } else if (filtroStock != null && !filtroStock.isEmpty()) {
            lista = gestor.filtrarStockBajo(Integer.parseInt(filtroStock));
        }

        if (editarId != null) {
            Producto p = gestor.buscar(editarId);
            if (p != null) request.setAttribute("productoEditar", p);
        }

        request.setAttribute("listaProductos", lista);
        request.getRequestDispatcher("adminProductos.jsp").forward(request, response);
    }

    private void agregar(HttpServletRequest request) {
        String id       = request.getParameter("idProducto");
        String nombre   = request.getParameter("nombre");
        String version  = request.getParameter("version");
        String licencia = request.getParameter("tipoLicencia");
        String cantStr  = request.getParameter("cantidadDisponible");
        String prov     = request.getParameter("proveedor");

        if (id == null || id.isEmpty()) return;

        int cantidad = 0;
        try { cantidad = Integer.parseInt(cantStr); } catch (Exception e) {}

        Producto p = new Producto(id, nombre, version, licencia, cantidad, prov);
        gestor.agregar(p);
    }

    private void eliminar(HttpServletRequest request) {
        String id = request.getParameter("idProducto");
        gestor.eliminar(id);
    }

    private void editar(HttpServletRequest request) {
        String id       = request.getParameter("idProducto");
        String nombre   = request.getParameter("nombre");
        String version  = request.getParameter("version");
        String licencia = request.getParameter("tipoLicencia");
        String cantStr  = request.getParameter("cantidadDisponible");
        String prov     = request.getParameter("proveedor");

        int cantidad = 0;
        try { cantidad = Integer.parseInt(cantStr); } catch (Exception e) {}

        gestor.editar(id, nombre, version, licencia, cantidad, prov);
    }
}
