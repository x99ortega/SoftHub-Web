<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <!-- Formulario de registro/actualización -->
        <div class="form-card">
            <h2>Registrar / Actualizar Software</h2>
            <form action="#" method="post">
                <div class="form-group">
                    <label for="idSoftware">ID Software</label>
                    <input type="text" id="idSoftware" name="idSoftware" placeholder="Ej: SW-001"/>
                </div>
                <div class="form-group">
                    <label for="nombre">Nombre del Software</label>
                    <input type="text" id="nombre" name="nombre" placeholder="Ej: Microsoft Office"/>
                </div>
                <div class="form-group">
                    <label for="version">Versión</label>
                    <input type="text" id="version" name="version" placeholder="Ej: 2024"/>
                </div>
                <div class="form-group">
                    <label for="tipoLicencia">Tipo de Licencia</label>
                    <select id="tipoLicencia" name="tipoLicencia">
                        <option value="">-- Seleccione --</option>
                        <option value="Perpetua">Perpetua</option>
                        <option value="Suscripcion">Suscripción</option>
                        <option value="OpenSource">Open Source</option>
                        <option value="Freemium">Freemium</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="cantidadDisponible">Cantidad Disponible</label>
                    <input type="number" id="cantidadDisponible" name="cantidadDisponible" placeholder="Ej: 10" min="0"/>
                </div>
                <div class="form-group">
                    <label for="proveedor">Proveedor</label>
                    <input type="text" id="proveedor" name="proveedor" placeholder="Ej: Microsoft"/>
                </div>

                <div class="form-actions">
                    <button type="submit" name="accion" value="registrar" class="btn btn-primary">Registrar</button>
                    <button type="submit" name="accion" value="actualizar" class="btn btn-warning">Actualizar</button>
                    <button type="reset" class="btn btn-danger">Limpiar</button>
                </div>
            </form>
        </div>

        <!-- Filtros -->
        <div class="form-card">
            <h2>Filtrar Software</h2>
            <form action="#" method="get" style="display:flex; gap:16px; flex-wrap:wrap; align-items:flex-end;">
                <div class="form-group" style="flex:1; min-width:160px;">
                    <label for="filtroNombre">Por Nombre</label>
                    <input type="text" id="filtroNombre" name="filtroNombre" placeholder="Buscar nombre..."/>
                </div>
                <div class="form-group" style="flex:1; min-width:160px;">
                    <label for="filtroProveedor">Por Proveedor</label>
                    <input type="text" id="filtroProveedor" name="filtroProveedor" placeholder="Buscar proveedor..."/>
                </div>
                <div class="form-group" style="flex:1; min-width:160px;">
                    <label for="filtroVersion">Por Versión</label>
                    <input type="text" id="filtroVersion" name="filtroVersion" placeholder="Ej: 2024"/>
                </div>
                <div class="form-group" style="flex:1; min-width:160px;">
                    <label for="filtroStock">Stock mínimo</label>
                    <input type="number" id="filtroStock" name="filtroStock" placeholder="Umbral..." min="0"/>
                </div>
                <div style="display:flex; gap:8px;">
                    <button type="submit" class="btn btn-primary">Filtrar</button>
                    <a href="${pageContext.request.contextPath}/adminProductos.jsp" class="btn btn-warning">Limpiar</a>
                </div>
            </form>
        </div>

        <!-- Tabla de listado -->
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
                    <!-- Los datos se cargarán dinámicamente con el Servlet -->
                    <tr>
                        <td colspan="7" style="text-align:center; color:#718096; padding:20px;">
                            No hay registros disponibles.
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

    </div>

    <%@ include file="lib/footer.jsp" %>

</body>
</html>
