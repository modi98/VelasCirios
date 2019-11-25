<%-- 
    Document   : entregarPedido
    Created on : Nov 24, 2019, 7:55:18 PM
    Author     : mauri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Entregar pedido</title>
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
                        <li><a href="listaUsuarios.jsp">Administrar usuarios</a></li>
                    <%
                        }
                    %>
                    <li><a href="Logout">Cerrar sesión</a></li>
                </ul>
            </div>
        </nav>
        <%
            if (request.getParameter("pedidoId") == null) {
                response.sendRedirect("listaPedidos.jsp");
            }
        %>
        <center>
            <div class="home-div rounded primary-background">
                <form action="EntregarPedido" method="POST">
                    <input type="hidden" value="<%=request.getParameter("pedidoId")%>" name="pedidoId">
                    <input type="text" value="<%=request.getParameter("nombreCliente")%>" disabled>
                    <input type="text" value="<%=request.getParameter("tel")%>" disabled>
                    <input type="text" value="<%=request.getParameter("fechaEntrega")%>" disabled>
                    <textarea rows="10" cols="30" disabled><%=request.getParameter("descripcion")%></textarea>
                    <input type="submit" value="Entregar">
                </form>
            </div>
                <h4><font color="red"><b>No podrás cambiar el pedido una vez lo marques como enviado.</b></font></h4>
        </center>
    </body>
</html>
