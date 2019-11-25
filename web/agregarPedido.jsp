<%-- 
    Document   : agregarPedido
    Created on : Nov 24, 2019, 5:22:52 PM
    Author     : mauri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar pedido</title>
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
                    <li class="active"><a href="agregarPedido.jsp">Agregar pedido</a></li>
                    <li><a href="listaPedidos.jsp">Lista de pedidos</a></li>
                    <%
                        String rol = (String) session.getAttribute("rol");
                        if (rol.equals("admin")) {
                    %>
                        <li><a href="listaUsuarios.jsp">Administrar usuarios</a></li>
                    <%
                        }
                    %>
                    <li><a href="Logout">Cerrar sesión</a></li>
                </ul>
            </div>
        </nav>
        <center>
            <div class="login-div rounded primary-background">
                <form action="CrearPedido" method="POST">
                    <label class="white-text" for="nombreCliente">Nombre de cliente</label>
                    <input type="text" id="nombreCliente" name="nombreCliente" placeholder="Ingresa el nombre del cliente.." required>
                    
                    <label class="white-text" for="tel">Teléfono</label>
                    <input type="text" id="tel" name="tel" placeholder="Teléfono del cliente.." required>
                    
                    <label class="white-text" for="fechaEntrega">Fecha de entrega</label>
                    <input type="date" id="fechaEntrega" name="fechaEntrega" placeholder="Fecha de entrega de pedido.." required>
                    
                    <label class="white-text" for="descripcion">Descripción</label>
                    <textarea id="descripcion" name="descripcion" rows="10" cols="30" placeholder="Detalles del pedido..."  required></textarea>
                    
                    <input type="submit" value="Agregar">
                </form>
            </div>
        </center>
    </body>
</html>
