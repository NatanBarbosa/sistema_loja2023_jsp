package sistema_loja2023.repository;

import sistema_loja2023.infraestructure.exceptions.CustomException;
import sistema_loja2023.model.ContaPagar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContaPagarRepository extends Conexao {

    public Integer inserir(ContaPagar contaPagar) throws CustomException {
        String query = "INSERT INTO tb_contapagar (cp_codigo, cp_valorconta, cp_datavencimento, cp_datapagamento, nf_codigo, cp_observacoes) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = super.connect();
             PreparedStatement statement = con.prepareStatement(query)
        ) {
            statement.setInt(1, contaPagar.getCp_codigo());
            statement.setDouble(2, contaPagar.getCp_valorconta());
            statement.setDate(3, contaPagar.getCp_datavencimento());
            statement.setDate(4, contaPagar.getCp_datapagamento());
            statement.setInt(5, contaPagar.getNf_codigo());
            statement.setString(6, contaPagar.getCp_observacoes());

            return statement.executeUpdate();
        } catch (SQLException e) {
            throw new CustomException("Erro ao inserir Conta a Pagar no banco de dados.", e.getMessage());
        }
    }

    public Integer alterar(ContaPagar contaPagar) throws CustomException {
        String query = "UPDATE tb_contapagar SET cp_valorconta = ?, cp_datavencimento = ?, cp_datapagamento = ?, nf_codigo = ?, cp_observacoes = ? WHERE cp_codigo = ?";
        try (
                Connection con = super.connect();
                PreparedStatement statement = con.prepareStatement(query)
        ) {
            statement.setDouble(1, contaPagar.getCp_valorconta());
            statement.setDate(2, contaPagar.getCp_datavencimento());
            statement.setDate(3, contaPagar.getCp_datapagamento());
            statement.setInt(4, contaPagar.getNf_codigo());
            statement.setString(5, contaPagar.getCp_observacoes());
            statement.setInt(6, contaPagar.getCp_codigo());

            return statement.executeUpdate();
        } catch (SQLException e) {
            throw new CustomException("Erro ao alterar Conta a Pagar no banco de dados.", e.getMessage());
        }
    }

    public ContaPagar obter(Integer codigo) throws CustomException {
        String query = "SELECT * FROM tb_contapagar WHERE cp_codigo = ?";
        try (
                Connection con = super.connect();
                PreparedStatement statement = con.prepareStatement(query)
        ) {
            statement.setInt(1, codigo);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    ContaPagar contaPagar = new ContaPagar();
                    contaPagar.setCp_codigo(resultSet.getInt("cp_codigo"));
                    contaPagar.setCp_valorconta(resultSet.getDouble("cp_valorconta"));
                    contaPagar.setCp_datavencimento(resultSet.getDate("cp_datavencimento"));
                    contaPagar.setCp_datapagamento(resultSet.getDate("cp_datapagamento"));
                    contaPagar.setNf_codigo(resultSet.getInt("nf_codigo"));
                    contaPagar.setCp_observacoes(resultSet.getString("cp_observacoes"));

                    return contaPagar;
                }
                return null;
            }
        } catch (SQLException e) {
            throw new CustomException("Erro ao obter Conta a Pagar do banco de dados.", e.getMessage());
        }
    }

    public Integer excluir(Integer codigo) throws CustomException {
        String query = "DELETE FROM tb_contapagar WHERE cp_codigo = ?";
        try (
                Connection con = super.connect();
                PreparedStatement statement = con.prepareStatement(query)
        ) {
            statement.setInt(1, codigo);

            return statement.executeUpdate();
        } catch (SQLException e) {
            throw new CustomException("Erro ao excluir Conta a Pagar do banco de dados.", e.getMessage());
        }
    }

    public List<ContaPagar> listarTodos() throws CustomException {
        List<ContaPagar> contasPagar = new ArrayList<>();
        String query = "SELECT * FROM tb_contapagar";
        try (Connection con = super.connect();
             PreparedStatement pst = con.prepareStatement(query);
             ResultSet resultSet = pst.executeQuery()) {

            while (resultSet.next()) {
                ContaPagar contaPagar = new ContaPagar();
                contaPagar.setCp_codigo(resultSet.getInt("cp_codigo"));
                contaPagar.setCp_valorconta(resultSet.getDouble("cp_valorconta"));
                contaPagar.setCp_datavencimento(resultSet.getDate("cp_datavencimento"));
                contaPagar.setCp_datapagamento(resultSet.getDate("cp_datapagamento"));
                contaPagar.setNf_codigo(resultSet.getInt("nf_codigo"));
                contaPagar.setCp_observacoes(resultSet.getString("cp_observacoes"));

                contasPagar.add(contaPagar);
            }
        } catch (SQLException e) {
            throw new CustomException("Erro ao listar Contas a Pagar do banco de dados.", e.getMessage());
        }

        return contasPagar;
    }
}
