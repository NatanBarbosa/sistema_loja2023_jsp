package sistema_loja2023.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sistema_loja2023.infraestructure.exceptions.CustomException;
import sistema_loja2023.model.TipoPagto;

public class TipoPagtoRepository extends Conexao {  

    public List<TipoPagto> listarTodos() throws CustomException {
        List<TipoPagto> listaTipoPagtos = new ArrayList<>();
        String query = "SELECT * FROM tb_tipopagto";
    
        try (Connection con = super.connect();
             PreparedStatement pst = con.prepareStatement(query);
             ResultSet rs = pst.executeQuery()) {
    
            while (rs.next()) {
                TipoPagto tipoPagto = new TipoPagto();
                tipoPagto.setTpg_codigo(rs.getInt("tpg_codigo"));
                tipoPagto.setTpg_descricao(rs.getString("tpg_descricao"));
                tipoPagto.setTpg_qtde(rs.getInt("tpg_qtde"));
                tipoPagto.setTpg_ativo(rs.getString("tpg_ativo"));
    
                listaTipoPagtos.add(tipoPagto);
            }
        } catch (SQLException e) {
            throw new CustomException("Erro ao listar tipoPagtos");
        }
    
        return listaTipoPagtos;
    }

    public int alterar (TipoPagto tipoPagto) throws CustomException {
        String query = 
            "UPDATE tb_tipopagto " +
            "SET " +
            "  tpg_descricao = ?, " +
            "  tpg_qtde = ?, " +
            "  tpg_ativo = ? " +
            " WHERE tpg_codigo = ?";

        try (
                Connection con = super.connect();
                PreparedStatement pst = con.prepareStatement(query)
            ) {

            pst.setInt(4, tipoPagto.getTpg_codigo());
            pst.setString(1, tipoPagto.getTpg_descricao());
            pst.setInt(2, tipoPagto.getTpg_qtde());
            pst.setString(3, tipoPagto.getTpg_ativo());

            int linhasAfetadas = pst.executeUpdate();

            return linhasAfetadas;
        } catch (SQLException e) {
            throw new CustomException("Erro ao atualizar Tipo Pagtos", e.getErrorCode() + e.getMessage());
        }

    }

    public int inserir (TipoPagto tipoPagto) throws CustomException {
        String query = "INSERT INTO tb_tipopagto " +
                       "(tpg_codigo, tpg_descricao, tpg_qtde, tpg_ativo) " +
                       "VALUES (?, ?, ?, ?)";
    
        try (Connection con = super.connect();
            PreparedStatement pst = con.prepareStatement(query)) {
    
            pst.setInt(1, tipoPagto.getTpg_codigo());
            pst.setString(2, tipoPagto.getTpg_descricao());
            pst.setInt(3, tipoPagto.getTpg_qtde());
            pst.setString(4, tipoPagto.getTpg_ativo());
    
            int linhasAfetadas = pst.executeUpdate();
    
            return linhasAfetadas;
        } catch (SQLException e) {
            if(e.getErrorCode() == 1062) {
                throw new CustomException("Esse código de Tipo Pagamento já existe");
            }
            throw new CustomException("Erro ao inserir Tipo Pagamento", e.getMessage() + "");
        }
    }
    
    public TipoPagto obter(int codigo) throws CustomException {
        String query = "SELECT * FROM tb_tipopagto WHERE tpg_codigo = ?";
    
        try (
            Connection con = super.connect();
            PreparedStatement pst = con.prepareStatement(query)
            ) {
    
            pst.setInt(1, codigo);
    
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    TipoPagto tipoPagto = new TipoPagto();
                    tipoPagto.setTpg_codigo(rs.getInt("tpg_codigo"));
                    tipoPagto.setTpg_descricao(rs.getString("tpg_descricao"));
                    tipoPagto.setTpg_qtde(rs.getInt("tpg_qtde"));
                    tipoPagto.setTpg_ativo(rs.getString("tpg_ativo"));

                    return tipoPagto;
                }
                return null;
            }
        } catch (SQLException e) {
            throw new CustomException("Erro ao obter Tipo Pagamento");
        }
    }
    
    public int excluir(int codigo) throws CustomException {
        String query = "DELETE FROM tb_tipopagto WHERE tpg_codigo = ?";
    
        try (
            Connection con = super.connect();
            PreparedStatement pst = con.prepareStatement(query)
            ) {
    
            pst.setInt(1, codigo);
    
            int linhasAfetadas = pst.executeUpdate();
            return linhasAfetadas;
        } catch (SQLException e) {
            throw new CustomException("Erro ao excluir Tipo Pagamento", e.getErrorCode() + " " + e.getMessage());
        }
    }
    
}
