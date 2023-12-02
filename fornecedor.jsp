<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./verificarLogin.jsp" %>
<%@ page import="sistema_loja2023.service.FornecedorService" %>
<%@ page import="sistema_loja2023.model.Fornecedor" %>
<%@ page import="java.util.List" %>
<%@ page import="sistema_loja2023.infraestructure.exceptions.CustomException" %>

<!DOCTYPE html PUBLIC "-//WC//DTD HTML . Transitional//EN" "http://www.w.org/TR/html/loose.dtd">

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tabela Fornecedores</title>

    <link rel="stylesheet" href="assets/estilo.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
        crossorigin="anonymous" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</head>

<%
    String for_codigo = request.getParameter("for_codigo");
    String action = request.getParameter("action");

    FornecedorService fornecedorService = new FornecedorService();
    String status = request.getParameter("status");

    String errorMessage = null;
    String errorDetail = null;

    String[] parametros = {
        request.getParameter("for_codigo"),
        request.getParameter("for_nome"),
        request.getParameter("for_endereco"),
        request.getParameter("for_numero"),
        request.getParameter("for_bairro"),
        request.getParameter("for_cidade"),
        request.getParameter("for_uf"),
        request.getParameter("for_cnpjcpf"),
        request.getParameter("for_rgie"),
        request.getParameter("for_telefone"),
        request.getParameter("for_fax"),
        request.getParameter("for_celular"),
        request.getParameter("for_email")
    };

    Fornecedor fornecedor = new Fornecedor();

    try {
        fornecedor = Fornecedor.mapearComParametros(parametros);

    } catch (Exception e) {
        errorMessage = "Um erro inesperado ocorreu! aaa";
        errorDetail = e.getMessage();
    }

    Fornecedor fornecedorPesquisado = new Fornecedor();

    try {
        if (action != null) {
            
            if (action.equals("consultar")) {
                fornecedorPesquisado = fornecedorService.obter(fornecedor.getFor_codigo());
                status = "Pesquisado com sucesso";
                if (fornecedorPesquisado == null) {
                    fornecedorPesquisado = new Fornecedor();
                    status = "Registro inexistente";
                }
            } else if (action.equals("cadastrar")) {
                fornecedorService.inserir(fornecedor);
                status = "Cadastrado com sucesso";
            } else if (action.equals("alterar")) {
                fornecedorService.alterar(fornecedor);
                status = "Alterado com sucesso";
            } else if (action.equals("excluir")) {
                fornecedorService.excluir(fornecedor.getFor_codigo());
                status = "Excluído com sucesso";
            } 
        } else {
            fornecedorPesquisado = fornecedorService.obter(1);
            status = "Pesquisado com sucesso";
            if (fornecedorPesquisado == null) {
                fornecedorPesquisado = new Fornecedor();
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
                <h3 class="text-primary text-center">Cadastro Fornecedores</h3>
            </div>
        </div>
        <hr />
        <form name="cadastro" method="post" action="">
            <input type="hidden" hidden id="action" name="action" value="">
            <input type="hidden" hidden id="page" name="page" value="fornecedor.jsp">
            <div class="row">
                <div class="col">
                    <div class="row">
                        <div class="mb-3 col-12">
                            <label for="for_nome" class="form-label">Nome</label>
                            <input type="text" class="form-control" id="for_nome" name="for_nome"
                                value='<%= (fornecedorPesquisado.getFor_nome() == null) ? "" : fornecedorPesquisado.getFor_nome() %>' />
                        </div>
                    </di>
                    <div class="row">
                        <div class="mb-3 col-6">
                            <label for="for_codigo" class="form-label">Código</label>
                            <input type="text" class="form-control" id="for_codigo" name="for_codigo"
                                value='<%= (fornecedorPesquisado.getFor_codigo() == null) ? "" : fornecedorPesquisado.getFor_codigo() %>' />
                        </div>
                        <div class="mb-3 col-6">
                            <label for="for_endereco" class="form-label">Endereço</label>
                            <input type="text" class="form-control" id="for_endereco" name="for_endereco"
                                value='<%= (fornecedorPesquisado.getFor_endereco() == null) ? "" : fornecedorPesquisado.getFor_endereco() %>' />
                        </div>
                    </div>
                    <div class="row">
                        <div class="mb-3 col-6">
                            <label for="for_numero" class="form-label">Número</label>
                            <input type="text" class="form-control" id="for_numero" name="for_numero"
                                value='<%= (fornecedorPesquisado.getFor_numero() == null) ? "" : fornecedorPesquisado.getFor_numero() %>' />
                        </div>
                        <div class="mb-3 col-6">
                            <label for="for_bairro" class="form-label">Bairro</label>
                            <input type="text" class="form-control" id="for_bairro" name="for_bairro"
                                value='<%= (fornecedorPesquisado.getFor_bairro() == null) ? "" : fornecedorPesquisado.getFor_bairro() %>' />
                        </div>
                    </div>
                    <div class="row">
                        <div class="mb-3 col-6">
                            <label for="for_cidade" class="form-label">Cidade</label>
                            <input type="text" class="form-control" id="for_cidade" name="for_cidade"
                                value='<%= (fornecedorPesquisado.getFor_cidade() == null) ? "" : fornecedorPesquisado.getFor_cidade() %>' />
                        </div>
                        <div class="mb-3 col-6">
                            <label for="for_uf" class="form-label">UF</label>
                            <input type="text" class="form-control" id="for_uf" name="for_uf"
                                value='<%= (fornecedorPesquisado.getFor_uf() == null) ? "" : fornecedorPesquisado.getFor_uf() %>' />
                        </div>
                    </div>
                    <div class="row">
                        <div class="mb-3 col-6">
                            <label for="for_cnpjcpf" class="form-label">CNPJ/CPF</label>
                            <input type="text" class="form-control" id="for_cnpjcpf" name="for_cnpjcpf"
                                value='<%= (fornecedorPesquisado.getFor_cnpjcpf() == null) ? "" : fornecedorPesquisado.getFor_cnpjcpf() %>' />
                        </div>
                        <div class="mb-3 col-6">
                            <label for="for_rgie" class="form-label">RG/IE</label>
                            <input type="text" class="form-control" id="for_rgie" name="for_rgie"
                                value='<%= (fornecedorPesquisado.getFor_rgie() == null) ? "" : fornecedorPesquisado.getFor_rgie() %>' />
                        </div>
                    </div>
                    <div class="row">
                        <div class="mb-3 col-6">
                            <label for="for_telefone" class="form-label">Telefone</label>
                            <input type="text" class="form-control" id="for_telefone" name="for_telefone"
                                value='<%= (fornecedorPesquisado.getFor_telefone() == null) ? "" : fornecedorPesquisado.getFor_telefone() %>' />
                        </div>
                        <div class="mb-3 col-6">
                            <label for="for_fax" class="form-label">Fax</label>
                            <input type="text" class="form-control" id="for_fax" name="for_fax"
                                value='<%= (fornecedorPesquisado.getFor_fax() == null) ? "" : fornecedorPesquisado.getFor_fax() %>' />
                        </div>
                    </div>
                    <div class="row">
                        <div class="mb-3 col-6">
                            <label for="for_celular" class="form-label">Celular</label>
                            <input type="text" class="form-control" id="for_celular" name="for_celular"
                                value='<%= (fornecedorPesquisado.getFor_celular() == null) ? "" : fornecedorPesquisado.getFor_celular() %>' />
                        </div>
                        <div class="mb-3 col-6">
                            <label for="for_email" class="form-label">E-mail</label>
                            <input type="text" class="form-control" id="for_email" name="for_email"
                                value='<%= (fornecedorPesquisado.getFor_email() == null) ? "" : fornecedorPesquisado.getFor_email() %>' />
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
        </form>
    </div>
</div>

<% if(action != null && action.equals("listar")) {%>
    <table class="table table-striped-columns table-secondary">
        <thead>
            <tr>
                <th scope="col">Código</th>
                <th scope="col">Nome</th>
                <th scope="col">Endereço</th>
                <th scope="col">Número</th>
                <th scope="col">Bairro</th>
                <th scope="col">Cidade</th>
                <th scope="col">UF</th>
                <th scope="col">CNPJ/CPF</th>
                <th scope="col">RG/IE</th>
                <th scope="col">Telefone</th>
                <th scope="col">Fax</th>
                <th scope="col">Celular</th>
                <th scope="col">Email</th>
            </tr>
        </thead>
        <tbody>
            <% 
                List<Fornecedor> lista_fornecedores = fornecedorService.listarTodos();
                for(int i = 0; i < lista_fornecedores.size(); i++){
            %>
                <tr>
                    <td><%= lista_fornecedores.get(i).getFor_codigo() %></td>
                    <td><%= lista_fornecedores.get(i).getFor_nome() %></td>
                    <td><%= lista_fornecedores.get(i).getFor_endereco() %></td>
                    <td><%= lista_fornecedores.get(i).getFor_numero() %></td>
                    <td><%= lista_fornecedores.get(i).getFor_bairro() %></td>
                    <td><%= lista_fornecedores.get(i).getFor_cidade() %></td>
                    <td><%= lista_fornecedores.get(i).getFor_uf() %></td>
                    <td><%= lista_fornecedores.get(i).getFor_cnpjcpf() %></td>
                    <td><%= lista_fornecedores.get(i).getFor_rgie() %></td>
                    <td><%= lista_fornecedores.get(i).getFor_telefone() %></td>
                    <td><%= lista_fornecedores.get(i).getFor_fax() %></td>
                    <td><%= lista_fornecedores.get(i).getFor_celular() %></td>
                    <td><%= lista_fornecedores.get(i).getFor_email() %></td>
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
                            document.cadastro.for_codigo,
                            document.cadastro.for_nome,
                            document.cadastro.for_endereco,
                            document.cadastro.for_numero,
                            document.cadastro.for_bairro,
                            document.cadastro.for_cidade,
                            document.cadastro.for_uf,
                            document.cadastro.for_cnpjcpf,
                            document.cadastro.for_rgie,
                            document.cadastro.for_telefone,
                            document.cadastro.for_fax,
                            document.cadastro.for_celular,
                            document.cadastro.for_email
                        ]
                        break
                    case "consultar":
                        required_fields = [
                            document.cadastro.for_codigo
                        ]
                        break
                    case "alterar":
                        required_fields = [
                            document.cadastro.for_codigo,
                            document.cadastro.for_nome,
                            document.cadastro.for_endereco,
                            document.cadastro.for_numero,
                            document.cadastro.for_bairro,
                            document.cadastro.for_cidade,
                            document.cadastro.for_uf,
                            document.cadastro.for_cnpjcpf,
                            document.cadastro.for_rgie,
                            document.cadastro.for_telefone,
                            document.cadastro.for_fax,
                            document.cadastro.for_celular,
                            document.cadastro.for_email
                        ]
                        break
                    case "excluir":
                        required_fields = [
                            document.cadastro.for_codigo
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
