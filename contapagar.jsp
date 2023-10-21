<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//WC//DTD HTML . Transitional//EN" "http://www.w.org/TR/html/loose.dtd">

<html>
<head>
    <title>Tabela Conta a Pagar</title>

    <link rel="stylesheet" href="assets/estilo.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
        crossorigin="anonymous" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</head>

<%
    String cp_codigo=request.getParameter("cp_codigo");
    String cp_valorconta=request.getParameter("cp_valorconta");
    String cp_datavencimento=request.getParameter("cp_datavencimento");
    String cp_datapagamento=request.getParameter("cp_datapagamento");
    String nf_codigo=request.getParameter("nf_codigo");
    String cp_observacoes=request.getParameter("cp_observacoes");
    String status=request.getParameter("status");
%>

<body>
    <div class="container bg-primary-subtle my-3">
        <div class="row">
            <div class="col p-2 mt-2">
                <h3 class="text-primary text-center">Cadastro Conta a Pagar</h3>
            </div>
        </div>
        <hr />
        <form name="cadastro" method="get">
            <div class="row">
                <div class="col">
                    <div class="mb-3">
                        <label for="cp_codigoField" class="form-label">Codigo</label>
                        <input type="text" class="form-control" id="cp_codigoField" name="cp_codigoField"
                            value='<%= (cp_codigo==null) ? "" : cp_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="cp_valorcontaField" class="form-label">Valor da Conta</label>
                        <input type="text" class="form-control" id="cp_valorcontaField" name="cp_valorcontaField"
                            value='<%= (cp_valorconta==null) ? "" : cp_valorconta %>' />
                    </div>
                    <div class="mb-3">
                        <label for="cp_datavencimentoField" class="form-label">Data de Vencimento</label>
                        <input type="date" class="form-control" id="cp_datavencimentoField"
                            name="cp_datavencimentoField"
                            value='<%= (cp_datavencimento==null) ? "" : cp_datavencimento %>' />
                    </div>
                    <div class="mb-3">
                        <label for="cp_datapagamentoField" class="form-label">Data de Pagamento</label>
                        <input type="date" class="form-control" id="cp_datapagamentoField"
                            name="cp_datapagamentoField"
                            value='<%= cp_datapagamento == null ? "" : cp_datapagamento %>' />
                    </div>
                    <div class="mb-3">
                        <label for="nf_codigoField" class="form-label">Código da Nota Fiscal</label>
                        <input type="text" class="form-control" id="nf_codigoField"
                            name="nf_codigoField"
                            value='<%= nf_codigo == null ? "" : nf_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="cp_observacoesField" class="form-label">Observações</label>
                        <textarea class="form-control" id="cp_observacoesField" name="cp_observacoesField"><%= cp_observacoes == null ? "" : cp_observacoes %></textarea>
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
                            document.cadastro.cp_codigoField,
                            document.cadastro.cp_valorcontaField,
                            document.cadastro.cp_datavencimentoField,
                            document.cadastro.cp_datavencimentoField,
                            document.cadastro.nf_codigoField,
                            document.cadastro.cp_observacoesField
                        ]
                        break
                    case "consultar":
                        required_fields = [
                            document.cadastro.cp_codigoField
                        ]
                        break
                    case "alterar":
                        required_fields = [
                            document.cadastro.cp_codigoField,
                            document.cadastro.cp_valorcontaField,
                            document.cadastro.cp_datavencimentoField,
                            document.cadastro.cp_datavencimentoField,
                            document.cadastro.nf_codigoField,
                            document.cadastro.cp_observacoesField
                        ]
                        break
                    case "excluir":
                        required_fields = [
                            document.cadastro.cp_codigoField
                        ]
                        break
                    case "listar":
                        break
                    default:
                        alert("Ação inválida")
                        break
                }

                if (validador(required_fields)) {
                    document.cadastro.action = action + "_contareceber.jsp"
                    document.cadastro.submit()
                }
            };
        });
    </script>
</body>

</html>
