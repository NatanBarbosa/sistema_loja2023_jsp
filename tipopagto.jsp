<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./verificarLogin.jsp" %>
<%@ page import="sistema_loja2023.service.TipoPagtoService" %>
<%@ page import="sistema_loja2023.model.TipoPagto" %>
<%@ page import="java.util.List" %>
<%@ page import="sistema_loja2023.infraestructure.exceptions.CustomException" %>
<!DOCTYPE html PUBLIC "-//WC//DTD HTML . Transitional//EN" "http://www.w.org/TR/html/loose.dtd">

<html>

<head>
    <title>Tabela Tipo Pagamento</title>
    <link rel="stylesheet" href="assets/estilo.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
        crossorigin="anonymous" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=iso--" />
</head>

<%
    String tpg_codigo=request.getParameter("tpg_codigo");
    String action = request.getParameter("action");

    TipoPagtoService tipoPagtoService = new TipoPagtoService();
    String status = request.getParameter("status");

    String errorMessage = null;
    String errorDetail = null;


    String[] parametros = {
        request.getParameter("tpg_codigoField"),
        request.getParameter("tpg_descricaoField"),
        request.getParameter("tpg_qtdeField"),
        request.getParameter("tpg_ativoField")
    };

    TipoPagto tipoPagto = new TipoPagto();

    try {
        tipoPagto = TipoPagto.mapearComParametros(parametros);
    } catch (Exception e) {
        errorMessage = "Um erro inesperado ocorreu!";
        errorDetail = e.getMessage();
    }

    
    TipoPagto tipoPagtoPesquisado = new TipoPagto();

    try {
        if (action != null) {
            
            if (action.equals("consultar")) {
                tipoPagtoPesquisado = tipoPagtoService.obter(tipoPagto.getTpg_codigo());
                status = "Pesquisado com sucesso";
                if (tipoPagtoPesquisado == null) {
                    tipoPagtoPesquisado = new TipoPagto();
                    status = "Registro inexistente";
                }

            } else if (action.equals("cadastrar")) {
                tipoPagtoService.inserir(tipoPagto);
                status = "Cadastrado com sucesso";

            } else if (action.equals("alterar")) {
                tipoPagtoService.alterar(tipoPagto);
                status = "Alterado com sucesso";
        
            } else if (action.equals("excluir")) {
                tipoPagtoService.excluir(tipoPagto.getTpg_codigo());
                status = "Excluído com sucesso";
            } 
        } 
        else {
            tipoPagtoPesquisado = tipoPagtoService.obter(1);
            status = "Pesquisado com sucesso";
             if (tipoPagtoPesquisado == null) {
                tipoPagtoPesquisado = new TipoPagto();
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
                <h3 class="text-primary text-center">Cadastro Tipo Pagamento</h3>
            </div>
        </div>
        <hr />
        <form name="cadastro" method="post">
            <input type="hidden" hidden id="action" name="action" value="">
            <input type="hidden" hidden id="page" name="page" value="tipopagto.jsp">
            <div class="row">
                <div class="col">
                    <div class="mb-3">
                        <label for="tpg_codigoField" class="form-label">Codigo</label>
                        <input type="text" class="form-control" id="tpg_codigoField" name="tpg_codigoField"
                            value='<%= (tipoPagtoPesquisado.getTpg_codigo()==null) ? "" : tipoPagtoPesquisado.getTpg_codigo() %>' />
                    </div>
                    <div class="mb-3">
                        <label for="tpg_descricaoField" class="form-label">Descrição</label>
                        <input type="text" class="form-control" id="tpg_descricaoField" name="tpg_descricaoField"
                            value='<%= (tipoPagtoPesquisado.getTpg_descricao()==null) ? "" : tipoPagtoPesquisado.getTpg_descricao() %>' />
                    </div>
                    <div class="mb-3">
                        <label for="tpg_qtdeField" class="form-label">Quantidade</label>
                        <input type="text" class="form-control" id="tpg_qtdeField"
                            name="tpg_qtdeField"
                            value='<%= (tipoPagtoPesquisado.getTpg_qtde()==null) ? "" : tipoPagtoPesquisado.getTpg_qtde() %>' />
                    </div>
                    <div class="mb-3">
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="tpg_ativoField"
                            name="tpg_ativoField"
                            <%= tipoPagtoPesquisado.getTpg_ativo() == null ? "" : tipoPagtoPesquisado.getTpg_ativo() == "S" ? "checked" : "" %>/>
                            <label for="tpg_ativoField" class="form-check-label">Ativo?</label>
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
                    <th scope="col">Descrição</th>
                    <th scope="col">Quantidade</th>
                    <th scope="col">Ativo?</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<TipoPagto> lista_tipoPagto = tipoPagtoService.listarTodos();
                    for(int i = 0; i < lista_tipoPagto.size(); i++){
                %>
                    <tr>
                        <td><%= lista_tipoPagto.get(i).tpg_codigo %></td>
                        <td><%= lista_tipoPagto.get(i).tpg_descricao %></td>
                        <td><%= lista_tipoPagto.get(i).tpg_qtde %></td>
                        <td><%= lista_tipoPagto.get(i).tpg_ativo %></td>
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
                            document.cadastro.tpg_codigoField,
                            document.cadastro.tpg_descricaoField,
                            document.cadastro.tpg_qtdeField,
                            document.cadastro.tpg_ativoField
                        ]
                        break
                    case "consultar":
                        required_fields = [
                            document.cadastro.tpg_codigoField
                        ]
                        break
                    case "alterar":
                        required_fields = [
                            document.cadastro.tpg_codigoField,
                            document.cadastro.tpg_descricaoField,
                            document.cadastro.tpg_qtdeField,
                            document.cadastro.tpg_ativoField
                        ]
                        break
                    case "excluir":
                        required_fields = [
                            document.cadastro.tpg_codigoField
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
