<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SoftHub Solutions - Registrar Empresa</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css"/>
</head>
<body>

    <%@ include file="lib/header.jsp" %>

    <div class="container">
        <div class="form-card">
            <h2>Registrar Nueva Empresa</h2>
            <p style="color:#718096; margin-bottom:20px;">
                Complete los campos del formulario para registrar una nueva empresa en el sistema.
            </p>
            <form action="#" method="post">

                <div class="form-group">
                    <label for="idEmpresa">ID Empresa *</label>
                    <input type="text" id="idEmpresa" name="idEmpresa" placeholder="Ej: EMP-001" required/>
                </div>
                <div class="form-group">
                    <label for="razonSocial">Razón Social *</label>
                    <input type="text" id="razonSocial" name="razonSocial" 
                           placeholder="Nombre legal de la empresa" required/>
                </div>
                <div class="form-group">
                    <label for="nit">NIT *</label>
                    <input type="text" id="nit" name="nit" placeholder="Ej: 900123456-7" required/>
                </div>
                <div class="form-group">
                    <label for="email">Correo Electrónico *</label>
                    <input type="email" id="email" name="email" 
                           placeholder="contacto@empresa.com" required/>
                </div>
                <div class="form-group">
                    <label for="ciudad">Ciudad *</label>
                    <input type="text" id="ciudad" name="ciudad" placeholder="Ej: Pasto" required/>
                </div>
                <div class="form-group">
                    <label for="telefono">Teléfono *</label>
                    <input type="text" id="telefono" name="telefono" 
                           placeholder="Ej: 3001234567" required/>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">Guardar Empresa</button>
                    <button type="reset" class="btn btn-danger">Limpiar Campos</button>
                    <a href="${pageContext.request.contextPath}/adminUsuarios.jsp" class="btn btn-warning">Cancelar</a>
                </div>
            </form>
        </div>
    </div>

    <%@ include file="lib/footer.jsp" %>

</body>
</html>
