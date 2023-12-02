package sistema_loja2023.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sistema_loja2023.infraestructure.exceptions.CustomException;
import sistema_loja2023.model.Funcionario;

public class FuncionarioRepository extends Conexao {

    public List<Funcionario> listarTodos() throws CustomException {
        List<Funcionario> listaFuncionarios = new ArrayList<>();
        String query = "SELECT * FROM tb_funcionario";

        try (Connection con = super.connect();
             PreparedStatement pst = con.prepareStatement(query);
             ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {
                Funcionario funcionario = new Funcionario();
                funcionario.setFun_codigo(rs.getInt("fun_codigo"));
                funcionario.setFun_nome(rs.getString("fun_nome"));
                funcionario.setFun_endereco(rs.getString("fun_endereco"));
                funcionario.setFun_numero(rs.getString("fun_numero"));
                funcionario.setFun_complemento(rs.getString("fun_complemento"));
                funcionario.setFun_bairro(rs.getString("fun_bairro"));
                funcionario.setFun_cidade(rs.getString("fun_cidade"));
                funcionario.setFun_uf(rs.getString("fun_uf"));
                funcionario.setFun_cnpjcpf(rs.getString("fun_cnpjcpf"));
                funcionario.setFun_rgie(rs.getString("fun_rgie"));
                funcionario.setFun_sexo(rs.getString("fun_sexo").charAt(0));
                funcionario.setFun_nascimento(rs.getDate("fun_nascimento"));
                funcionario.setFun_telefone(rs.getString("fun_telefone"));
                funcionario.setFun_celular(rs.getString("fun_celular"));
                funcionario.setFun_email(rs.getString("fun_email"));
                funcionario.setFun_salario(rs.getFloat("fun_salario"));

                listaFuncionarios.add(funcionario);
            }
        } catch (SQLException e) {
            throw new CustomException("Erro ao listar funcionários", e.getMessage());
        }

        return listaFuncionarios;
    }

    public Integer alterar(Funcionario funcionario) throws CustomException {
        String query =
                "UPDATE tb_funcionario " +
                        "SET " +
                        "  fun_nome = ?," +
                        "  fun_endereco = ?," +
                        "  fun_numero = ?," +
                        "  fun_complemento = ?," +
                        "  fun_bairro = ?," +
                        "  fun_cidade = ?," +
                        "  fun_uf = ?," +
                        "  fun_cnpjcpf = ?," +
                        "  fun_rgie = ?," +
                        "  fun_sexo = ?," +
                        "  fun_nascimento = ?," +
                        "  fun_telefone = ?," +
                        "  fun_celular = ?," +
                        "  fun_email = ?," +
                        "  fun_salario = ? " +
                        "WHERE fun_codigo = ?";

        try (
                Connection con = super.connect();
                PreparedStatement pst = con.prepareStatement(query)
        ) {

            pst.setString(1, funcionario.getFun_nome());
            pst.setString(2, funcionario.getFun_endereco());
            pst.setString(3, funcionario.getFun_numero());
            pst.setString(4, funcionario.getFun_complemento());
            pst.setString(5, funcionario.getFun_bairro());
            pst.setString(6, funcionario.getFun_cidade());
            pst.setString(7, funcionario.getFun_uf());
            pst.setString(8, funcionario.getFun_cnpjcpf());
            pst.setString(9, funcionario.getFun_rgie());
            pst.setString(10, String.valueOf(funcionario.getFun_sexo()));
            pst.setDate(11, funcionario.getFun_nascimento());
            pst.setString(12, funcionario.getFun_telefone());
            pst.setString(13, funcionario.getFun_celular());
            pst.setString(14, funcionario.getFun_email());
            pst.setFloat(15, funcionario.getFun_salario());
            pst.setInt(16, funcionario.getFun_codigo());

            Integer linhasAfetadas = pst.executeUpdate();

            return linhasAfetadas;
        } catch (SQLException e) {
            throw new CustomException("Erro ao atualizar funcionário", e.getMessage());
        }
    }

    public Integer inserir(Funcionario funcionario) throws CustomException {
        String query = "INSERT INTO tb_funcionario " +
                "(fun_codigo, fun_nome, fun_endereco, fun_numero, fun_complemento, fun_bairro, fun_cidade, fun_uf, fun_cnpjcpf, fun_rgie, fun_sexo, fun_nascimento, fun_telefone, fun_celular, fun_email, fun_salario) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = super.connect();
             PreparedStatement pst = con.prepareStatement(query)) {

            pst.setInt(1, funcionario.getFun_codigo());
            pst.setString(2, funcionario.getFun_nome());
            pst.setString(3, funcionario.getFun_endereco());
            pst.setString(4, funcionario.getFun_numero());
            pst.setString(5, funcionario.getFun_complemento());
            pst.setString(6, funcionario.getFun_bairro());
            pst.setString(7, funcionario.getFun_cidade());
            pst.setString(8, funcionario.getFun_uf());
            pst.setString(9, funcionario.getFun_cnpjcpf());
            pst.setString(10, funcionario.getFun_rgie());
            pst.setString(11, String.valueOf(funcionario.getFun_sexo()));
            pst.setDate(12, funcionario.getFun_nascimento());
            pst.setString(13, funcionario.getFun_telefone());
            pst.setString(14, funcionario.getFun_celular());
            pst.setString(15, funcionario.getFun_email());
            pst.setFloat(16, funcionario.getFun_salario());

            Integer linhasAfetadas = pst.executeUpdate();

            return linhasAfetadas;
        } catch (SQLException e) {
            if (e.getErrorCode() == 1062) {
                throw new CustomException("Esse código de funcionário já existe", e.getMessage());
            }
            throw new CustomException("Erro ao inserir funcionário", e.getMessage());
        }
    }

    public Funcionario obter(Integer codigo) throws CustomException {
        String query = "SELECT * FROM tb_funcionario WHERE fun_codigo = ?";

        try (
                Connection con = super.connect();
                PreparedStatement pst = con.prepareStatement(query)
        ) {

            pst.setInt(1, codigo.intValue());

            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    Funcionario funcionario = new Funcionario();
                    funcionario.setFun_codigo(rs.getInt("fun_codigo"));
                    funcionario.setFun_nome(rs.getString("fun_nome"));
                    funcionario.setFun_endereco(rs.getString("fun_endereco"));
                    funcionario.setFun_numero(rs.getString("fun_numero"));
                    funcionario.setFun_complemento(rs.getString("fun_complemento"));
                    funcionario.setFun_bairro(rs.getString("fun_bairro"));
                    funcionario.setFun_cidade(rs.getString("fun_cidade"));
                    funcionario.setFun_uf(rs.getString("fun_uf"));
                    funcionario.setFun_cnpjcpf(rs.getString("fun_cnpjcpf"));
                    funcionario.setFun_rgie(rs.getString("fun_rgie"));
                    funcionario.setFun_sexo(rs.getString("fun_sexo").charAt(0));
                    funcionario.setFun_nascimento(rs.getDate("fun_nascimento"));
                    funcionario.setFun_telefone(rs.getString("fun_telefone"));
                    funcionario.setFun_celular(rs.getString("fun_celular"));
                    funcionario.setFun_email(rs.getString("fun_email"));
                    funcionario.setFun_salario(rs.getFloat("fun_salario"));

                    return funcionario;
                } else {
                    return null;
                }
            }

        } catch (SQLException e) {
            throw new CustomException("Erro ao obter funcionário", e.getMessage());
        }
    }

    public Integer excluir(Integer codigo) throws CustomException {
        String query = "DELETE FROM tb_funcionario WHERE fun_codigo = ?";

        try (
                Connection con = super.connect();
                PreparedStatement pst = con.prepareStatement(query)
        ) {

            pst.setInt(1, codigo.intValue());

            Integer linhasAfetadas = pst.executeUpdate();

            return linhasAfetadas;
        } catch (SQLException e) {
            throw new CustomException("Erro ao excluir funcionário", e.getMessage());
        }
    }
}
