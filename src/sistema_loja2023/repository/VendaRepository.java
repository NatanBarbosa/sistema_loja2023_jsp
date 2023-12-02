package sistema_loja2023.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sistema_loja2023.infraestructure.exceptions.CustomException;
import sistema_loja2023.model.Venda;

public class VendaRepository extends Conexao {  

    public List<Venda> listarTodos() throws CustomException {
        List<Venda> listaVendas = new ArrayList<>();
        String query = "SELECT * FROM tb_vendas";
    
        try (Connection con = super.connect();
             PreparedStatement pst = con.prepareStatement(query);
             ResultSet rs = pst.executeQuery()) {
    
            while (rs.next()) {
                Venda venda = new Venda();
                venda.setVen_codigo(rs.getInt("ven_codigo"));
                venda.setTpg_codigo(rs.getInt("tpg_codigo"));
                venda.setFun_codigo(rs.getInt("fun_codigo"));
                venda.setNf_codigo(rs.getInt("nf_codigo"));
                venda.setVen_datavenda(rs.getString("ven_datavenda"));
                venda.setVen_valortotal(rs.getString("ven_valortotal"));
                venda.setVen_observacoes(rs.getString("ven_observacoes"));
    
                listaVendas.add(venda);
            }
        } catch (SQLException e) {
            throw new CustomException("Erro ao listar vendas");
        }
    
        return listaVendas;
    }

    public int alterar (Venda venda) throws CustomException {
        String query = 
            "UPDATE tb_vendas " +
            "SET " +
            "  tpg_codigo = ?," +
            "  fun_codigo = ?," +
            "  nf_codigo = ?," +
            "  ven_datavenda = ?," +
            "  ven_valortotal = ?," +
            "  ven_observacoes = ? " +
            "WHERE ven_codigo = ?";

        try (
                Connection con = super.connect();
                PreparedStatement pst = con.prepareStatement(query)
            ) {

            pst.setInt(1, venda.getTpg_codigo());
            pst.setInt(2, venda.getFun_codigo());
            pst.setInt(3, venda.getNf_codigo());
            pst.setString(4, venda.getVen_datavenda());
            pst.setString(5, venda.getVen_valortotal());
            pst.setString(6, venda.getVen_observacoes());
            pst.setInt(7, venda.getVen_codigo());

            int linhasAfetadas = pst.executeUpdate();

            return linhasAfetadas;
        } catch (SQLException e) {
            throw new CustomException("Erro ao atualizar venda", e.getErrorCode() + e.getMessage());
        }

    }

    public int inserir (Venda venda) throws CustomException {
        String query = "INSERT INTO tb_vendas " +
                       "(ven_codigo, tpg_codigo, fun_codigo, nf_codigo, ven_datavenda, ven_valortotal, ven_observacoes) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?)";
    
        try (Connection con = super.connect();
             PreparedStatement pst = con.prepareStatement(query)) {
    
            pst.setInt(1, venda.getVen_codigo());
            pst.setInt(2, venda.getTpg_codigo());
            pst.setInt(3, venda.getFun_codigo());
            pst.setInt(4, venda.getNf_codigo());
            pst.setString(5, venda.getVen_datavenda());
            pst.setString(6, venda.getVen_valortotal());
            pst.setString(7, venda.getVen_observacoes());
    
            int linhasAfetadas = pst.executeUpdate();
    
            return linhasAfetadas;
        } catch (SQLException e) {
            if(e.getErrorCode() == 1062) {
                throw new CustomException("Esse código de venda já existe");
            }
            throw new CustomException("Erro ao inserir venda", e.getMessage() + "");
        }
    }
    
    public Venda obter(int codigo) throws CustomException {
        String query = "SELECT * FROM tb_vendas WHERE ven_codigo = ?";
    
        try (
            Connection con = super.connect();
            PreparedStatement pst = con.prepareStatement(query)
            ) {
    
            pst.setInt(1, codigo);
    
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    Venda venda = new Venda();
                    venda.setVen_codigo(rs.getInt("ven_codigo"));
                    venda.setTpg_codigo(rs.getInt("tpg_codigo"));
                    venda.setFun_codigo(rs.getInt("fun_codigo"));
                    venda.setNf_codigo(rs.getInt("nf_codigo"));
                    venda.setVen_datavenda(rs.getString("ven_datavenda"));
                    venda.setVen_valortotal(rs.getString("ven_valortotal"));
                    venda.setVen_observacoes(rs.getString("ven_observacoes"));

                    return venda;
                }
                return null; 
            }
        } catch (SQLException e) {
            throw new CustomException("Erro ao obter venda");
        }
    }
    
    public int excluir(int codigo) throws CustomException {
        String query = "DELETE FROM tb_vendas WHERE ven_codigo = ?";
    
        try (
            Connection con = super.connect();
            PreparedStatement pst = con.prepareStatement(query)
            ) {
    
            pst.setInt(1, codigo);
    
            int linhasAfetadas = pst.executeUpdate();
            return linhasAfetadas;
        } catch (SQLException e) {
            throw new CustomException("Erro ao excluir venda", e.getErrorCode() + " " + e.getMessage());
        }
    }
    
}
