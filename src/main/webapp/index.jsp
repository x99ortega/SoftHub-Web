<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SoftHub Solutions - Inicio</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css"/>
</head>
<body>

    <%@ include file="lib/header.jsp" %>

    <div class="container">

        <div class="hero">
            <h1>Bienvenido a SoftHub Solutions</h1>
            <p>Sistema de gestión de inventario de software empresarial</p>
        </div>

        <div class="cards-grid">
            <div class="card">
                <h3>Gestión de Software</h3>
                <p>Registrar, listar, actualizar y eliminar software del inventario.</p>
                <a href="${pageContext.request.contextPath}/adminProductos.jsp" class="btn btn-primary">Ir al módulo</a>
            </div>
            <div class="card">
                <h3>Gestión de Empresas</h3>
                <p>Administrar empresas y usuarios registrados en el sistema.</p>
                <a href="${pageContext.request.contextPath}/adminUsuarios.jsp" class="btn btn-primary">Ir al módulo</a>
            </div>
     
    </div>

    <%@ include file="lib/footer.jsp" %>

</body>
</html>
