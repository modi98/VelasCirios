<%-- 
    Document   : crearUsuario
    Created on : Nov 24, 2019, 9:37:54 PM
    Author     : mauri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear usuario</title>
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
            <div class="login-div rounded primary-background">
                <h3 class="white-text">Crear usuario</h3>
                <form action="CrearUsuario" method="POST">
                    <label class="white-text">Nombre</label>
                    <input type="text" name="nombre" placeholder="Ingresa el nombre del usuario.." required>
                    
                    <label class="white-text">Correo</label>
                    <input type="text" name="correo" placeholder="Ingresa el correo del usuario.." required>
                    
                    <label class="white-text">Rol</label>
                    <input type="text" name="rol" placeholder="Ingresa el rol del usuario.." required>
                    
                    <label class="white-text">Contraseña</label>
                    <input type="text" name="pass" placeholder="Ingresa la contraseña del usuario.." required>
                    
                    <input type="submit" value="Crear">
                </form>
            </div>
        </center>
    </body>
</html>
