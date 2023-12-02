<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//WC//DTD HTML . Transitional//EN" "http://www.w.org/TR/html/loose.dtd">

<html>

<head>
    <title>Tabela Tipo Pagamento</title>
    <link rel="stylesheet" href="assets/estilo.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
        crossorigin="anonymous" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=iso--" />
</head>

<%
    String tpg_codigo=request.getParameter("tpg_codigo");
    String tpg_descricao=request.getParameter("tpg_descricao");
    String tpg_qtde=request.getParameter("tpg_qtde");
    String tpg_ativo=request.getParameter("tpg_ativo");
    String status=request.getParameter("status");
%>

<body>
    <div class="container bg-primary-subtle content-area">
        <div class="row">
            <div class="col p-2 mt-2">
                <h3 class="text-primary text-center">Cadastro Tipo Pagamento</h3>
            </div>
        </div>
        <hr />
        <form name="cadastro" method="get">
            <div class="row">
                <div class="col">
                    <div class="mb-3">
                        <label for="tpg_codigoField" class="form-label">Codigo</label>
                        <input type="text" class="form-control" id="tpg_codigoField" name="tpg_codigoField"
                            value='<%= (tpg_codigo==null) ? "" : tpg_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="tpg_descricaoField" class="form-label">Descrição</label>
                        <input type="text" class="form-control" id="tpg_descricaoField" name="tpg_descricaoField"
                            value='<%= (tpg_descricao==null) ? "" : tpg_descricao %>' />
                    </div>
                    <div class="mb-3">
                        <label for="tpg_qtdeField" class="form-label">Quantidade</label>
                        <input type="text" class="form-control" id="tpg_qtdeField"
                            name="tpg_qtdeField"
                            value='<%= (tpg_qtde==null) ? "" : tpg_qtde %>' />
                    </div>
                    <div class="mb-3">
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="tpg_ativoField"
                            name="tpg_ativoField"
                            <%= tpg_ativo == null ? "" : tpg_ativo == "S" ? "checked" : "" %>/>
                            <label for="tpg_ativoField" class="form-check-label">Ativo?</label>
                        </div>
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
                            document.cadastro.tpg_codigoField,
                            document.cadastro.tpg_descricaoField,
                            document.cadastro.tpg_qtdeField,
                            document.cadastro.tpg_ativoField
                        ]
                        break
                    case "consultar":
                        required_fields = [
                            document.cadastro.tpg_codigoField
                        ]
                        break
                    case "alterar":
                        required_fields = [
                            document.cadastro.tpg_codigoField,
                            document.cadastro.tpg_descricaoField,
                            document.cadastro.tpg_qtdeField,
                            document.cadastro.tpg_ativoField
                        ]
                        break
                    case "excluir":
                        required_fields = [
                            document.cadastro.tpg_codigoField
                        ]
                        break
                    case "listar":
                        break
                    default:
                        alert("Ação inválida")
                        break
                }

                if (validador(required_fields)) {
                    document.cadastro.action = action + "_tipopagto.jsp"
                    document.cadastro.submit()
                }
            };
        });
    </script>
</body>

</html>
