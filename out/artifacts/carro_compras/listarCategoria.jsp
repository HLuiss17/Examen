<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*, models.*" %>
<%
  List<Categoria> categoria = (List<Categoria>) request.getAttribute("categorias");
%>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Lista de Categorías</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>

<div class="container mt-4">
  <h1>Lista de Categorías</h1>

  <!-- Enlace para agregar categorías -->
  <div class="mb-3">
    <a href="${pageContext.request.contextPath}/categoria/form" class="btn btn-primary">
      <i class="bi bi-plus-circle"></i> Ingresar Categorías
    </a>
  </div>

  <!-- Tabla de Categorías -->
  <table class="table table-bordered mt-3">
    <thead>
    <tr>
      <th>ID CATEGORIA</th>
      <th>NOMBRE</th>
      <th>ESTADO</th>
      <th>OPCIONES</th>
    </tr>
    </thead>
    <tbody>
    <% for (Categoria p : categoria) { %>
    <tr>
      <td><%= p.getIdCategoria() %></td>
      <td><%= p.getNombre() %></td>
      <% if(p.getEstado() == 1) { %>
      <td>Activado</td>
      <% } else if(p.getEstado() == 0) { %>
      <td>Desactivado</td>
      <% } %>
      <td>
        <a href="<%= request.getContextPath() %>/categoria/form?idCategoria=<%= p.getIdCategoria() %>" class="btn btn-warning btn-sm">
          <i class="bi bi-pencil"></i> Editar
        </a>
      </td>
    </tr>
    <% } %>
    </tbody>
  </table>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
