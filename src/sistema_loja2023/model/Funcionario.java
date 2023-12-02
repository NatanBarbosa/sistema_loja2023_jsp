package sistema_loja2023.model;

import java.sql.Date;

public class Funcionario {

    public Integer fun_codigo;
    public String fun_nome;
    public String fun_endereco;
    public String fun_numero;
    public String fun_complemento;
    public String fun_bairro;
    public String fun_cidade;
    public String fun_uf;
    public String fun_cnpjcpf;
    public String fun_rgie;
    public char fun_sexo;
    public Date fun_nascimento;
    public String fun_telefone;
    public String fun_celular;
    public String fun_email;
    public Float fun_salario;

    public Integer getFun_codigo() {
        return fun_codigo;
    }

    public void setFun_codigo(Integer fun_codigo) {
        this.fun_codigo = fun_codigo;
    }

    public String getFun_nome() {
        return fun_nome;
    }

    public void setFun_nome(String fun_nome) {
        this.fun_nome = fun_nome;
    }

    public String getFun_endereco() {
        return fun_endereco;
    }

    public void setFun_endereco(String fun_endereco) {
        this.fun_endereco = fun_endereco;
    }

    public String getFun_numero() {
        return fun_numero;
    }

    public void setFun_numero(String fun_numero) {
        this.fun_numero = fun_numero;
    }

    public String getFun_complemento() {
        return fun_complemento;
    }

    public void setFun_complemento(String fun_complemento) {
        this.fun_complemento = fun_complemento;
    }

    public String getFun_bairro() {
        return fun_bairro;
    }

    public void setFun_bairro(String fun_bairro) {
        this.fun_bairro = fun_bairro;
    }

    public String getFun_cidade() {
        return fun_cidade;
    }

    public void setFun_cidade(String fun_cidade) {
        this.fun_cidade = fun_cidade;
    }

    public String getFun_uf() {
        return fun_uf;
    }

    public void setFun_uf(String fun_uf) {
        this.fun_uf = fun_uf;
    }

    public String getFun_cnpjcpf() {
        return fun_cnpjcpf;
    }

    public void setFun_cnpjcpf(String fun_cnpjcpf) {
        this.fun_cnpjcpf = fun_cnpjcpf;
    }

    public String getFun_rgie() {
        return fun_rgie;
    }

    public void setFun_rgie(String fun_rgie) {
        this.fun_rgie = fun_rgie;
    }

    public char getFun_sexo() {
        return fun_sexo;
    }

    public void setFun_sexo(char fun_sexo) {
        this.fun_sexo = fun_sexo;
    }

    public Date getFun_nascimento() {
        return this.fun_nascimento;
    }

    public void setFun_nascimento(Date date) {
        this.fun_nascimento = date;
    }

    public String getFun_telefone() {
        return fun_telefone;
    }

    public void setFun_telefone(String fun_telefone) {
        this.fun_telefone = fun_telefone;
    }

    public String getFun_celular() {
        return fun_celular;
    }

    public void setFun_celular(String fun_celular) {
        this.fun_celular = fun_celular;
    }

    public String getFun_email() {
        return fun_email;
    }

    public void setFun_email(String fun_email) {
        this.fun_email = fun_email;
    }

    public Float getFun_salario() {
        return fun_salario;
    }

    public void setFun_salario(Float fun_salario) {
        this.fun_salario = fun_salario;
    }

    public static Funcionario mapearComParametros(String[] parameters) {
        Funcionario funcionario = new Funcionario();

        if (isNotNullOrEmpty(parameters[0])) {
            funcionario.setFun_codigo(Integer.parseInt(parameters[0]));
        }

        if (isNotNullOrEmpty(parameters[1])) {
            funcionario.setFun_nome(parameters[1]);
        }

        if (isNotNullOrEmpty(parameters[2])) {
            funcionario.setFun_endereco(parameters[2]);
        }

        if (isNotNullOrEmpty(parameters[3])) {
            funcionario.setFun_numero(parameters[3]);
        }

        if (isNotNullOrEmpty(parameters[4])) {
            funcionario.setFun_complemento(parameters[4]);
        }

        if (isNotNullOrEmpty(parameters[5])) {
            funcionario.setFun_bairro(parameters[5]);
        }

        if (isNotNullOrEmpty(parameters[6])) {
            funcionario.setFun_cidade(parameters[6]);
        }

        if (isNotNullOrEmpty(parameters[7])) {
            funcionario.setFun_uf(parameters[7]);
        }

        if (isNotNullOrEmpty(parameters[8])) {
            funcionario.setFun_cnpjcpf(parameters[8]);
        }

        if (isNotNullOrEmpty(parameters[9])) {
            funcionario.setFun_rgie(parameters[9]);
        }

        if (isNotNullOrEmpty(parameters[10])) {
            funcionario.setFun_sexo(parameters[10].charAt(0));
        }

        if (isNotNullOrEmpty(parameters[11])) {
            funcionario.setFun_nascimento(Date.valueOf(parameters[11]));
        }

        if (isNotNullOrEmpty(parameters[12])) {
            funcionario.setFun_telefone(parameters[12]);
        }

        if (isNotNullOrEmpty(parameters[13])) {
            funcionario.setFun_celular(parameters[13]);
        }

        if (isNotNullOrEmpty(parameters[14])) {
            funcionario.setFun_email(parameters[14]);
        }

        if (isNotNullOrEmpty(parameters[15])) {
            funcionario.setFun_salario(Float.parseFloat(parameters[15]));
        }

        return funcionario;
    }

    private static boolean isNotNullOrEmpty(String value) {
        return value != null && !value.isEmpty();
    }
}
