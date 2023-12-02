package sistema_loja2023.model;

import java.sql.Date;

public class ContaReceber {

    private Integer cr_codigo;
    private Double cr_valorconta;
    private Date cr_datavencimento;
    private Date cr_datarecebimento;
    private Integer nf_codigo;
    private String cr_observacoes;

    // Constructors, getters, and setters

    public ContaReceber() {
    }

    public ContaReceber(Integer cr_codigo, Double cr_valorconta, Date cr_datavencimento, Date cr_datarecebimento,
            Integer nf_codigo, String cr_observacoes) {
        this.cr_codigo = cr_codigo;
        this.cr_valorconta = cr_valorconta;
        this.cr_datavencimento = cr_datavencimento;
        this.cr_datarecebimento = cr_datarecebimento;
        this.nf_codigo = nf_codigo;
        this.cr_observacoes = cr_observacoes;
    }

    public Integer getCr_codigo() {
        return cr_codigo;
    }

    public void setCr_codigo(Integer cr_codigo) {
        this.cr_codigo = cr_codigo;
    }

    public Double getCr_valorconta() {
        return cr_valorconta;
    }

    public void setCr_valorconta(Double cr_valorconta) {
        this.cr_valorconta = cr_valorconta;
    }

    public Date getCr_datavencimento() {
        return cr_datavencimento;
    }

    public void setCr_datavencimento(Date cr_datavencimento) {
        this.cr_datavencimento = cr_datavencimento;
    }

    public Date getCr_datarecebimento() {
        return cr_datarecebimento;
    }

    public void setCr_datarecebimento(Date cr_datarecebimento) {
        this.cr_datarecebimento = cr_datarecebimento;
    }

    public Integer getNf_codigo() {
        return nf_codigo;
    }

    public void setNf_codigo(Integer nf_codigo) {
        this.nf_codigo = nf_codigo;
    }

    public String getCr_observacoes() {
        return cr_observacoes;
    }

    public void setCr_observacoes(String cr_observacoes) {
        this.cr_observacoes = cr_observacoes;
    }

    public static ContaReceber mapearComParametros(String[] parametros) throws Exception {
        if (parametros.length != 6) {
            throw new Exception("Número incorreto de parâmetros para mapeamento da Conta Receber.");
        }

        ContaReceber contaReceber = new ContaReceber();

        if (isNotNullOrEmpty(parametros[0])) {
            contaReceber.setCr_codigo(new Integer(parametros[0]));
        }

        if (isNotNullOrEmpty(parametros[1])) {
            contaReceber.setCr_valorconta(Double.parseDouble(parametros[1]));
        }

        if (isNotNullOrEmpty(parametros[2])) {
            contaReceber.setCr_datavencimento(Date.valueOf(parametros[2]));
        }
        if (isNotNullOrEmpty(parametros[3])) {
            contaReceber.setCr_datarecebimento(Date.valueOf(parametros[3]));
        }
        if (isNotNullOrEmpty(parametros[4])) {
            contaReceber.setNf_codigo(Integer.parseInt(parametros[4]));
        }

        if (isNotNullOrEmpty(parametros[5])) {
            contaReceber.setCr_observacoes(parametros[5]);
        }

        return contaReceber;
    }

    private static boolean isNotNullOrEmpty(String value) {
        return value != null && !value.isEmpty();
    }
}
