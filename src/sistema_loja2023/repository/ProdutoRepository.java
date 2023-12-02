package sistema_loja2023.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sistema_loja2023.infraestructure.exceptions.CustomException;
import sistema_loja2023.model.Produto;

public class ProdutoRepository extends Conexao {  

    public List<Produto> listarTodos() throws CustomException {
        List<Produto> listaProdutos = new ArrayList<>();
        String query = "SELECT * FROM tb_produtos";
    
        try (Connection con = super.connect();
             PreparedStatement pst = con.prepareStatement(query);
             ResultSet rs = pst.executeQuery()) {
    
            while (rs.next()) {
                Produto produto = new Produto();
                produto.setPro_codigo(rs.getInt("pro_codigo"));
                produto.setPro_descricao(rs.getString("pro_descricao"));
                produto.setTtp_codigo(rs.getInt("tpp_codigo"));
                produto.setPro_precocusto(rs.getFloat("pro_precocusto"));
                produto.setPro_precovenda(rs.getFloat("pro_precovenda"));
                produto.setPro_estoque(rs.getFloat("pro_estoque"));
                produto.setPro_embalagem(rs.getString("pro_embalagem"));
                produto.setPro_ipi(rs.getFloat("pro_ipi"));
    
                listaProdutos.add(produto);
            }
        } catch (SQLException e) {
            throw new CustomException("Erro ao listar produtos");
        }
    
        return listaProdutos;
    }

    public int alterar (Produto produto) throws CustomException {
        String query = 
            "UPDATE tb_produtos " +
            "SET " +
            "  pro_descricao = ?," +
            "  tpp_codigo = ?," +
            "  pro_precocusto = ?," +
            "  pro_precovenda = ?," +
            "  pro_estoque = ?," +
            "  pro_embalagem = ?," +
            "  pro_ipi = ? " +
            "WHERE pro_codigo = ?";

        try (
                Connection con = super.connect();
                PreparedStatement pst = con.prepareStatement(query)
            ) {

            pst.setString(1, produto.getPro_descricao());
            pst.setInt(2, produto.getTtp_codigo());
            pst.setDouble(3, produto.getPro_precocusto());
            pst.setDouble(4, produto.getPro_precovenda());
            pst.setDouble(5, produto.getPro_estoque());
            pst.setString(6, produto.getPro_embalagem());
            pst.setDouble(7, produto.getPro_ipi());
            pst.setInt(8, produto.getPro_codigo());

            int linhasAfetadas = pst.executeUpdate();

            return linhasAfetadas;
        } catch (SQLException e) {
            throw new CustomException("Erro ao atualizar produto", e.getErrorCode() + e.getMessage());
        }

    }

    public int inserir (Produto produto) throws CustomException {
        String query = "INSERT INTO tb_produtos " +
                       "(pro_codigo, pro_descricao, tpp_codigo, pro_precocusto, pro_precovenda, pro_estoque, pro_embalagem, pro_ipi) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    
        try (Connection con = super.connect();
             PreparedStatement pst = con.prepareStatement(query)) {
    
            pst.setInt(1, produto.getPro_codigo());
            pst.setString(2, produto.getPro_descricao());
            pst.setInt(3, produto.getTtp_codigo());
            pst.setDouble(4, produto.getPro_precocusto());
            pst.setDouble(5, produto.getPro_precovenda());
            pst.setDouble(6, produto.getPro_estoque());
            pst.setString(7, produto.getPro_embalagem());
            pst.setDouble(8, produto.getPro_ipi());
    
            int linhasAfetadas = pst.executeUpdate();
    
            return linhasAfetadas;
        } catch (SQLException e) {
            if(e.getErrorCode() == 1062) {
                throw new CustomException("Esse código de produto já existe");
            }
            throw new CustomException("Erro ao inserir produto", e.getMessage() + "");
        }
    }
    
    public Produto obter(int codigo) throws CustomException {
        String query = "SELECT * FROM tb_produtos WHERE pro_codigo = ?";
    
        try (
            Connection con = super.connect();
            PreparedStatement pst = con.prepareStatement(query)
            ) {
    
            pst.setInt(1, codigo);
    
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    Produto produto = new Produto();
                    produto.setPro_codigo(rs.getInt("pro_codigo"));
                    produto.setPro_descricao(rs.getString("pro_descricao"));
                    produto.setTtp_codigo(rs.getInt("tpp_codigo"));
                    produto.setPro_precocusto(rs.getFloat("pro_precocusto"));
                    produto.setPro_precovenda(rs.getFloat("pro_precovenda"));
                    produto.setPro_estoque(rs.getFloat("pro_estoque"));
                    produto.setPro_embalagem(rs.getString("pro_embalagem"));
                    produto.setPro_ipi(rs.getFloat("pro_ipi"));

                    return produto;
                }
                return null; 
            }
        } catch (SQLException e) {
            throw new CustomException("Erro ao obter produto");
        }
    }
    
    public int excluir(int codigo) throws CustomException {
        String query = "DELETE FROM tb_produtos WHERE pro_codigo = ?";
    
        try (
            Connection con = super.connect();
            PreparedStatement pst = con.prepareStatement(query)
            ) {
    
            pst.setInt(1, codigo);
    
            int linhasAfetadas = pst.executeUpdate();
            return linhasAfetadas;
        } catch (SQLException e) {
            throw new CustomException("Erro ao excluir produto", e.getErrorCode() + " " + e.getMessage());
        }
    }
    
}
