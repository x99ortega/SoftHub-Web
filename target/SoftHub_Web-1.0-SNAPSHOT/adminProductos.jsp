<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Producto, java.util.LinkedList"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SoftHub - Gestion de Software</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css"/>
</head>
<body>
<%@ include file="lib/header.jsp" %>
<div class="container">

    <div class="page-header">
        <div>
            <h2>Gestion de Software</h2>
            <p>Inventario de software empresarial</p>
        </div>
        <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-ghost btn-sm">Volver</a>
    </div>

    <% String mensaje = (String) request.getAttribute("mensaje");
       if (mensaje != null && !mensaje.isEmpty()) {
           boolean esError = mensaje.startsWith("Error"); %>
    <div class="alerta <%= esError ? "alerta-error" : "alerta-ok" %>"><%= mensaje %></div>
    <% } %>

    <%
        Producto prod = (Producto) request.getAttribute("productoEditar");
        String accion = (prod != null) ? "editar" : "agregar";
    %>

    <!-- Formulario -->
    <div class="card">
        <div class="card-header">
            <span class="card-title"><%= (prod != null) ? "Editar Software" : "Registrar Nuevo Software" %></span>
        </div>
        <div class="card-body">
            <form action="ServletProductos" method="post">
                <input type="hidden" name="accion" value="<%= accion %>"/>
                <div class="form-grid">
                    <div class="form-group">
                        <label>ID Software</label>
                        <input type="text" name="idProducto" value="<%= prod != null ? prod.getIdProducto() : "" %>" <%= prod != null ? "readonly" : "" %> placeholder="Ej: SW-001" required/>
                    </div>
                    <div class="form-group">
                        <label>Nombre</label>
                        <input type="text" name="nombre" value="<%= prod != null ? prod.getNombre() : "" %>" placeholder="Ej: Microsoft Office" required/>
                    </div>
                    <div class="form-group">
                        <label>Version</label>
                        <input type="text" name="version" value="<%= prod != null ? prod.getVersion() : "" %>" placeholder="Ej: 2024" required/>
                    </div>
                    <div class="form-group">
                        <label>Tipo de Licencia</label>
                        <select name="tipoLicencia" required>
                            <option value="">Seleccione...</option>
                            <option value="Perpetua"    <%= prod != null && prod.getTipoLicencia().equals("Perpetua")    ? "selected" : "" %>>Perpetua</option>
                            <option value="Suscripcion" <%= prod != null && prod.getTipoLicencia().equals("Suscripcion") ? "selected" : "" %>>Suscripcion</option>
                            <option value="OpenSource"  <%= prod != null && prod.getTipoLicencia().equals("OpenSource")  ? "selected" : "" %>>Open Source</option>
                            <option value="Freemium"    <%= prod != null && prod.getTipoLicencia().equals("Freemium")    ? "selected" : "" %>>Freemium</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Cantidad</label>
                        <input type="number" name="cantidadDisponible" value="<%= prod != null ? prod.getCantidadDisponible() : "" %>" placeholder="Ej: 10" min="0" required/>
                    </div>
                    <div class="form-group">
                        <label>Proveedor</label>
                        <input type="text" name="proveedor" value="<%= prod != null ? prod.getProveedor() : "" %>" placeholder="Ej: Microsoft" required/>
                    </div>
                </div>
                <div class="form-actions">
                    <button type="submit" class="btn btn-primary"><%= prod != null ? "Actualizar" : "Registrar" %></button>
                    <a href="ServletProductos" class="btn btn-ghost">Cancelar</a>
                </div>
            </form>
        </div>
    </div>

    <!-- Filtros y tabla -->
    <div class="card">
        <form action="ServletProductos" method="get">
            <div class="filters-bar">
                <div class="form-group"><label>Por Nombre</label><input type="text" name="filtroNombre" placeholder="Buscar..."/></div>
                <div class="form-group"><label>Por Proveedor</label><input type="text" name="filtroProveedor" placeholder="Buscar..."/></div>
                <div class="form-group"><label>Por Version</label><input type="text" name="filtroVersion" placeholder="Ej: 2024"/></div>
                <div class="form-group"><label>Stock menor a</label><input type="number" name="filtroStock" placeholder="Umbral..." min="0"/></div>
                <div style="display:flex;gap:8px;align-items:flex-end;">
                    <button type="submit" class="btn btn-primary btn-sm">Filtrar</button>
                    <a href="ServletProductos" class="btn btn-ghost btn-sm">Limpiar</a>
                </div>
            </div>
        </form>

        <div class="card-header" style="border-top:1px solid var(--border);">
            <span class="card-title">Listado de Software</span>
            <% LinkedList<Producto> lista = (LinkedList<Producto>) request.getAttribute("listaProductos");
               int total = (lista != null) ? lista.size() : 0; %>
            <span class="record-count"><%= total %> registros</span>
        </div>

        <div class="table-wrapper">
            <table>
                <thead>
                    <tr><th>ID</th><th>Nombre</th><th>Version</th><th>Licencia</th><th>Cantidad</th><th>Proveedor</th><th>Acciones</th></tr>
                </thead>
                <tbody>
                <% if (lista == null || lista.isEmpty()) { %>
                    <tr><td colspan="7"><div class="empty-state">No hay software registrado.</div></td></tr>
                <% } else { for (Producto p : lista) { %>
                    <tr>
                        <td><span class="badge badge-blue"><%= p.getIdProducto() %></span></td>
                        <td><strong><%= p.getNombre() %></strong></td>
                        <td><%= p.getVersion() %></td>
                        <td><span class="badge badge-purple"><%= p.getTipoLicencia() %></span></td>
                        <td><span class="badge <%= p.getCantidadDisponible() < 5 ? "badge-red" : "badge-green" %>"><%= p.getCantidadDisponible() %></span></td>
                        <td><%= p.getProveedor() %></td>
                        <td>
                            <div class="actions">
                                <a href="ServletProductos?editar=<%= p.getIdProducto() %>" class="btn btn-warning btn-sm">Editar</a>
                                <form action="ServletProductos" method="post" style="display:inline;">
                                    <input type="hidden" name="accion" value="eliminar"/>
                                    <input type="hidden" name="idProducto" value="<%= p.getIdProducto() %>"/>
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
