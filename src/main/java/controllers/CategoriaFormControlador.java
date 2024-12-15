package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Categoria;
import repositories.CategoriaRepositoryJdbcImplement;
import service.CategoriaService;
import service.CategoriaServiceJdbcImplement;
import service.ServiceJdbcException;

import java.io.IOException;
import java.sql.Connection;
import java.util.Optional;

@WebServlet("/categoria/form")
public class CategoriaFormControlador extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");
        CategoriaService service = new CategoriaServiceJdbcImplement(conn);
        Long id;
        try {
            id = Long.parseLong(req.getParameter("idCategoria"));
        } catch (NumberFormatException e) {
            id = 0L;
        }

        Categoria categoria = new Categoria();
        if (id > 0) {
            Optional<Categoria> o = service.agregarPorId(id);
            if (o.isPresent()) {
                categoria = o.get();
            }
        }
        req.setAttribute("categoria", categoria);

        getServletContext().getRequestDispatcher("/formularioCategoria.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = (Connection) req.getAttribute("conn");
        CategoriaService service = new CategoriaServiceJdbcImplement(conn);

        String nombreCategoria = req.getParameter("nombreCategoria");
        int estadoCategoria = 0;  // Valor predeterminado para Desactivar

        try {
            estadoCategoria = Integer.parseInt(req.getParameter("estadoCategoria"));
        } catch (NumberFormatException e) {
            estadoCategoria = 0;  // En caso de error, mantén el valor predeterminado
        }

        Long idCategoria;
        try {
            idCategoria = Long.valueOf(req.getParameter("idCategoria"));
        } catch (NumberFormatException e) {
            idCategoria = 0L;
        }

        Categoria categoria = new Categoria();
        categoria.setIdCategoria(idCategoria);
        categoria.setNombre(nombreCategoria);
        categoria.setEstado(estadoCategoria);

        try {
            service.guardar(categoria);
        } catch (ServiceJdbcException e) {
            // Log del error o mostrar un mensaje de error adecuado
            req.setAttribute("errorMessage", "Ocurrió un error al guardar la categoría: " + e.getMessage());
            getServletContext().getRequestDispatcher("/formularioCategoria.jsp").forward(req, resp);
            return;
        }

        // Redireccionar a un listado para que no ejecute el método doPost nuevamente
        resp.sendRedirect(req.getContextPath() + "/categorias");
    }

}
