<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String usuarioActivo = (String) session.getAttribute("usuarioActivo");
    if (usuarioActivo == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
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
<div class="container">

    <div class="module-grid">
        <a href="${pageContext.request.contextPath}/ServletProductos" class="module-card">
            <h3>Gestion de Software</h3>
            <p>Registra, actualiza, elimina y filtra el inventario de software empresarial.</p>
            <span class="btn btn-primary btn-sm">Ir al modulo</span>
        </a>
        <a href="${pageContext.request.contextPath}/ServletUsuarios" class="module-card">
            <h3>Gestion de Empresas</h3>
            <p>Administra las empresas registradas en el sistema.</p>
            <span class="btn btn-primary btn-sm">Ir al modulo</span>
        </a>
        <a href="${pageContext.request.contextPath}/asignacion.jsp" class="module-card">
            <h3>Asignaciones</h3>
            <p>Asigna software a empresas y genera reportes de asignacion.</p>
            <span class="btn btn-primary btn-sm">Ir al modulo</span>
        </a>
    </div>

</div>
<%@ include file="lib/footer.jsp" %>
</body>
</html>
