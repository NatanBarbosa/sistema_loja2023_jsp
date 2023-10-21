<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//WC//DTD HTML . Transitional//EN" "http://www.w.org/TR/html/loose.dtd">

<html>
<head>
    <title>Tabela Fornecedor</title>

    <link rel="stylesheet" href="assets/estilo.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
        crossorigin="anonymous" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</head>

<%
    String for_codigo=request.getParameter("for_codigo");
    String for_nome=request.getParameter("for_nome");
    String for_endereco=request.getParameter("for_endereco");
    String for_numero=request.getParameter("for_numero");
    String for_bairro=request.getParameter("for_bairro");
    String for_cidade=request.getParameter("for_cidade");
    String for_uf=request.getParameter("for_uf");
    String for_cpfcnpj=request.getParameter("for_cpfcnpj");
    String for_rgie=request.getParameter("for_rgie");
    String for_telefone=request.getParameter("for_telefone");
    String for_fax=request.getParameter("for_fax");
    String for_celular=request.getParameter("for_celular");
    String for_email=request.getParameter("for_email");
    String status=request.getParameter("status");
%>

<body>
    <div class="container bg-primary-subtle my-3">
        <div class="row">
            <div class="col p-2 mt-2">
                <h3 class="text-primary text-center">Cadastro Fornecedor</h3>
            </div>
        </div>
        <hr />
        <form name="cadastro" method="get">
            <div class="row">
                <div class="col">
                    <div class="mb-3">
                        <label for="for_codigoField" class="form-label">Codigo</label>
                        <input type="text" class="form-control" id="for_codigoField" name="for_codigoField"
                            value='<%= (for_codigo==null) ? "" : for_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="for_nomeField" class="form-label">Nome</label>
                        <input type="text" class="form-control" id="for_nomeField" name="for_nomeField"
                            value='<%= (for_nome==null) ? "" : for_nome %>' />
                    </div>
                    <div class="mb-3">
                        <label for="for_enderecoField" class="form-label">Endereço</label>
                        <input type="text" class="form-control" id="for_enderecoField"
                            name="for_enderecoField"
                            value='<%= (for_endereco==null) ? "" : for_endereco %>' />
                    </div>
                    <div class="mb-3">
                        <label for="for_numeroField" class="form-label">Numero</label>
                        <input type="text" class="form-control" id="for_numeroField"
                            name="for_numeroField"
                            value='<%= for_numero == null ? "" : for_numero %>' />
                    </div>
                    <div class="mb-3">
                        <label for="for_bairroField" class="form-label">Bairro</label>
                        <input type="text" class="form-control" id="for_bairroField"
                            name="for_bairroField"
                            value='<%= for_bairro == null ? "" : for_bairro %>' />
                    </div>
                    <div class="mb-3">
                        <label for="for_cidadeField" class="form-label">Cidade</label>
                        <input type="text" class="form-control" id="for_cidadeField"
                            name="for_cidadeField"
                            value='<%= for_cidade == null ? "" : for_cidade %>' />
                    </div>
                    <div class="mb-3">
                        <label for="for_ufField" class="form-label">UF</label>
                        <input type="text" class="form-control" id="for_ufField"
                            name="for_ufField"
                            value='<%= for_uf == null ? "" : for_uf %>' />
                    </div>
                    <div class="mb-3">
                        <label for="for_cpfcnpjField" class="form-label">CPF ou CNPJ</label>
                        <input type="text" class="form-control" id="for_cpfcnpjField"
                            name="for_cpfcnpjField"
                            value='<%= for_cpfcnpj == null ? "" : for_cpfcnpj %>' />
                    </div>
                    <div class="mb-3">
                        <label for="for_rgieField" class="form-label">RG ou IE</label>
                        <input type="text" class="form-control" id="for_rgieField"
                            name="for_rgieField"
                            value='<%= for_rgie == null ? "" : for_rgie %>' />
                    </div>
                    <div class="mb-3">
                        <label for="for_telefoneField" class="form-label">Telefone</label>
                        <input type="text" class="form-control" id="for_telefoneField"
                            name="for_telefoneField"
                            value='<%= for_telefone == null ? "" : for_telefone %>' />
                    </div>
                    <div class="mb-3">
                        <label for="for_faxField" class="form-label">Fax</label>
                        <input type="text" class="form-control" id="for_faxField"
                            name="for_faxField"
                            value='<%= for_fax == null ? "" : for_fax %>' />
                    </div>
                    <div class="mb-3">
                        <label for="for_celularField" class="form-label">Celular</label>
                        <input type="text" class="form-control" id="for_celularField"
                            name="for_celularField"
                            value='<%= for_celular == null ? "" : for_celular %>' />
                    </div>
                    <div class="mb-3">
                        <label for="for_emailField" class="form-label">Email</label>
                        <input type="text" class="form-control" id="for_emailField"
                            name="for_emailField"
                            value='<%= for_email == null ? "" : for_email %>' />
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
                            document.cadastro.for_codigoField,
                            document.cadastro.for_nomeField,
                            document.cadastro.for_enderecoField,
                            document.cadastro.for_numeroField,
                            document.cadastro.for_bairroField,
                            document.cadastro.for_cidadeField,
                            document.cadastro.for_ufField,
                            document.cadastro.for_cpfcnpjField,
                            document.cadastro.for_rgieField,
                            document.cadastro.for_telefoneField,
                            document.cadastro.for_faxField,
                            document.cadastro.for_celularField,
                            document.cadastro.for_emailField,
                        ]
                        break
                    case "consultar":
                        required_fields = [
                            document.cadastro.for_codigoField
                        ]
                        break
                    case "alterar":
                        required_fields = [
                            document.cadastro.for_codigoField,
                            document.cadastro.for_nomeField,
                            document.cadastro.for_enderecoField,
                            document.cadastro.for_numeroField,
                            document.cadastro.for_bairroField,
                            document.cadastro.for_cidadeField,
                            document.cadastro.for_ufField,
                            document.cadastro.for_cpfcnpjField,
                            document.cadastro.for_rgieField,
                            document.cadastro.for_telefoneField,
                            document.cadastro.for_faxField,
                            document.cadastro.for_celularField,
                            document.cadastro.for_emailField,
                        ]
                        break
                    case "excluir":
                        required_fields = [
                            document.cadastro.for_codigoField
                        ]
                        break
                    case "listar":
                        break
                    default:
                        alert("Ação inválida")
                        break
                }

                if (validador(required_fields)) {
                    document.cadastro.action = action + "_fornecedor.jsp"
                    document.cadastro.submit()
                }
            };
        });
    </script>
</body>

</html>
