<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Login</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h1 class="text-center mb-4">Formulario de Login</h1>

    <!-- Formulario de login -->
    <form action="/carro_compras/login" method="post" class="border p-4 rounded shadow">

        <!-- Campo de Username -->
        <div class="mb-3">
            <label for="username" class="form-label">
                <i class="bi bi-person-circle"></i> Username
            </label>
            <input type="text" name="username" id="username" class="form-control" required>
        </div>

        <!-- Campo de Password -->
        <div class="mb-3">
            <label for="password" class="form-label">
                <i class="bi bi-key"></i> Password
            </label>
            <input type="password" name="password" id="password" class="form-control" required>
        </div>

        <!-- Botón de Submit -->
        <div class="d-flex justify-content-center">
            <input type="submit" value="Enviar" class="btn btn-primary w-50">
        </div>

    </form>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
