<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SoftHub — Registrar Empresa</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css"/>
</head>
<body>

<%@ include file="lib/header.jsp" %>

<div class="container">
    <div class="page-header">
        <div>
            <h2>
                <div class="ph-icon" style="background:rgba(6,182,212,0.12);color:var(--cyan);">
                    <i class="bi bi-plus-circle"></i>
                </div>
                Registrar Empresa
            </h2>
            <p>Completa los campos para registrar una nueva empresa en el sistema</p>
        </div>
        <a href="${pageContext.request.contextPath}/adminUsuarios.jsp" class="btn btn-ghost btn-sm">
            <i class="bi bi-arrow-left"></i> Volver
        </a>
    </div>

    <div class="form-card">
        <h2>Datos de la Empresa</h2>
        <form action="#" method="post">
            <div class="form-grid">
                <div class="form-group">
                    <label>ID Empresa *</label>
                    <input type="text" name="idEmpresa" placeholder="Ej: EMP-001" required/>
                </div>
                <div class="form-group">
                    <label>Razón Social *</label>
                    <input type="text" name="razonSocial" placeholder="Nombre legal de la empresa" required/>
                </div>
                <div class="form-group">
                    <label>NIT *</label>
                    <input type="text" name="nit" placeholder="Ej: 900123456-7" required/>
                </div>
                <div class="form-group">
                    <label>Correo Electrónico *</label>
                    <input type="email" name="email" placeholder="contacto@empresa.com" required/>
                </div>
                <div class="form-group">
                    <label>Ciudad *</label>
                    <input type="text" name="ciudad" placeholder="Ej: Pasto" required/>
                </div>
                <div class="form-group">
                    <label>Teléfono *</label>
                    <input type="text" name="telefono" placeholder="Ej: 3001234567" required/>
                </div>
            </div>
            <div class="form-actions">
                <button type="submit" class="btn btn-primary">
                    <i class="bi bi-plus-lg"></i> Guardar Empresa
                </button>
                <button type="reset" class="btn btn-ghost">
                    <i class="bi bi-arrow-counterclockwise"></i> Limpiar
                </button>
                <a href="${pageContext.request.contextPath}/adminUsuarios.jsp" class="btn btn-danger">
                    <i class="bi bi-x"></i> Cancelar
                </a>
            </div>
        </form>
    </div>
</div>

<%@ include file="lib/footer.jsp" %>
</body>
</html>
