<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Usuario, java.util.LinkedList"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SoftHub Solutions - Gestión de Empresas</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css"/>
</head>
<body>
    <%@ include file="lib/header.jsp" %>
    <div class="container">

        <%
            Usuario usu = (Usuario) request.getAttribute("usuarioEditar");
            String accion = (usu != null) ? "editar" : "agregar";
        %>

        <div class="form-card">
            <h2><%= (usu != null) ? "Editar Empresa" : "Registrar Nueva Empresa" %></h2>
            <form action="ServletUsuarios" method="post">
                <input type="hidden" name="accion" value="<%= accion %>"/>

                <div class="form-group">
                    <label>ID Empresa</label>
                    <input type="text" name="idEmpresa"
                           value="<%= usu != null ? usu.getIdEmpresa() : "" %>"
                           <%= usu != null ? "readonly" : "" %>
                           placeholder="Ej: EMP-001" required/>
                </div>
                <div class="form-group">
                    <label>Razón Social</label>
                    <input type="text" name="razonSocial"
                           value="<%= usu != null ? usu.getRazonSocial() : "" %>"
                           placeholder="Nombre legal de la empresa" required/>
                </div>
                <div class="form-group">
                    <label>NIT</label>
                    <input type="text" name="nit"
                           value="<%= usu != null ? usu.getNit() : "" %>"
                           placeholder="Ej: 900123456-7" required/>
                </div>
                <div class="form-group">
                    <label>Correo Electrónico</label>
                    <input type="email" name="email"
                           value="<%= usu != null ? usu.getEmail() : "" %>"
                           placeholder="contacto@empresa.com" required/>
                </div>
                <div class="form-group">
                    <label>Ciudad</label>
                    <input type="text" name="ciudad"
                           value="<%= usu != null ? usu.getCiudad() : "" %>"
                           placeholder="Ej: Pasto" required/>
                </div>
                <div class="form-group">
                    <label>Teléfono</label>
                    <input type="text" name="telefono"
                           value="<%= usu != null ? usu.getTelefono() : "" %>"
                           placeholder="Ej: 3001234567" required/>
                </div>
                <div class="form-group">
                    <label>Sector</label>
                    <input type="text" name="sector"
                           value="<%= usu != null ? usu.getSector() : "" %>"
                           placeholder="Ej: Tecnología"/>
                </div>
                <div class="form-group">
                    <label>Tipo de Empresa</label>
                    <select name="tipoEmpresa">
                        <option value="">-- Seleccione --</option>
                        <option value="Startup"    <%= usu != null && "Startup".equals(usu.getTipoEmpresa())    ? "selected" : "" %>>Startup</option>
                        <option value="PyME"       <%= usu != null && "PyME".equals(usu.getTipoEmpresa())       ? "selected" : "" %>>PyME</option>
                        <option value="Corporacion"<%= usu != null && "Corporacion".equals(usu.getTipoEmpresa())? "selected" : "" %>>Corporación</option>
                        <option value="Gobierno"   <%= usu != null && "Gobierno".equals(usu.getTipoEmpresa())   ? "selected" : "" %>>Gobierno</option>
                    </select>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">
                        <%= usu != null ? "Actualizar" : "Registrar" %>
                    </button>
                    <a href="ServletUsuarios" class="btn btn-danger">Limpiar</a>
                </div>
            </form>
        </div>

        <!-- Búsqueda -->
        <div class="form-card">
            <h2>Buscar Empresa</h2>
            <form action="ServletUsuarios" method="get" style="display:flex; gap:16px; align-items:flex-end;">
                <div class="form-group" style="flex:1;">
                    <label>Por Razón Social</label>
                    <input type="text" name="buscar" placeholder="Buscar empresa..."/>
                </div>
                <div style="display:flex; gap:8px;">
                    <button type="submit" class="btn btn-primary">Buscar</button>
                    <a href="ServletUsuarios" class="btn btn-warning">Limpiar</a>
                </div>
            </form>
        </div>

        <!-- Tabla -->
        <div class="table-card">
            <h2>Listado de Empresas</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Razón Social</th>
                        <th>NIT</th>
                        <th>Email</th>
                        <th>Ciudad</th>
                        <th>Teléfono</th>
                        <th>Sector</th>
                        <th>Tipo</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    LinkedList<Usuario> lista = (LinkedList<Usuario>) request.getAttribute("listaUsuarios");
                    if (lista == null || lista.isEmpty()) {
                %>
                    <tr>
                        <td colspan="9" style="text-align:center; color:#718096; padding:20px;">
                            No hay registros. Agrega una empresa arriba.
                        </td>
                    </tr>
                <%
                    } else {
                        for (Usuario u : lista) {
                %>
                    <tr>
                        <td><%= u.getIdEmpresa() %></td>
                        <td><%= u.getRazonSocial() %></td>
                        <td><%= u.getNit() %></td>
                        <td><%= u.getEmail() %></td>
                        <td><%= u.getCiudad() %></td>
                        <td><%= u.getTelefono() %></td>
                        <td><%= u.getSector() %></td>
                        <td><%= u.getTipoEmpresa() %></td>
                        <td>
                            <a href="ServletUsuarios?editar=<%= u.getIdEmpresa() %>"
                               class="btn btn-warning" style="padding:6px 12px; font-size:0.8rem;">Editar</a>
                            <form action="ServletUsuarios" method="post" style="display:inline;">
                                <input type="hidden" name="accion" value="eliminar"/>
                                <input type="hidden" name="idEmpresa" value="<%= u.getIdEmpresa() %>"/>
                                <button type="submit" class="btn btn-danger"
                                        style="padding:6px 12px; font-size:0.8rem;"
                                        onclick="return confirm('¿Eliminar esta empresa?')">Eliminar</button>
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
