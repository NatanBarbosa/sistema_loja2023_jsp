<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//WC//DTD HTML . Transitional//EN" "http://www.w.org/TR/html/loose.dtd">

<html>
<head>
    <title>Tabela Itens da Compra</title>

    <link rel="stylesheet" href="assets/estilo.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
        crossorigin="anonymous" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</head>

<%
    String itc_codigo=request.getParameter("itc_codigo");
    String com_codigo=request.getParameter("com_codigo");
    String pro_codigo=request.getParameter("pro_codigo");
    String tpp_codigo=request.getParameter("tpp_codigo");
    String nf_codigo=request.getParameter("nf_codigo");
    String for_codigo=request.getParameter("for_codigo");
    String tpg_codigo=request.getParameter("tpg_codigo");
    String itc_embalagem=request.getParameter("itc_embalagem");
    String itc_qtde=request.getParameter("itc_qtde");
    String itec_valorun=request.getParameter("itec_valorun");
    String itc_desc=request.getParameter("itc_desc");
    String itc_valortotal=request.getParameter("itc_valortotal");
    String status=request.getParameter("status");
%>

<body>
    <div class="container bg-primary-subtle content-area">
        <div class="row">
            <div class="col p-2 mt-2">
                <h3 class="text-primary text-center">Cadastro Itens da Compra</h3>
            </div>
        </div>
        <hr />
        <form name="cadastro" method="get">
            <div class="row">
                <div class="col">
                    <div class="mb-3">
                        <label for="itc_codigoField" class="form-label">Codigo</label>
                        <input type="text" class="form-control" id="itc_codigoField" name="itc_codigoField"
                            value='<%= (itc_codigo==null) ? "" : itc_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="com_codigoField" class="form-label">Codigo Compra</label>
                        <input type="text" class="form-control" id="com_codigoField" name="com_codigoField"
                            value='<%= (com_codigo==null) ? "" : com_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="pro_codigoField" class="form-label">Codigo Produto</label>
                        <input type="text" class="form-control" id="pro_codigoField"
                            name="pro_codigoField"
                            value='<%= (pro_codigo==null) ? "" : pro_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="tpp_codigoField" class="form-label">Codigo Tipo de Produto</label>
                        <input type="text" class="form-control" id="tpp_codigoField"
                            name="tpp_codigoField"
                            value='<%= tpp_codigo == null ? "" : tpp_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="nf_codigoField" class="form-label">Codigo Nota Fiscal</label>
                        <input type="text" class="form-control" id="nf_codigoField"
                            name="nf_codigoField"
                            value='<%= nf_codigo == null ? "" : nf_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="for_codigoField" class="form-label">Codigo Fornecedor</label>
                        <input type="text" class="form-control" id="for_codigoField"
                            name="for_codigoField"
                            value='<%= for_codigo == null ? "" : for_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="tpg_codigoField" class="form-label">Codigo Tipo de Pagamento</label>
                        <input type="text" class="form-control" id="tpg_codigoField"
                            name="tpg_codigoField"
                            value='<%= tpg_codigo == null ? "" : tpg_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="itc_embalagemField" class="form-label">Embalagem</label>
                        <input type="text" class="form-control" id="itc_embalagemField"
                            name="itc_embalagemField"
                            value='<%= itc_embalagem == null ? "" : itc_embalagem %>' />
                    </div>
                    <div class="mb-3">
                        <label for="itc_qtdeField" class="form-label">Quantidade de itens</label>
                        <input type="text" class="form-control" id="itc_qtdeField"
                            name="itc_qtdeField"
                            value='<%= itc_qtde == null ? "" : itc_qtde %>' />
                    </div>
                    <div class="mb-3">
                        <label for="itec_valorunField" class="form-label">Valor unitário</label>
                        <input type="text" class="form-control" id="itec_valorunField"
                            name="itec_valorunField"
                            value='<%= itec_valorun == null ? "" : itec_valorun %>' />
                    </div>
                    <div class="mb-3">
                        <label for="itc_descField" class="form-label">Descrição</label>
                        <input type="text" class="form-control" id="itc_descField"
                            name="itc_descField"
                            value='<%= itc_desc == null ? "" : itc_desc %>' />
                    </div>
                    <div class="mb-3">
                        <label for="itc_valortotalField" class="form-label">Valor total</label>
                        <input type="text" class="form-control" id="itc_valortotalField"
                            name="itc_valortotalField"
                            value='<%= itc_valortotal == null ? "" : itc_valortotal %>' />
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
                            document.cadastro.itc_codigoField,
                            document.cadastro.com_codigoField,
                            document.cadastro.pro_codigoField,
                            document.cadastro.tpp_codigoField,
                            document.cadastro.nf_codigoField,
                            document.cadastro.for_codigoField,
                            document.cadastro.tpg_codigoField,
                            document.cadastro.itc_embalagemField,
                            document.cadastro.itc_qtdeField,
                            document.cadastro.itec_valorunField,
                            document.cadastro.itc_descField,
                            document.cadastro.itc_valortotalField
                        ]
                        break
                    case "consultar":
                        required_fields = [
                            document.cadastro.itc_codigoField
                        ]
                        break
                    case "alterar":
                        required_fields = [
                            document.cadastro.itc_codigoField,
                            document.cadastro.com_codigoField,
                            document.cadastro.pro_codigoField,
                            document.cadastro.tpp_codigoField,
                            document.cadastro.nf_codigoField,
                            document.cadastro.for_codigoField,
                            document.cadastro.tpg_codigoField,
                            document.cadastro.itc_embalagemField,
                            document.cadastro.itc_qtdeField,
                            document.cadastro.itec_valorunField,
                            document.cadastro.itc_descField,
                            document.cadastro.itc_valortotalField
                        ]
                        break
                    case "excluir":
                        required_fields = [
                            document.cadastro.itc_codigoField
                        ]
                        break
                    case "listar":
                        break
                    default:
                        alert("Ação inválida")
                        break
                }

                if (validador(required_fields)) {
                    document.cadastro.action = action + "_itenscompra.jsp"
                    document.cadastro.submit()
                }
            };
        });
    </script>
</body>

</html>
