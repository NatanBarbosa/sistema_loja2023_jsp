<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./verificarLogin.jsp" %>
<%@ page import="sistema_loja2023.service.ProdutoService" %>
<%@ page import="sistema_loja2023.model.Produto" %>

<!DOCTYPE html PUBLIC "-//WC//DTD HTML . Transitional//EN" "http://www.w.org/TR/html/loose.dtd">

<html>
<head>
    <title>Tabela Produtos</title>

    <link rel="stylesheet" href="assets/estilo.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
        crossorigin="anonymous" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</head>

<%
    String pro_codigo=request.getParameter("pro_codigo");
    String action = request.getParameter("action");

    ProdutoService produtoService = new ProdutoService();
    String status = request.getParameter("status");

    String[] parametros = {
        request.getParameter("pro_codigo"),
        request.getParameter("pro_descricao"),
        request.getParameter("tpp_codigo"),
        request.getParameter("pro_precocusto"),
        request.getParameter("pro_precovenda"),
        request.getParameter("pro_estoque"),
        request.getParameter("pro_embalagem"),
        request.getParameter("pro_ipi")
    };

    Produto produto = Produto.mapearComParametros(parametros);

    Produto produtoPesquisado = new Produto();

    if ("consultar".equals(action)) {
        produtoPesquisado = produtoService.obter(produto.getPro_codigo());

    } else if ("cadastrar".equals(action)) {
        produtoService.inserir(produto);

    } else if ("alterar".equals(action)) {
        produtoService.alterar(produto);

    } else if ("excluir".equals(action)) {
        produtoService.excluir(produto.getPro_codigo());

    } else {
        produtoPesquisado = produtoService.obter(produto.getPro_codigo());
    }


%>

<body>
    <div class="container bg-primary-subtle my-3">
        <div class="row">
            <div class="col p-2 mt-2">
                <h3 class="text-primary text-center">Cadastro Produtos</h3>
            </div>
        </div>
        <hr />
        <form name="cadastro" method="get">
            <div class="row">
                <div class="col">
                    <div class="mb-3">
                        <label for="pro_codigoField" class="form-label">Codigo</label>
                        <input type="text" class="form-control" id="pro_codigoField" name="pro_codigoField"
                            value='<%= (produto.getPro_codigo()==null) ? "" : produto.getPro_codigo() %>' />
                    </div>
                    <div class="mb-3">
                        <label for="pro_descricaoField" class="form-label">Descrição</label>
                        <input type="text" class="form-control" id="pro_descricaoField" name="pro_descricaoField"
                            value='<%= (produto.getPro_descricao()==null) ? "" : produto.getPro_descricao() %>' />
                    </div>
                    <div class="mb-3">
                        <label for="tpp_codigoField" class="form-label">Codigo Tipo de Produto</label>
                        <input type="text" class="form-control" id="tpp_codigoField"
                            name="tpp_codigoField"
                            value='<%= produto.getTtp_codigo() == null ? "" : produto.getTtp_codigo() %>' />
                    </div>
                    <div class="mb-3">
                        <label for="pro_precocustoField" class="form-label">Preço de custo</label>
                        <input type="text" class="form-control" id="pro_precocustoField"
                            name="pro_precocustoField"
                            value='<%= produto.getPro_precocusto() == null ? "" : produto.getPro_precocusto() %>' />
                    </div>
                    <div class="mb-3">
                        <label for="pro_precovendaField" class="form-label">Preço de venda</label>
                        <input type="text" class="form-control" id="pro_precovendaField"
                            name="pro_precovendaField"
                            value='<%= produto.getPro_precovenda() == null ? "" : produto.getPro_precovenda() %>' />
                    </div>
                    <div class="mb-3">
                        <label for="pro_estoqueField" class="form-label">Quantidade em Estoque</label>
                        <input type="text" class="form-control" id="pro_estoqueField"
                            name="pro_estoqueField"
                            value='<%= produto.getPro_estoque() == null ? "" : produto.getPro_estoque() %>' />
                    </div>
                    <div class="mb-3">
                        <label for="pro_embalagemField" class="form-label">Embalagem</label>
                        <input type="text" class="form-control" id="pro_embalagemField"
                            name="pro_embalagemField"
                            value='<%= produto.getPro_embalagem() == null ? "" : produto.getPro_embalagem() %>' />
                    </div>
                    <div class="mb-3">
                        <label for="pro_ipiField" class="form-label">IPI</label>
                        <input type="text" class="form-control" id="pro_ipiField"
                            name="pro_ipiField"
                            value='<%= produto.getPro_ipi() == null ? "" : produto.getPro_ipi() %>' />
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
                            document.cadastro.pro_codigoField,
                            document.cadastro.pro_descricaoField,
                            document.cadastro.tpp_codigoField,
                            document.cadastro.pro_precocustoField,
                            document.cadastro.pro_precovendaField,
                            document.cadastro.pro_estoqueField,
                            document.cadastro.pro_embalagemField,
                            document.cadastro.pro_ipiField
                        ]
                        break
                    case "consultar":
                        required_fields = [
                            document.cadastro.pro_codigoField
                        ]
                        break
                    case "alterar":
                        required_fields = [
                            document.cadastro.pro_codigoField,
                            document.cadastro.pro_descricaoField,
                            document.cadastro.tpp_codigoField,
                            document.cadastro.pro_precocustoField,
                            document.cadastro.pro_precovendaField,
                            document.cadastro.pro_estoqueField,
                            document.cadastro.pro_embalagemField,
                            document.cadastro.pro_ipiField
                        ]
                        break
                    case "excluir":
                        required_fields = [
                            document.cadastro.pro_codigoField
                        ]
                        break
                    case "listar":
                        break
                    default:
                        alert("Ação inválida")
                        break
                }

                if (validador(required_fields)) {
                    document.cadastro.action = "produtos.jsp?" + action;
                    document.cadastro.submit()
                }
            };
        });
    </script>
</body>

</html>
