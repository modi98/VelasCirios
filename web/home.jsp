<%-- 
    Document   : home
    Created on : Nov 10, 2019, 5:20:25 PM
    Author     : mauri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio | Velas Y Cirios Decorativos</title>
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
                    <li class="active"><a href="home.jsp">Inicio</a></li>
                    <li><a href="agregarPedido.jsp">Agregar pedido</a></li>
                    <li><a href="listaPedidos.jsp">Lista de pedidos</a></li>
                    <%
                        String rol = (String) session.getAttribute("rol");
                        if (rol.equals("admin")) {
                    %>
                        <li><a href="#">Administrar usuarios</a></li>
                    <%
                        }
                    %>
                    <li><a href="Logout">Cerrar sesión</a></li>
                </ul>
            </div>
        </nav>
        <center>
            <div class="home-div rounded primary-background">
                <img src="assets/logoWhite.png" style="width: 20px;">
                <h1 class="white-text">Bienvenido, <%=session.getAttribute("nombre")%></h1><br>
                <h4 class="white-text">Esta es la plataforma inteligente de Velas y Cirios Decorativos. A través de esta plataforma podrás registrar los pedidos de los clientes y enviarlas instantáneamente a la base de datos que podrá ser consultada por todos los usuarios de la plataforma con conexión a internet.</h4>
                <br>
                <img src="assets/ss1.png" style="width: 600px;">
                <h4 class="white-text">Para agregar un pedido elige la opción agregar pedido en el menú principal y completa el formulario.</h4>
                <br>
                <img src="assets/ss2.png" style="width: 600px;">
                <h4 class="white-text">También puedes ver la lista de pedidos actuales seleccionando Lista de pedidos en el menú principal, ahí podrás ver detalles del pedido y marcarlo como entregado.</h4>
                <h4 class="white-text"><b>No olvides cerrar sesión al salir.</b></h4>
            </div>
        </center>
    </body>
</html>
