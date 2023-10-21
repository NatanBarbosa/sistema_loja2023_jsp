<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//WC//DTD HTML . Transitional//EN" "http://www.w.org/TR/html/loose.dtd">

<html>

<head>
    <title>Tabela Tipo Produto</title>
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
    String tpp_codigo=request.getParameter("tpp_codigo");
    String tpp_descricao=request.getParameter("tpp_descricao");
    String status=request.getParameter("status");
%>

<body>
    <div class="container bg-primary-subtle my-3">
        <div class="row">
            <div class="col p-2 mt-2">
                <h3 class="text-primary text-center">Cadastro Tipo Produto</h3>
            </div>
        </div>
        <hr />
        <form name="cadastro" method="get">
            <div class="row">
                <div class="col">
                    <div class="mb-3">
                        <label for="tpp_codigoField" class="form-label">Codigo</label>
                        <input type="text" class="form-control" id="tpp_codigoField" name="tpp_codigoField"
                            value='<%= (tpp_codigo==null) ? "" : tpp_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="tpp_descricaoField" class="form-label">Descrição</label>
                        <input type="text" class="form-control" id="tpp_descricaoField" name="tpp_descricaoField"
                            value='<%= (tpp_descricao==null) ? "" : tpp_descricao %>' />
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
                            document.cadastro.tpp_codigoField,
                            document.cadastro.tpp_descricaoField
                        ]
                        break
                    case "consultar":
                        required_fields = [
                            document.cadastro.tpp_codigoField
                        ]
                        break
                    case "alterar":
                        required_fields = [
                            document.cadastro.tpp_codigoField,
                            document.cadastro.tpp_descricaoField
                        ]
                        break
                    case "excluir":
                        required_fields = [
                            document.cadastro.tpp_codigoField
                        ]
                        break
                    case "listar":
                        break
                    default:
                        alert("Ação inválida")
                        break
                }

                if (validador(required_fields)) {
                    document.cadastro.action = action + "_tipoproduto.jsp"
                    document.cadastro.submit()
                }
            };
        });
    </script>
</body>

</html>
