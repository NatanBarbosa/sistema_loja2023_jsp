<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./verificarLogin.jsp" %>
<%@ page import="sistema_loja2023.service.ItensVendaService" %>
<%@ page import="sistema_loja2023.model.ItensVenda" %>
<%@ page import="java.util.List" %>
<%@ page import="sistema_loja2023.infraestructure.exceptions.CustomException" %>
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
    String action = request.getParameter("action");

    ItensVendaService itensVendaService = new ItensVendaService();
    String status = request.getParameter("status");

    String errorMessage = null;
    String errorDetail = null;


    String[] parametros = {
        request.getParameter("itv_codigoField"),
        request.getParameter("ven_codigoField"),
        request.getParameter("pro_codigoField"),
        request.getParameter("tpp_codigoField"),
        request.getParameter("nf_codigoField"),
        request.getParameter("fun_codigoField"),
        request.getParameter("tpg_codigoField"),
        request.getParameter("itv_embalagemField"),
        request.getParameter("itv_qtdeField"),
        request.getParameter("itec_valorunField"),
        request.getParameter("itv_descField"),
        request.getParameter("itv_valortotalField")
    };

    ItensVenda itemVenda = new ItensVenda();

    try {
        itemVenda = ItensVenda.mapearComParametros(parametros);

    } catch (Exception e) {
        errorMessage = "Um erro inesperado ocorreu!";
        errorDetail = e.getMessage();
    }

    
    ItensVenda itemVendaPesquisado = new ItensVenda();

    try {
        if (action != null) {
            
            if (action.equals("consultar")) {
                itemVendaPesquisado = itensVendaService.obter(itemVenda.getItv_codigo());
                status = "Pesquisado com sucesso";
                if (itemVendaPesquisado == null) {
                    itemVendaPesquisado = new ItensVenda();
                    status = "Registro inexistente";
                }
              

            } else if (action.equals("cadastrar")) {
                itensVendaService.inserir(itemVenda);
                status = "Cadastrado com sucesso";

            } else if (action.equals("alterar")) {
                itensVendaService.alterar(itemVenda);
                status = "Alterado com sucesso";
        
            } else if (action.equals("excluir")) {
                itensVendaService.excluir(itemVenda.getItv_codigo());
                status = "Excluído com sucesso";
            } 
        } 
        else {
            itemVendaPesquisado = itensVendaService.obter(1);
            status = "Pesquisado com sucesso";
             if (itemVendaPesquisado == null) {
                itemVendaPesquisado = new ItensVenda();
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
                <h3 class="text-primary text-center">Cadastro Itens da Venda</h3>
            </div>
        </div>
        <hr />
        <form name="cadastro" method="post">
            <input type="hidden" hidden id="action" name="action" value="">
            <input type="hidden" hidden id="page" name="page" value="itensvenda.jsp">
            <div class="row">
                <div class="col">
                    <div class="mb-3">
                        <label for="itv_codigoField" class="form-label">Codigo</label>
                        <input type="text" class="form-control" id="itv_codigoField" name="itv_codigoField"
                            value='<%= itemVendaPesquisado.itv_codigo==null ? "" : itemVendaPesquisado.itv_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="ven_codigoField" class="form-label">Codigo Venda</label>
                        <input type="text" class="form-control" id="ven_codigoField" name="ven_codigoField"
                            value='<%= itemVendaPesquisado.ven_codigo==null ? "" : itemVendaPesquisado.ven_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="pro_codigoField" class="form-label">Codigo Produto</label>
                        <input type="text" class="form-control" id="pro_codigoField"
                            name="pro_codigoField"
                            value='<%= itemVendaPesquisado.pro_codigo==null ? "" : itemVendaPesquisado.pro_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="tpp_codigoField" class="form-label">Codigo Tipo de Produto</label>
                        <input type="text" class="form-control" id="tpp_codigoField"
                            name="tpp_codigoField"
                            value='<%= itemVendaPesquisado.tpp_codigo == null ? "" : itemVendaPesquisado.tpp_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="nf_codigoField" class="form-label">Codigo Nota Fiscal</label>
                        <input type="text" class="form-control" id="nf_codigoField"
                            name="nf_codigoField"
                            value='<%= itemVendaPesquisado.nf_codigo == null ? "" : itemVendaPesquisado.nf_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="fun_codigoField" class="form-label">Codigo Funcionário</label>
                        <input type="text" class="form-control" id="fun_codigoField"
                            name="fun_codigoField"
                            value='<%= itemVendaPesquisado.fun_codigo == null ? "" : itemVendaPesquisado.fun_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="tpg_codigoField" class="form-label">Codigo Tipo de Pagamento</label>
                        <input type="text" class="form-control" id="tpg_codigoField"
                            name="tpg_codigoField"
                            value='<%= itemVendaPesquisado.tpg_codigo == null ? "" : itemVendaPesquisado.tpg_codigo %>' />
                    </div>
                    <div class="mb-3">
                        <label for="itv_embalagemField" class="form-label">Embalagem</label>
                        <input type="text" class="form-control" id="itv_embalagemField"
                            name="itv_embalagemField"
                            value='<%= itemVendaPesquisado.itv_embalagem == null ? "" : itemVendaPesquisado.itv_embalagem %>' />
                    </div>
                    <div class="mb-3">
                        <label for="itv_qtdeField" class="form-label">Quantidade de itens</label>
                        <input type="text" class="form-control" id="itv_qtdeField"
                            name="itv_qtdeField"
                            value='<%= itemVendaPesquisado.itv_qtde == null ? "" : itemVendaPesquisado.itv_qtde %>' />
                    </div>
                    <div class="mb-3">
                        <label for="itec_valorunField" class="form-label">Valor unitário</label>
                        <input type="text" class="form-control" id="itec_valorunField"
                            name="itec_valorunField"
                            value='<%= itemVendaPesquisado.itv_valorun == null ? "" : itemVendaPesquisado.itv_valorun %>' />
                    </div>
                    <div class="mb-3">
                        <label for="itv_descField" class="form-label">Descrição</label>
                        <input type="text" class="form-control" id="itv_descField"
                            name="itv_descField"
                            value='<%= itemVendaPesquisado.itv_desc == null ? "" : itemVendaPesquisado.itv_desc %>' />
                    </div>
                    <div class="mb-3">
                        <label for="itv_valortotalField" class="form-label">Valor total</label>
                        <input type="text" class="form-control" id="itv_valortotalField"
                            name="itv_valortotalField"
                            value='<%= itemVendaPesquisado.itv_valortotal == null ? "" : itemVendaPesquisado.itv_valortotal %>' />
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
                    <th scope="col">Id Venda</th>
                    <th scope="col">Id Produto</th>
                    <th scope="col">Id Tipo de produto</th>
                    <th scope="col">Id Nota fiscal</th>
                    <th scope="col">Id Funcionario</th>
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
                    List<ItensVenda> lista_itensvenda = itensVendaService.listarTodos();
                    for(int i = 0; i < lista_itensvenda.size(); i++){
                %>
                    <tr>
                        <td><%= lista_itensvenda.get(i).itv_codigo %></td>
                        <td><%= lista_itensvenda.get(i).ven_codigo %></td>
                        <td><%= lista_itensvenda.get(i).pro_codigo %></td>
                        <td><%= lista_itensvenda.get(i).tpp_codigo %></td>
                        <td><%= lista_itensvenda.get(i).nf_codigo %></td>
                        <td><%= lista_itensvenda.get(i).fun_codigo %></td>
                        <td><%= lista_itensvenda.get(i).tpg_codigo %></td>
                        <td><%= lista_itensvenda.get(i).itv_embalagem %></td>
                        <td><%= lista_itensvenda.get(i).itv_qtde %></td>
                        <td><%= lista_itensvenda.get(i).itv_valorun %></td>
                        <td><%= lista_itensvenda.get(i).itv_desc %></td>
                        <td><%= lista_itensvenda.get(i).itv_valortotal %></td>
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
                    document.cadastro.action.value=action;
                    document.cadastro.action = document.cadastro.page.value;
                    document.cadastro.submit()
                }
            };
        });
    </script>
</body>

</html>
