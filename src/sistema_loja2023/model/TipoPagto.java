package sistema_loja2023.model;

public class TipoPagto {
    public Integer tpg_codigo;
    public String tpg_descricao;
    public Integer tpg_qtde;
    public String tpg_ativo;

    public static TipoPagto mapearComParametros(String[] parameters) {
        TipoPagto tipoPagto = new TipoPagto();
    
        if (isNotNullOrEmpty(parameters[0])) {
            tipoPagto.setTpg_codigo(Integer.parseInt(parameters[0]));
        }
    
        if (isNotNullOrEmpty(parameters[1])) {
            tipoPagto.setTpg_descricao(parameters[1]);
        }

        if (isNotNullOrEmpty(parameters[2])) {
            tipoPagto.setTpg_qtde(Integer.parseInt(parameters[2]));
        }

        tipoPagto.setTpg_ativo(parameters[3]);

    
        return tipoPagto;
    }
    
    private static boolean isNotNullOrEmpty(String value) {
        return !(value == "" || value == null);
    }
    
	public Integer getTpg_codigo() {
		return this.tpg_codigo;
	}

	public void setTpg_codigo(Integer tpg_codigo) {
		this.tpg_codigo = tpg_codigo;
	}

	public String getTpg_descricao() {
		return this.tpg_descricao;
	}

	public void setTpg_descricao(String tpg_descricao) {
		this.tpg_descricao = tpg_descricao;
	}

	public Integer getTpg_qtde() {
		return this.tpg_qtde;
	}

	public void setTpg_qtde(Integer tpg_qtde) {
		this.tpg_qtde = tpg_qtde;
	}

	public String getTpg_ativo() {
		return this.tpg_ativo;
	}

	public void setTpg_ativo(String tpg_ativo) {
		if (tpg_ativo == null) {
			this.tpg_ativo = "N";
			return;
		}

		if (tpg_ativo.equals("N")) {
			this.tpg_ativo = "N";
		}

		if (tpg_ativo.equals("S")) {
			this.tpg_ativo = "S";
		}
		
	}

}
