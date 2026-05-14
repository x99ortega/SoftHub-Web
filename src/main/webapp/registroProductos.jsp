<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SoftHub — Registrar Software</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css"/>
</head>
<body>

<%@ include file="lib/header.jsp" %>

<div class="container">
    <div class="page-header">
        <div>
            <h2>
                <div class="ph-icon" style="background:rgba(37,99,235,0.12);color:var(--ac2);">
                    <i class="bi bi-plus-circle"></i>
                </div>
                Registrar Software
            </h2>
            <p>Completa todos los campos para agregar un nuevo software al inventario</p>
        </div>
        <a href="${pageContext.request.contextPath}/adminProductos.jsp" class="btn btn-ghost btn-sm">
            <i class="bi bi-arrow-left"></i> Volver
        </a>
    </div>

    <div class="form-card">
        <h2>Datos del Software</h2>
        <form action="#" method="post">
            <div class="form-grid">
                <div class="form-group">
                    <label>ID Software *</label>
                    <input type="text" name="idSoftware" placeholder="Ej: SW-001" required/>
                </div>
                <div class="form-group">
                    <label>Nombre *</label>
                    <input type="text" name="nombre" placeholder="Ej: Microsoft Office" required/>
                </div>
                <div class="form-group">
                    <label>Versión *</label>
                    <input type="text" name="version" placeholder="Ej: 2024" required/>
                </div>
                <div class="form-group">
                    <label>Tipo de Licencia *</label>
                    <select name="tipoLicencia" required>
                        <option value="">— Seleccione —</option>
                        <option value="Perpetua">Perpetua</option>
                        <option value="Suscripcion">Suscripción</option>
                        <option value="OpenSource">Open Source</option>
                        <option value="Freemium">Freemium</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Cantidad Disponible *</label>
                    <input type="number" name="cantidadDisponible" placeholder="Ej: 10" min="0" required/>
                </div>
                <div class="form-group">
                    <label>Proveedor *</label>
                    <input type="text" name="proveedor" placeholder="Ej: Microsoft" required/>
                </div>
            </div>

            <div style="height:1px;background:var(--border);margin:20px 0;"></div>

            <div style="font-size:0.78rem;font-weight:700;color:var(--muted);text-transform:uppercase;letter-spacing:0.7px;margin-bottom:14px;">
                <i class="bi bi-building"></i> Empresa Asociada
            </div>

            <div class="form-grid">
                <div class="form-group">
                    <label>ID Empresa</label>
                    <input type="text" name="idEmpresa" placeholder="Ej: EMP-001"/>
                </div>
                <div class="form-group">
                    <label>Razón Social</label>
                    <input type="text" name="razonSocial" placeholder="Nombre de la empresa"/>
                </div>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary">
                    <i class="bi bi-plus-lg"></i> Guardar Software
                </button>
                <button type="reset" class="btn btn-ghost">
                    <i class="bi bi-arrow-counterclockwise"></i> Limpiar
                </button>
                <a href="${pageContext.request.contextPath}/adminProductos.jsp" class="btn btn-danger">
                    <i class="bi bi-x"></i> Cancelar
                </a>
            </div>
        </form>
    </div>
</div>

<%@ include file="lib/footer.jsp" %>
</body>
</html>
