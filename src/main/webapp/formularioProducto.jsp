<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,models.*" %>
<html>
<%
    List<Categoria> categorias = (List<Categoria>) request.getAttribute("categorias");
    Productos productos = (Productos) request.getAttribute("productos");
%>
<head>
    <title>Ingreso de Productos</title>
    <!-- Vincular Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Vincular Bootstrap Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h1 class="text-center mb-4">Formulario de Productos</h1>
    <form action="<%= request.getContextPath() %>/productos/form" method="post">
        <div class="mb-3">
            <label for="nombre" class="form-label">
                <i class="bi bi-box"></i> Ingrese el nombre del producto
            </label>
            <input type="hidden" name="idProducto" value="<%= productos.getIdProducto() %>">
            <input type="text" id="nombre" name="nombre" class="form-control"
                   value="<%= productos.getNombre() != null ? productos.getNombre() : "" %>" required>
        </div>

        <div class="mb-3">
            <label for="categoria" class="form-label">
                <i class="bi bi-tags"></i> Seleccione la categoría
            </label>
            <select name="categoria" id="categoria" class="form-select" required>
                <option value="">---Seleccione la Categoría---</option>
                <% for (Categoria c : categorias) { %>
                <% if(c.getEstado() == 1) { %>
                <option value="<%= c.getIdCategoria() %>"
                        <%= c.getIdCategoria().equals(productos.getCategoria().getIdCategoria()) ? "selected" : "" %>>
                    <%= c.getNombre() %>
                </option>
                <% } %>
                <% } %>
            </select>
        </div>

        <div class="mb-3">
            <label for="precio" class="form-label">
                <i class="bi bi-cash"></i> Ingrese el precio
            </label>
            <input type="number" name="precio" id="precio" class="form-control" step="0.01"
                   value="<%= productos.getPrecio() != 0 ? productos.getPrecio() : "" %>" required>
        </div>

        <div class="d-grid gap-2 col-6 mx-auto">
            <button type="submit" class="btn btn-primary">
                <i class="bi bi-send"></i> Enviar
            </button>
        </div>
    </form>

    <p class="mt-3 text-center">
        ¿No encuentras la categoría que necesitas?
        <a href="<%= request.getContextPath() %>/productos/agregarCategoria" class="btn btn-link">
            <i class="bi bi-plus-circle"></i> Agregar nueva categoría
        </a>
    </p>
</div>

<!-- Vincular Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
