<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./verificarLogin.jsp" %>
<%@ page import="sistema_loja2023.service.NotaFiscalService" %>
<%@ page import="sistema_loja2023.model.NotaFiscal" %>
<%@ page import="java.util.List" %>
<%@ page import="sistema_loja2023.infraestructure.exceptions.CustomException" %>

<!DOCTYPE html PUBLIC "-//WC//DTD HTML . Transitional//EN" "http://www.w.org/TR/html/loose.dtd">

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tabela Notas Fiscais</title>

    <link rel="stylesheet" href="assets/estilo.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
        crossorigin="anonymous" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</head>

<%
    String nf_codigo = request.getParameter("nf_codigo");
    String action = request.getParameter("action");

    NotaFiscalService notaFiscalService = new NotaFiscalService();
    String status = request.getParameter("status");

    String errorMessage = null;
    String errorDetail = null;

    String[] parametros = {
        request.getParameter("nf_codigo"),
        request.getParameter("nf_valornf"),
        request.getParameter("nf_taxaimpostonf"),
        request.getParameter("nf_valorimposto")
    };

    NotaFiscal notaFiscal = new NotaFiscal();

    try {
        notaFiscal = NotaFiscal.mapearComParametros(parametros);

    } catch (Exception e) {
        errorMessage = "Um erro inesperado ocorreu!";
        errorDetail = e.getMessage();
    }
    

    NotaFiscal notaFiscalPesquisada = new NotaFiscal();

    try {
        if (action != null) {
        
            if (action.equals("consultar")) {
                notaFiscalPesquisada = notaFiscalService.obter(notaFiscal.getNf_codigo());
                status = "Pesquisado com sucesso";
                if (notaFiscalPesquisada == null) {
                    notaFiscalPesquisada = new NotaFiscal();
                    status = "Registro inexistente";
                }
            } else if (action.equals("cadastrar")) {
                notaFiscalService.inserir(notaFiscal);
                status = "Cadastrado com sucesso";
            } else if (action.equals("alterar")) {
                notaFiscalService.alterar(notaFiscal);
                status = "Alterado com sucesso";
            } else if (action.equals("excluir")) {
                notaFiscalService.excluir(notaFiscal.getNf_codigo());
                status = "Excluído com sucesso";
            } 
        } else {
            notaFiscalPesquisada = notaFiscalService.obter(1);
            status = "Pesquisado com sucesso";
            if (notaFiscalPesquisada == null) {
                notaFiscalPesquisada = new NotaFiscal();
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
                <h3 class="text-primary text-center">Cadastro Notas Fiscais</h3>
            </div>
        </div>
        <hr />
        <form name="cadastro" method="post" action="">
            <input type="hidden" hidden id="action" name="action" value="">
            <input type="hidden" hidden id="page" name="page" value="notafiscal.jsp">
            <div class="row">
                <div class="col">
                    <div class="row mb-3">
                      <div class="mb-3 col-6">
                            <label for="nf_valorimposto" class="form-label">Valor Imposto</label>
                            <input type="number" class="form-control" id="nf_valorimposto" name="nf_valorimposto"
                                value='<%= (notaFiscalPesquisada.getNf_valorimposto() == null) ? "" : notaFiscalPesquisada.getNf_valorimposto() %>' />
                        </div>
                        <div class="mb-3 col-6">
                            <label for="nf_valornf" class="form-label">Valor NF</label>
                            <input type="number" class="form-control" id="nf_valornf" name="nf_valornf"
                                value='<%= (notaFiscalPesquisada.getNf_valornf() == null) ? "" : notaFiscalPesquisada.getNf_valornf() %>' />
                        </div>
                    </di>
                    <div class="row">
                        <div class="mb-3 col-6">
                            <label for="nf_codigo" class="form-label">Código</label>
                            <input type="number" class="form-control" id="nf_codigo" name="nf_codigo"
                                value='<%= (notaFiscalPesquisada.getNf_codigo() == null) ? "" : notaFiscalPesquisada.getNf_codigo() %>' />
                        </div>
                        <div class="mb-3 col-6">
                            <label for="nf_taxaimpostonf" class="form-label">Taxa Imposto NF</label>
                            <input type="number" class="form-control" id="nf_taxaimpostonf" name="nf_taxaimpostonf"
                                value='<%= (notaFiscalPesquisada.getNf_taxaimpostonf() == null) ? "" : notaFiscalPesquisada.getNf_taxaimpostonf() %>' />
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
            <h3 class="text-primary text-center">Lista de Notas Fiscais</h3>
            <table class="table table-striped-columns table-secondary">
                <thead>
                    <tr>
                        <th scope="col">Código</th>
                        <th scope="col">Valor NF</th>
                        <th scope="col">Taxa Imposto NF</th>
                        <th scope="col">Valor Imposto</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<NotaFiscal> lista_notasfiscais = notaFiscalService.listarTodos();
                        for (int i = 0; i < lista_notasfiscais.size(); i++) {
                    %>
                            <tr>
                                <td><%= lista_notasfiscais.get(i).getNf_codigo() %></td>
                                <td><%= lista_notasfiscais.get(i).getNf_valornf() %></td>
                                <td><%= lista_notasfiscais.get(i).getNf_taxaimpostonf() %></td>
                                <td><%= lista_notasfiscais.get(i).getNf_valorimposto() %></td>
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
                            document.cadastro.nf_codigo,
                            document.cadastro.nf_valornf,
                            document.cadastro.nf_taxaimpostonf,
                            document.cadastro.nf_valorimposto
                        ];
                        break;
                    case "consultar":
                        required_fields = [
                            document.cadastro.nf_codigo
                        ];
                        break;
                    case "alterar":
                        required_fields = [
                            document.cadastro.nf_codigo,
                            document.cadastro.nf_valornf,
                            document.cadastro.nf_taxaimpostonf,
                            document.cadastro.nf_valorimposto
                        ];
                        break;
                    case "excluir":
                        required_fields = [
                            document.cadastro.nf_codigo
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
