package sistema_loja2023.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sistema_loja2023.infraestructure.exceptions.CustomException;
import sistema_loja2023.model.NotaFiscal;

public class NotaFiscalRepository extends Conexao {

    public Integer inserir(NotaFiscal notaFiscal) throws CustomException {
        String query = "INSERT INTO tb_notafiscal (nf_codigo, nf_valornf, nf_taxaimpostonf, nf_valorimposto) VALUES (?, ?, ?, ?)";
       
        try ( Connection con = super.connect();
             PreparedStatement statement = con.prepareStatement(query)
             ) {
            statement.setInt(1, notaFiscal.getNf_codigo());
            statement.setDouble(2, notaFiscal.getNf_valornf());
            statement.setDouble(3, notaFiscal.getNf_taxaimpostonf());
            statement.setDouble(4, notaFiscal.getNf_valorimposto());

            return statement.executeUpdate();
        } catch (SQLException e) {
            throw new CustomException("Erro ao inserir Nota Fiscal no banco de dados.", e.getMessage());
        }
    }

    public Integer alterar(NotaFiscal notaFiscal) throws CustomException {
        String query = "UPDATE tb_notafiscal SET nf_valornf = ?, nf_taxaimpostonf = ?, nf_valorimposto = ? WHERE nf_codigo = ?";
        try (
                Connection con = super.connect();
                PreparedStatement statement = con.prepareStatement(query)
        ) {
            statement.setDouble(1, notaFiscal.getNf_valornf());
            statement.setDouble(2, notaFiscal.getNf_taxaimpostonf());
            statement.setDouble(3, notaFiscal.getNf_valorimposto());
            statement.setInt(4, notaFiscal.getNf_codigo());

            return statement.executeUpdate();
        } catch (SQLException e) {
            throw new CustomException("Erro ao alterar Nota Fiscal no banco de dados.", e.getMessage());
        }
    }

    public NotaFiscal obter(Integer codigo) throws CustomException {
        String query = "SELECT * FROM tb_notafiscal WHERE nf_codigo = ?";
         try (
                Connection con = super.connect();
                PreparedStatement statement = con.prepareStatement(query)
        ) {
            statement.setInt(1, codigo);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    NotaFiscal notaFiscal = new NotaFiscal();
                    notaFiscal.setNf_codigo(resultSet.getInt("nf_codigo"));
                    notaFiscal.setNf_valornf(resultSet.getDouble("nf_valornf"));
                    notaFiscal.setNf_taxaimpostonf(resultSet.getDouble("nf_taxaimpostonf"));
                    notaFiscal.setNf_valorimposto(resultSet.getDouble("nf_valorimposto"));

                    return notaFiscal;
                }
                return null;
            }
        } catch (SQLException e) {
            throw new CustomException("Erro ao obter Nota Fiscal do banco de dados.", e.getMessage());
        }
    }

    public Integer excluir(Integer codigo) throws CustomException {
        String query = "DELETE FROM tb_notafiscal WHERE nf_codigo = ?";
        try (
                Connection con = super.connect();
                PreparedStatement statement = con.prepareStatement(query)
        ) {
            statement.setInt(1, codigo);

            return statement.executeUpdate();
        } catch (SQLException e) {
            throw new CustomException("Erro ao excluir Nota Fiscal do banco de dados.", e.getMessage());
        }
    }

    public List<NotaFiscal> listarTodos() throws CustomException {
        List<NotaFiscal> notasFiscais = new ArrayList<>();
        String query = "SELECT * FROM tb_notafiscal";
        try (Connection con = super.connect();
             PreparedStatement pst = con.prepareStatement(query);
             ResultSet resultSet = pst.executeQuery()) {

            while (resultSet.next()) {
                NotaFiscal notaFiscal = new NotaFiscal();
                notaFiscal.setNf_codigo(resultSet.getInt("nf_codigo"));
                notaFiscal.setNf_valornf(resultSet.getDouble("nf_valornf"));
                notaFiscal.setNf_taxaimpostonf(resultSet.getDouble("nf_taxaimpostonf"));
                notaFiscal.setNf_valorimposto(resultSet.getDouble("nf_valorimposto"));

                notasFiscais.add(notaFiscal);
            }
        } catch (SQLException e) {
            throw new CustomException("Erro ao listar Notas Fiscais do banco de dados.", e.getMessage());
        }

        return notasFiscais;
    }
}
