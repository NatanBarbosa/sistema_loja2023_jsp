package sistema_loja2023.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sistema_loja2023.infraestructure.exceptions.CustomException;
import sistema_loja2023.model.Fornecedor;

public class FornecedorRepository extends Conexao {

    public List<Fornecedor> listarTodos() throws CustomException {
        List<Fornecedor> listaFornecedores = new ArrayList<>();
        String query = "SELECT * FROM tb_fornecedor";

        try (Connection con = super.connect();
             PreparedStatement pst = con.prepareStatement(query);
             ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {
                Fornecedor fornecedor = new Fornecedor();
                fornecedor.setFor_codigo(rs.getInt("for_codigo"));
                fornecedor.setFor_nome(rs.getString("for_nome"));
                fornecedor.setFor_endereco(rs.getString("for_endereco"));
                fornecedor.setFor_numero(rs.getString("for_numero"));
                fornecedor.setFor_bairro(rs.getString("for_bairro"));
                fornecedor.setFor_cidade(rs.getString("for_cidade"));
                fornecedor.setFor_uf(rs.getString("for_uf"));
                fornecedor.setFor_cnpjcpf(rs.getString("for_cnpjcpf"));
                fornecedor.setFor_rgie(rs.getString("for_rgie"));
                fornecedor.setFor_telefone(rs.getString("for_telefone"));
                fornecedor.setFor_fax(rs.getString("for_fax"));
                fornecedor.setFor_celular(rs.getString("for_celular"));
                fornecedor.setFor_email(rs.getString("for_email"));

                listaFornecedores.add(fornecedor);
            }
        } catch (SQLException e) {
            throw new CustomException("Erro ao listar fornecedores", e.getMessage());
        }

        return listaFornecedores;
    }

    public Integer alterar(Fornecedor fornecedor) throws CustomException {
        String query =
                "UPDATE tb_fornecedor " +
                "SET " +
                "  for_nome = ?," +
                "  for_endereco = ?," +
                "  for_numero = ?," +
                "  for_bairro = ?," +
                "  for_cidade = ?," +
                "  for_uf = ?," +
                "  for_cnpjcpf = ?," +
                "  for_rgie = ?," +
                "  for_telefone = ?," +
                "  for_fax = ?," +
                "  for_celular = ?," +
                "  for_email = ? " +
                "WHERE for_codigo = ?";

        try (
                Connection con = super.connect();
                PreparedStatement pst = con.prepareStatement(query)
        ) {

            pst.setString(1, fornecedor.getFor_nome());
            pst.setString(2, fornecedor.getFor_endereco());
            pst.setString(3, fornecedor.getFor_numero());
            pst.setString(4, fornecedor.getFor_bairro());
            pst.setString(5, fornecedor.getFor_cidade());
            pst.setString(6, fornecedor.getFor_uf());
            pst.setString(7, fornecedor.getFor_cnpjcpf());
            pst.setString(8, fornecedor.getFor_rgie());
            pst.setString(9, fornecedor.getFor_telefone());
            pst.setString(10, fornecedor.getFor_fax());
            pst.setString(11, fornecedor.getFor_celular());
            pst.setString(12, fornecedor.getFor_email());
            pst.setInt(13, fornecedor.getFor_codigo());

            Integer linhasAfetadas = pst.executeUpdate();

            return linhasAfetadas;
        } catch (SQLException e) {
            throw new CustomException("Erro ao atualizar fornecedor", e.getMessage());
        }
    }

    public Integer inserir(Fornecedor fornecedor) throws CustomException {
        String query = "INSERT INTO tb_fornecedor " +
                       "(for_codigo, for_nome, for_endereco, for_numero, for_bairro, for_cidade, for_uf, for_cnpjcpf, for_rgie, for_telefone, for_fax, for_celular, for_email) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = super.connect();
             PreparedStatement pst = con.prepareStatement(query)) {

            pst.setInt(1, fornecedor.getFor_codigo());
            pst.setString(2, fornecedor.getFor_nome());
            pst.setString(3, fornecedor.getFor_endereco());
            pst.setString(4, fornecedor.getFor_numero());
            pst.setString(5, fornecedor.getFor_bairro());
            pst.setString(6, fornecedor.getFor_cidade());
            pst.setString(7, fornecedor.getFor_uf());
            pst.setString(8, fornecedor.getFor_cnpjcpf());
            pst.setString(9, fornecedor.getFor_rgie());
            pst.setString(10, fornecedor.getFor_telefone());
            pst.setString(11, fornecedor.getFor_fax());
            pst.setString(12, fornecedor.getFor_celular());
            pst.setString(13, fornecedor.getFor_email());

            Integer linhasAfetadas = pst.executeUpdate();

            return linhasAfetadas;
        } catch (SQLException e) {
            if (e.getErrorCode() == 1062) {
                throw new CustomException("Esse código de fornecedor já existe", e.getMessage());
            }
            throw new CustomException("Erro ao inserir fornecedor", e.getMessage());
        }
    }

    public Fornecedor obter(Integer codigo) throws CustomException {
        String query = "SELECT * FROM tb_fornecedor WHERE for_codigo = ?";

        try (
            Connection con = super.connect();
            PreparedStatement pst = con.prepareStatement(query)
        ) {

            pst.setInt(1, codigo.intValue());

            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    Fornecedor fornecedor = new Fornecedor();
                    fornecedor.setFor_codigo(rs.getInt("for_codigo"));
                    fornecedor.setFor_nome(rs.getString("for_nome"));
                    fornecedor.setFor_endereco(rs.getString("for_endereco"));
                    fornecedor.setFor_numero(rs.getString("for_numero"));
                    fornecedor.setFor_bairro(rs.getString("for_bairro"));
                    fornecedor.setFor_cidade(rs.getString("for_cidade"));
                    fornecedor.setFor_uf(rs.getString("for_uf"));
                    fornecedor.setFor_cnpjcpf(rs.getString("for_cnpjcpf"));
                    fornecedor.setFor_rgie(rs.getString("for_rgie"));
                    fornecedor.setFor_telefone(rs.getString("for_telefone"));
                    fornecedor.setFor_fax(rs.getString("for_fax"));
                    fornecedor.setFor_celular(rs.getString("for_celular"));
                    fornecedor.setFor_email(rs.getString("for_email"));

                    return fornecedor;
                }
                return null;
            }
        } catch (SQLException e) {
            throw new CustomException("Erro ao obter fornecedor", e.getMessage());
        }
    }

    public Integer excluir(Integer codigo) throws CustomException {
        String query = "DELETE FROM tb_fornecedor WHERE for_codigo = ?";

        try (
            Connection con = super.connect();
            PreparedStatement pst = con.prepareStatement(query)
        ) {

            pst.setInt(1, codigo);

            Integer linhasAfetadas = pst.executeUpdate();
            return linhasAfetadas;
        } catch (SQLException e) {
            throw new CustomException("Erro ao excluir fornecedor", e.getMessage());
        }
    }
}
