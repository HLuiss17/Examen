package service;

import models.Categoria;
import repositories.CategoriaRepositoryJdbcImplement;
import repositories.Repository;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public class CategoriaServiceJdbcImplement implements CategoriaService{

    private Repository<Categoria> repositoryJdbc;
    // Creamos un constructor
    public CategoriaServiceJdbcImplement(Connection connection) {
        this.repositoryJdbc = new CategoriaRepositoryJdbcImplement(connection);
    }
    @Override
    public List<Categoria> listar() {
        try {
            return repositoryJdbc.listar();
        } catch (SQLException throwables) {
            throw new ServiceJdbcException(throwables.getMessage(), throwables.getCause());
        }
    }

    @Override
    public Optional<Categoria> agregarPorId(Long idCategoria) {
        try {
            return Optional.ofNullable(repositoryJdbc.porId(idCategoria));
        }catch (SQLException throwables){
            throw new ServiceJdbcException(throwables.getMessage(),throwables.getCause());
        }
    }

    @Override
    public void guardar(Categoria categoria) {
        try {
            repositoryJdbc.guardar(categoria);
        } catch (SQLException throwables) {
            // Imprimir la excepción para los logs
            throwables.printStackTrace();
            // Lanzar una excepción personalizada para el servicio
            throw new ServiceJdbcException("Error al guardar la categoría: " + throwables.getMessage(), throwables);
        }
    }


    @Override
    public void eliminar(Long idCategoria) {
        try{
            repositoryJdbc.eliminar(idCategoria);
        }catch (SQLException throwables){
            throw new ServiceJdbcException(throwables.getMessage(), throwables.getCause());

        }

    }
}
