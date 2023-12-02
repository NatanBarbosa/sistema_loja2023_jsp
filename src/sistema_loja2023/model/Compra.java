package sistema_loja2023.model;

public class Compra {
    public Integer com_codigo;
    public Integer tpg_codigo;
    public Integer for_codigo;
    public Integer nf_codigo;
    public String com_datacompra;
    public String com_valortotal;
    public String com_observacoes;

    public static Compra mapearComParametros(String[] parameters) {
        Compra compra = new Compra();
    
        if (isNotNullOrEmpty(parameters[0])) {
            compra.setCom_codigo(Integer.parseInt(parameters[0]));
        }
    
        if (isNotNullOrEmpty(parameters[1])) {
            compra.setTpg_codigo(Integer.parseInt(parameters[1]));
        }
    
        if (isNotNullOrEmpty(parameters[2])) {
            compra.setFor_codigo(Integer.parseInt(parameters[2]));
        }
    
        if (isNotNullOrEmpty(parameters[3])) {
            compra.setNf_codigo(Integer.parseInt(parameters[3]));
        }
    
        if (isNotNullOrEmpty(parameters[4])) {
            compra.setCom_datacompra(parameters[4]);
        }
    
        if (isNotNullOrEmpty(parameters[5])) {
            compra.setCom_valortotal(parameters[5]);
        }
    
        if (isNotNullOrEmpty(parameters[6])) {
            compra.setCom_observacoes(parameters[6]);
        }
    
        return compra;
    }
    
    private static boolean isNotNullOrEmpty(String value) {
        return !(value == "" || value == null);
    }

    
	public Integer getCom_codigo() {
		return this.com_codigo;
	}

	public void setCom_codigo(Integer com_codigo) {
		this.com_codigo = com_codigo;
	}

	public Integer getTpg_codigo() {
		return this.tpg_codigo;
	}

	public void setTpg_codigo(Integer tpg_codigo) {
		this.tpg_codigo = tpg_codigo;
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

	public String getCom_datacompra() {
		return this.com_datacompra;
	}

	public void setCom_datacompra(String com_datacompra) {
		this.com_datacompra = com_datacompra;
	}

	public String getCom_valortotal() {
		return this.com_valortotal;
	}

	public void setCom_valortotal(String com_valortotal) {
		this.com_valortotal = com_valortotal;
	}

	public String getCom_observacoes() {
		return this.com_observacoes;
	}

	public void setCom_observacoes(String com_observacoes) {
		this.com_observacoes = com_observacoes;
	}

}
