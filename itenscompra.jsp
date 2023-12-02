<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./verificarLogin.jsp" %>
<%@ page import="sistema_loja2023.service.ItensCompraService" %>
<%@ page import="sistema_loja2023.model.ItensCompra" %>
<%@ page import="java.util.List" %>
<%@ page import="sistema_loja2023.infraestructure.exceptions.CustomException" %>
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
    String action = request.getParameter("action");

    ItensCompraService itensCompraService = new ItensCompraService();
    String status = request.getParameter("status");

    String errorMessage = null;
    String errorDetail = null;


    String[] parametros = {
        request.getParameter("itc_codigoField"),
        request.getParameter("com_codigoField"),
        request.getParameter("pro_codigoField"),
        request.getParameter("tpp_codigoField"),
        request.getParameter("nf_codigoField"),
        request.getParameter("for_codigoField"),
        request.getParameter("tpg_codigoField"),
        request.getParameter("itc_embalagemField"),
        request.getParameter("itc_qtdeField"),
        request.getParameter("itec_valorunField"),
        request.getParameter("itc_descField"),
        request.getParameter("itc_valortotalField")
    };

    ItensCompra itemCompra = new ItensCompra();

    try {
        itemCompra = ItensCompra.mapearComParametros(parametros);

    } catch (Exception e) {
        errorMessage = "Um erro inesperado ocorreu!";
        errorDetail = e.getMessage();
    }

    
    ItensCompra itemCompraPesquisado = new ItensCompra();

    try {
        if (action != null) {
            
            if (action.equals("consultar")) {
                itemCompraPesquisado = itensCompraService.obter(itemCompra.getItc_codigo());
                status = "Pesquisado com sucesso";
                if (itemCompraPesquisado == null) {
                    itemCompraPesquisado = new ItensCompra();
                    status = "Registro inexistente";
                }
              

            } else if (action.equals("cadastrar")) {
                itensCompraService.inserir(itemCompra);
                status = "Cadastrado com sucesso";

            } else if (action.equals("alterar")) {
                itensCompraService.alterar(itemCompra);
                status = "Alterado com sucesso";
        
            } else if (action.equals("excluir")) {
                itensCompraService.excluir(itemCompra.getItc_codigo());
                status = "Excluído com sucesso";
            } 
        } 
        else {
            itemCompraPesquisado = itensCompraService.obter(1);
            status = "Pesquisado com sucesso";
             if (itemCompraPesquisado == null) {
                itemCompraPesquisado = new ItensCompra();
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
    <div class="container bg-primary-subtle content-area">
        <div class="row">
            <div class="col p-2 mt-2">
                <h3 class="text-primary text-center">Cadastro Itens da Compra</h3>
            </div>
        </div>
        <hr />
        <form name="cadastro" method="post">
            <input type="hidden" hidden id="action" name="action" value="">
            <input type="hidden" hidden id="page" name="page" value="itenscompra.jsp">
            <div class="row">
                <div class="col">
                    <div class="mb-3">
                        <label for="itc_codigoField" class="form-label">Codigo</label>
                        <input type="text" class="form-control" id="itc_codigoField" name="itc_codigoField"
                            value='<%= (itemCompraPesquisado.itc_codigo==null) ? "" : itemCompraPesquisado.itc_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="com_codigoField" class="form-label">Codigo Compra</label>
                        <input type="text" class="form-control" id="com_codigoField" name="com_codigoField"
                            value='<%= (itemCompraPesquisado.com_codigo==null) ? "" : itemCompraPesquisado.com_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="pro_codigoField" class="form-label">Codigo Produto</label>
                        <input type="text" class="form-control" id="pro_codigoField"
                            name="pro_codigoField"
                            value='<%= (itemCompraPesquisado.pro_codigo==null) ? "" : itemCompraPesquisado.pro_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="tpp_codigoField" class="form-label">Codigo Tipo de Produto</label>
                        <input type="text" class="form-control" id="tpp_codigoField"
                            name="tpp_codigoField"
                            value='<%= itemCompraPesquisado.tpp_codigo == null ? "" : itemCompraPesquisado.tpp_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="nf_codigoField" class="form-label">Codigo Nota Fiscal</label>
                        <input type="text" class="form-control" id="nf_codigoField"
                            name="nf_codigoField"
                            value='<%= itemCompraPesquisado.nf_codigo == null ? "" : itemCompraPesquisado.nf_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="for_codigoField" class="form-label">Codigo Fornecedor</label>
                        <input type="text" class="form-control" id="for_codigoField"
                            name="for_codigoField"
                            value='<%= itemCompraPesquisado.for_codigo == null ? "" : itemCompraPesquisado.for_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="tpg_codigoField" class="form-label">Codigo Tipo de Pagamento</label>
                        <input type="text" class="form-control" id="tpg_codigoField"
                            name="tpg_codigoField"
                            value='<%= itemCompraPesquisado.tpg_codigo == null ? "" : itemCompraPesquisado.tpg_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="itc_embalagemField" class="form-label">Embalagem</label>
                        <input type="text" class="form-control" id="itc_embalagemField"
                            name="itc_embalagemField"
                            value='<%= itemCompraPesquisado.itc_embalagem == null ? "" : itemCompraPesquisado.itc_embalagem %>' />
                    </div>
                    <div class="mb-3">
                        <label for="itc_qtdeField" class="form-label">Quantidade de itens</label>
                        <input type="text" class="form-control" id="itc_qtdeField"
                            name="itc_qtdeField"
                            value='<%= itemCompraPesquisado.itc_qtde == null ? "" : itemCompraPesquisado.itc_qtde %>' />
                    </div>
                    <div class="mb-3">
                        <label for="itec_valorunField" class="form-label">Valor unitário</label>
                        <input type="text" class="form-control" id="itec_valorunField"
                            name="itec_valorunField"
                            value='<%= itemCompraPesquisado.itc_valorun == null ? "" : itemCompraPesquisado.itc_valorun %>' />
                    </div>
                    <div class="mb-3">
                        <label for="itc_descField" class="form-label">Descrição</label>
                        <input type="text" class="form-control" id="itc_descField"
                            name="itc_descField"
                            value='<%= itemCompraPesquisado.itc_desc == null ? "" : itemCompraPesquisado.itc_desc %>' />
                    </div>
                    <div class="mb-3">
                        <label for="itc_valortotalField" class="form-label">Valor total</label>
                        <input type="text" class="form-control" id="itc_valortotalField"
                            name="itc_valortotalField"
                            value='<%= itemCompraPesquisado.itc_valortotal == null ? "" : itemCompraPesquisado.itc_valortotal %>' />
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
                            <input type="text" class="form-control" id="status" name="status" disabled
                                value='<%= (status==null) ? "" : status %>'
                                aria-describedby="statusField basic-addon4" />
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <% if(action != null && action.equals("listar")) {%>
        <table class="table table-striped-columns table-secondary container">
            <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Id Compra</th>
                    <th scope="col">Id Produto</th>
                    <th scope="col">Id Tipo de produto</th>
                    <th scope="col">Id Nota fiscal</th>
                    <th scope="col">Id Fornecedor</th>
                    <th scope="col">Id Tipo de pagamento</th>
                    <th scope="col">Embalagem</th>
                    <th scope="col">Quantidade</th>
                    <th scope="col">Valor unitário</th>
                    <th scope="col">Descrição</th>
                    <th scope="col">Valor total</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<ItensCompra> lista_itenscompra = itensCompraService.listarTodos();
                    for(int i = 0; i < lista_itenscompra.size(); i++){
                %>
                    <tr>
                        <td><%= lista_itenscompra.get(i).itc_codigo %></td>
                        <td><%= lista_itenscompra.get(i).com_codigo %></td>
                        <td><%= lista_itenscompra.get(i).pro_codigo %></td>
                        <td><%= lista_itenscompra.get(i).tpp_codigo %></td>
                        <td><%= lista_itenscompra.get(i).nf_codigo %></td>
                        <td><%= lista_itenscompra.get(i).for_codigo %></td>
                        <td><%= lista_itenscompra.get(i).tpg_codigo %></td>
                        <td><%= lista_itenscompra.get(i).itc_embalagem %></td>
                        <td><%= lista_itenscompra.get(i).itc_qtde %></td>
                        <td><%= lista_itenscompra.get(i).itc_valorun %></td>
                        <td><%= lista_itenscompra.get(i).itc_desc %></td>
                        <td><%= lista_itenscompra.get(i).itc_valortotal %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    <% } %>

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
                    document.cadastro.action.value=action;
                    document.cadastro.action = document.cadastro.page.value;
                    document.cadastro.submit()
                }
            };
        });
    </script>
</body>

</html>
