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

/**
 * ServletUsuarios - CRUD completo de Empresas en memoria
 * Proyecto: SoftHub Solutions
 * @author Victor Raphael Cuaran Jossa - Freddy Andres Burbano
 */
@WebServlet(name = "ServletUsuarios", urlPatterns = {"/ServletUsuarios"})
public class ServletUsuarios extends HttpServlet {

    private static GestionarUsuarios gestor = new GestionarUsuarios();

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

        response.sendRedirect("ServletUsuarios");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String buscar   = request.getParameter("buscar");
        String editarId = request.getParameter("editar");

        LinkedList<Usuario> lista = gestor.listarTodos();

        if (buscar != null && !buscar.isEmpty()) {
            lista = gestor.buscarPorNombre(buscar);
        }

        if (editarId != null) {
            Usuario u = gestor.buscar(editarId);
            if (u != null) request.setAttribute("usuarioEditar", u);
        }

        request.setAttribute("listaUsuarios", lista);
        request.getRequestDispatcher("adminUsuarios.jsp").forward(request, response);
    }

    private void agregar(HttpServletRequest request) {
        String id          = request.getParameter("idEmpresa");
        String razonSocial = request.getParameter("razonSocial");
        String nit         = request.getParameter("nit");
        String email       = request.getParameter("email");
        String ciudad      = request.getParameter("ciudad");
        String telefono    = request.getParameter("telefono");
        String sector      = request.getParameter("sector");
        String tipoEmpresa = request.getParameter("tipoEmpresa");

        if (id == null || id.isEmpty()) return;

        Usuario u = new Usuario(id, razonSocial, nit, email, ciudad, telefono, sector, tipoEmpresa);
        gestor.agregar(u);
    }

    private void eliminar(HttpServletRequest request) {
        String id = request.getParameter("idEmpresa");
        gestor.eliminar(id);
    }

    private void editar(HttpServletRequest request) {
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
