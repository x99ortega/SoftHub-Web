package Servlets;

import Modelo.GestionarUsuarios;
import Modelo.Usuario;
import java.io.IOException;
import java.util.LinkedList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ServletUsuarios", urlPatterns = {"/ServletUsuarios"})
public class ServletUsuarios extends HttpServlet {

    private static GestionarUsuarios gestor = new GestionarUsuarios();

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
                    mensaje = "Empresa registrada exitosamente.";
                    break;
                case "eliminar":
                    eliminar(request);
                    mensaje = "Empresa eliminada correctamente.";
                    break;
                case "editar":
                    editar(request);
                    mensaje = "Empresa actualizada correctamente.";
                    break;
            }
        } catch (Exception e) {
            mensaje = "Error: " + e.getMessage();
        }

        response.sendRedirect("ServletUsuarios?msg=" + java.net.URLEncoder.encode(mensaje, "UTF-8"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String buscar   = request.getParameter("buscar");
        String editarId = request.getParameter("editar");
        String msg      = request.getParameter("msg");

        LinkedList<Usuario> lista;

        if (buscar != null && !buscar.isEmpty()) {
            lista = gestor.buscarPorNombre(buscar);
        } else {
            lista = gestor.listarTodos();
        }

        if (editarId != null) {
            Usuario u = gestor.buscar(editarId);
            if (u != null) request.setAttribute("usuarioEditar", u);
        }

        if (msg != null && !msg.isEmpty()) {
            request.setAttribute("mensaje", msg);
        }

        request.setAttribute("listaUsuarios", lista);
        request.getRequestDispatcher("adminUsuarios.jsp").forward(request, response);
    }

    private void agregar(HttpServletRequest request) throws Exception {
        String id          = request.getParameter("idEmpresa");
        String razonSocial = request.getParameter("razonSocial");
        String nit         = request.getParameter("nit");
        String email       = request.getParameter("email");
        String ciudad      = request.getParameter("ciudad");
        String telefono    = request.getParameter("telefono");
        String sector      = request.getParameter("sector");
        String tipoEmpresa = request.getParameter("tipoEmpresa");

        if (id == null || id.trim().isEmpty()) throw new Exception("El ID no puede estar vacio.");
        if (razonSocial == null || razonSocial.trim().isEmpty()) throw new Exception("La razon social no puede estar vacia.");

        Usuario u = new Usuario(id.trim(), razonSocial.trim(), nit, email, ciudad, telefono, sector, tipoEmpresa);
        gestor.agregar(u);
    }

    private void eliminar(HttpServletRequest request) throws Exception {
        String id = request.getParameter("idEmpresa");
        gestor.eliminar(id);
    }

    private void editar(HttpServletRequest request) throws Exception {
        String id          = request.getParameter("idEmpresa");
        String razonSocial = request.getParameter("razonSocial");
        String nit         = request.getParameter("nit");
        String email       = request.getParameter("email");
        String ciudad      = request.getParameter("ciudad");
        String telefono    = request.getParameter("telefono");
        String sector      = request.getParameter("sector");
        String tipoEmpresa = request.getParameter("tipoEmpresa");

        gestor.editar(id, razonSocial, nit, email, ciudad, telefono, sector, tipoEmpresa);
    }
}
