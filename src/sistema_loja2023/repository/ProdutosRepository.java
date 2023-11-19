package sistema_loja2023.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sistema_loja2023.model.Produto;

public class ProdutosRepository extends Conexao {  

    public List<Produto> obterProdutos () throws SQLException {
                
        try {
			String query = "SELECT * FROM tb_produtos";
			Connection con = super.connect();

			PreparedStatement pst = con.prepareStatement(query);
            
			ResultSet rs = pst.executeQuery();

            List<Produto> listaProdutos = new ArrayList<Produto>();
            
            while(rs.next()){
                Produto produto = new Produto();
                produto.setPro_descricao(rs.getString("pro_descricao"));
                listaProdutos.add(produto);
            }

			super.closeConnection(con);

            return listaProdutos;
			
		} catch (Exception e) {
			throw e;
		}
    }
}
