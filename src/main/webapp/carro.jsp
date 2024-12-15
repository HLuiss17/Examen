<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" import="models.*" %>
<%
    Carro carro = (Carro) session.getAttribute("carro");
%>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carro de compras</title>
    <!-- Vincular Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Vincular íconos de Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center mb-4">Carro de compras</h1>

    <%
        if (carro == null || carro.getItems().isEmpty()) {
    %>
    <div class="alert alert-warning" role="alert">
        Lo sentimos, no hay productos en el carro de compras.
    </div>
    <% } else { %>

    <table class="table table-bordered table-striped">
        <thead>
        <tr>
            <th>ID Producto</th>
            <th>Nombre</th>
            <th>Precio</th>
            <th>Cantidad</th>
            <th>Total</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (ItemCarro item : carro.getItems()) {
        %>
        <tr>
            <td><%= item.getProductos().getIdProducto() %></td>
            <td><%= item.getProductos().getNombre() %></td>
            <td><%= item.getProductos().getPrecio() %></td>
            <td><%= item.getCantidad() %></td>
            <td><%= item.getSbtotal() %></td>
        </tr>
        <% } %>
        <tr>
            <td colspan="4" class="text-end"><strong>Total</strong></td>
            <td><strong><%= carro.getTotal() %></strong></td>
        </tr>
        </tbody>
    </table>
    <% } %>

    <div class="text-center mt-4">
        <a href="<%= request.getContextPath() %>/productos" class="btn btn-secondary">
            <i class="bi bi-cart-plus"></i> Seguir comprando
        </a>
        <a href="<%= request.getContextPath() %>/index.html" class="btn btn-primary">
            <i class="bi bi-house-door"></i> Ir al inicio
        </a>
    </div>
</div>

<!-- Vincular Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
