package sistema_loja2023.model;

public class Produto {
    public Integer pro_codigo;
    public String pro_descricao;
    public Integer ttp_codigo;
    public Float pro_precocusto;
    public Float pro_precovenda;
    public Float pro_estoque;
    public String pro_embalagem;
    public Float pro_ipi;

    public static Produto mapearComParametros(String[] parameters) {
        Produto produto = new Produto();
    
        if (isNotNullOrEmpty(parameters[0])) {
            produto.setPro_codigo(Integer.parseInt(parameters[0]));
        }
    
        if (isNotNullOrEmpty(parameters[1])) {
            produto.setPro_descricao(parameters[1]);
        }
    
        if (isNotNullOrEmpty(parameters[2])) {
            produto.setTtp_codigo(Integer.parseInt(parameters[2]));
        }
    
        if (isNotNullOrEmpty(parameters[3])) {
            produto.setPro_precocusto(Float.parseFloat(parameters[3]));
        }
    
        if (isNotNullOrEmpty(parameters[4])) {
            produto.setPro_precovenda(Float.parseFloat(parameters[4]));
        }
    
        if (isNotNullOrEmpty(parameters[5])) {
            produto.setPro_estoque(Float.parseFloat(parameters[5]));
        }
    
        if (isNotNullOrEmpty(parameters[6])) {
            produto.setPro_embalagem(parameters[6]);
        }
    
        if (isNotNullOrEmpty(parameters[7])) {
            produto.setPro_ipi(Float.parseFloat(parameters[7]));
        }
    
        return produto;
    }
    
    private static boolean isNotNullOrEmpty(String value) {
        return !(value == "" || value == null);
    }
    

    public Integer getPro_codigo() {
        return this.pro_codigo;
    }

    public void setPro_codigo(Integer pro_codigo) {
        this.pro_codigo = pro_codigo;
    }

    public String getPro_descricao() {
        return this.pro_descricao;
    }

    public void setPro_descricao(String pro_descricao) {
        this.pro_descricao = pro_descricao;
    }

    public Integer getTtp_codigo() {
        return this.ttp_codigo;
    }

    public void setTtp_codigo(Integer ttp_codigo) {
        this.ttp_codigo = ttp_codigo;
    }

    public Float getPro_precocusto() {
        return this.pro_precocusto;
    }

    public void setPro_precocusto(Float pro_precocusto) {
        this.pro_precocusto = pro_precocusto;
    }

    public Float getPro_precovenda() {
        return this.pro_precovenda;
    }

    public void setPro_precovenda(Float pro_precovenda) {
        this.pro_precovenda = pro_precovenda;
    }

    public Float getPro_estoque() {
        return this.pro_estoque;
    }

    public void setPro_estoque(Float pro_estoque) {
        this.pro_estoque = pro_estoque;
    }

    public String getPro_embalagem() {
        return this.pro_embalagem;
    }

    public void setPro_embalagem(String pro_embalagem) {
        this.pro_embalagem = pro_embalagem;
    }

    public Float getPro_ipi() {
        return this.pro_ipi;
    }

    public void setPro_ipi(Float pro_ipi) {
        this.pro_ipi = pro_ipi;
    }

}
