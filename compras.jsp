<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//WC//DTD HTML . Transitional//EN" "http://www.w.org/TR/html/loose.dtd">

<html>
<head>
    <title>Tabela Compras</title>

    <link rel="stylesheet" href="assets/estilo.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
        crossorigin="anonymous" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</head>

<%
    String com_codigo=request.getParameter("com_codigo");
    String tpg_codigo=request.getParameter("tpg_codigo");
    String for_codigo=request.getParameter("for_codigo");
    String nf_codigo=request.getParameter("nf_codigo");
    String com_datacompra=request.getParameter("com_datacompra");
    String com_valortotal=request.getParameter("com_valortotal");
    String com_observacoes=request.getParameter("com_observacoes");
    String status=request.getParameter("status");
%>

<body>
    <div class="container bg-primary-subtle my-3">
        <div class="row">
            <div class="col p-2 mt-2">
                <h3 class="text-primary text-center">Cadastro Compras</h3>
            </div>
        </div>
        <hr />
        <form name="cadastro" method="get">
            <div class="row">
                <div class="col">
                    <div class="mb-3">
                        <label for="com_codigoField" class="form-label">Codigo</label>
                        <input type="text" class="form-control" id="com_codigoField" name="com_codigoField"
                            value='<%= (com_codigo==null) ? "" : com_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="tpg_codigoField" class="form-label">Codigo Tipo de pagamento</label>
                        <input type="text" class="form-control" id="tpg_codigoField" name="tpg_codigoField"
                            value='<%= (tpg_codigo==null) ? "" : tpg_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="for_codigoField" class="form-label">Codigo Fornecedor</label>
                        <input type="text" class="form-control" id="for_codigoField"
                            name="for_codigoField"
                            value='<%= (for_codigo==null) ? "" : for_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="nf_codigoField" class="form-label">Codigo Nota fiscal</label>
                        <input type="text" class="form-control" id="nf_codigoField"
                            name="nf_codigoField"
                            value='<%= nf_codigo == null ? "" : nf_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="com_datacompraField" class="form-label">Data da compra</label>
                        <input type="date" class="form-control" id="com_datacompraField"
                            name="com_datacompraField"
                            value='<%= com_datacompra == null ? "" : com_datacompra %>' />
                    </div>
                    <div class="mb-3">
                        <label for="com_valortotalField" class="form-label">Valor Total</label>
                        <input type="text" class="form-control" id="com_valortotalField"
                            name="com_valortotalField"
                            value='<%= com_valortotal == null ? "" : com_valortotal %>' />
                    </div>
                    <div class="mb-3">
                        <label for="com_observacoesField" class="form-label">Observações</label>
                        <textarea class="form-control" id="com_observacoesField"
                            name="com_observacoesField"
                            ><%= com_observacoes == null ? "" : com_observacoes %></textarea>
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
                            document.cadastro.com_codigoField,
                            document.cadastro.tpg_codigoField,
                            document.cadastro.for_codigoField,
                            document.cadastro.nf_codigoField,
                            document.cadastro.com_datacompraField,
                            document.cadastro.com_valortotalField,
                            document.cadastro.com_observacoesField,
                        ]
                        break
                    case "consultar":
                        required_fields = [
                            document.cadastro.com_codigoField
                        ]
                        break
                    case "alterar":
                        required_fields = [
                            document.cadastro.com_codigoField,
                            document.cadastro.tpg_codigoField,
                            document.cadastro.for_codigoField,
                            document.cadastro.nf_codigoField,
                            document.cadastro.com_datacompraField,
                            document.cadastro.com_valortotalField,
                            document.cadastro.com_observacoesField,
                        ]
                        break
                    case "excluir":
                        required_fields = [
                            document.cadastro.com_codigoField
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
