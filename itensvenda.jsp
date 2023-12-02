<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//WC//DTD HTML . Transitional//EN" "http://www.w.org/TR/html/loose.dtd">

<html>
<head>
    <title>Tabela Itens da Venda</title>

    <link rel="stylesheet" href="assets/estilo.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
        crossorigin="anonymous" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</head>

<%
    String itv_codigo=request.getParameter("itv_codigo");
    String ven_codigo=request.getParameter("ven_codigo");
    String pro_codigo=request.getParameter("pro_codigo");
    String tpp_codigo=request.getParameter("tpp_codigo");
    String nf_codigo=request.getParameter("nf_codigo");
    String fun_codigo=request.getParameter("fun_codigo");
    String tpg_codigo=request.getParameter("tpg_codigo");
    String itv_embalagem=request.getParameter("itv_embalagem");
    String itv_qtde=request.getParameter("itv_qtde");
    String itec_valorun=request.getParameter("itec_valorun");
    String itv_desc=request.getParameter("itv_desc");
    String itv_valortotal=request.getParameter("itv_valortotal");
    String status=request.getParameter("status");
%>

<body>
    <div class="container bg-primary-subtle content-area">
        <div class="row">
            <div class="col p-2 mt-2">
                <h3 class="text-primary text-center">Cadastro Itens da Venda</h3>
            </div>
        </div>
        <hr />
        <form name="cadastro" method="get">
            <div class="row">
                <div class="col">
                    <div class="mb-3">
                        <label for="itv_codigoField" class="form-label">Codigo</label>
                        <input type="text" class="form-control" id="itv_codigoField" name="itv_codigoField"
                            value='<%= (itv_codigo==null) ? "" : itv_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="ven_codigoField" class="form-label">Codigo Venda</label>
                        <input type="text" class="form-control" id="ven_codigoField" name="ven_codigoField"
                            value='<%= (ven_codigo==null) ? "" : ven_codigo %>' />
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
                        <label for="fun_codigoField" class="form-label">Codigo Funcionário</label>
                        <input type="text" class="form-control" id="fun_codigoField"
                            name="fun_codigoField"
                            value='<%= fun_codigo == null ? "" : fun_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="tpg_codigoField" class="form-label">Codigo Tipo de Pagamento</label>
                        <input type="text" class="form-control" id="tpg_codigoField"
                            name="tpg_codigoField"
                            value='<%= tpg_codigo == null ? "" : tpg_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="itv_embalagemField" class="form-label">Embalagem</label>
                        <input type="text" class="form-control" id="itv_embalagemField"
                            name="itv_embalagemField"
                            value='<%= itv_embalagem == null ? "" : itv_embalagem %>' />
                    </div>
                    <div class="mb-3">
                        <label for="itv_qtdeField" class="form-label">Quantidade de itens</label>
                        <input type="text" class="form-control" id="itv_qtdeField"
                            name="itv_qtdeField"
                            value='<%= itv_qtde == null ? "" : itv_qtde %>' />
                    </div>
                    <div class="mb-3">
                        <label for="itec_valorunField" class="form-label">Valor unitário</label>
                        <input type="text" class="form-control" id="itec_valorunField"
                            name="itec_valorunField"
                            value='<%= itec_valorun == null ? "" : itec_valorun %>' />
                    </div>
                    <div class="mb-3">
                        <label for="itv_descField" class="form-label">Descrição</label>
                        <input type="text" class="form-control" id="itv_descField"
                            name="itv_descField"
                            value='<%= itv_desc == null ? "" : itv_desc %>' />
                    </div>
                    <div class="mb-3">
                        <label for="itv_valortotalField" class="form-label">Valor total</label>
                        <input type="text" class="form-control" id="itv_valortotalField"
                            name="itv_valortotalField"
                            value='<%= itv_valortotal == null ? "" : itv_valortotal %>' />
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
                            document.cadastro.itv_codigoField,
                            document.cadastro.ven_codigoField,
                            document.cadastro.pro_codigoField,
                            document.cadastro.tpp_codigoField,
                            document.cadastro.nf_codigoField,
                            document.cadastro.fun_codigoField,
                            document.cadastro.tpg_codigoField,
                            document.cadastro.itv_embalagemField,
                            document.cadastro.itv_qtdeField,
                            document.cadastro.itec_valorunField,
                            document.cadastro.itv_descField,
                            document.cadastro.itv_valortotalField
                        ]
                        break
                    case "consultar":
                        required_fields = [
                            document.cadastro.itv_codigoField
                        ]
                        break
                    case "alterar":
                        required_fields = [
                            document.cadastro.itv_codigoField,
                            document.cadastro.ven_codigoField,
                            document.cadastro.pro_codigoField,
                            document.cadastro.tpp_codigoField,
                            document.cadastro.nf_codigoField,
                            document.cadastro.fun_codigoField,
                            document.cadastro.tpg_codigoField,
                            document.cadastro.itv_embalagemField,
                            document.cadastro.itv_qtdeField,
                            document.cadastro.itec_valorunField,
                            document.cadastro.itv_descField,
                            document.cadastro.itv_valortotalField
                        ]
                        break
                    case "excluir":
                        required_fields = [
                            document.cadastro.itv_codigoField
                        ]
                        break
                    case "listar":
                        break
                    default:
                        alert("Ação inválida")
                        break
                }

                if (validador(required_fields)) {
                    document.cadastro.action = action + "_itensvenda.jsp"
                    document.cadastro.submit()
                }
            };
        });
    </script>
</body>

</html>
