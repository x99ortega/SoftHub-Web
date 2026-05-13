<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SoftHub Solutions</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/style.css"/>
</head>
<body>

    <%@ include file="lib/header.jsp" %>

    <div class="hero">
        <h1>Bienvenido a <span>SoftHub</span><br/>Solutions</h1>
        <p>Gestiona tu inventario de software empresarial de forma eficiente, organizada y en tiempo real.</p>
    </div>

    <div class="container" style="padding-top:0;">
        <div class="cards-grid">

            <div class="card">
                <h3>Gestión de Software</h3>
                <p>Registra, lista, actualiza y elimina software del inventario. Filtra por nombre, proveedor, versión y stock.</p>
                <a href="${pageContext.request.contextPath}/ServletProductos" class="btn btn-primary">Ir al módulo →</a>
            </div>

            <div class="card">
                <h3>Gestión de Empresas</h3>
                <p>Administra las empresas y usuarios registrados en el sistema. Busca por razón social.</p>
                <a href="${pageContext.request.contextPath}/ServletUsuarios" class="btn btn-primary">Ir al módulo →</a>
            </div>

        </div>
    </div>

    <%@ include file="lib/footer.jsp" %>

</body>
</html>
