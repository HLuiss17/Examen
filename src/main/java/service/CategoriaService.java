package service;

import models.Categoria;

import java.util.List;
import java.util.Optional;

public interface CategoriaService {
    List<Categoria> listar();
    //metodo para añadir
    Optional<Categoria> agregarPorId(Long idCategoria);
    //implemtamos el metodo para guardar o editar platos
    void guardar(Categoria categoria);
    //Metodo Eliminar
    void eliminar(Long idCategoria);
}
