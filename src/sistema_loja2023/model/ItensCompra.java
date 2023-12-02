package sistema_loja2023.model;

public class ItensCompra {
    public Integer itc_codigo;
    public Integer com_codigo;
    public Integer pro_codigo;
    public Integer tpp_codigo;
    public Integer for_codigo;
    public Integer nf_codigo;
    public Integer tpg_codigo;
    public String itc_embalagem;
    public Float itc_qtde;
    public Float itc_valorun;
    public String itc_desc;
    public Float itc_valortotal;

    public static ItensCompra mapearComParametros(String[] parameters) {
        ItensCompra itensCompra = new ItensCompra();
    
        if (isNotNullOrEmpty(parameters[0])) {
            itensCompra.setItc_codigo(Integer.parseInt(parameters[0]));
        }
    
        if (isNotNullOrEmpty(parameters[1])) {
            itensCompra.setCom_codigo(Integer.parseInt(parameters[1]));
        }
    
        if (isNotNullOrEmpty(parameters[2])) {
            itensCompra.setPro_codigo(Integer.parseInt(parameters[2]));
        }
    
        if (isNotNullOrEmpty(parameters[3])) {
            itensCompra.setTpp_codigo(Integer.parseInt(parameters[3]));
        }
    
        if (isNotNullOrEmpty(parameters[4])) {
            itensCompra.setFor_codigo(Integer.parseInt(parameters[4]));
        }
    
        if (isNotNullOrEmpty(parameters[5])) {
            itensCompra.setNf_codigo(Integer.parseInt(parameters[5]));
        }

		if (isNotNullOrEmpty(parameters[6])) {
            itensCompra.setTpg_codigo(Integer.parseInt(parameters[6]));
        }
    
        if (isNotNullOrEmpty(parameters[7])) {
            itensCompra.setItc_embalagem(parameters[7]);
        }

		if (isNotNullOrEmpty(parameters[8])) {
            itensCompra.setItc_qtde(Float.parseFloat(parameters[8]));
        }

		if (isNotNullOrEmpty(parameters[9])) {
            itensCompra.setItc_valorun(Float.parseFloat(parameters[9]));
        }

		if (isNotNullOrEmpty(parameters[10])) {
            itensCompra.setItc_desc(parameters[10]);
        }

		if (isNotNullOrEmpty(parameters[11])) {
            itensCompra.setItc_valortotal(Float.parseFloat(parameters[11]));
        }
    
        return itensCompra;
    }

	private static boolean isNotNullOrEmpty(String value) {
		return !(value == "" || value == null);
	}

	
	public Integer getItc_codigo() {
		return this.itc_codigo;
	}

	public void setItc_codigo(Integer itc_codigo) {
		this.itc_codigo = itc_codigo;
	}

	public Integer getCom_codigo() {
		return this.com_codigo;
	}

	public void setCom_codigo(Integer com_codigo) {
		this.com_codigo = com_codigo;
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

	public Integer getFor_codigo() {
		return this.for_codigo;
	}

	public void setFor_codigo(Integer for_codigo) {
		this.for_codigo = for_codigo;
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

	public String getItc_embalagem() {
		return this.itc_embalagem;
	}

	public void setItc_embalagem(String itc_embalagem) {
		this.itc_embalagem = itc_embalagem;
	}

	public Float getItc_qtde() {
		return this.itc_qtde;
	}

	public void setItc_qtde(Float itc_qtde) {
		this.itc_qtde = itc_qtde;
	}

	public Float getItc_valorun() {
		return this.itc_valorun;
	}

	public void setItc_valorun(Float itc_valorun) {
		this.itc_valorun = itc_valorun;
	}

	public String getItc_desc() {
		return this.itc_desc;
	}

	public void setItc_desc(String itc_desc) {
		this.itc_desc = itc_desc;
	}

	public Float getItc_valortotal() {
		return this.itc_valortotal;
	}

	public void setItc_valortotal(Float itc_valortotal) {
		this.itc_valortotal = itc_valortotal;
	}

}
