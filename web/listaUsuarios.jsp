<%-- 
    Document   : listaUsuarios
    Created on : Nov 24, 2019, 8:39:25 PM
    Author     : mauri
--%>

<%@page import="com.model.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dbHandlers.LoginHandler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de usuarios</title>
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
                        } else {
                            response.sendRedirect("home.jsp");
                        }
                    %>
                    <li><a href="Logout">Cerrar sesión</a></li>
                </ul>
            </div>
        </nav>
        <center>
            <a href="crearUsuario.jsp">Crear usuario</a><br><br>
            <div class="home-div rounded primary-background">
                <%
                    LoginHandler uh = new LoginHandler();
                    ArrayList<Usuario> usuarios = uh.getUsers();
                    for (Usuario usuario : usuarios) {
                %>
                    <h4 class="white-text">Nombre: <%=usuario.nombre%></h4>
                    <h4 class="white-text">Correo: <%=usuario.correo%></h4>
                    <h4 class="white-text">Rol: <%=usuario.rol%></h4>
                    <form action="actualizarUsuario.jsp" method="POST">
                        <input type="hidden" name="usuarioId" value="<%=usuario.id%>">
                        <input type="hidden" name="nombre" value="<%=usuario.nombre%>">
                        <input type="hidden" name="correo" value="<%=usuario.correo%>">
                        <input type="hidden" name="rol" value="<%=usuario.rol%>">
                        <input type="submit" value="Actualizar">
                    </form>
                    <hr>
                <%
                    }
                %>
            </div>
        </center>
    </body>
</html>
