<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SoftHub Solutions - Iniciar Sesión</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css"/>
</head>
<body>

    <div class="login-wrapper">
        <div class="login-box">
            <div class="login-logo">
             <img src="${pageContext.request.contextPath}/images/banner.png" alt="SoftHub Logo"/>
                <h2>SoftHub Solutions</h2>
                <p>Ingresa tus credenciales para continuar</p>
            </div>

            <form action="${pageContext.request.contextPath}/index.jsp" method="post">
                <div class="form-group" style="margin-bottom:16px;">
                    <label>Usuario</label>
                    <input type="text" name="usuario" placeholder="Ingresa tu usuario"/>
                </div>
                <div class="form-group" style="margin-bottom:20px;">
                    <label>Contraseña</label>
                    <input type="password" name="password" placeholder="••••••••"/>
                </div>
                <button type="submit" class="btn btn-primary">Ingresar al sistema</button>
            </form>
        </div>
    </div>

</body>
</html>
