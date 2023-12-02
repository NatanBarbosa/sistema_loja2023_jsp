<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./verificarLogin.jsp" %>
<%@ page import="sistema_loja2023.service.ContaReceberService" %>
<%@ page import="sistema_loja2023.model.ContaReceber" %>
<%@ page import="java.util.List" %>
<%@ page import="sistema_loja2023.infraestructure.exceptions.CustomException" %>

<!DOCTYPE html PUBLIC "-//WC//DTD HTML . Transitional//EN" "http://www.w.org/TR/html/loose.dtd">

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tabela Contas a Receber</title>

    <link rel="stylesheet" href="assets/estilo.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
        crossorigin="anonymous" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</head>

<%
    String cr_codigo = request.getParameter("cr_codigo");
    String action = request.getParameter("action");

    ContaReceberService contaReceberService = new ContaReceberService();
    String status = request.getParameter("status");

    String errorMessage = null;
    String errorDetail = null;

    String[] parametros = {
        request.getParameter("cr_codigo"),
        request.getParameter("cr_valorconta"),
        request.getParameter("cr_datavencimento"),
        request.getParameter("cr_datarecebimento"),
        request.getParameter("nf_codigo"),
        request.getParameter("cr_observacoes")
    };

    ContaReceber contaReceber = new ContaReceber();

    try {
        contaReceber = ContaReceber.mapearComParametros(parametros);

    } catch (Exception e) {
        errorMessage = "Um erro inesperado ocorreu!";
        errorDetail = e.getMessage();
    }
    

    ContaReceber contaReceberPesquisada = new ContaReceber();

    try {
        if (action != null) {
        
            if (action.equals("consultar")) {
                contaReceberPesquisada = contaReceberService.obter(contaReceber.getCr_codigo());
                status = "Pesquisado com sucesso";
                if (contaReceberPesquisada == null) {
                    contaReceberPesquisada = new ContaReceber();
                    status = "Registro inexistente";
                }
            } else if (action.equals("cadastrar")) {
                contaReceberService.inserir(contaReceber);
                status = "Cadastrado com sucesso";
            } else if (action.equals("alterar")) {
                contaReceberService.alterar(contaReceber);
                status = "Alterado com sucesso";
            } else if (action.equals("excluir")) {
                contaReceberService.excluir(contaReceber.getCr_codigo());
                status = "Excluído com sucesso";
            } 
        } else {
            contaReceberPesquisada = contaReceberService.obter(1);
            status = "Pesquisado com sucesso";
            if (contaReceberPesquisada == null) {
                contaReceberPesquisada = new ContaReceber();
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
                <h3 class="text-primary text-center">Cadastro Contas a Receber</h3>
            </div>
        </div>
        <hr />
        <form name="cadastro" method="post" action="">
            <input type="hidden" hidden id="action" name="action" value="">
            <input type="hidden" hidden id="page" name="page" value="contareceber.jsp">
            <div class="row">
                <div class="col">
                    <div class="row mb-3">
                      <div class="mb-3 col-6">
                            <label for="cr_valorconta" class="form-label">Valor Conta</label>
                            <input type="number" class="form-control" id="cr_valorconta" name="cr_valorconta"
                                value='<%= (contaReceberPesquisada.getCr_valorconta() == null) ? "" : contaReceberPesquisada.getCr_valorconta() %>' />
                        </div>
                        <div class="mb-3 col-6">
                            <label for="cr_datavencimento" class="form-label">Data Vencimento</label>
                            <input type="date" class="form-control" id="cr_datavencimento" name="cr_datavencimento"
                                value='<%= (contaReceberPesquisada.getCr_datavencimento() == null) ? "" : contaReceberPesquisada.getCr_datavencimento() %>' />
                        </div>
                    </di>
                    <div class="row">
                        <div class="mb-3 col-6">
                            <label for="cr_codigo" class="form-label">Código</label>
                            <input type="number" class="form-control" id="cr_codigo" name="cr_codigo"
                                value='<%= (contaReceberPesquisada.getCr_codigo() == null) ? "" : contaReceberPesquisada.getCr_codigo() %>' />
                        </div>
                        <div class="mb-3 col-6">
                            <label for="cr_datarecebimento" class="form-label">Data Recebimento</label>
                            <input type="date" class="form-control" id="cr_datarecebimento" name="cr_datarecebimento"
                                value='<%= (contaReceberPesquisada.getCr_datarecebimento() == null) ? "" : contaReceberPesquisada.getCr_datarecebimento() %>' />
                        </div>
                    </div>
                    <div class="row">
                        <div class="mb-3 col-6">
                            <label for="nf_codigo" class="form-label">Código Nota Fiscal</label>
                            <input type="number" class="form-control" id="nf_codigo" name="nf_codigo"
                                value='<%= (contaReceberPesquisada.getNf_codigo() == null) ? "" : contaReceberPesquisada.getNf_codigo() %>' />
                        </div>
                        <div class="mb-3 col-6">
                            <label for="cr_observacoes" class="form-label">Observações</label>
                            <input type="text" class="form-control" id="cr_observacoes" name="cr_observacoes"
                                value='<%= (contaReceberPesquisada.getCr_observacoes() == null) ? "" : contaReceberPesquisada.getCr_observacoes() %>' />
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
            <h3 class="text-primary text-center">Lista de Contas a Receber</h3>
            <table class="table table-striped-columns table-secondary">
                <thead>
                    <tr>
                        <th scope="col">Código</th>
                        <th scope="col">Valor da Conta</th>
                        <th scope="col">Data de Vencimento</th>
                        <th scope="col">Data de Recebimento</th>
                        <th scope="col">Código Nota Fiscal</th>
                        <th scope="col">Observações</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<ContaReceber> lista_contasreceber = contaReceberService.listarTodos();
                        for (int i = 0; i < lista_contasreceber.size(); i++) {
                    %>
                            <tr>
                                <td><%= lista_contasreceber.get(i).getCr_codigo() %></td>
                                <td><%= lista_contasreceber.get(i).getCr_valorconta() %></td>
                                <td><%= lista_contasreceber.get(i).getCr_datavencimento() %></td>
                                <td><%= lista_contasreceber.get(i).getCr_datarecebimento() %></td>
                                <td><%= lista_contasreceber.get(i).getNf_codigo() %></td>
                                <td><%= lista_contasreceber.get(i).getCr_observacoes() %></td>
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
                        required_fields = [
                            document.cadastro.cr_codigo,
                            document.cadastro.cr_valorconta,
                            document.cadastro.cr_datavencimento,
                            document.cadastro.cr_datarecebimento,
                            document.cadastro.nf_codigo,
                            document.cadastro.cr_observacoes
                        ];
                        break;
                    case "consultar":
                        required_fields = [
                            document.cadastro.cr_codigo
                        ];
                        break;
                    case "alterar":
                        required_fields = [
                            document.cadastro.cr_codigo,
                            document.cadastro.cr_valorconta,
                            document.cadastro.cr_datavencimento,
                            document.cadastro.cr_datarecebimento,
                            document.cadastro.nf_codigo,
                            document.cadastro.cr_observacoes
                        ];
                        break;
                    case "excluir":
                        required_fields = [
                            document.cadastro.cr_codigo
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