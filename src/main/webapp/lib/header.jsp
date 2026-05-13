<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar">
    <a href="${pageContext.request.contextPath}/index.jsp" class="navbar-brand">
        <img src="${pageContext.request.contextPath}/images/banner.png" alt="SoftHub Logo"/>
        <span>Soft<em>Hub</em></span>
    </a>
    <ul class="navbar-links">
        <li><a href="${pageContext.request.contextPath}/index.jsp">Inicio</a></li>
        <li><a href="${pageContext.request.contextPath}/ServletProductos">Software</a></li>
        <li><a href="${pageContext.request.contextPath}/ServletUsuarios">Empresas</a></li>
        <li><a href="${pageContext.request.contextPath}/login.jsp" class="btn btn-ghost" style="padding:8px 16px;">Cerrar Sesión</a></li>
    </ul>
</nav>
