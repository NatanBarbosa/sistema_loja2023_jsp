package sistema_loja2023.model;

public class ItensVenda {
    public Integer itv_codigo;
    public Integer ven_codigo;
    public Integer pro_codigo;
    public Integer tpp_codigo;
    public Integer fun_codigo;
    public Integer nf_codigo;
    public Integer tpg_codigo;
    public String itv_embalagem;
    public Float itv_qtde;
    public Float itv_valorun;
    public String itv_desc;
    public Float itv_valortotal;

    public static ItensVenda mapearComParametros(String[] parameters) {
        ItensVenda itensVenda = new ItensVenda();
    
        if (isNotNullOrEmpty(parameters[0])) {
            itensVenda.setItv_codigo(Integer.parseInt(parameters[0]));
        }
    
        if (isNotNullOrEmpty(parameters[1])) {
            itensVenda.setVen_codigo(Integer.parseInt(parameters[1]));
        }
    
        if (isNotNullOrEmpty(parameters[2])) {
            itensVenda.setPro_codigo(Integer.parseInt(parameters[2]));
        }
    
        if (isNotNullOrEmpty(parameters[3])) {
            itensVenda.setTpp_codigo(Integer.parseInt(parameters[3]));
        }
    
        if (isNotNullOrEmpty(parameters[4])) {
            itensVenda.setFun_codigo(Integer.parseInt(parameters[4]));
        }
    
        if (isNotNullOrEmpty(parameters[5])) {
            itensVenda.setNf_codigo(Integer.parseInt(parameters[5]));
        }

		if (isNotNullOrEmpty(parameters[6])) {
            itensVenda.setTpg_codigo(Integer.parseInt(parameters[6]));
        }
    
        if (isNotNullOrEmpty(parameters[7])) {
            itensVenda.setItv_embalagem(parameters[7]);
        }

		if (isNotNullOrEmpty(parameters[8])) {
            itensVenda.setItv_qtde(Float.parseFloat(parameters[8]));
        }

		if (isNotNullOrEmpty(parameters[9])) {
            itensVenda.setItv_valorun(Float.parseFloat(parameters[9]));
        }

		if (isNotNullOrEmpty(parameters[10])) {
            itensVenda.setItv_desc(parameters[10]);
        }

		if (isNotNullOrEmpty(parameters[11])) {
            itensVenda.setItv_valortotal(Float.parseFloat(parameters[11]));
        }
    
        return itensVenda;
    }

	private static boolean isNotNullOrEmpty(String value) {
		return !(value == "" || value == null);
	}

	
	public Integer getItv_codigo() {
		return this.itv_codigo;
	}

	public void setItv_codigo(Integer itv_codigo) {
		this.itv_codigo = itv_codigo;
	}

	public Integer getVen_codigo() {
		return this.ven_codigo;
	}

	public void setVen_codigo(Integer ven_codigo) {
		this.ven_codigo = ven_codigo;
	}

	public Integer getPro_codigo() {
		return this.pro_codigo;
	}

	public void setPro_codigo(Integer pro_codigo) {
		this.pro_codigo = pro_codigo;
	}

	public Integer getTpp_codigo() {
		return this.tpp_codigo;
	}

	public void setTpp_codigo(Integer tpp_codigo) {
		this.tpp_codigo = tpp_codigo;
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

	public Integer getTpg_codigo() {
		return this.tpg_codigo;
	}

	public void setTpg_codigo(Integer tpg_codigo) {
		this.tpg_codigo = tpg_codigo;
	}

	public String getItv_embalagem() {
		return this.itv_embalagem;
	}

	public void setItv_embalagem(String itv_embalagem) {
		this.itv_embalagem = itv_embalagem;
	}

	public Float getItv_qtde() {
		return this.itv_qtde;
	}

	public void setItv_qtde(Float itv_qtde) {
		this.itv_qtde = itv_qtde;
	}

	public Float getItv_valorun() {
		return this.itv_valorun;
	}

	public void setItv_valorun(Float itv_valorun) {
		this.itv_valorun = itv_valorun;
	}

	public String getItv_desc() {
		return this.itv_desc;
	}

	public void setItv_desc(String itv_desc) {
		this.itv_desc = itv_desc;
	}

	public Float getItv_valortotal() {
		return this.itv_valortotal;
	}

	public void setItv_valortotal(Float itv_valortotal) {
		this.itv_valortotal = itv_valortotal;
	}

}