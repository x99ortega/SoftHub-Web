<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SoftHub Solutions - Iniciar Sesion</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css"/>
</head>
<body>
<div class="login-page">
    <div class="login-panel">
        <div class="login-left">
            <h2>Gestion de inventario empresarial</h2>
            <p>SoftHub Solutions centraliza el control de licencias y herramientas de software para empresas y startups.</p>
            <div class="login-feature"><div class="login-dot"></div>Control de inventario en tiempo real</div>
            <div class="login-feature"><div class="login-dot"></div>Gestion de licencias por empresa</div>
            <div class="login-feature"><div class="login-dot"></div>Filtros y busqueda avanzada</div>
            <div class="login-feature"><div class="login-dot"></div>Asignacion de software a empresas</div>
        </div>
        <div class="login-right">
            <div class="login-logo">
                <img src="${pageContext.request.contextPath}/images/banner.png" alt="Logo" onerror="this.style.display='none'"/>
                <span>Soft<em>Hub</em></span>
            </div>
            <h3>Iniciar sesion</h3>
            <p>Ingresa tus credenciales para continuar</p>

            <% String error = request.getParameter("error");
               if ("1".equals(error)) { %>
            <div class="alerta alerta-error">Usuario o contrasena incorrectos.</div>
            <% } %>

            <form action="ServletLogin" method="post">
                <div class="form-group" style="margin-bottom:12px;">
                    <label>Usuario</label>
                    <input type="text" name="usuario" placeholder="admin" required/>
                </div>
                <div class="form-group" style="margin-bottom:20px;">
                    <label>Contrasena</label>
                    <input type="password" name="password" placeholder="admin123" required/>
                </div>
                <button type="submit" class="btn btn-primary" style="width:100%;justify-content:center;">Ingresar al sistema</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
