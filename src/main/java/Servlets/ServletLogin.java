package Servlets;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ServletLogin", urlPatterns = {"/ServletLogin"})
public class ServletLogin extends HttpServlet {

    private static final String ARCHIVO = "usuarios_login.txt";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String usuario    = request.getParameter("usuario");
        String password   = request.getParameter("password");
        String resultado  = validarLogin(usuario, password);

        if (resultado.equals("OK")) {
            HttpSession session = request.getSession();
            session.setAttribute("usuarioActivo", usuario);
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("login.jsp?error=1");
        }
    }

    private String validarLogin(String usuario, String password) {
        File archivo = null;
        FileReader reader = null;
        BufferedReader buffer = null;
        try {
            archivo = new File(ARCHIVO);
            if (!archivo.exists()) {
                crearArchivoDefault();
            }
            reader = new FileReader(archivo);
            buffer = new BufferedReader(reader);
            String linea;
            while ((linea = buffer.readLine()) != null) {
                String[] datos = linea.split("\\|");
                if (datos.length == 2) {
                    if (datos[0].trim().equals(usuario) && datos[1].trim().equals(password)) {
                        return "OK";
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (buffer != null) buffer.close(); } catch (IOException e) { e.printStackTrace(); }
            try { if (reader != null) reader.close(); } catch (IOException e) { e.printStackTrace(); }
        }
        return "ERROR";
    }

    private void crearArchivoDefault() {
        FileWriter writer = null;
        PrintWriter pw = null;
        try {
            writer = new FileWriter(new File(ARCHIVO), false);
            pw = new PrintWriter(writer);
            pw.println("admin|admin123");
            pw.println("victor|victor123");
            pw.println("fredy|fredy123");
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (pw != null) pw.close();
            try { if (writer != null) writer.close(); } catch (IOException e) { e.printStackTrace(); }
        }
    }
}
