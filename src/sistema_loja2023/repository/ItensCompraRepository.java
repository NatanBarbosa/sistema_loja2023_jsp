package sistema_loja2023.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sistema_loja2023.infraestructure.exceptions.CustomException;
import sistema_loja2023.model.ItensCompra;

public class ItensCompraRepository extends Conexao {  

    public List<ItensCompra> listarTodos() throws CustomException {
        List<ItensCompra> listaItensCompras = new ArrayList<>();
        String query = "SELECT * FROM tb_itenscompra";
    
        try (Connection con = super.connect();
             PreparedStatement pst = con.prepareStatement(query);
             ResultSet rs = pst.executeQuery()) {
    
            while (rs.next()) {
                ItensCompra itensCompra = new ItensCompra();
                itensCompra.setItc_codigo(rs.getInt("itc_codigo"));
                itensCompra.setCom_codigo(rs.getInt("com_codigo"));
                itensCompra.setTpg_codigo(rs.getInt("tpg_codigo"));
                itensCompra.setFor_codigo(rs.getInt("for_codigo"));
                itensCompra.setNf_codigo(rs.getInt("nf_codigo"));
                itensCompra.setTpp_codigo(rs.getInt("tpp_codigo"));
                itensCompra.setPro_codigo(rs.getInt("pro_codigo"));
                itensCompra.setItc_embalagem(rs.getString("itc_embalagem"));
                itensCompra.setItc_qtde(rs.getFloat("itc_qtde"));
                itensCompra.setItc_valorun(rs.getFloat("itc_valorun"));
                itensCompra.setItc_valortotal(rs.getFloat("itc_valortotal"));
                itensCompra.setItc_desc(rs.getString("itc_desc"));
    
                listaItensCompras.add(itensCompra);
            }
        } catch (SQLException e) {
            throw new CustomException("Erro ao listar compras");
        }
    
        return listaItensCompras;
    }

    public int alterar (ItensCompra itemCompra) throws CustomException {
        String query = 
            "UPDATE tb_itenscompra " +
            "SET " +
            "  com_codigo = ?," +
            "  tpg_codigo = ?," +
            "  for_codigo = ?," +
            "  nf_codigo = ?," +
            "  tpp_codigo = ?," +
            "  pro_codigo = ?," +
            "  itc_embalagem = ?," +
            "  itc_qtde = ?," +
            "  itc_valorun = ?, " +
            "  itc_desc = ?, " +
            "  itc_valortotal = ? " +
            "WHERE itc_codigo = ?";

        try (
                Connection con = super.connect();
                PreparedStatement pst = con.prepareStatement(query)
            ) {

            pst.setInt(1, itemCompra.getCom_codigo());
            pst.setInt(2, itemCompra.getTpg_codigo());
            pst.setInt(3, itemCompra.getFor_codigo());
            pst.setInt(4, itemCompra.getNf_codigo());
            pst.setInt(5, itemCompra.getTpp_codigo());
            pst.setInt(6, itemCompra.getPro_codigo());
            pst.setString(7, itemCompra.getItc_embalagem());
            pst.setFloat(8, itemCompra.getItc_qtde());
            pst.setFloat(9, itemCompra.getItc_valorun());
            pst.setString(10, itemCompra.getItc_desc());
            pst.setFloat(11, itemCompra.getItc_valortotal());
            pst.setInt(12, itemCompra.getItc_codigo());

            int linhasAfetadas = pst.executeUpdate();

            return linhasAfetadas;
        } catch (SQLException e) {
            throw new CustomException("Erro ao atualizar Item Compra", e.getErrorCode() + e.getMessage());
        }

    }

    public int inserir (ItensCompra itemCompra) throws CustomException {
        String query = "INSERT INTO tb_itenscompra " +
                       "(itc_codigo, com_codigo, tpg_codigo, for_codigo, nf_codigo, tpp_codigo, pro_codigo, itc_embalagem, itc_qtde, itc_valorun, itc_desc, itc_valortotal) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    
        try (Connection con = super.connect();
             PreparedStatement pst = con.prepareStatement(query)) {
    
            pst.setInt(1, itemCompra.getItc_codigo());
            pst.setInt(2, itemCompra.getCom_codigo());
            pst.setInt(3, itemCompra.getTpg_codigo());
            pst.setInt(4, itemCompra.getFor_codigo());
            pst.setInt(5, itemCompra.getNf_codigo());
            pst.setInt(6, itemCompra.getTpp_codigo());
            pst.setInt(7, itemCompra.getPro_codigo());
            pst.setString(8, itemCompra.getItc_embalagem());
            pst.setFloat(9, itemCompra.getItc_qtde());
            pst.setFloat(10, itemCompra.getItc_valorun());
            pst.setString(11, itemCompra.getItc_desc());
            pst.setFloat(12, itemCompra.getItc_valortotal());
    
            int linhasAfetadas = pst.executeUpdate();
    
            return linhasAfetadas;
        } catch (SQLException e) {
            if(e.getErrorCode() == 1062) {
                throw new CustomException("Esse código de Item compra já existe");
            }
            throw new CustomException("Erro ao inserir Item compra", e.getMessage() + "");
        }
    }
    
    public ItensCompra obter(int codigo) throws CustomException {
        String query = "SELECT * FROM tb_itenscompra WHERE itc_codigo = ?";
    
        try (
            Connection con = super.connect();
            PreparedStatement pst = con.prepareStatement(query)
            ) {
    
            pst.setInt(1, codigo);
    
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    ItensCompra itensCompra = new ItensCompra();
                    itensCompra.setItc_codigo(rs.getInt("itc_codigo"));
                    itensCompra.setCom_codigo(rs.getInt("com_codigo"));
                    itensCompra.setTpg_codigo(rs.getInt("tpg_codigo"));
                    itensCompra.setFor_codigo(rs.getInt("for_codigo"));
                    itensCompra.setNf_codigo(rs.getInt("nf_codigo"));
                    itensCompra.setTpp_codigo(rs.getInt("tpp_codigo"));
                    itensCompra.setPro_codigo(rs.getInt("pro_codigo"));
                    itensCompra.setItc_embalagem(rs.getString("itc_embalagem"));
                    itensCompra.setItc_qtde(rs.getFloat("itc_qtde"));
                    itensCompra.setItc_valorun(rs.getFloat("itc_valorun"));
                    itensCompra.setItc_desc(rs.getString("itc_desc"));
                    itensCompra.setItc_valortotal(rs.getFloat("itc_valortotal"));

                    return itensCompra;
                }
                return null; 
            }
        } catch (SQLException e) {
            throw new CustomException("Erro ao obter item compra" + e.getMessage());
        }
    }
    
    public int excluir(int codigo) throws CustomException {
        String query = "DELETE FROM tb_itenscompra WHERE itc_codigo = ?";
    
        try (
            Connection con = super.connect();
            PreparedStatement pst = con.prepareStatement(query)
            ) {
    
            pst.setInt(1, codigo);
    
            int linhasAfetadas = pst.executeUpdate();
            return linhasAfetadas;
        } catch (SQLException e) {
            throw new CustomException("Erro ao excluir item compra", e.getErrorCode() + " " + e.getMessage());
        }
    }
    
}
