<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SoftHub Solutions - Registrar Software</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css"/>
</head>
<body>

    <%@ include file="lib/header.jsp" %>

    <div class="container">
        <div class="form-card">
            <h2>Registrar Nuevo Software</h2>
            <p style="color:#718096; margin-bottom:20px;">
                Complete todos los campos del formulario para registrar un nuevo software en el inventario.
            </p>
            <form action="#" method="post">

                <div class="form-group">
                    <label for="idSoftware">ID Software *</label>
                    <input type="text" id="idSoftware" name="idSoftware" placeholder="Ej: SW-001" required/>
                </div>
                <div class="form-group">
                    <label for="nombre">Nombre del Software *</label>
                    <input type="text" id="nombre" name="nombre" placeholder="Ej: Microsoft Office" required/>
                </div>
                <div class="form-group">
                    <label for="version">Versión *</label>
                    <input type="text" id="version" name="version" placeholder="Ej: 2024" required/>
                </div>
                <div class="form-group">
                    <label for="tipoLicencia">Tipo de Licencia *</label>
                    <select id="tipoLicencia" name="tipoLicencia" required>
                        <option value="">-- Seleccione una opción --</option>
                        <option value="Perpetua">Perpetua</option>
                        <option value="Suscripcion">Suscripción</option>
                        <option value="OpenSource">Open Source</option>
                        <option value="Freemium">Freemium</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="cantidadDisponible">Cantidad Disponible *</label>
                    <input type="number" id="cantidadDisponible" name="cantidadDisponible" 
                           placeholder="Ej: 10" min="0" required/>
                </div>
                <div class="form-group">
                    <label for="proveedor">Proveedor *</label>
                    <input type="text" id="proveedor" name="proveedor" placeholder="Ej: Microsoft" required/>
                </div>

                <!-- Campos de Empresa asociada -->
                <hr style="margin: 20px 0; border-color: #e2e8f0;"/>
                <h3 style="color:#1a365d; margin-bottom:16px;">Empresa Asociada</h3>

                <div class="form-group">
                    <label for="idEmpresa">ID Empresa</label>
                    <input type="text" id="idEmpresa" name="idEmpresa" placeholder="Ej: EMP-001"/>
                </div>
                <div class="form-group">
                    <label for="razonSocial">Razón Social</label>
                    <input type="text" id="razonSocial" name="razonSocial" placeholder="Nombre de la empresa"/>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">Guardar Software</button>
                    <button type="reset" class="btn btn-danger">Limpiar Campos</button>
                    <a href="${pageContext.request.contextPath}/adminProductos.jsp" class="btn btn-warning">Cancelar</a>
                </div>
            </form>
        </div>
    </div>

    <%@ include file="lib/footer.jsp" %>

</body>
</html>
