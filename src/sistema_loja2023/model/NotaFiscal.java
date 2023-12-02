package sistema_loja2023.model;

public class NotaFiscal {

    public Integer nf_codigo;
    public Double nf_valornf;
    public Double nf_taxaimpostonf;
    public Double nf_valorimposto;

    public Integer getNf_codigo() {
        return nf_codigo;
    }

    public void setNf_codigo(Integer nf_codigo) {
        this.nf_codigo = nf_codigo;
    }

    public Double getNf_valornf() {
        return nf_valornf;
    }

    public void setNf_valornf(Double nf_valornf) {
        this.nf_valornf = nf_valornf;
    }

    public Double getNf_taxaimpostonf() {
        return nf_taxaimpostonf;
    }

    public void setNf_taxaimpostonf(Double nf_taxaimpostonf) {
        this.nf_taxaimpostonf = nf_taxaimpostonf;
    }

    public Double getNf_valorimposto() {
        return nf_valorimposto;
    }

    public void setNf_valorimposto(Double nf_valorimposto) {
        this.nf_valorimposto = nf_valorimposto;
    }

    public static NotaFiscal mapearComParametros(String[] parametros) throws Exception {
        if (parametros.length != 4) {
            throw new Exception("Número incorreto de parâmetros para mapeamento da Nota Fiscal.");
        }
    
        NotaFiscal notaFiscal = new NotaFiscal();
    
        if (isNotNullOrEmpty(parametros[0])) {
            notaFiscal.setNf_codigo(new Integer(parametros[0]));
        }
    
        if (isNotNullOrEmpty(parametros[1])) {
            notaFiscal.setNf_valornf(Double.parseDouble(parametros[1]));
        }
    
        if (isNotNullOrEmpty(parametros[2])) {
            notaFiscal.setNf_taxaimpostonf(Double.parseDouble(parametros[2]));
        }
    
        if (isNotNullOrEmpty(parametros[3])) {
            notaFiscal.setNf_valorimposto(Double.parseDouble(parametros[3]));
        }
    
        return notaFiscal;
    }
    
    private static boolean isNotNullOrEmpty(String value) {
        return value != null && !value.isEmpty();
    }
    
}
