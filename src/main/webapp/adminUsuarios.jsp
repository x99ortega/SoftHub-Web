<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <!-- Formulario -->
        <div class="form-card">
            <h2>Registrar / Actualizar Empresa</h2>
            <form action="#" method="post">
                <div class="form-group">
                    <label for="idEmpresa">ID Empresa</label>
                    <input type="text" id="idEmpresa" name="idEmpresa" placeholder="Ej: EMP-001"/>
                </div>
                <div class="form-group">
                    <label for="razonSocial">Razón Social</label>
                    <input type="text" id="razonSocial" name="razonSocial" placeholder="Nombre legal de la empresa"/>
                </div>
                <div class="form-group">
                    <label for="nit">NIT</label>
                    <input type="text" id="nit" name="nit" placeholder="Ej: 900123456-7"/>
                </div>
                <div class="form-group">
                    <label for="email">Correo Electrónico</label>
                    <input type="email" id="email" name="email" placeholder="contacto@empresa.com"/>
                </div>
                <div class="form-group">
                    <label for="ciudad">Ciudad</label>
                    <input type="text" id="ciudad" name="ciudad" placeholder="Ej: Pasto"/>
                </div>
                <div class="form-group">
                    <label for="telefono">Teléfono</label>
                    <input type="text" id="telefono" name="telefono" placeholder="Ej: 3001234567"/>
                </div>

                <div class="form-actions">
                    <button type="submit" name="accion" value="registrar" class="btn btn-primary">Registrar</button>
                    <button type="submit" name="accion" value="actualizar" class="btn btn-warning">Actualizar</button>
                    <button type="reset" class="btn btn-danger">Limpiar</button>
                </div>
            </form>
        </div>

        <!-- Tabla de listado -->
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
