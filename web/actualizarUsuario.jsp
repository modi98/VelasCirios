<%-- 
    Document   : actualizarUsuario
    Created on : Nov 24, 2019, 8:48:17 PM
    Author     : mauri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="./css/style.css">
    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="home.jsp">Velas y Cirios Decorativos</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="home.jsp">Inicio</a></li>
                    <li><a href="agregarPedido.jsp">Agregar pedido</a></li>
                    <li><a href="listaPedidos.jsp">Lista de pedidos</a></li>
                    <%
                        String rol = (String) session.getAttribute("rol");
                        if (rol.equals("admin")) {
                    %>
                        <li><a class="active" href="listaUsuarios.jsp">Administrar usuarios</a></li>
                    <%
                        }
                    %>
                    <li><a href="Logout">Cerrar sesión</a></li>
                </ul>
            </div>
        </nav>
        <center>
            <div class="home-div rounded primary-background">
                <h3 class="white-text">Actualizar usuario</h3>
                <form action="ActualizarUsuario" method="POST">
                    <input type="hidden" value="<%=request.getParameter("usuarioId")%>" name="usuarioId">
                    
                    <label class="white-text">Nombre de usuario</label>
                    <input type="text" value="<%=request.getParameter("nombre")%>" name="nombre">
                    
                    <label class="white-text">Correo</label>
                    <input type="text" value="<%=request.getParameter("correo")%>" name="correo">
                    
                    <label class="white-text">Rol</label>
                    <input type="text" value="<%=request.getParameter("rol")%>" name="rol">
                    <input type="submit" value="Actualizar">
                </form>
            </div>
        </center>
    </body>
</html>
