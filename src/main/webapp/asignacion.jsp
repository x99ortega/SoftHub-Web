<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.GestionarProductos, Modelo.GestionarUsuarios, Modelo.Producto, Modelo.Usuario, java.util.LinkedList"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SoftHub - Asignaciones</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css"/>
</head>
<body>
<%@ include file="lib/header.jsp" %>
<div class="container">

    <div class="page-header">
        <div>
            <h2>Asignaciones</h2>
            <p>Asigna software a empresas registradas en el sistema</p>
        </div>
        <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-ghost btn-sm">Volver</a>
    </div>

    <%
        GestionarProductos gestorP = new GestionarProductos();
        GestionarUsuarios  gestorU = new GestionarUsuarios();
        LinkedList<Producto> productos = gestorP.listarTodos();
        LinkedList<Usuario>  usuarios  = gestorU.listarTodos();
        String msg = request.getParameter("msg");
    %>

    <% if (msg != null && !msg.isEmpty()) { %>
    <div class="alerta alerta-ok"><%= msg %></div>
    <% } %>

    <!-- Formulario de asignacion -->
    <div class="card">
        <div class="card-header">
            <span class="card-title">Nueva Asignacion</span>
        </div>
        <div class="card-body">
            <form action="asignacion.jsp" method="post">
                <div class="form-grid">
                    <div class="form-group">
                        <label>Empresa</label>
                        <select name="idEmpresa" required>
                            <option value="">Seleccione una empresa...</option>
                            <% for (Usuario u : usuarios) { %>
                            <option value="<%= u.getIdEmpresa() %>"><%= u.getIdEmpresa() %> - <%= u.getRazonSocial() %></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Software</label>
                        <select name="idProducto" required>
                            <option value="">Seleccione un software...</option>
                            <% for (Producto p : productos) { %>
                            <option value="<%= p.getIdProducto() %>"><%= p.getIdProducto() %> - <%= p.getNombre() %></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Cantidad Asignada</label>
                        <input type="number" name="cantidad" placeholder="Ej: 5" min="1" required/>
                    </div>
                    <div class="form-group">
                        <label>Fecha de Asignacion</label>
                        <input type="date" name="fecha" required/>
                    </div>
                </div>
                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">Registrar Asignacion</button>
                    <a href="asignacion.jsp" class="btn btn-ghost">Limpiar</a>
                </div>
            </form>
        </div>
    </div>

    <%-- Procesar POST --%>
    <%
        String metodo = request.getMethod();
        if ("POST".equalsIgnoreCase(metodo)) {
            String idEmpresa  = request.getParameter("idEmpresa");
            String idProducto = request.getParameter("idProducto");
            String cantidad   = request.getParameter("cantidad");
            String fecha      = request.getParameter("fecha");

            Usuario  empresa  = gestorU.buscar(idEmpresa);
            Producto software = gestorP.buscar(idProducto);

            if (empresa != null && software != null) {
                // Guardar en reporte.txt
                try {
                    java.io.FileWriter fw = new java.io.FileWriter("reporte.txt", true);
                    java.io.PrintWriter pw = new java.io.PrintWriter(fw);
                    pw.println(fecha + " | Empresa: " + empresa.getRazonSocial() +
                               " (" + idEmpresa + ") | Software: " + software.getNombre() +
                               " (" + idProducto + ") | Cantidad: " + cantidad);
                    pw.close();
                    fw.close();
                    response.sendRedirect("asignacion.jsp?msg=Asignacion+registrada+exitosamente");
                } catch (Exception e) {
                    out.println("<div class='alerta alerta-error'>Error al guardar: " + e.getMessage() + "</div>");
                }
            }
        }
    %>

    <!-- Historial de asignaciones desde reporte.txt -->
    <div class="card">
        <div class="card-header">
            <span class="card-title">Historial de Asignaciones</span>
        </div>
        <div class="table-wrapper">
            <table>
                <thead>
                    <tr><th>Fecha</th><th>Empresa</th><th>Software</th><th>Cantidad</th></tr>
                </thead>
                <tbody>
                <%
                    java.io.File archivoReporte = new java.io.File("reporte.txt");
                    if (!archivoReporte.exists() || archivoReporte.length() == 0) {
                %>
                    <tr><td colspan="4"><div class="empty-state">No hay asignaciones registradas.</div></td></tr>
                <%
                    } else {
                        java.io.BufferedReader br = new java.io.BufferedReader(new java.io.FileReader(archivoReporte));
                        String linea;
                        while ((linea = br.readLine()) != null) {
                            String[] partes = linea.split("\\|");
                            if (partes.length == 4) {
                %>
                    <tr>
                        <td><span class="badge badge-blue"><%= partes[0].trim() %></span></td>
                        <td><%= partes[1].trim() %></td>
                        <td><%= partes[2].trim() %></td>
                        <td><span class="badge badge-green"><%= partes[3].trim() %></span></td>
                    </tr>
                <%
                            }
                        }
                        br.close();
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>

</div>
<%@ include file="lib/footer.jsp" %>
</body>
</html>
