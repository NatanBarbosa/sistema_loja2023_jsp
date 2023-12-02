package sistema_loja2023.model;

public class Venda {
    public Integer ven_codigo;
    public Integer tpg_codigo;
    public Integer fun_codigo;
    public Integer nf_codigo;
    public String ven_datavenda;
    public String ven_valortotal;
    public String ven_observacoes;

    public static Venda mapearComParametros(String[] parameters) {
        Venda venda = new Venda();
    
        if (isNotNullOrEmpty(parameters[0])) {
            venda.setVen_codigo(Integer.parseInt(parameters[0]));
        }
    
        if (isNotNullOrEmpty(parameters[1])) {
            venda.setTpg_codigo(Integer.parseInt(parameters[1]));
        }
    
        if (isNotNullOrEmpty(parameters[2])) {
            venda.setFun_codigo(Integer.parseInt(parameters[2]));
        }
    
        if (isNotNullOrEmpty(parameters[3])) {
            venda.setNf_codigo(Integer.parseInt(parameters[3]));
        }
    
        if (isNotNullOrEmpty(parameters[4])) {
            venda.setVen_datavenda(parameters[4]);
        }
    
        if (isNotNullOrEmpty(parameters[5])) {
            venda.setVen_valortotal(parameters[5]);
        }
    
        if (isNotNullOrEmpty(parameters[6])) {
            venda.setVen_observacoes(parameters[6]);
        }
    
        return venda;
    }
    
    private static boolean isNotNullOrEmpty(String value) {
        return !(value == "" || value == null);
    }

	public Integer getVen_codigo() {
		return this.ven_codigo;
	}

	public void setVen_codigo(Integer ven_codigo) {
		this.ven_codigo = ven_codigo;
	}

	public Integer getTpg_codigo() {
		return this.tpg_codigo;
	}

	public void setTpg_codigo(Integer tpg_codigo) {
		this.tpg_codigo = tpg_codigo;
	}

	public Integer getFun_codigo() {
		return this.fun_codigo;
	}

	public void setFun_codigo(Integer fun_codigo) {
		this.fun_codigo = fun_codigo;
	}

	public Integer getNf_codigo() {
		return this.nf_codigo;
	}

	public void setNf_codigo(Integer nf_codigo) {
		this.nf_codigo = nf_codigo;
	}

	public String getVen_datavenda() {
		return this.ven_datavenda;
	}

	public void setVen_datavenda(String ven_datavenda) {
		this.ven_datavenda = ven_datavenda;
	}

	public String getVen_valortotal() {
		return this.ven_valortotal;
	}

	public void setVen_valortotal(String ven_valortotal) {
		this.ven_valortotal = ven_valortotal;
	}

	public String getVen_observacoes() {
		return this.ven_observacoes;
	}

	public void setVen_observacoes(String ven_observacoes) {
		this.ven_observacoes = ven_observacoes;
	}


}
