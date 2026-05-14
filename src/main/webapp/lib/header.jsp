<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar">
    <a href="${pageContext.request.contextPath}/index.jsp" class="navbar-brand">
        <img src="${pageContext.request.contextPath}/images/banner.png" alt="Logo" onerror="this.style.display='none'"/>
        <span class="navbar-brand-text">Soft<em>Hub</em> Solutions</span>
    </a>
    <ul class="navbar-links">
        <li><a href="${pageContext.request.contextPath}/index.jsp">Inicio</a></li>
        <li><a href="${pageContext.request.contextPath}/ServletProductos">Software</a></li>
        <li><a href="${pageContext.request.contextPath}/ServletUsuarios">Empresas</a></li>
        <li><a href="${pageContext.request.contextPath}/asignacion.jsp">Asignaciones</a></li>
        <li><a href="${pageContext.request.contextPath}/ServletCerrarSesion" class="logout">Cerrar Sesion</a></li>
    </ul>
</nav>
