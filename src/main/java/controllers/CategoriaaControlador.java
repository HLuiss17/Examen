package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Categoria;
import service.CategoriaService;
import service.CategoriaServiceJdbcImplement;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet ("/categorias")
public class CategoriaaControlador extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //llamamos alaconeccion bbdd
        Connection conn = (Connection) req.getAttribute("conn");
        //creamos el obejeto
        CategoriaService service = new CategoriaServiceJdbcImplement(conn);
        List<Categoria> categoria = service.listar();
        req.setAttribute("categorias",categoria);
        //Direccionamos la vista
        getServletContext().getRequestDispatcher("/listarCategoria.jsp").forward(req,resp);
    }
}
