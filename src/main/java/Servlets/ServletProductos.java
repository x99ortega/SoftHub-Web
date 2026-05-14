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

@WebServlet(name = "ServletProductos", urlPatterns = {"/ServletProductos"})
public class ServletProductos extends HttpServlet {

    private static GestionarProductos gestor = new GestionarProductos();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");
        if (accion == null) accion = "";
        String mensaje = "";

        try {
            switch (accion) {
                case "agregar":
                    agregar(request);
                    mensaje = "Software registrado exitosamente.";
                    break;
                case "eliminar":
                    eliminar(request);
                    mensaje = "Software eliminado correctamente.";
                    break;
                case "editar":
                    editar(request);
                    mensaje = "Software actualizado correctamente.";
                    break;
            }
        } catch (Exception e) {
            mensaje = "Error: " + e.getMessage();
        }

        response.sendRedirect("ServletProductos?msg=" + java.net.URLEncoder.encode(mensaje, "UTF-8"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String filtroNombre    = request.getParameter("filtroNombre");
        String filtroProveedor = request.getParameter("filtroProveedor");
        String filtroVersion   = request.getParameter("filtroVersion");
        String filtroStock     = request.getParameter("filtroStock");
        String editarId        = request.getParameter("editar");
        String msg             = request.getParameter("msg");

        LinkedList<Producto> lista;

        if (filtroNombre != null && !filtroNombre.isEmpty()) {
            lista = gestor.filtrarNombre(filtroNombre);
        } else if (filtroProveedor != null && !filtroProveedor.isEmpty()) {
            lista = gestor.filtrarProveedor(filtroProveedor);
        } else if (filtroVersion != null && !filtroVersion.isEmpty()) {
            lista = gestor.filtrarVersion(filtroVersion);
        } else if (filtroStock != null && !filtroStock.isEmpty()) {
            lista = gestor.filtrarStockBajo(Integer.parseInt(filtroStock));
        } else {
            lista = gestor.listarTodos();
        }

        if (editarId != null) {
            Producto p = gestor.buscar(editarId);
            if (p != null) request.setAttribute("productoEditar", p);
        }

        if (msg != null && !msg.isEmpty()) {
            request.setAttribute("mensaje", msg);
        }

        request.setAttribute("listaProductos", lista);
        request.getRequestDispatcher("adminProductos.jsp").forward(request, response);
    }

    private void agregar(HttpServletRequest request) throws Exception {
        String id       = request.getParameter("idProducto");
        String nombre   = request.getParameter("nombre");
        String version  = request.getParameter("version");
        String licencia = request.getParameter("tipoLicencia");
        String cantStr  = request.getParameter("cantidadDisponible");
        String prov     = request.getParameter("proveedor");

        if (id == null || id.trim().isEmpty()) throw new Exception("El ID no puede estar vacio.");
        if (nombre == null || nombre.trim().isEmpty()) throw new Exception("El nombre no puede estar vacio.");

        int cantidad = 0;
        try { cantidad = Integer.parseInt(cantStr); } catch (Exception e) { throw new Exception("La cantidad debe ser un numero valido."); }

        Producto p = new Producto(id.trim(), nombre.trim(), version, licencia, cantidad, prov);
        gestor.agregar(p);
    }

    private void eliminar(HttpServletRequest request) throws Exception {
        String id = request.getParameter("idProducto");
        gestor.eliminar(id);
    }

    private void editar(HttpServletRequest request) throws Exception {
        String id       = request.getParameter("idProducto");
        String nombre   = request.getParameter("nombre");
        String version  = request.getParameter("version");
        String licencia = request.getParameter("tipoLicencia");
        String cantStr  = request.getParameter("cantidadDisponible");
        String prov     = request.getParameter("proveedor");

        int cantidad = 0;
        try { cantidad = Integer.parseInt(cantStr); } catch (Exception e) { throw new Exception("La cantidad debe ser un numero valido."); }

        gestor.editar(id, nombre, version, licencia, cantidad, prov);
    }
}
