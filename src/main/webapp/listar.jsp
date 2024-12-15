<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,models.*" %>
<%
    List<Productos> productos = (List<Productos>) request.getAttribute("productos");
    Optional<String> username = (Optional<String>) request.getAttribute("username");
%>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Productos</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>

<div class="container mt-4">
    <h1>Listado de productos</h1>

    <% if (username.isPresent()) { %>
    <div class="alert alert-info">Hola <%= username.get() %>, bienvenido a la aplicación</div>
    <div><p><a href="<%= request.getContextPath() %>/productos/form" class="btn btn-primary">Ingrese el producto</a></p></div>
    <% } %>

    <table class="table table-bordered mt-3">
        <thead>
        <tr>
            <th>ID PRODUCTO</th>
            <th>NOMBRE PRODUCTO</th>
            <th>CATEGORIA</th>
            <% if (username.isPresent()) { %>
            <th>PRECIO</th>
            <th>OPCIONES</th>
            <% } %>
        </tr>
        </thead>
        <tbody>
        <% for (Productos p : productos) { %>
        <tr>
            <td><%= p.getIdProducto() %></td>
            <td><%= p.getNombre() %></td>
            <td><%= p.getCategoria() %></td>
            <% if (username.isPresent()) { %>
            <td><%= p.getPrecio() %></td>
            <td>
                <a href="<%= request.getContextPath() %>/agregar-carro?idProducto=<%= p.getIdProducto() %>" class="btn btn-success">
                    <i class="bi bi-cart-plus"></i> Agregar
                </a>
                <a href="<%= request.getContextPath() %>/productos/form?idProducto=<%= p.getIdProducto() %>" class="btn btn-warning">
                    <i class="bi bi-pencil"></i> Editar
                </a>
            </td>
            <% } %>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
