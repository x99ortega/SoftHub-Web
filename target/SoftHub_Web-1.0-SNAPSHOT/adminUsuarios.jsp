<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Usuario, java.util.LinkedList"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SoftHub - Gestion de Empresas</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css"/>
</head>
<body>
<%@ include file="lib/header.jsp" %>
<div class="container">

    <div class="page-header">
        <div>
            <h2>Gestion de Empresas</h2>
            <p>Empresas registradas en el sistema</p>
        </div>
        <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-ghost btn-sm">Volver</a>
    </div>

    <% String mensaje = (String) request.getAttribute("mensaje");
       if (mensaje != null && !mensaje.isEmpty()) {
           boolean esError = mensaje.startsWith("Error"); %>
    <div class="alerta <%= esError ? "alerta-error" : "alerta-ok" %>"><%= mensaje %></div>
    <% } %>

    <%
        Usuario usu = (Usuario) request.getAttribute("usuarioEditar");
        String accion = (usu != null) ? "editar" : "agregar";
    %>

    <!-- Formulario -->
    <div class="card">
        <div class="card-header">
            <span class="card-title"><%= (usu != null) ? "Editar Empresa" : "Registrar Nueva Empresa" %></span>
        </div>
        <div class="card-body">
            <form action="ServletUsuarios" method="post">
                <input type="hidden" name="accion" value="<%= accion %>"/>
                <div class="form-grid">
                    <div class="form-group">
                        <label>ID Empresa</label>
                        <input type="text" name="idEmpresa" value="<%= usu != null ? usu.getIdEmpresa() : "" %>" <%= usu != null ? "readonly" : "" %> placeholder="Ej: EMP-001" required/>
                    </div>
                    <div class="form-group">
                        <label>Razon Social</label>
                        <input type="text" name="razonSocial" value="<%= usu != null ? usu.getRazonSocial() : "" %>" placeholder="Nombre legal" required/>
                    </div>
                    <div class="form-group">
                        <label>NIT</label>
                        <input type="text" name="nit" value="<%= usu != null ? usu.getNit() : "" %>" placeholder="Ej: 900123456-7" required/>
                    </div>
                    <div class="form-group">
                        <label>Correo</label>
                        <input type="email" name="email" value="<%= usu != null ? usu.getEmail() : "" %>" placeholder="contacto@empresa.com" required/>
                    </div>
                    <div class="form-group">
                        <label>Ciudad</label>
                        <input type="text" name="ciudad" value="<%= usu != null ? usu.getCiudad() : "" %>" placeholder="Ej: Pasto" required/>
                    </div>
                    <div class="form-group">
                        <label>Telefono</label>
                        <input type="text" name="telefono" value="<%= usu != null ? usu.getTelefono() : "" %>" placeholder="Ej: 3001234567" required/>
                    </div>
                    <div class="form-group">
                        <label>Sector</label>
                        <input type="text" name="sector" value="<%= usu != null ? usu.getSector() : "" %>" placeholder="Ej: Tecnologia"/>
                    </div>
                    <div class="form-group">
                        <label>Tipo de Empresa</label>
                        <select name="tipoEmpresa">
                            <option value="">Seleccione...</option>
                            <option value="Startup"     <%= usu != null && "Startup".equals(usu.getTipoEmpresa())     ? "selected" : "" %>>Startup</option>
                            <option value="PyME"        <%= usu != null && "PyME".equals(usu.getTipoEmpresa())        ? "selected" : "" %>>PyME</option>
                            <option value="Corporacion" <%= usu != null && "Corporacion".equals(usu.getTipoEmpresa()) ? "selected" : "" %>>Corporacion</option>
                            <option value="Gobierno"    <%= usu != null && "Gobierno".equals(usu.getTipoEmpresa())    ? "selected" : "" %>>Gobierno</option>
                        </select>
                    </div>
                </div>
                <div class="form-actions">
                    <button type="submit" class="btn btn-primary"><%= usu != null ? "Actualizar" : "Registrar" %></button>
                    <a href="ServletUsuarios" class="btn btn-ghost">Cancelar</a>
                </div>
            </form>
        </div>
    </div>

    <!-- Busqueda y tabla -->
    <div class="card">
        <form action="ServletUsuarios" method="get">
            <div class="filters-bar">
                <div class="form-group"><label>Buscar por Razon Social</label><input type="text" name="buscar" placeholder="Nombre de empresa..."/></div>
                <div style="display:flex;gap:8px;align-items:flex-end;">
                    <button type="submit" class="btn btn-primary btn-sm">Buscar</button>
                    <a href="ServletUsuarios" class="btn btn-ghost btn-sm">Limpiar</a>
                </div>
            </div>
        </form>

        <div class="card-header" style="border-top:1px solid var(--border);">
            <span class="card-title">Listado de Empresas</span>
            <% LinkedList<Usuario> lista = (LinkedList<Usuario>) request.getAttribute("listaUsuarios");
               int total = (lista != null) ? lista.size() : 0; %>
            <span class="record-count"><%= total %> registros</span>
        </div>

        <div class="table-wrapper">
            <table>
                <thead>
                    <tr><th>ID</th><th>Razon Social</th><th>NIT</th><th>Email</th><th>Ciudad</th><th>Telefono</th><th>Sector</th><th>Tipo</th><th>Acciones</th></tr>
                </thead>
                <tbody>
                <% if (lista == null || lista.isEmpty()) { %>
                    <tr><td colspan="9"><div class="empty-state">No hay empresas registradas.</div></td></tr>
                <% } else { for (Usuario u : lista) { %>
                    <tr>
                        <td><span class="badge badge-blue"><%= u.getIdEmpresa() %></span></td>
                        <td><strong><%= u.getRazonSocial() %></strong></td>
                        <td><%= u.getNit() %></td>
                        <td><%= u.getEmail() %></td>
                        <td><%= u.getCiudad() %></td>
                        <td><%= u.getTelefono() %></td>
                        <td><span class="badge badge-green"><%= u.getSector() %></span></td>
                        <td><span class="badge badge-orange"><%= u.getTipoEmpresa() %></span></td>
                        <td>
                            <div class="actions">
                                <a href="ServletUsuarios?editar=<%= u.getIdEmpresa() %>" class="btn btn-warning btn-sm">Editar</a>
                                <form action="ServletUsuarios" method="post" style="display:inline;">
                                    <input type="hidden" name="accion" value="eliminar"/>
                                    <input type="hidden" name="idEmpresa" value="<%= u.getIdEmpresa() %>"/>
                                    <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Eliminar?')">Eliminar</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                <% } } %>
                </tbody>
            </table>
        </div>
    </div>
</div>
<%@ include file="lib/footer.jsp" %>
</body>
</html>
