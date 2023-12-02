package sistema_loja2023.model;

import sistema_loja2023.infraestructure.exceptions.CustomException;

public class Fornecedor {

    private Integer for_codigo;
    private String for_nome;
    private String for_endereco;
    private String for_numero;
    private String for_bairro;
    private String for_cidade;
    private String for_uf;
    private String for_cnpjcpf;
    private String for_rgie;
    private String for_telefone;
    private String for_fax;
    private String for_celular;
    private String for_email;

    public static Fornecedor mapearComParametros(String[] parametros) throws CustomException {
        Fornecedor fornecedor = new Fornecedor();
    
        if (isNotNullOrEmpty(parametros[0])) {
            fornecedor.setFor_codigo(new Integer(parametros[0]));
        } 

        if (isNotNullOrEmpty(parametros[1])) {
            fornecedor.setFor_nome(parametros[1]);
        }
    
        if (isNotNullOrEmpty(parametros[2])) {
            fornecedor.setFor_endereco(parametros[2]);
        }
    
        if (isNotNullOrEmpty(parametros[3])) {
            fornecedor.setFor_numero(parametros[3]);
        }
    
        if (isNotNullOrEmpty(parametros[4])) {
            fornecedor.setFor_bairro(parametros[4]);
        }
    
        if (isNotNullOrEmpty(parametros[5])) {
            fornecedor.setFor_cidade(parametros[5]);
        }
    
        if (isNotNullOrEmpty(parametros[6])) {
            fornecedor.setFor_uf(parametros[6]);
        }
    
        if (isNotNullOrEmpty(parametros[7])) {
            fornecedor.setFor_cnpjcpf(parametros[7]);
        }
    
        if (isNotNullOrEmpty(parametros[8])) {
            fornecedor.setFor_rgie(parametros[8]);
        }
    
        if (isNotNullOrEmpty(parametros[9])) {
            fornecedor.setFor_telefone(parametros[9]);
        }
    
        if (isNotNullOrEmpty(parametros[10])) {
            fornecedor.setFor_fax(parametros[10]);
        }
    
        if (isNotNullOrEmpty(parametros[11])) {
            fornecedor.setFor_celular(parametros[11]);
        }
    
        if (isNotNullOrEmpty(parametros[12])) {
            fornecedor.setFor_email(parametros[12]);
        }
    
        return fornecedor;
    }
    
    private static boolean isNotNullOrEmpty(String value) {
        return !(value == null || value.trim().isEmpty());
    }

    public Integer getFor_codigo() {
        return this.for_codigo;
    }

    public String getFor_nome() {
        return this.for_nome;
    }

    public String getFor_endereco() {
        return this.for_endereco;
    }

    public String getFor_numero() {
        return this.for_numero;
    }

    public String getFor_bairro() {
        return this.for_bairro;
    }

    public String getFor_cidade() {
        return this.for_cidade;
    }

    public String getFor_uf() {
        return this.for_uf;
    }

    public String getFor_cnpjcpf() {
        return this.for_cnpjcpf;
    }

    public String getFor_rgie() {
        return this.for_rgie;
    }

    public String getFor_telefone() {
        return this.for_telefone;
    }

    public String getFor_fax() {
        return this.for_fax;
    }

    public String getFor_celular() {
        return this.for_celular;
    }

    public String getFor_email() {
        return this.for_email;
    }

    public void setFor_codigo(Integer for_codigo) {
        this.for_codigo = for_codigo;
    }

    public void setFor_nome(String for_nome) {
        this.for_nome = for_nome;
    }

    public void setFor_endereco(String for_endereco) {
        this.for_endereco = for_endereco;
    }

    public void setFor_numero(String for_numero) {
        this.for_numero = for_numero;
    }

    public void setFor_bairro(String for_bairro) {
        this.for_bairro = for_bairro;
    }

    public void setFor_cidade(String for_cidade) {
        this.for_cidade = for_cidade;
    }

    public void setFor_uf(String for_uf) {
        this.for_uf = for_uf;
    }

    public void setFor_cnpjcpf(String for_cnpjcpf) {
        this.for_cnpjcpf = for_cnpjcpf;
    }

    public void setFor_rgie(String for_rgie) {
        this.for_rgie = for_rgie;
    }

    public void setFor_telefone(String for_telefone) {
        this.for_telefone = for_telefone;
    }

    public void setFor_fax(String for_fax) {
        this.for_fax = for_fax;
    }

    public void setFor_celular(String for_celular) {
        this.for_celular = for_celular;
    }

    public void setFor_email(String for_email) {
        this.for_email = for_email;
    }
}
 