<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,models.*" %>
<%
    Categoria categoria = (Categoria) request.getAttribute("categoria");
%>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ingreso de Categorías</title>
    <!-- Vincular Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Vincular íconos de Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center mb-4">Ingreso de Categorías</h1>

    <form action="<%= request.getContextPath() %>/categoria/form" method="post" class="needs-validation" novalidate>

        <div class="mb-3">
            <label for="nombreCategoria" class="form-label">Ingrese el nombre de la categoría</label>
            <input type="hidden" name="idCategoria" value="<%= categoria.getIdCategoria() %>">
            <input type="text" id="nombreCategoria" name="nombreCategoria" class="form-control"
                   value="<%= categoria.getNombre() != null ? categoria.getNombre() : "" %>" required>
            <div class="invalid-feedback">Por favor, ingrese un nombre de categoría válido.</div>
        </div>

        <div class="mb-3">
            <label for="estadoCategoria" class="form-label">Estado</label>
            <select name="estadoCategoria" id="estadoCategoria" class="form-select">
                <option value="0" <%= categoria.getEstado() != null && categoria.getEstado() == 0 ? "selected" : "" %>>Desactivar</option>
                <option value="1" <%= categoria.getEstado() != null && categoria.getEstado() == 1 ? "selected" : "" %>>Activar</option>
            </select>
        </div>

        <div class="d-grid gap-2 col-6 mx-auto">
            <button type="submit" class="btn btn-primary">
                <i class="bi bi-save"></i> Enviar
            </button>
        </div>
    </form>
</div>

<!-- Vincular Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
