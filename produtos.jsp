<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./verificarLogin.jsp" %>
<%@ page import="sistema_loja2023.service.ProdutoService" %>
<%@ page import="sistema_loja2023.model.Produto" %>
<%@ page import="sistema_loja2023.infraestructure.exceptions.CustomException" %>

<!DOCTYPE html PUBLIC "-//WC//DTD HTML . Transitional//EN" "http://www.w.org/TR/html/loose.dtd">

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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

    String errorMessage = null;
    String errorDetail = null;


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

    Produto produto = new Produto();

    try {
        produto = Produto.mapearComParametros(parametros);

    } catch (Exception e) {
        errorMessage = "Um erro inesperado ocorreu!";
        errorDetail = e.getMessage();
    }

    
    Produto produtoPesquisado = new Produto();

    try {
        if (action != null) {
            
            if (action.equals("consultar")) {
                produtoPesquisado = produtoService.obter(produto.getPro_codigo());
                status = "Pesquisado com sucesso";
                if (produtoPesquisado == null) {
                    produtoPesquisado = new Produto();
                    status = "Registro inexistente";
                }
              

            } else if (action.equals("cadastrar")) {
                produtoService.inserir(produto);
                status = "Cadastrado com sucesso";

            } else if (action.equals("alterar")) {
                produtoService.alterar(produto);
                status = "Alterado com sucesso";
        
            } else if (action.equals("excluir")) {
                produtoService.excluir(produto.getPro_codigo());
                status = "Excluído com sucesso";
            } 
        } 
        else {
            produtoPesquisado = produtoService.obter(1);
            status = "Pesquisado com sucesso";
             if (produtoPesquisado == null) {
                produtoPesquisado = new Produto();
                status = "Registro inexistente";
            }
        }

    } catch (CustomException e) {
        errorMessage = e.getMessage();
        errorDetail = e.getDetail();
    } catch (Exception e) {
        errorMessage = "Um erro inesperado ocorreu!";
        errorDetail = e.getMessage();
    }


%>

<body>
<%@ include file="./navbar.jsp" %>
    <% if (errorMessage != null) { %>
        <div class="alert alert-danger" role="alert">
            <%=errorMessage%>

            <% if (errorDetail != null) { %>
                <br><br>
                <%=errorDetail%>
            <% } %>
        </div>
    <% } %>

    <div class="container bg-primary-subtle my-3">
        <div class="row">
            <div class="col p-2 mt-2">
                <h3 class="text-primary text-center">Cadastro Produtos</h3>
            </div>
        </div>
        <hr />
        <form name="cadastro" method="post" action="">
            <input type="hidden" hidden id="action" name="action" value="">
            <input type="hidden" hidden id="page" name="page" value="produtos.jsp">
            <div class="row">
                <div class="col">
                    <div class="row">
                        <div class="mb-3 col-6">
                            <label for="pro_codigo" class="form-label">Codigo</label>
                            <input type="number" class="form-control" id="pro_codigo" name="pro_codigo"
                                value='<%= (produtoPesquisado.getPro_codigo()==null) ? "" : produtoPesquisado.getPro_codigo() %>' />
                        </div>
                        <div class="mb-3 col-6">
                            <label for="pro_descricao" class="form-label">Descrição</label>
                            <input type="text" class="form-control" id="pro_descricao" name="pro_descricao"
                                value='<%= (produtoPesquisado.getPro_descricao()==null) ? "" : produtoPesquisado.getPro_descricao() %>' />
                        </div>
                    </div>
                     <div class="row">
                        <div class="mb-3 col-6">
                            <label for="tpp_codigo" class="form-label">Codigo Tipo de Produto</label>
                            <input type="number" class="form-control" id="tpp_codigo"
                                name="tpp_codigo"
                                value='<%= produtoPesquisado.getTtp_codigo() == null ? "" : produtoPesquisado.getTtp_codigo() %>' />
                        </div>
                        <div class="mb-3 col-6">
                            <label for="pro_precocusto" class="form-label">Preço de custo</label>
                            <input type="number" class="form-control" id="pro_precocusto"
                                name="pro_precocusto"
                                value='<%= produtoPesquisado.getPro_precocusto() == null ? "" : produtoPesquisado.getPro_precocusto() %>' />
                        </div>
                    </div>
                    <div class="row">
                        <div class="mb-3 col-6">
                            <label for="pro_precovenda" class="form-label">Preço de venda</label>
                            <input type="number" step="0.01" class="form-control" id="pro_precovenda"
                                name="pro_precovenda"
                                value='<%= produtoPesquisado.getPro_precovenda() == null ? "" : produtoPesquisado.getPro_precovenda() %>' />
                        </div>
                        <div class="mb-3 col-6">
                            <label for="pro_estoque" class="form-label">Quantidade em Estoque</label>
                            <input type="number" class="form-control" id="pro_estoque"
                                name="pro_estoque"
                                value='<%= produtoPesquisado.getPro_estoque() == null ? "" : produtoPesquisado.getPro_estoque() %>' />
                        </div>
                    </div>
                    <div class="row">
                        <div class="mb-3 col-6">
                            <label for="pro_embalagem" class="form-label">Embalagem</label>
                            <input type="text" class="form-control" id="pro_embalagem"
                                name="pro_embalagem"
                                value='<%= produtoPesquisado.getPro_embalagem() == null ? "" : produtoPesquisado.getPro_embalagem() %>' />
                        </div>
                        <div class="mb-3 col-6">
                            <label for="pro_ipi" class="form-label">IPI</label>
                            <input type="number" class="form-control" id="pro_ipi"
                                name="pro_ipi"
                                value='<%= produtoPesquisado.getPro_ipi() == null ? "" : produtoPesquisado.getPro_ipi() %>' />
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
                            <span class="input-group-text" id="status">Status:</span>
                            <input type="text" class="form-control" id="status" name="status" disabled
                                value='<%= (status==null) ? "" : status %>'
                                aria-describedby="status basic-addon4" />
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
                            document.cadastro.pro_codigo,
                            document.cadastro.pro_descricao,
                            document.cadastro.tpp_codigo,
                            document.cadastro.pro_precocusto,
                            document.cadastro.pro_precovenda,
                            document.cadastro.pro_estoque,
                            document.cadastro.pro_embalagem,
                            document.cadastro.pro_ipi
                        ]
                        break
                    case "consultar":
                        required_fields = [
                            document.cadastro.pro_codigo
                        ]
                        break
                    case "alterar":
                        required_fields = [
                            document.cadastro.pro_codigo,
                            document.cadastro.pro_descricao,
                            document.cadastro.tpp_codigo,
                            document.cadastro.pro_precocusto,
                            document.cadastro.pro_precovenda,
                            document.cadastro.pro_estoque,
                            document.cadastro.pro_embalagem,
                            document.cadastro.pro_ipi
                        ]
                        break
                    case "excluir":
                        required_fields = [
                            document.cadastro.pro_codigo
                        ]
                        break
                    case "listar":
                        break
                    default:
                        alert("Ação inválida")
                        break
                }

                if (validador(required_fields)) {
                    document.cadastro.action.value=action;
                    document.cadastro.action = document.cadastro.page.value;
                    document.cadastro.submit()
                }
            };
        });
    </script>
</body>

</html>