package sistema_loja2023.repository;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {
    private String driver = "org.gjt.mm.mysql.Driver";
	private String url = "jdbc:mysql://127.0.0.1:3306/sistema_loja2023";
	private String user = "root";
	private String password = "vertrigo";
	//private String password = "";

	protected Connection connect () {
		Connection con = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
		} catch (Exception ex) {
			System.out.println("ERROR -> " + ex.getMessage() + ex.getStackTrace());
		} finally {
			return con;
		}
	}
	
	protected void closeConnection(Connection con) {
		try {
			con.close();	
		} catch(Exception ex) {
			System.out.println(ex.getMessage());
		}
	}
}
