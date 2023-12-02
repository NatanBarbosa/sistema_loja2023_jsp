package sistema_loja2023.model;

public class TipoProduto {
    public Integer tpp_codigo;
    public String tpp_descricao;

    public static TipoProduto mapearComParametros(String[] parameters) {
        TipoProduto tipoProduto = new TipoProduto();
    
        if (isNotNullOrEmpty(parameters[0])) {
            tipoProduto.setTpp_codigo(Integer.parseInt(parameters[0]));
        }
    
        if (isNotNullOrEmpty(parameters[1])) {
            tipoProduto.setTpp_descricao(parameters[1]);
        }
    
        return tipoProduto;
    }
    
    private static boolean isNotNullOrEmpty(String value) {
        return !(value == "" || value == null);
    }

	public Integer getTpp_codigo() {
		return this.tpp_codigo;
	}

	public void setTpp_codigo(Integer tpp_codigo) {
		this.tpp_codigo = tpp_codigo;
	}

	public String getTpp_descricao() {
		return this.tpp_descricao;
	}

	public void setTpp_descricao(String tpp_descricao) {
		this.tpp_descricao = tpp_descricao;
	}

}
