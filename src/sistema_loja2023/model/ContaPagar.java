package sistema_loja2023.model;

import java.sql.Date;

public class ContaPagar {

    private Integer cp_codigo;
    private Double cp_valorconta;
    private Date cp_datavencimento;
    private Date cp_datapagamento;
    private Integer nf_codigo;
    private String cp_observacoes;

    public ContaPagar() {
    }

    public ContaPagar(Integer cp_codigo, Double cp_valorconta, Date cp_datavencimento, Date cp_datapagamento,
            Integer nf_codigo, String cp_observacoes) {
        this.cp_codigo = cp_codigo;
        this.cp_valorconta = cp_valorconta;
        this.cp_datavencimento = cp_datavencimento;
        this.cp_datapagamento = cp_datapagamento;
        this.nf_codigo = nf_codigo;
        this.cp_observacoes = cp_observacoes;
    }

    public Integer getCp_codigo() {
        return cp_codigo;
    }

    public void setCp_codigo(Integer cp_codigo) {
        this.cp_codigo = cp_codigo;
    }

    public Double getCp_valorconta() {
        return cp_valorconta;
    }

    public void setCp_valorconta(Double cp_valorconta) {
        this.cp_valorconta = cp_valorconta;
    }

    public Date getCp_datavencimento() {
        return cp_datavencimento;
    }

    public void setCp_datavencimento(Date cp_datavencimento) {
        this.cp_datavencimento = cp_datavencimento;
    }

    public Date getCp_datapagamento() {
        return cp_datapagamento;
    }

    public void setCp_datapagamento(Date cp_datapagamento) {
        this.cp_datapagamento = cp_datapagamento;
    }

    public Integer getNf_codigo() {
        return nf_codigo;
    }

    public void setNf_codigo(Integer nf_codigo) {
        this.nf_codigo = nf_codigo;
    }

    public String getCp_observacoes() {
        return cp_observacoes;
    }

    public void setCp_observacoes(String cp_observacoes) {
        this.cp_observacoes = cp_observacoes;
    }

    public static ContaPagar mapearComParametros(String[] parametros) throws Exception {
        if (parametros.length != 6) {
            throw new Exception("Número incorreto de parâmetros para mapeamento da Conta Pagar.");
        }

        ContaPagar contaPagar = new ContaPagar();

        if (isNotNullOrEmpty(parametros[0])) {
            contaPagar.setCp_codigo(new Integer(parametros[0]));
        }

        if (isNotNullOrEmpty(parametros[1])) {
            contaPagar.setCp_valorconta(Double.parseDouble(parametros[1]));
        }

        if (isNotNullOrEmpty(parametros[2])) {
            contaPagar.setCp_datavencimento(Date.valueOf(parametros[2]));
        }
        if (isNotNullOrEmpty(parametros[3])) {
            contaPagar.setCp_datapagamento(Date.valueOf(parametros[3]));
        }
        if (isNotNullOrEmpty(parametros[4])) {
            contaPagar.setNf_codigo(Integer.parseInt(parametros[4]));
        }

        if (isNotNullOrEmpty(parametros[5])) {
            contaPagar.setCp_observacoes(parametros[5]);
        }

        return contaPagar;
    }

    private static boolean isNotNullOrEmpty(String value) {
        return value != null && !value.isEmpty();
    }
}
