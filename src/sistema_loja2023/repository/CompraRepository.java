package sistema_loja2023.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sistema_loja2023.infraestructure.exceptions.CustomException;
import sistema_loja2023.model.Compra;

public class CompraRepository extends Conexao {  

    public List<Compra> listarTodos() throws CustomException {
        List<Compra> listaCompras = new ArrayList<>();
        String query = "SELECT * FROM tb_compras";
    
        try (Connection con = super.connect();
             PreparedStatement pst = con.prepareStatement(query);
             ResultSet rs = pst.executeQuery()) {
    
            while (rs.next()) {
                Compra compra = new Compra();
                compra.setCom_codigo(rs.getInt("com_codigo"));
                compra.setTpg_codigo(rs.getInt("tpg_codigo"));
                compra.setFor_codigo(rs.getInt("for_codigo"));
                compra.setNf_codigo(rs.getInt("nf_codigo"));
                compra.setCom_datacompra(rs.getString("com_datacompra"));
                compra.setCom_valortotal(rs.getString("com_valortotal"));
                compra.setCom_observacoes(rs.getString("com_observacoes"));
    
                listaCompras.add(compra);
            }
        } catch (SQLException e) {
            throw new CustomException("Erro ao listar compras");
        }
    
        return listaCompras;
    }

    public int alterar (Compra compra) throws CustomException {
        String query = 
            "UPDATE tb_compras " +
            "SET " +
            "  tpg_codigo = ?," +
            "  for_codigo = ?," +
            "  nf_codigo = ?," +
            "  com_datacompra = ?," +
            "  com_valortotal = ?," +
            "  com_observacoes = ? " +
            "WHERE com_codigo = ?";

        try (
                Connection con = super.connect();
                PreparedStatement pst = con.prepareStatement(query)
            ) {

            pst.setInt(1, compra.getTpg_codigo());
            pst.setInt(2, compra.getFor_codigo());
            pst.setInt(3, compra.getNf_codigo());
            pst.setString(4, compra.getCom_datacompra());
            pst.setString(5, compra.getCom_valortotal());
            pst.setString(6, compra.getCom_observacoes());
            pst.setInt(7, compra.getCom_codigo());

            int linhasAfetadas = pst.executeUpdate();

            return linhasAfetadas;
        } catch (SQLException e) {
            throw new CustomException("Erro ao atualizar compra", e.getErrorCode() + e.getMessage());
        }

    }

    public int inserir (Compra compra) throws CustomException {
        String query = "INSERT INTO tb_compras " +
                       "(com_codigo, tpg_codigo, for_codigo, nf_codigo, com_datacompra, com_valortotal, com_observacoes) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?)";
    
        try (Connection con = super.connect();
             PreparedStatement pst = con.prepareStatement(query)) {
    
            pst.setInt(1, compra.getCom_codigo());
            pst.setInt(2, compra.getTpg_codigo());
            pst.setInt(3, compra.getFor_codigo());
            pst.setInt(4, compra.getNf_codigo());
            pst.setString(5, compra.getCom_datacompra());
            pst.setString(6, compra.getCom_valortotal());
            pst.setString(7, compra.getCom_observacoes());
    
            int linhasAfetadas = pst.executeUpdate();
    
            return linhasAfetadas;
        } catch (SQLException e) {
            if(e.getErrorCode() == 1062) {
                throw new CustomException("Esse código de compra já existe");
            }
            throw new CustomException("Erro ao inserir compra", e.getMessage() + "");
        }
    }
    
    public Compra obter(int codigo) throws CustomException {
        String query = "SELECT * FROM tb_compras WHERE com_codigo = ?";
    
        try (
            Connection con = super.connect();
            PreparedStatement pst = con.prepareStatement(query)
            ) {
    
            pst.setInt(1, codigo);
    
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    Compra compra = new Compra();
                    compra.setCom_codigo(rs.getInt("com_codigo"));
                    compra.setTpg_codigo(rs.getInt("tpg_codigo"));
                    compra.setFor_codigo(rs.getInt("for_codigo"));
                    compra.setNf_codigo(rs.getInt("nf_codigo"));
                    compra.setCom_datacompra(rs.getString("com_datacompra"));
                    compra.setCom_valortotal(rs.getString("com_valortotal"));
                    compra.setCom_observacoes(rs.getString("com_observacoes"));

                    return compra;
                }
                return null; 
            }
        } catch (SQLException e) {
            throw new CustomException("Erro ao obter compra");
        }
    }
    
    public int excluir(int codigo) throws CustomException {
        String query = "DELETE FROM tb_compras WHERE com_codigo = ?";
    
        try (
            Connection con = super.connect();
            PreparedStatement pst = con.prepareStatement(query)
            ) {
    
            pst.setInt(1, codigo);
    
            int linhasAfetadas = pst.executeUpdate();
            return linhasAfetadas;
        } catch (SQLException e) {
            throw new CustomException("Erro ao excluir compra", e.getErrorCode() + " " + e.getMessage());
        }
    }
    
}
