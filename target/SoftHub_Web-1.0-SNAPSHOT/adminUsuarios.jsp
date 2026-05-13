<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Usuario, java.util.LinkedList"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SoftHub - Gestión de Empresas</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css"/>
</head>
<body>

    <%@ include file="lib/header.jsp" %>

    <div class="container">

        <!-- Header de página -->
        <div class="page-header">
            <div>
                <h2>Gestión de Empresas</h2>
                <p>Administra las empresas registradas en el sistema</p>
            </div>
            <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-ghost btn-sm">← Volver</a>
        </div>

        <%
            Usuario usu = (Usuario) request.getAttribute("usuarioEditar");
            String accion = (usu != null) ? "editar" : "agregar";
        %>

        <!-- Formulario -->
        <div class="form-card">
            <h2><%= (usu != null) ? "Editar Empresa" : "Registrar Nueva Empresa" %></h2>
            <form action="ServletUsuarios" method="post">
                <input type="hidden" name="accion" value="<%= accion %>"/>
                <div class="form-grid">
                    <div class="form-group">
                        <label>ID Empresa</label>
                        <input type="text" name="idEmpresa"
                               value="<%= usu != null ? usu.getIdEmpresa() : "" %>"
                               <%= usu != null ? "readonly style='opacity:0.6;'" : "" %>
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
                            <option value="Startup"     <%= usu != null && "Startup".equals(usu.getTipoEmpresa())     ? "selected" : "" %>>Startup</option>
                            <option value="PyME"        <%= usu != null && "PyME".equals(usu.getTipoEmpresa())        ? "selected" : "" %>>PyME</option>
                            <option value="Corporacion" <%= usu != null && "Corporacion".equals(usu.getTipoEmpresa()) ? "selected" : "" %>>Corporación</option>
                            <option value="Gobierno"    <%= usu != null && "Gobierno".equals(usu.getTipoEmpresa())    ? "selected" : "" %>>Gobierno</option>
                        </select>
                    </div>
                </div>
                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">
                        <%= usu != null ? "✓ Actualizar" : "+ Registrar" %>
                    </button>
                    <a href="ServletUsuarios" class="btn btn-ghost">Limpiar</a>
                </div>
            </form>
        </div>

        <!-- Búsqueda -->
        <div class="filters-card">
            <h3>Buscar Empresa</h3>
            <form action="ServletUsuarios" method="get">
                <div class="filters-grid">
                    <div class="form-group">
                        <label>Por Razón Social</label>
                        <input type="text" name="buscar" placeholder="Buscar empresa..."/>
                    </div>
                    <div style="display:flex; gap:8px; padding-bottom:2px;">
                        <button type="submit" class="btn btn-primary btn-sm">Buscar</button>
                        <a href="ServletUsuarios" class="btn btn-ghost btn-sm">Limpiar</a>
                    </div>
                </div>
            </form>
        </div>

        <!-- Tabla -->
        <div class="table-card">
            <div class="table-header">
                <h2>Listado de Empresas</h2>
                <%
                    LinkedList<Usuario> lista = (LinkedList<Usuario>) request.getAttribute("listaUsuarios");
                    int total = (lista != null) ? lista.size() : 0;
                %>
                <span class="table-count"><%= total %> registros</span>
            </div>
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
                    if (lista == null || lista.isEmpty()) {
                %>
                    <tr>
                        <td colspan="9">
                            <div class="empty-state">
                                <p>No hay empresas registradas aún. Agrega una arriba.</p>
                            </div>
                        </td>
                    </tr>
                <%
                    } else {
                        for (Usuario u : lista) {
                %>
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
                                <a href="ServletUsuarios?editar=<%= u.getIdEmpresa() %>"
                                   class="btn btn-warning btn-sm">Editar</a>
                                <form action="ServletUsuarios" method="post" style="display:inline;">
                                    <input type="hidden" name="accion" value="eliminar"/>
                                    <input type="hidden" name="idEmpresa" value="<%= u.getIdEmpresa() %>"/>
                                    <button type="submit" class="btn btn-danger btn-sm"
                                            onclick="return confirm('¿Eliminar esta empresa?')">Eliminar</button>
                                </form>
                            </div>
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
