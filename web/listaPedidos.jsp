<%-- 
    Document   : listaPedidos
    Created on : Nov 24, 2019, 6:27:49 PM
    Author     : mauri
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.model.Pedido"%>
<%@page import="com.dbHandlers.PedidosHandler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de pedidos</title>
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
                    <li class="active"><a href="listaPedidos.jsp">Lista de pedidos</a></li>
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
                <%
                    PedidosHandler ph = new PedidosHandler();
                    ArrayList<Pedido> pedidos = ph.getPedidos();
                    for (Pedido pedido : pedidos) {
                        if (!pedido.entregado) {
                %>
                    <h4 class="white-text">Nombre de cliente: <%=pedido.nombreCliente%></h4>
                    <h4 class="white-text">Teléfono: <%=pedido.tel%></h4>
                    <h4 class="white-text">Fecha de entrega: <%=pedido.fechaEntrega%></h4>
                    <textarea id="descripcion" name="descripcion" rows="10" cols="30" disabled><%=pedido.descripcion%></textarea>
                    <form action="entregarPedido.jsp" method="POST">
                        <input type="hidden" name="pedidoId" value="<%=pedido.id%>">
                        <input type="hidden" name="nombreCliente" value="<%=pedido.nombreCliente%>">
                        <input type="hidden" name="tel" value="<%=pedido.tel%>">
                        <input type="hidden" name="fechaEntrega" value="<%=pedido.fechaEntrega%>">
                        <input type="hidden" name="descripcion" value="<%=pedido.descripcion%>">
                        <input type="submit" value="Entregar">
                    </form>
                    <hr>
                <%
                        }
                    }
                %>
            </div>
        </center>
    </body>
</html>
