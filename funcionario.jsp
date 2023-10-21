<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//WC//DTD HTML . Transitional//EN" "http://www.w.org/TR/html/loose.dtd">

<html>
<head>
    <title>Tabela Funcionario</title>

    <link rel="stylesheet" href="assets/estilo.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
        crossorigin="anonymous" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</head>

<%
    String fun_codigo=request.getParameter("fun_codigo");
    String fun_nome=request.getParameter("fun_nome");
    String fun_endereco=request.getParameter("fun_endereco");
    String fun_numero=request.getParameter("fun_numero");
    String fun_complemento=request.getParameter("fun_complemento");
    String fun_bairro=request.getParameter("fun_bairro");
    String fun_cidade=request.getParameter("fun_cidade");
    String fun_uf=request.getParameter("fun_uf");
    String fun_cpfcnpj=request.getParameter("fun_cpfcnpj");
    String fun_rgie=request.getParameter("fun_rgie");
    String fun_sexo=request.getParameter("fun_sexo");
    String fun_nascimento=request.getParameter("fun_nascimento");
    String fun_telefone=request.getParameter("fun_telefone");
    String fun_celular=request.getParameter("fun_celular");
    String fun_email=request.getParameter("fun_email");
    String fun_salario=request.getParameter("fun_salario");
    String status=request.getParameter("status");
%>

<body>
    <div class="container bg-primary-subtle my-3">
        <div class="row">
            <div class="col p-2 mt-2">
                <h3 class="text-primary text-center">Cadastro Funcionario</h3>
            </div>
        </div>
        <hr />
        <form name="cadastro" method="get">
            <div class="row">
                <div class="col">
                    <div class="mb-3">
                        <label for="fun_codigoField" class="form-label">Codigo</label>
                        <input type="text" class="form-control" id="fun_codigoField" name="fun_codigoField"
                            value='<%= (fun_codigo==null) ? "" : fun_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="fun_nomeField" class="form-label">Nome</label>
                        <input type="text" class="form-control" id="fun_nomeField" name="fun_nomeField"
                            value='<%= (fun_nome==null) ? "" : fun_nome %>' />
                    </div>
                    <div class="mb-3">
                        <label for="fun_enderecoField" class="form-label">Endereço</label>
                        <input type="text" class="form-control" id="fun_enderecoField"
                            name="fun_enderecoField"
                            value='<%= (fun_endereco==null) ? "" : fun_endereco %>' />
                    </div>
                    <div class="mb-3">
                        <label for="fun_numeroField" class="form-label">Número</label>
                        <input type="text" class="form-control" id="fun_numeroField"
                            name="fun_numeroField"
                            value='<%= fun_numero == null ? "" : fun_numero %>' />
                    </div>
                    <div class="mb-3">
                        <label for="fun_complementoField" class="form-label">Complemento</label>
                        <input type="text" class="form-control" id="fun_complementoField"
                            name="fun_complementoField"
                            value='<%= fun_complemento == null ? "" : fun_complemento %>' />
                    </div>
                    <div class="mb-3">
                        <label for="fun_bairroField" class="form-label">Bairro</label>
                        <input type="text" class="form-control" id="fun_bairroField"
                            name="fun_bairroField"
                            value='<%= fun_bairro == null ? "" : fun_bairro %>' />
                    </div>
                    <div class="mb-3">
                        <label for="fun_cidadeField" class="form-label">Cidade</label>
                        <input type="text" class="form-control" id="fun_cidadeField"
                            name="fun_cidadeField"
                            value='<%= fun_cidade == null ? "" : fun_cidade %>' />
                    </div>
                    <div class="mb-3">
                        <label for="fun_ufField" class="form-label">UF</label>
                        <input type="text" class="form-control" id="fun_ufField"
                            name="fun_ufField"
                            value='<%= fun_uf == null ? "" : fun_uf %>' />
                    </div>
                    <div class="mb-3">
                        <label for="fun_cpfcnpjField" class="form-label">CPF ou CNPJ</label>
                        <input type="text" class="form-control" id="fun_cpfcnpjField"
                            name="fun_cpfcnpjField"
                            value='<%= fun_cpfcnpj == null ? "" : fun_cpfcnpj %>' />
                    </div>
                    <div class="mb-3">
                        <label for="fun_rgieField" class="form-label">RG ou IE</label>
                        <input type="text" class="form-control" id="fun_rgieField"
                            name="fun_rgieField"
                            value='<%= fun_rgie == null ? "" : fun_rgie %>' />
                    </div>
                    <div class="mb-3">
                        <label for="fun_sexoField" class="form-check-label">Sexo</label>
                        <div class="form-check">
                            <input type="radio" class="form-check-input" id="F"
                            name="fun_sexoField"
                            <%= fun_sexo == null ? "" : fun_sexo == "F" ? "checked" : "" %> />
                            <label class="form-check-label" for="F">
                                Feminino
                            </label>
                        </div>
                        <div class="form-check">
                            <input type="radio" class="form-check-input" id="M"
                            name="fun_sexoField"
                            <%= fun_sexo == null ? "" : fun_sexo == "M" ? "checked" : "" %> />
                            <label class="form-check-label" for="M">
                                Masculino
                            </label>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="fun_nascimentoField" class="form-label">Data de nascimento</label>
                        <input type="date" class="form-control" id="fun_nascimentoField"
                            name="fun_nascimentoField"
                            value='<%= fun_nascimento == null ? "" : fun_nascimento %>' />
                    </div>
                    <div class="mb-3">
                        <label for="fun_telefoneField" class="form-label">Telefone</label>
                        <input type="text" class="form-control" id="fun_telefoneField"
                            name="fun_telefoneField"
                            value='<%= fun_telefone == null ? "" : fun_telefone %>' />
                    </div>
                    <div class="mb-3">
                        <label for="fun_celularField" class="form-label">Celular</label>
                        <input type="text" class="form-control" id="fun_celularField"
                            name="fun_celularField"
                            value='<%= fun_celular == null ? "" : fun_celular %>' />
                    </div>
                    <div class="mb-3">
                        <label for="fun_emailField" class="form-label">Email</label>
                        <input type="text" class="form-control" id="fun_emailField"
                            name="fun_emailField"
                            value='<%= fun_email == null ? "" : fun_email %>' />
                    </div>
                    <div class="mb-3">
                        <label for="fun_salarioField" class="form-label">Salário</label>
                        <input type="text" class="form-control" id="fun_salarioField"
                            name="fun_salarioField"
                            value='<%= fun_salario == null ? "" : fun_salario %>' />
                    </div>
                </div>
            </div>
            <hr />
            <div class="row mb-3">
                <div class="col">
                    <button type="button" class="btn-action btn btn-success" btn-action="cadastrar">
                        Cadastrar
                    </button>
                    <button type="button" class="btn-action btn btn-info" btn-action="consultar">
                        Consultar
                    </button>
                    <button type="button" class="btn-action btn btn-warning" btn-action="alterar">
                        Alterar
                    </button>
                    <button type="button" class="btn-action btn btn-danger" btn-action="excluir">
                        excluir
                    </button>
                    <button type="button" class="btn-action btn btn-secondary" btn-action="listar">
                        listar
                    </button>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="mb-3">
                        <div class="input-group">
                            <span class="input-group-text" id="statusField">Status:</span>
                            <input type="text" class="form-control" id="statusField" name="statusField" disabled
                                value='<%= (status==null) ? "" : status %>'
                                aria-describedby="statusField basic-addon4" />
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <script src="assets/validador.js"></script>
    <script>
        document.querySelectorAll(".btn-action").forEach((btn) => {
            btn.onclick = () => {
                let action = btn.getAttribute("btn-action");
                let required_fields = []

                switch (action) {
                    case "cadastrar":
                        required_fields = [
                            document.cadastro.fun_codigoField,
                            document.cadastro.fun_nomeField,
                            document.cadastro.fun_enderecoField,
                            document.cadastro.fun_numeroField,
                            document.cadastro.fun_complementoField,
                            document.cadastro.fun_bairroField,
                            document.cadastro.fun_cidadeField,
                            document.cadastro.fun_ufField,
                            document.cadastro.fun_cpfcnpjField,
                            document.cadastro.fun_rgieField,
                            document.cadastro.fun_sexoField,
                            document.cadastro.fun_nascimentoField,
                            document.cadastro.fun_telefoneField,
                            document.cadastro.fun_celularField,
                            document.cadastro.fun_emailField,
                            document.cadastro.fun_salarioField,
                        ]
                        break
                    case "consultar":
                        required_fields = [
                            document.cadastro.fun_codigoField
                        ]
                        break
                    case "alterar":
                        required_fields = [
                            document.cadastro.fun_codigoField,
                            document.cadastro.fun_nomeField,
                            document.cadastro.fun_enderecoField,
                            document.cadastro.fun_numeroField,
                            document.cadastro.fun_complementoField,
                            document.cadastro.fun_bairroField,
                            document.cadastro.fun_cidadeField,
                            document.cadastro.fun_ufField,
                            document.cadastro.fun_cpfcnpjField,
                            document.cadastro.fun_rgieField,
                            document.cadastro.fun_sexoField,
                            document.cadastro.fun_nascimentoField,
                            document.cadastro.fun_telefoneField,
                            document.cadastro.fun_celularField,
                            document.cadastro.fun_emailField,
                            document.cadastro.fun_salarioField,
                        ]
                        break
                    case "excluir":
                        required_fields = [
                            document.cadastro.fun_codigoField
                        ]
                        break
                    case "listar":
                        break
                    default:
                        alert("Ação inválida")
                        break
                }

                if (validador(required_fields)) {
                    document.cadastro.action = action + "_funcionario.jsp"
                    document.cadastro.submit()
                }
            };
        });
    </script>
</body>

</html>
