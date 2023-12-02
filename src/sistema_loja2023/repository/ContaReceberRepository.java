package sistema_loja2023.repository;

import sistema_loja2023.infraestructure.exceptions.CustomException;
import sistema_loja2023.model.ContaReceber;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContaReceberRepository extends Conexao {

    public Integer inserir(ContaReceber contaReceber) throws CustomException {
        String query = "INSERT INTO tb_contareceber (cr_codigo, cr_valorconta, cr_datavencimento, cr_datarecebimento, nf_codigo, cr_observacoes) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = super.connect();
             PreparedStatement statement = con.prepareStatement(query)
        ) {
            statement.setInt(1, contaReceber.getCr_codigo());
            statement.setDouble(2, contaReceber.getCr_valorconta());
            statement.setDate(3, contaReceber.getCr_datavencimento());
            statement.setDate(4, contaReceber.getCr_datarecebimento());
            statement.setInt(5, contaReceber.getNf_codigo());
            statement.setString(6, contaReceber.getCr_observacoes());

            return statement.executeUpdate();
        } catch (SQLException e) {
            throw new CustomException("Erro ao inserir Conta a Receber no banco de dados.", e.getMessage());
        }
    }

    public Integer alterar(ContaReceber contaReceber) throws CustomException {
        String query = "UPDATE tb_contareceber SET cr_valorconta = ?, cr_datavencimento = ?, cr_datarecebimento = ?, nf_codigo = ?, cr_observacoes = ? WHERE cr_codigo = ?";
        try (
                Connection con = super.connect();
                PreparedStatement statement = con.prepareStatement(query)
        ) {
            statement.setDouble(1, contaReceber.getCr_valorconta());
            statement.setDate(2, contaReceber.getCr_datavencimento());
            statement.setDate(3, contaReceber.getCr_datarecebimento());
            statement.setInt(4, contaReceber.getNf_codigo());
            statement.setString(5, contaReceber.getCr_observacoes());
            statement.setInt(6, contaReceber.getCr_codigo());

            return statement.executeUpdate();
        } catch (SQLException e) {
            throw new CustomException("Erro ao alterar Conta a Receber no banco de dados.", e.getMessage());
        }
    }

    public ContaReceber obter(Integer codigo) throws CustomException {
        String query = "SELECT * FROM tb_contareceber WHERE cr_codigo = ?";
        try (
                Connection con = super.connect();
                PreparedStatement statement = con.prepareStatement(query)
        ) {
            statement.setInt(1, codigo);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    ContaReceber contaReceber = new ContaReceber();
                    contaReceber.setCr_codigo(resultSet.getInt("cr_codigo"));
                    contaReceber.setCr_valorconta(resultSet.getDouble("cr_valorconta"));
                    contaReceber.setCr_datavencimento(resultSet.getDate("cr_datavencimento"));
                    contaReceber.setCr_datarecebimento(resultSet.getDate("cr_datarecebimento"));
                    contaReceber.setNf_codigo(resultSet.getInt("nf_codigo"));
                    contaReceber.setCr_observacoes(resultSet.getString("cr_observacoes"));

                    return contaReceber;
                }
                return null;
            }
        } catch (SQLException e) {
            throw new CustomException("Erro ao obter Conta a Receber do banco de dados.", e.getMessage());
        }
    }

    public Integer excluir(Integer codigo) throws CustomException {
        String query = "DELETE FROM tb_contareceber WHERE cr_codigo = ?";
        try (
                Connection con = super.connect();
                PreparedStatement statement = con.prepareStatement(query)
        ) {
            statement.setInt(1, codigo);

            return statement.executeUpdate();
        } catch (SQLException e) {
            throw new CustomException("Erro ao excluir Conta a Receber do banco de dados.", e.getMessage());
        }
    }

    public List<ContaReceber> listarTodos() throws CustomException {
        List<ContaReceber> contasReceber = new ArrayList<>();
        String query = "SELECT * FROM tb_contareceber";
        try (Connection con = super.connect();
             PreparedStatement pst = con.prepareStatement(query);
             ResultSet resultSet = pst.executeQuery()) {

            while (resultSet.next()) {
                ContaReceber contaReceber = new ContaReceber();
                contaReceber.setCr_codigo(resultSet.getInt("cr_codigo"));
                contaReceber.setCr_valorconta(resultSet.getDouble("cr_valorconta"));
                contaReceber.setCr_datavencimento(resultSet.getDate("cr_datavencimento"));
                contaReceber.setCr_datarecebimento(resultSet.getDate("cr_datarecebimento"));
                contaReceber.setNf_codigo(resultSet.getInt("nf_codigo"));
                contaReceber.setCr_observacoes(resultSet.getString("cr_observacoes"));

                contasReceber.add(contaReceber);
            }
        } catch (SQLException e) {
            throw new CustomException("Erro ao listar Contas a Receber do banco de dados.", e.getMessage());
        }

        return contasReceber;
    }
}
