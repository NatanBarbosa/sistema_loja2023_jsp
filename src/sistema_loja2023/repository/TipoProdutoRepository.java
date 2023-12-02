package sistema_loja2023.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sistema_loja2023.infraestructure.exceptions.CustomException;
import sistema_loja2023.model.TipoProduto;

public class TipoProdutoRepository extends Conexao {  

    public List<TipoProduto> listarTodos() throws CustomException {
        List<TipoProduto> listaTipoProdutos = new ArrayList<>();
        String query = "SELECT * FROM tb_tipoproduto";
    
        try (Connection con = super.connect();
             PreparedStatement pst = con.prepareStatement(query);
             ResultSet rs = pst.executeQuery()) {
    
            while (rs.next()) {
                TipoProduto tipoProduto = new TipoProduto();
                tipoProduto.setTpp_codigo(rs.getInt("tpp_codigo"));
                tipoProduto.setTpp_descricao(rs.getString("tpp_descricao"));
    
                listaTipoProdutos.add(tipoProduto);
            }
        } catch (SQLException e) {
            throw new CustomException("Erro ao listar tipoProdutos");
        }
    
        return listaTipoProdutos;
    }

    public int alterar (TipoProduto tipoProduto) throws CustomException {
        String query = 
            "UPDATE tb_tipoproduto " +
            "SET " +
            "  tpp_descricao = ? " +
            "WHERE tpp_codigo = ?";

        try (
                Connection con = super.connect();
                PreparedStatement pst = con.prepareStatement(query)
            ) {

            pst.setInt(1, tipoProduto.getTpp_codigo());
            pst.setString(2, tipoProduto.getTpp_descricao());

            int linhasAfetadas = pst.executeUpdate();

            return linhasAfetadas;
        } catch (SQLException e) {
            throw new CustomException("Erro ao atualizar Tipo Produto", e.getErrorCode() + e.getMessage());
        }

    }

    public int inserir (TipoProduto tipoProduto) throws CustomException {
        String query = "INSERT INTO tb_tipoproduto " +
                       "(tpp_codigo, tpp_descricao) " +
                       "VALUES (?, ?)";
    
        try (Connection con = super.connect();
            PreparedStatement pst = con.prepareStatement(query)) {
    
            pst.setInt(1, tipoProduto.getTpp_codigo());
            pst.setString(2, tipoProduto.getTpp_descricao());
    
            int linhasAfetadas = pst.executeUpdate();
    
            return linhasAfetadas;
        } catch (SQLException e) {
            if(e.getErrorCode() == 1062) {
                throw new CustomException("Esse código de Tipo Produto já existe");
            }
            throw new CustomException("Erro ao inserir Tipo Produto", e.getMessage() + "");
        }
    }
    
    public TipoProduto obter(int codigo) throws CustomException {
        String query = "SELECT * FROM tb_tipoproduto WHERE tpp_codigo = ?";
    
        try (
            Connection con = super.connect();
            PreparedStatement pst = con.prepareStatement(query)
            ) {
    
            pst.setInt(1, codigo);
    
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    TipoProduto tipoProduto = new TipoProduto();
                    tipoProduto.setTpp_codigo(rs.getInt("tpp_codigo"));
                    tipoProduto.setTpp_descricao(rs.getString("tpp_descricao"));

                    return tipoProduto;
                }
                return null; 
            }
        } catch (SQLException e) {
            throw new CustomException("Erro ao obter Tipo Produto");
        }
    }
    
    public int excluir(int codigo) throws CustomException {
        String query = "DELETE FROM tb_tipoproduto WHERE tpp_codigo = ?";
    
        try (
            Connection con = super.connect();
            PreparedStatement pst = con.prepareStatement(query)
            ) {
    
            pst.setInt(1, codigo);
    
            int linhasAfetadas = pst.executeUpdate();
            return linhasAfetadas;
        } catch (SQLException e) {
            throw new CustomException("Erro ao excluir Tipo Produto", e.getErrorCode() + " " + e.getMessage());
        }
    }
    
}
