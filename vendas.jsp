<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//WC//DTD HTML . Transitional//EN" "http://www.w.org/TR/html/loose.dtd">

<html>
<head>
    <title>Tabela Vendas</title>

    <link rel="stylesheet" href="assets/estilo.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
        crossorigin="anonymous" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</head>

<%
    String ven_codigo=request.getParameter("ven_codigo");
    String tpg_codigo=request.getParameter("tpg_codigo");
    String fun_codigo=request.getParameter("fun_codigo");
    String nf_codigo=request.getParameter("nf_codigo");
    String ven_datavenda=request.getParameter("ven_datavenda");
    String ven_valortotal=request.getParameter("ven_valortotal");
    String ven_observacoes=request.getParameter("ven_observacoes");
    String status=request.getParameter("status");
%>

<body>
    <div class="container bg-primary-subtle my-3">
        <div class="row">
            <div class="col p-2 mt-2">
                <h3 class="text-primary text-center">Cadastro Vendas</h3>
            </div>
        </div>
        <hr />
        <form name="cadastro" method="get">
            <div class="row">
                <div class="col">
                    <div class="mb-3">
                        <label for="ven_codigoField" class="form-label">Codigo</label>
                        <input type="text" class="form-control" id="ven_codigoField" name="ven_codigoField"
                            value='<%= (ven_codigo==null) ? "" : ven_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="tpg_codigoField" class="form-label">Codigo Tipo de pagamento</label>
                        <input type="text" class="form-control" id="tpg_codigoField" name="tpg_codigoField"
                            value='<%= (tpg_codigo==null) ? "" : tpg_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="fun_codigoField" class="form-label">Codigo Funcionário</label>
                        <input type="text" class="form-control" id="fun_codigoField"
                            name="fun_codigoField"
                            value='<%= (fun_codigo==null) ? "" : fun_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="nf_codigoField" class="form-label">Codigo Nota fiscal</label>
                        <input type="text" class="form-control" id="nf_codigoField"
                            name="nf_codigoField"
                            value='<%= nf_codigo == null ? "" : nf_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="ven_datavendaField" class="form-label">Data da venda</label>
                        <input type="date" class="form-control" id="ven_datavendaField"
                            name="ven_datavendaField"
                            value='<%= ven_datavenda == null ? "" : ven_datavenda %>' />
                    </div>
                    <div class="mb-3">
                        <label for="ven_valortotalField" class="form-label">Valor Total</label>
                        <input type="text" class="form-control" id="ven_valortotalField"
                            name="ven_valortotalField"
                            value='<%= ven_valortotal == null ? "" : ven_valortotal %>' />
                    </div>
                    <div class="mb-3">
                        <label for="ven_observacoesField" class="form-label">Observações</label>
                        <textarea class="form-control" id="ven_observacoesField"
                            name="ven_observacoesField"
                            ><%= ven_observacoes == null ? "" : ven_observacoes %></textarea>
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
                            document.cadastro.ven_codigoField,
                            document.cadastro.tpg_codigoField,
                            document.cadastro.fun_codigoField,
                            document.cadastro.nf_codigoField,
                            document.cadastro.ven_datavendaField,
                            document.cadastro.ven_valortotalField,
                            document.cadastro.ven_observacoesField,
                        ]
                        break
                    case "consultar":
                        required_fields = [
                            document.cadastro.ven_codigoField
                        ]
                        break
                    case "alterar":
                        required_fields = [
                            document.cadastro.ven_codigoField,
                            document.cadastro.tpg_codigoField,
                            document.cadastro.fun_codigoField,
                            document.cadastro.nf_codigoField,
                            document.cadastro.ven_datavendaField,
                            document.cadastro.ven_valortotalField,
                            document.cadastro.ven_observacoesField,
                        ]
                        break
                    case "excluir":
                        required_fields = [
                            document.cadastro.ven_codigoField
                        ]
                        break
                    case "listar":
                        break
                    default:
                        alert("Ação inválida")
                        break
                }

                if (validador(required_fields)) {
                    document.cadastro.action = action + "_compras.jsp"
                    document.cadastro.submit()
                }
            };
        });
    </script>
</body>

</html>
