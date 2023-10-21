<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//WC//DTD HTML . Transitional//EN" "http://www.w.org/TR/html/loose.dtd">

<html>
<head>
    <title>Tabela Conta a Receber</title>

    <link rel="stylesheet" href="assets/estilo.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
        crossorigin="anonymous" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</head>

<%
    String cr_codigo=request.getParameter("cr_codigo");
    String cr_valorconta=request.getParameter("cr_valorconta");
    String cr_datavencimento=request.getParameter("cr_datavencimento");
    String cr_datarecebimento=request.getParameter("cr_datarecebimento");
    String nf_codigo=request.getParameter("nf_codigo");
    String cr_observacoes=request.getParameter("cr_observacoes");
    String status=request.getParameter("status");
%>

<body>
    <div class="container bg-primary-subtle my-3">
        <div class="row">
            <div class="col p-2 mt-2">
                <h3 class="text-primary text-center">Cadastro Conta a Receber</h3>
            </div>
        </div>
        <hr />
        <form name="cadastro" method="get">
            <div class="row">
                <div class="col">
                    <div class="mb-3">
                        <label for="cr_codigoField" class="form-label">Codigo</label>
                        <input type="text" class="form-control" id="cr_codigoField" name="cr_codigoField"
                            value='<%= (cr_codigo==null) ? "" : cr_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="cr_valorcontaField" class="form-label">Valor da Conta</label>
                        <input type="text" class="form-control" id="cr_valorcontaField" name="cr_valorcontaField"
                            value='<%= (cr_valorconta==null) ? "" : cr_valorconta %>' />
                    </div>
                    <div class="mb-3">
                        <label for="cr_datavencimentoField" class="form-label">Data de Vencimento</label>
                        <input type="date" class="form-control" id="cr_datavencimentoField"
                            name="cr_datavencimentoField"
                            value='<%= (cr_datavencimento==null) ? "" : cr_datavencimento %>' />
                    </div>
                    <div class="mb-3">
                        <label for="cr_datarecebimentoField" class="form-label">Data de Recebimento</label>
                        <input type="date" class="form-control" id="cr_datarecebimentoField"
                            name="cr_datarecebimentoField"
                            value='<%= cr_datarecebimento == null ? "" : cr_datarecebimento %>' />
                    </div>
                    <div class="mb-3">
                        <label for="nf_codigoField" class="form-label">Código da Nota Fiscal</label>
                        <input type="text" class="form-control" id="nf_codigoField"
                            name="nf_codigoField"
                            value='<%= nf_codigo == null ? "" : nf_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="cr_observacoesField" class="form-label">Observações</label>
                        <textarea class="form-control" id="cr_observacoesField"
                            name="cr_observacoesField"
                            ><%= cr_observacoes == null ? "" : cr_observacoes %></textarea>
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
                            document.cadastro.cr_codigoField,
                            document.cadastro.cr_valorcontaField,
                            document.cadastro.cr_datavencimentoField,
                            document.cadastro.cr_datarecebimentoField,
                            document.cadastro.nf_codigoField,
                            document.cadastro.cr_observacoesField
                        ]
                        break
                    case "consultar":
                        required_fields = [
                            document.cadastro.cr_codigoField
                        ]
                        break
                    case "alterar":
                        required_fields = [
                            document.cadastro.cr_codigoField,
                            document.cadastro.cr_valorcontaField,
                            document.cadastro.cr_datavencimentoField,
                            document.cadastro.cr_datarecebimentoField,
                            document.cadastro.nf_codigoField,
                            document.cadastro.cr_observacoesField
                        ]
                        break
                    case "excluir":
                        required_fields = [
                            document.cadastro.cr_codigoField
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
