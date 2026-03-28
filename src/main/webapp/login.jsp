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
            <img src="${pageContext.request.contextPath}/images/banner.jpg" alt="Logo SoftHub" height="70" style="margin-bottom:16px;"/>
            <h2>Iniciar Sesión</h2>

            <form action="#" method="post">
                <div class="form-group" style="text-align:left;">
                    <label for="usuario">Usuario</label>
                    <input type="text" id="usuario" name="usuario" placeholder="Ingrese su usuario"/>
                </div>
                <div class="form-group" style="text-align:left;">
                    <label for="password">Contraseña</label>
                    <input type="password" id="password" name="password" placeholder="Ingrese su contraseña"/>
                </div>
                <button type="submit" class="btn btn-primary" style="width:100%; margin-top:10px;">Ingresar</button>
            </form>
        </div>
    </div>

</body>
</html>
