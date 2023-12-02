<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./verificarLogin.jsp" %>
<%@ page import="sistema_loja2023.service.VendaService" %>
<%@ page import="sistema_loja2023.model.Venda" %>
<%@ page import="java.util.List" %>
<%@ page import="sistema_loja2023.infraestructure.exceptions.CustomException" %>

<!DOCTYPE html PUBLIC "-//WC//DTD HTML . Transitional//EN" "http://www.w.org/TR/html/loose.dtd">

<html>
<head>
    <title>Tabela Vendas</title>

    <link rel="stylesheet" href="assets/estilo.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
        crossorigin="anonymous" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</head>

<%
    String ven_codigo=request.getParameter("ven_codigo");
    String action = request.getParameter("action");

    VendaService vendaService = new VendaService();
    String status = request.getParameter("status");

    String errorMessage = null;
    String errorDetail = null;


    String[] parametros = {
        request.getParameter("ven_codigoField"),
        request.getParameter("tpg_codigoField"),
        request.getParameter("fun_codigoField"),
        request.getParameter("nf_codigoField"),
        request.getParameter("ven_datavendaField"),
        request.getParameter("ven_valortotalField"),
        request.getParameter("ven_observacoesField")
    };

    Venda venda = new Venda();

    try {
        venda = Venda.mapearComParametros(parametros);
    } catch (Exception e) {
        errorMessage = "Um erro inesperado ocorreu!";
        errorDetail = e.getMessage();
    }

    
    Venda vendaPesquisado = new Venda();

    try {
        if (action != null) {
            
            if (action.equals("consultar")) {
                vendaPesquisado = vendaService.obter(venda.getVen_codigo());
                status = "Pesquisado com sucesso";
                if (vendaPesquisado == null) {
                    vendaPesquisado = new Venda();
                    status = "Registro inexistente";
                }
              

            } else if (action.equals("cadastrar")) {
                vendaService.inserir(venda);
                status = "Cadastrado com sucesso";

            } else if (action.equals("alterar")) {
                vendaService.alterar(venda);
                status = "Alterado com sucesso";
        
            } else if (action.equals("excluir")) {
                vendaService.excluir(venda.getVen_codigo());
                status = "Excluído com sucesso";
            } 
        } 
        else {
            vendaPesquisado = vendaService.obter(1);
            status = "Pesquisado com sucesso";
             if (vendaPesquisado == null) {
                vendaPesquisado = new Venda();
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
    <div class="container bg-primary-subtle my-3">
        <div class="row">
            <div class="col p-2 mt-2">
                <h3 class="text-primary text-center">Cadastro Vendas</h3>
            </div>
        </div>
        <hr />
        <form name="cadastro" method="get">
            <input type="hidden" hidden id="action" name="action" value="">
            <input type="hidden" hidden id="page" name="page" value="vendas.jsp">
            <div class="row">
                <div class="col">
                    <div class="mb-3">
                        <label for="ven_codigoField" class="form-label">Codigo</label>
                        <input type="text" class="form-control" id="ven_codigoField" name="ven_codigoField"
                            value='<%= (vendaPesquisado.getVen_codigo()==null) ? "" : vendaPesquisado.getVen_codigo() %>' />
                    </div>
                    <div class="mb-3">
                        <label for="tpg_codigoField" class="form-label">Codigo Tipo de pagamento</label>
                        <input type="text" class="form-control" id="tpg_codigoField" name="tpg_codigoField"
                            value='<%= (vendaPesquisado.getTpg_codigo()==null) ? "" : vendaPesquisado.getTpg_codigo() %>' />
                    </div>
                    <div class="mb-3">
                        <label for="fun_codigoField" class="form-label">Codigo Funcionário</label>
                        <input type="text" class="form-control" id="fun_codigoField"
                            name="fun_codigoField"
                            value='<%= (vendaPesquisado.getFun_codigo()==null) ? "" : vendaPesquisado.getFun_codigo() %>' />
                    </div>
                    <div class="mb-3">
                        <label for="nf_codigoField" class="form-label">Codigo Nota fiscal</label>
                        <input type="text" class="form-control" id="nf_codigoField"
                            name="nf_codigoField"
                            value='<%= vendaPesquisado.getNf_codigo() == null ? "" : vendaPesquisado.getNf_codigo() %>' />
                    </div>
                    <div class="mb-3">
                        <label for="ven_datavendaField" class="form-label">Data da venda</label>
                        <input type="date" class="form-control" id="ven_datavendaField"
                            name="ven_datavendaField"
                            value='<%= vendaPesquisado.getVen_datavenda() == null ? "" : vendaPesquisado.getVen_datavenda() %>' />
                    </div>
                    <div class="mb-3">
                        <label for="ven_valortotalField" class="form-label">Valor Total</label>
                        <input type="text" class="form-control" id="ven_valortotalField"
                            name="ven_valortotalField"
                            value='<%= vendaPesquisado.getVen_valortotal() == null ? "" : vendaPesquisado.getVen_valortotal() %>' />
                    </div>
                    <div class="mb-3">
                        <label for="ven_observacoesField" class="form-label">Observações</label>
                        <textarea class="form-control" id="ven_observacoesField"
                            name="ven_observacoesField"
                            ><%= vendaPesquisado.getVen_observacoes() == null ? "" : vendaPesquisado.getVen_observacoes() %></textarea>
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
                    <th scope="col">Id Funcionário</th>
                    <th scope="col">Id Nota Fiscal</th>
                    <th scope="col">Data da venda</th>
                    <th scope="col">Valor total</th>
                    <th scope="col">Observações</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Venda> lista_vendas = vendaService.listarTodos();
                    for(int i = 0; i < lista_vendas.size(); i++){
                %>
                    <tr>
                        <td><%= lista_vendas.get(i).ven_codigo %></td>
                        <td><%= lista_vendas.get(i).tpg_codigo %></td>
                        <td><%= lista_vendas.get(i).fun_codigo %></td>
                        <td><%= lista_vendas.get(i).nf_codigo %></td>
                        <td><%= lista_vendas.get(i).ven_datavenda %></td>
                        <td><%= lista_vendas.get(i).ven_valortotal %></td>
                        <td><%= lista_vendas.get(i).ven_observacoes %></td>
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
                            document.cadastro.ven_codigoField,
                            document.cadastro.tpg_codigoField,
                            document.cadastro.fun_codigoField,
                            document.cadastro.nf_codigoField,
                            document.cadastro.ven_datavendaField,
                            document.cadastro.ven_valortotalField,
                            document.cadastro.ven_observacoesField,
                        ]
                        break
                    case "consultar":
                        required_fields = [
                            document.cadastro.ven_codigoField
                        ]
                        break
                    case "alterar":
                        required_fields = [
                            document.cadastro.ven_codigoField,
                            document.cadastro.tpg_codigoField,
                            document.cadastro.fun_codigoField,
                            document.cadastro.nf_codigoField,
                            document.cadastro.ven_datavendaField,
                            document.cadastro.ven_valortotalField,
                            document.cadastro.ven_observacoesField,
                        ]
                        break
                    case "excluir":
                        required_fields = [
                            document.cadastro.ven_codigoField
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
