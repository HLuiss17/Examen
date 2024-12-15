package repositories;

import models.Categoria;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoriaRepositoryJdbcImplement implements Repository<Categoria> {
    private Connection conn;

    public CategoriaRepositoryJdbcImplement(Connection conn) {
        this.conn = conn;
    }

    @Override
    public List<Categoria> listar() throws SQLException {
        String SQL ="SELECT * FROM categoria ORDER BY idcategoria ASC";
        List<Categoria> categorias = new ArrayList<>();
        try {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(SQL);
            while(rs.next()){
                Categoria categoria = getCategoria(rs);
                categorias.add(categoria);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return categorias;
    }

    @Override
    public Categoria porId(Long idCategoria) throws SQLException {
        String SQL = "SELECT * FROM categoria WHERE idcategoria =?";
        Categoria categoria=null;
        try(PreparedStatement ps = conn.prepareStatement(SQL)){
            ps.setLong(1, idCategoria);
            try(ResultSet rs = ps.executeQuery()){
                if (rs.next()){
                    categoria=getCategoria(rs);
                }
            }
        }
        return categoria;
    }

    @Override
    public void guardar(Categoria categoria) throws SQLException {
        String SQL;
        boolean isUpdate = categoria.getIdCategoria() != null && categoria.getIdCategoria() > 0;
        if (isUpdate) {
            SQL = "UPDATE categoria SET nombre = ?, estado = ? WHERE idcategoria = ?";
        } else {
            // Si el id no es null, realizamos una actualización
            SQL = "INSERT INTO categoria (nombre, estado) VALUES (?, ?)";
        }

        try (PreparedStatement ps = conn.prepareStatement(SQL)) {
            ps.setString(1, categoria.getNombre());
            ps.setInt(2, categoria.getEstado());
            // Si es una actualización, agregamos el idCategoria al final
            if (isUpdate) {
                // Parámetro adicional para la consulta de actualización
                ps.setLong(3, categoria.getIdCategoria());
            }

            ps.executeUpdate();
        }
    }

    @Override
    public void eliminar(Long id) throws SQLException {
        String sql = "DELETE FROM categoria WHERE idcategoria = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setLong(1, id);
            stmt.executeUpdate();
        }
    }

    private static Categoria getCategoria(ResultSet rs) throws SQLException {
        Categoria c = new Categoria();
        c.setIdCategoria(rs.getLong("idcategoria"));
        c.setNombre(rs.getString("nombre"));
        c.setEstado(rs.getInt("estado"));
        return c;
    }
}
