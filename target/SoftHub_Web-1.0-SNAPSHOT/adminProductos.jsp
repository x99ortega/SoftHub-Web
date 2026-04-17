<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Producto, java.util.LinkedList"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SoftHub Solutions - Gestión de Software</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css"/>
</head>
<body>
    <%@ include file="lib/header.jsp" %>
    <div class="container">

        <%
            Producto prod = (Producto) request.getAttribute("productoEditar");
            String accion = (prod != null) ? "editar" : "agregar";
        %>

        <div class="form-card">
            <h2><%= (prod != null) ? "Editar Software" : "Registrar Nuevo Software" %></h2>
            <form action="ServletProductos" method="post">
                <input type="hidden" name="accion" value="<%= accion %>"/>

                <div class="form-group">
                    <label>ID Software</label>
                    <input type="text" name="idProducto"
                           value="<%= prod != null ? prod.getIdProducto() : "" %>"
                           <%= prod != null ? "readonly" : "" %>
                           placeholder="Ej: SW-001" required/>
                </div>
                <div class="form-group">
                    <label>Nombre del Software</label>
                    <input type="text" name="nombre"
                           value="<%= prod != null ? prod.getNombre() : "" %>"
                           placeholder="Ej: Microsoft Office" required/>
                </div>
                <div class="form-group">
                    <label>Versión</label>
                    <input type="text" name="version"
                           value="<%= prod != null ? prod.getVersion() : "" %>"
                           placeholder="Ej: 2024" required/>
                </div>
                <div class="form-group">
                    <label>Tipo de Licencia</label>
                    <select name="tipoLicencia" required>
                        <option value="">-- Seleccione --</option>
                        <option value="Perpetua"    <%= prod != null && prod.getTipoLicencia().equals("Perpetua")    ? "selected" : "" %>>Perpetua</option>
                        <option value="Suscripcion" <%= prod != null && prod.getTipoLicencia().equals("Suscripcion") ? "selected" : "" %>>Suscripción</option>
                        <option value="OpenSource"  <%= prod != null && prod.getTipoLicencia().equals("OpenSource")  ? "selected" : "" %>>Open Source</option>
                        <option value="Freemium"    <%= prod != null && prod.getTipoLicencia().equals("Freemium")    ? "selected" : "" %>>Freemium</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Cantidad Disponible</label>
                    <input type="number" name="cantidadDisponible"
                           value="<%= prod != null ? prod.getCantidadDisponible() : "" %>"
                           placeholder="Ej: 10" min="0" required/>
                </div>
                <div class="form-group">
                    <label>Proveedor</label>
                    <input type="text" name="proveedor"
                           value="<%= prod != null ? prod.getProveedor() : "" %>"
                           placeholder="Ej: Microsoft" required/>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">
                        <%= prod != null ? "Actualizar" : "Registrar" %>
                    </button>
                    <a href="ServletProductos" class="btn btn-danger">Limpiar</a>
                </div>
            </form>
        </div>

        <!-- Filtros -->
        <div class="form-card">
            <h2>Filtrar Software</h2>
            <form action="ServletProductos" method="get" style="display:flex; gap:16px; flex-wrap:wrap; align-items:flex-end;">
                <div class="form-group" style="flex:1; min-width:150px;">
                    <label>Por Nombre</label>
                    <input type="text" name="filtroNombre" placeholder="Buscar nombre..."/>
                </div>
                <div class="form-group" style="flex:1; min-width:150px;">
                    <label>Por Proveedor</label>
                    <input type="text" name="filtroProveedor" placeholder="Buscar proveedor..."/>
                </div>
                <div class="form-group" style="flex:1; min-width:150px;">
                    <label>Por Versión</label>
                    <input type="text" name="filtroVersion" placeholder="Ej: 2024"/>
                </div>
                <div class="form-group" style="flex:1; min-width:150px;">
                    <label>Stock menor a</label>
                    <input type="number" name="filtroStock" placeholder="Umbral..." min="0"/>
                </div>
                <div style="display:flex; gap:8px;">
                    <button type="submit" class="btn btn-primary">Filtrar</button>
                    <a href="ServletProductos" class="btn btn-warning">Limpiar</a>
                </div>
            </form>
        </div>

        <!-- Tabla -->
        <div class="table-card">
            <h2>Listado de Software</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Versión</th>
                        <th>Tipo Licencia</th>
                        <th>Cantidad</th>
                        <th>Proveedor</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    LinkedList<Producto> lista = (LinkedList<Producto>) request.getAttribute("listaProductos");
                    if (lista == null || lista.isEmpty()) {
                %>
                    <tr>
                        <td colspan="7" style="text-align:center; color:#718096; padding:20px;">
                            No hay registros. Agrega un software arriba.
                        </td>
                    </tr>
                <%
                    } else {
                        for (Producto p : lista) {
                %>
                    <tr>
                        <td><%= p.getIdProducto() %></td>
                        <td><%= p.getNombre() %></td>
                        <td><%= p.getVersion() %></td>
                        <td><%= p.getTipoLicencia() %></td>
                        <td><%= p.getCantidadDisponible() %></td>
                        <td><%= p.getProveedor() %></td>
                        <td>
                            <a href="ServletProductos?editar=<%= p.getIdProducto() %>"
                               class="btn btn-warning" style="padding:6px 12px; font-size:0.8rem;">Editar</a>
                            <form action="ServletProductos" method="post" style="display:inline;">
                                <input type="hidden" name="accion" value="eliminar"/>
                                <input type="hidden" name="idProducto" value="<%= p.getIdProducto() %>"/>
                                <button type="submit" class="btn btn-danger"
                                        style="padding:6px 12px; font-size:0.8rem;"
                                        onclick="return confirm('¿Eliminar este software?')">Eliminar</button>
                            </form>
                        </td>
                    </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
    <%@ include file="lib/footer.jsp" %>
</body>
</html>
