<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./verificarLogin.jsp" %>
<%@ page import="sistema_loja2023.service.CompraService" %>
<%@ page import="sistema_loja2023.model.Compra" %>
<%@ page import="java.util.List" %>
<%@ page import="sistema_loja2023.infraestructure.exceptions.CustomException" %>

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
    String action = request.getParameter("action");

    CompraService compraService = new CompraService();
    String status = request.getParameter("status");

    String errorMessage = null;
    String errorDetail = null;


    String[] parametros = {
        request.getParameter("com_codigoField"),
        request.getParameter("tpg_codigoField"),
        request.getParameter("for_codigoField"),
        request.getParameter("nf_codigoField"),
        request.getParameter("com_datacompraField"),
        request.getParameter("com_valortotalField"),
        request.getParameter("com_observacoesField")
    };

    Compra compra = new Compra();

    try {
        compra = Compra.mapearComParametros(parametros);

    } catch (Exception e) {
        errorMessage = "Um erro inesperado ocorreu!";
        errorDetail = e.getMessage();
    }

    
    Compra compraPesquisado = new Compra();

    try {
        if (action != null) {
            
            if (action.equals("consultar")) {
                compraPesquisado = compraService.obter(compra.getCom_codigo());
                status = "Pesquisado com sucesso";
                if (compraPesquisado == null) {
                    compraPesquisado = new Compra();
                    status = "Registro inexistente";
                }
              

            } else if (action.equals("cadastrar")) {
                compraService.inserir(compra);
                status = "Cadastrado com sucesso";

            } else if (action.equals("alterar")) {
                compraService.alterar(compra);
                status = "Alterado com sucesso";
        
            } else if (action.equals("excluir")) {
                compraService.excluir(compra.getCom_codigo());
                status = "Excluído com sucesso";
            } 
        } 
        else {
            compraPesquisado = compraService.obter(1);
            status = "Pesquisado com sucesso";
             if (compraPesquisado == null) {
                compraPesquisado = new Compra();
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
                <h3 class="text-primary text-center">Cadastro Compras</h3>
            </div>
        </div>
        <hr />
        <form name="cadastro" method="post" action="">
            <input type="hidden" hidden id="action" name="action" value="">
            <input type="hidden" hidden id="page" name="page" value="compras.jsp">
            <div class="row">
                <div class="col">
                    <div class="mb-3">
                        <label for="com_codigoField" class="form-label">Codigo</label>
                        <input type="text" class="form-control" id="com_codigoField" name="com_codigoField"
                            value='<%= (compraPesquisado.getCom_codigo()==null) ? "" : compraPesquisado.getCom_codigo() %>' />
                    </div>
                    <div class="mb-3">
                        <label for="tpg_codigoField" class="form-label">Codigo Tipo de pagamento</label>
                        <input type="text" class="form-control" id="tpg_codigoField" name="tpg_codigoField"
                            value='<%= (compraPesquisado.getTpg_codigo()==null) ? "" : compraPesquisado.getTpg_codigo() %>' />
                    </div>
                    <div class="mb-3">
                        <label for="for_codigoField" class="form-label">Codigo Fornecedor</label>
                        <input type="text" class="form-control" id="for_codigoField"
                            name="for_codigoField"
                            value='<%= (compraPesquisado.getFor_codigo()==null) ? "" : compraPesquisado.getFor_codigo() %>' />
                    </div>
                    <div class="mb-3">
                        <label for="nf_codigoField" class="form-label">Codigo Nota fiscal</label>
                        <input type="text" class="form-control" id="nf_codigoField"
                            name="nf_codigoField"
                            value='<%= compraPesquisado.getNf_codigo() == null ? "" : compraPesquisado.getNf_codigo() %>' />
                    </div>
                    <div class="mb-3">
                        <label for="com_datacompraField" class="form-label">Data da compra</label>
                        <input type="date" class="form-control" id="com_datacompraField"
                            name="com_datacompraField"
                            value='<%= compraPesquisado.getCom_datacompra() == null ? "" : compraPesquisado.getCom_datacompra() %>' />
                    </div>
                    <div class="mb-3">
                        <label for="com_valortotalField" class="form-label">Valor Total</label>
                        <input type="text" class="form-control" id="com_valortotalField"
                            name="com_valortotalField"
                            value='<%= compraPesquisado.getCom_valortotal() == null ? "" : compraPesquisado.getCom_valortotal() %>' />
                    </div>
                    <div class="mb-3">
                        <label for="com_observacoesField" class="form-label">Observações</label>
                        <textarea class="form-control" id="com_observacoesField"
                            name="com_observacoesField"
                            ><%= compraPesquisado.getCom_observacoes() == null ? "" : compraPesquisado.getCom_observacoes() %></textarea>
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
                    <th scope="col">Id Tipo de pagamento</th>
                    <th scope="col">Id Fornecedor</th>
                    <th scope="col">Id Nota Fiscal</th>
                    <th scope="col">Data da compra</th>
                    <th scope="col">Valor total</th>
                    <th scope="col">Observações</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Compra> lista_compras = compraService.listarTodos();
                    for(int i = 0; i < lista_compras.size(); i++){
                %>
                    <tr>
                        <td><%= lista_compras.get(i).com_codigo %></td>
                        <td><%= lista_compras.get(i).tpg_codigo %></td>
                        <td><%= lista_compras.get(i).for_codigo %></td>
                        <td><%= lista_compras.get(i).nf_codigo %></td>
                        <td><%= lista_compras.get(i).com_datacompra %></td>
                        <td><%= lista_compras.get(i).com_valortotal %></td>
                        <td><%= lista_compras.get(i).com_observacoes %></td>
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
                    document.cadastro.action.value=action;
                    document.cadastro.action = document.cadastro.page.value;
                    document.cadastro.submit()
                }
            };
        });
    </script>
</body>

</html>
