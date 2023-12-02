package sistema_loja2023.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sistema_loja2023.infraestructure.exceptions.CustomException;
import sistema_loja2023.model.ItensVenda;

public class ItensVendaRepository extends Conexao {  

    public List<ItensVenda> listarTodos() throws CustomException {
        List<ItensVenda> listaItensVendas = new ArrayList<>();
        String query = "SELECT * FROM tb_itensvenda";
    
        try (Connection con = super.connect();
             PreparedStatement pst = con.prepareStatement(query);
             ResultSet rs = pst.executeQuery()) {
    
            while (rs.next()) {
                ItensVenda itensVenda = new ItensVenda();
                itensVenda.setItv_codigo(rs.getInt("itv_codigo"));
                itensVenda.setVen_codigo(rs.getInt("ven_codigo"));
                itensVenda.setTpg_codigo(rs.getInt("tpg_codigo"));
                itensVenda.setFun_codigo(rs.getInt("fun_codigo"));
                itensVenda.setNf_codigo(rs.getInt("nf_codigo"));
                itensVenda.setTpp_codigo(rs.getInt("tpp_codigo"));
                itensVenda.setPro_codigo(rs.getInt("pro_codigo"));
                itensVenda.setItv_embalagem(rs.getString("itv_embalagem"));
                itensVenda.setItv_qtde(rs.getFloat("itv_qtde"));
                itensVenda.setItv_valorun(rs.getFloat("itv_valorun"));
                itensVenda.setItv_valortotal(rs.getFloat("itv_valortotal"));
                itensVenda.setItv_desc(rs.getString("itv_desc"));
    
                listaItensVendas.add(itensVenda);
            }
        } catch (SQLException e) {
            throw new CustomException("Erro ao listar itens venda");
        }
    
        return listaItensVendas;
    }

    public int alterar (ItensVenda itemCompra) throws CustomException {
        String query = 
            "UPDATE tb_itensvenda " +
            "SET " +
            "  ven_codigo = ?," +
            "  tpg_codigo = ?," +
            "  fun_codigo = ?," +
            "  nf_codigo = ?," +
            "  tpp_codigo = ?," +
            "  pro_codigo = ?," +
            "  itv_embalagem = ?," +
            "  itv_qtde = ?," +
            "  itv_valorun = ?, " +
            "  itv_desc = ?, " +
            "  itv_valortotal = ? " +
            "WHERE itv_codigo = ?";

        try (
                Connection con = super.connect();
                PreparedStatement pst = con.prepareStatement(query)
            ) {

            pst.setInt(1, itemCompra.getVen_codigo());
            pst.setInt(2, itemCompra.getTpg_codigo());
            pst.setInt(3, itemCompra.getFun_codigo());
            pst.setInt(4, itemCompra.getNf_codigo());
            pst.setInt(5, itemCompra.getTpp_codigo());
            pst.setInt(6, itemCompra.getPro_codigo());
            pst.setString(7, itemCompra.getItv_embalagem());
            pst.setFloat(8, itemCompra.getItv_qtde());
            pst.setFloat(9, itemCompra.getItv_valorun());
            pst.setString(10, itemCompra.getItv_desc());
            pst.setFloat(11, itemCompra.getItv_valortotal());
            pst.setInt(12, itemCompra.getItv_codigo());

            int linhasAfetadas = pst.executeUpdate();

            return linhasAfetadas;
        } catch (SQLException e) {
            throw new CustomException("Erro ao atualizar Item Venda", e.getErrorCode() + e.getMessage());
        }

    }

    public int inserir (ItensVenda itemCompra) throws CustomException {
        String query = "INSERT INTO tb_itensvenda " +
                       "(itv_codigo, ven_codigo, tpg_codigo, fun_codigo, nf_codigo, tpp_codigo, pro_codigo, itv_embalagem, itv_qtde, itv_valorun, itv_desc, itv_valortotal) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    
        try (Connection con = super.connect();
             PreparedStatement pst = con.prepareStatement(query)) {
    
            pst.setInt(1, itemCompra.getItv_codigo());
            pst.setInt(2, itemCompra.getVen_codigo());
            pst.setInt(3, itemCompra.getTpg_codigo());
            pst.setInt(4, itemCompra.getFun_codigo());
            pst.setInt(5, itemCompra.getNf_codigo());
            pst.setInt(6, itemCompra.getTpp_codigo());
            pst.setInt(7, itemCompra.getPro_codigo());
            pst.setString(8, itemCompra.getItv_embalagem());
            pst.setFloat(9, itemCompra.getItv_qtde());
            pst.setFloat(10, itemCompra.getItv_valorun());
            pst.setString(11, itemCompra.getItv_desc());
            pst.setFloat(12, itemCompra.getItv_valortotal());
    
            int linhasAfetadas = pst.executeUpdate();
    
            return linhasAfetadas;
        } catch (SQLException e) {
            if(e.getErrorCode() == 1062) {
                throw new CustomException("Esse código de Item compra já existe");
            }
            throw new CustomException("Erro ao inserir Item compra", e.getMessage() + "");
        }
    }
    
    public ItensVenda obter(int codigo) throws CustomException {
        String query = "SELECT * FROM tb_itensvenda WHERE itv_codigo = ?";
    
        try (
            Connection con = super.connect();
            PreparedStatement pst = con.prepareStatement(query)
            ) {
    
            pst.setInt(1, codigo);
    
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    ItensVenda itensVenda = new ItensVenda();
                    itensVenda.setItv_codigo(rs.getInt("itv_codigo"));
                    itensVenda.setVen_codigo(rs.getInt("ven_codigo"));
                    itensVenda.setTpg_codigo(rs.getInt("tpg_codigo"));
                    itensVenda.setFun_codigo(rs.getInt("fun_codigo"));
                    itensVenda.setNf_codigo(rs.getInt("nf_codigo"));
                    itensVenda.setTpp_codigo(rs.getInt("tpp_codigo"));
                    itensVenda.setPro_codigo(rs.getInt("pro_codigo"));
                    itensVenda.setItv_embalagem(rs.getString("itv_embalagem"));
                    itensVenda.setItv_qtde(rs.getFloat("itv_qtde"));
                    itensVenda.setItv_valorun(rs.getFloat("itv_valorun"));
                    itensVenda.setItv_desc(rs.getString("itv_desc"));
                    itensVenda.setItv_valortotal(rs.getFloat("itv_valortotal"));

                    return itensVenda;
                }
                return null; 
            }
        } catch (SQLException e) {
            throw new CustomException("Erro ao obter item venda" + e.getMessage());
        }
    }
    
    public int excluir(int codigo) throws CustomException {
        String query = "DELETE FROM tb_itensvenda WHERE itv_codigo = ?";
    
        try (
            Connection con = super.connect();
            PreparedStatement pst = con.prepareStatement(query)
            ) {
    
            pst.setInt(1, codigo);
    
            int linhasAfetadas = pst.executeUpdate();
            return linhasAfetadas;
        } catch (SQLException e) {
            throw new CustomException("Erro ao excluir item venda", e.getErrorCode() + " " + e.getMessage());
        }
    }
    
}
