<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./verificarLogin.jsp" %>
<%@ page import="sistema_loja2023.service.ContaPagarService" %>
<%@ page import="sistema_loja2023.model.ContaPagar" %>
<%@ page import="java.util.List" %>
<%@ page import="sistema_loja2023.infraestructure.exceptions.CustomException" %>

<!DOCTYPE html PUBLIC "-//WC//DTD HTML . Transitional//EN" "http://www.w.org/TR/html/loose.dtd">

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tabela Contas a Pagar</title>

    <link rel="stylesheet" href="assets/estilo.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
        crossorigin="anonymous" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</head>

<%
    String cp_codigo = request.getParameter("cp_codigo");
    String action = request.getParameter("action");

    ContaPagarService contaPagarService = new ContaPagarService();
    String status = request.getParameter("status");

    String errorMessage = null;
    String errorDetail = null;

    String[] parametros = {
        request.getParameter("cp_codigo"),
        request.getParameter("cp_valorconta"),
        request.getParameter("cp_datavencimento"),
        request.getParameter("cp_datapagamento"),
        request.getParameter("nf_codigo"),
        request.getParameter("cp_observacoes")
    };

    ContaPagar contaPagar = new ContaPagar();

    try {
        contaPagar = ContaPagar.mapearComParametros(parametros);

    } catch (Exception e) {
        errorMessage = "Um erro inesperado ocorreu!";
        errorDetail = e.getMessage();
    }
    

    ContaPagar contaPagarPesquisada = new ContaPagar();

    try {
        if (action != null) {
        
            if (action.equals("consultar")) {
                contaPagarPesquisada = contaPagarService.obter(contaPagar.getCp_codigo());
                status = "Pesquisado com sucesso";
                if (contaPagarPesquisada == null) {
                    contaPagarPesquisada = new ContaPagar();
                    status = "Registro inexistente";
                }
            } else if (action.equals("cadastrar")) {
                contaPagarService.inserir(contaPagar);
                status = "Cadastrado com sucesso";
            } else if (action.equals("alterar")) {
                contaPagarService.alterar(contaPagar);
                status = "Alterado com sucesso";
            } else if (action.equals("excluir")) {
                contaPagarService.excluir(contaPagar.getCp_codigo());
                status = "Excluído com sucesso";
            } 
        } else {
            contaPagarPesquisada = contaPagarService.obter(1);
            status = "Pesquisado com sucesso";
            if (contaPagarPesquisada == null) {
                contaPagarPesquisada = new ContaPagar();
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
                <h3 class="text-primary text-center">Cadastro Contas a Pagar</h3>
            </div>
        </div>
        <hr />
        <form name="cadastro" method="post" action="">
            <input type="hidden" hidden id="action" name="action" value="">
            <input type="hidden" hidden id="page" name="page" value="contapagar.jsp">
            <div class="row">
                <div class="col">
                    <div class="row mb-3">
                      <div class="mb-3 col-6">
                            <label for="cp_valorconta" class="form-label">Valor Conta</label>
                            <input type="number" class="form-control" id="cp_valorconta" name="cp_valorconta"
                                value='<%= (contaPagarPesquisada.getCp_valorconta() == null) ? "" : contaPagarPesquisada.getCp_valorconta() %>' />
                        </div>
                        <div class="mb-3 col-6">
                            <label for="cp_datavencimento" class="form-label">Data Vencimento</label>
                            <input type="date" class="form-control" id="cp_datavencimento" name="cp_datavencimento"
                                value='<%= (contaPagarPesquisada.getCp_datavencimento() == null) ? "" : contaPagarPesquisada.getCp_datavencimento() %>' />
                        </div>
                    </di>
                    <div class="row">
                        <div class="mb-3 col-6">
                            <label for="cp_codigo" class="form-label">Código</label>
                            <input type="number" class="form-control" id="cp_codigo" name="cp_codigo"
                                value='<%= (contaPagarPesquisada.getCp_codigo() == null) ? "" : contaPagarPesquisada.getCp_codigo() %>' />
                        </div>
                        <div class="mb-3 col-6">
                            <label for="cp_datapagamento" class="form-label">Data Pagamento</label>
                            <input type="date" class="form-control" id="cp_datapagamento" name="cp_datapagamento"
                                value='<%= (contaPagarPesquisada.getCp_datapagamento() == null) ? "" : contaPagarPesquisada.getCp_datapagamento() %>' />
                        </div>
                    </div>
                    <div class="row">
                        <div class="mb-3 col-6">
                            <label for="nf_codigo" class="form-label">Código Nota Fiscal</label>
                            <input type="number" class="form-control" id="nf_codigo" name="nf_codigo"
                                value='<%= (contaPagarPesquisada.getNf_codigo() == null) ? "" : contaPagarPesquisada.getNf_codigo() %>' />
                        </div>
                        <div class="mb-3 col-6">
                            <label for="cp_observacoes" class="form-label">Observações</label>
                            <input type="text" class="form-control" id="cp_observacoes" name="cp_observacoes"
                                value='<%= (contaPagarPesquisada.getCp_observacoes() == null) ? "" : contaPagarPesquisada.getCp_observacoes() %>' />
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
                                Excluir
                            </button>
                            <button type="button" class="btn-action btn btn-secondary" btn-action="listar">
                                Listar
                            </button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="mb-3">
                                <div class="input-group">
                                    <span class="input-group-text" id="status">Status:</span>
                                    <input type="text" class="form-control" id="status" name="status" disabled
                                        value='<%= (status == null) ? "" : status %>'
                                        aria-describedby="status basic-addon4" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <br />
        <br />
    </div>

    
 <% if (action != null && action.equals("listar")) { %>
    <div class="container my-3">
        <h3 class="text-primary text-center">Lista de Contas a Pagar</h3>
        <table class="table table-striped-columns table-secondary">
            <thead>
                <tr>
                    <th scope="col">Código</th>
                    <th scope="col">Valor da Conta</th>
                    <th scope="col">Data de Vencimento</th>
                    <th scope="col">Data de Pagamento</th>
                    <th scope="col">Código Nota Fiscal</th>
                    <th scope="col">Observações</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<ContaPagar> lista_contaspagar = contaPagarService.listarTodos();
                    for (int i = 0; i < lista_contaspagar.size(); i++) {
                %>
                        <tr>
                            <td><%= lista_contaspagar.get(i).getCp_codigo() %></td>
                            <td><%= lista_contaspagar.get(i).getCp_valorconta() %></td>
                            <td><%= lista_contaspagar.get(i).getCp_datavencimento() %></td>
                            <td><%= lista_contaspagar.get(i).getCp_datapagamento() %></td>
                            <td><%= lista_contaspagar.get(i).getNf_codigo() %></td>
                            <td><%= lista_contaspagar.get(i).getCp_observacoes() %></td>
                        </tr>
                <% } %>
            </tbody>
        </table>
    </div>
<% } %>

<script src="assets/validador.js"></script>
<script>
    document.querySelectorAll(".btn-action").forEach((btn) => {
        btn.onclick = () => {
            let action = btn.getAttribute("btn-action");
            let required_fields = [];

            switch (action) {
                case "cadastrar":
                case "alterar":
                    required_fields = [
                        document.cadastro.cp_codigo,
                        document.cadastro.cp_valorconta,
                        document.cadastro.cp_datavencimento,
                        document.cadastro.cp_datapagamento,
                        document.cadastro.nf_codigo,
                        document.cadastro.cp_observacoes
                    ];
                    break;
                case "consultar":
                case "excluir":
                    required_fields = [
                        document.cadastro.cp_codigo
                    ];
                    break;
                case "listar":
                    break;
                default:
                    alert("Ação inválida");
                    break;
            }

            if (validador(required_fields)) {
                document.cadastro.action.value = action;
                document.cadastro.action = document.cadastro.page.value;
                document.cadastro.submit();
            }
        };
    });
</script>

</body>

</html>
