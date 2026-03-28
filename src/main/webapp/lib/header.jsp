<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar">
    <div class="navbar-brand">
        <img src="${pageContext.request.contextPath}/images/banner.jpg" alt="SoftHub Logo" height="40"/>
        <span>SoftHub Solutions</span>
    </div>
    <ul class="navbar-links">
        <li><a href="${pageContext.request.contextPath}/index.jsp">Inicio</a></li>
        <li><a href="${pageContext.request.contextPath}/adminProductos.jsp">Gestión de Software</a></li>
        <li><a href="${pageContext.request.contextPath}/adminUsuarios.jsp">Gestión de Empresas</a></li>
        <li><a href="${pageContext.request.contextPath}/login.jsp">Cerrar Sesión</a></li>
    </ul>
</nav>
