<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="./verificarLogin.jsp" %>
<%@ page import="sistema_loja2023.service.FuncionarioService" %>
<%@ page import="sistema_loja2023.model.Funcionario" %>
<%@ page import="java.util.List" %>
<%@ page import="sistema_loja2023.infraestructure.exceptions.CustomException" %>

<!DOCTYPE html PUBLIC "-//WC//DTD HTML . Transitional//EN" "http://www.w.org/TR/html/loose.dtd">

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tabela Funcionários</title>

    <link rel="stylesheet" href="assets/estilo.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
        crossorigin="anonymous" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</head>

<%
    String fun_codigo = request.getParameter("fun_codigo");
    String action = request.getParameter("action");

    FuncionarioService funcionarioService = new FuncionarioService();
    String status = request.getParameter("status");

    String errorMessage = null;
    String errorDetail = null;

    String[] parametros = {
        request.getParameter("fun_codigo"),
        request.getParameter("fun_nome"),
        request.getParameter("fun_endereco"),
        request.getParameter("fun_numero"),
        request.getParameter("fun_complemento"),
        request.getParameter("fun_bairro"),
        request.getParameter("fun_cidade"),
        request.getParameter("fun_uf"),
        request.getParameter("fun_cnpjcpf"),
        request.getParameter("fun_rgie"),
        request.getParameter("fun_sexo"),
        request.getParameter("fun_nascimento"),
        request.getParameter("fun_telefone"),
        request.getParameter("fun_celular"),
        request.getParameter("fun_email"),
        request.getParameter("fun_salario")
    };

    Funcionario funcionario = new Funcionario();

    try {
        funcionario = Funcionario.mapearComParametros(parametros);

    } catch (Exception e) {
        errorMessage = "Um erro inesperado ocorreu! " + e.getMessage();
        errorDetail = e.getMessage();
    }

    Funcionario funcionarioPesquisado = new Funcionario();

    try {
        if (action != null) {
            
            if (action.equals("consultar")) {
                funcionarioPesquisado = funcionarioService.obter(funcionario.getFun_codigo());
                status = "Pesquisado com sucesso";
                if (funcionarioPesquisado == null) {
                    funcionarioPesquisado = new Funcionario();
                    status = "Registro inexistente";
                }
            } else if (action.equals("cadastrar")) {
                funcionarioService.inserir(funcionario);
                status = "Cadastrado com sucesso";
            } else if (action.equals("alterar")) {
                funcionarioService.alterar(funcionario);
                status = "Alterado com sucesso";
            } else if (action.equals("excluir")) {
                funcionarioService.excluir(funcionario.getFun_codigo());
                status = "Excluído com sucesso";
            } 
        } else {
            funcionarioPesquisado = funcionarioService.obter(1);
            status = "Pesquisado com sucesso";
            if (funcionarioPesquisado == null) {
                funcionarioPesquisado = new Funcionario();
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
                <h3 class="text-primary text-center">Cadastro Funcionários</h3>
            </div>
        </div>
        <hr />
        <form name="cadastro" method="post" action="">
            <input type="hidden" hidden id="action" name="action" value="">
            <input type="hidden" hidden id="page" name="page" value="funcionario.jsp">
            <div class="row">
                <div class="col">
                    <div class="row">
                        <div class="mb-3 col-12">
                            <label for="fun_nome" class="form-label">Nome</label>
                            <input type="text" class="form-control" id="fun_nome" name="fun_nome"
                                value='<%= (funcionarioPesquisado.getFun_nome() == null) ? "" : funcionarioPesquisado.getFun_nome() %>' />
                        </div>
                    </di>
                    <div class="row">
                        <div class="mb-3 col-6">
                            <label for="fun_codigo" class="form-label">Código</label>
                            <input type="text" class="form-control" id="fun_codigo" name="fun_codigo"
                                value='<%= (funcionarioPesquisado.getFun_codigo() == null) ? "" : funcionarioPesquisado.getFun_codigo() %>' />
                        </div>
                        <div class="mb-3 col-6">
                            <label for="fun_endereco" class="form-label">Endereço</label>
                            <input type="text" class="form-control" id="fun_endereco" name="fun_endereco"
                                value='<%= (funcionarioPesquisado.getFun_endereco() == null) ? "" : funcionarioPesquisado.getFun_endereco() %>' />
                        </div>
                    </div>
                    <div class="row">
                        <div class="mb-3 col-6">
                            <label for="fun_numero" class="form-label">Número</label>
                            <input type="text" class="form-control" id="fun_numero" name="fun_numero"
                                value='<%= (funcionarioPesquisado.getFun_numero() == null) ? "" : funcionarioPesquisado.getFun_numero() %>' />
                        </div>
                        <div class="mb-3 col-6">
                            <label for="fun_complemento" class="form-label">Complemento</label>
                            <input type="text" class="form-control" id="fun_complemento" name="fun_complemento"
                                value='<%= (funcionarioPesquisado.getFun_complemento() == null) ? "" : funcionarioPesquisado.getFun_complemento() %>' />
                        </div>
                    </div>
                    <div class="row">
                        <div class="mb-3 col-6">
                            <label for="fun_bairro" class="form-label">Bairro</label>
                            <input type="text" class="form-control" id="fun_bairro" name="fun_bairro"
                                value='<%= (funcionarioPesquisado.getFun_bairro() == null) ? "" : funcionarioPesquisado.getFun_bairro() %>' />
                        </div>
                        <div class="mb-3 col-6">
                            <label for="fun_cidade" class="form-label">Cidade</label>
                            <input type="text" class="form-control" id="fun_cidade" name="fun_cidade"
                                value='<%= (funcionarioPesquisado.getFun_cidade() == null) ? "" : funcionarioPesquisado.getFun_cidade() %>' />
                        </div>
                    </div>
                    <div class="row">
                        <div class="mb-3 col-6">
                            <label for="fun_uf" class="form-label">UF</label>
                            <input type="text" class="form-control" id="fun_uf" name="fun_uf" maxlength="2"
                                value='<%= (funcionarioPesquisado.getFun_uf() == null) ? "" : funcionarioPesquisado.getFun_uf() %>' />
                        </div>
                        <div class="mb-3 col-6">
                            <label for="fun_cnpjcpf" class="form-label">CNPJ/CPF</label>
                            <input type="text" class="form-control" id="fun_cnpjcpf" name="fun_cnpjcpf"
                                value='<%= (funcionarioPesquisado.getFun_cnpjcpf() == null) ? "" : funcionarioPesquisado.getFun_cnpjcpf() %>' />
                        </div>
                    </div>
                    <div class="row">
                        <div class="mb-3 col-6">
                            <label for="fun_rgie" class="form-label">RG/IE</label>
                            <input type="text" class="form-control" id="fun_rgie" name="fun_rgie"
                                value='<%= (funcionarioPesquisado.getFun_rgie() == null) ? "" : funcionarioPesquisado.getFun_rgie() %>' />
                        </div>
                        <div class="mb-3 col-6">
                            <label for="fun_sexo" class="form-label">Sexo</label>
                            <input type="text" class="form-control" id="fun_sexo" name="fun_sexo"
                                value='<%= funcionarioPesquisado.getFun_sexo()%>' />
                        </div>
                    </div>
                    <div class="row">
                        <div class="mb-3 col-6">
                            <label for="fun_nascimento" class="form-label">Nascimento</label>
                            <input type="date" class="form-control" id="fun_nascimento" name="fun_nascimento"
                                value='<%= (funcionarioPesquisado.getFun_nascimento() == null) ? "" : funcionarioPesquisado.getFun_nascimento() %>' />
                        </div>
                        <div class="mb-3 col-6">
                            <label for="fun_telefone" class="form-label">Telefone</label>
                            <input type="text" class="form-control" id="fun_telefone" name="fun_telefone"
                                value='<%= (funcionarioPesquisado.getFun_telefone() == null) ? "" : funcionarioPesquisado.getFun_telefone() %>' />
                        </div>
                    </div>
                    <div class="row">
                        <div class="mb-3 col-6">
                            <label for="fun_celular" class="form-label">Celular</label>
                            <input type="text" class="form-control" id="fun_celular" name="fun_celular"
                                value='<%= (funcionarioPesquisado.getFun_celular() == null) ? "" : funcionarioPesquisado.getFun_celular() %>' />
                        </div>
                        <div class="mb-3 col-6">
                            <label for="fun_email" class="form-label">Email</label>
                            <input type="text" class="form-control" id="fun_email" name="fun_email"
                                value='<%= (funcionarioPesquisado.getFun_email() == null) ? "" : funcionarioPesquisado.getFun_email() %>' />
                        </div>
                    </div>
                    <div class="row">
                        <div class="mb-3 col-6">
                            <label for="fun_salario" class="form-label">Salário</label>
                            <input type="text" class="form-control" id="fun_salario" name="fun_salario"
                                value='<%= (funcionarioPesquisado.getFun_salario() == null) ? "" : funcionarioPesquisado.getFun_salario() %>' />
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
    </div>
</div>

    <% if (action != null && action.equals("listar")) { %>
    <table class="table table-striped-columns table-secondary">
        <thead>
            <tr>
                <th scope="col">Código</th>
                <th scope="col">Nome</th>
                <th scope="col">Endereço</th>
                <th scope="col">Número</th>
                <th scope="col">Complemento</th>
                <th scope="col">Bairro</th>
                <th scope="col">Cidade</th>
                <th scope="col">UF</th>
                <th scope="col">CNPJ/CPF</th>
                <th scope="col">RG/IE</th>
                <th scope="col">Sexo</th>
                <th scope="col">Nascimento</th>
                <th scope="col">Telefone</th>
                <th scope="col">Celular</th>
                <th scope="col">Email</th>
                <th scope="col">Salário</th>
            </tr>
        </thead>
        <tbody>
            <% 
                List<Funcionario> lista_funcionarios = funcionarioService.listarTodos();
                for (int i = 0; i < lista_funcionarios.size(); i++) {
            %>
                <tr>
                    <td><%= lista_funcionarios.get(i).getFun_codigo() %></td>
                    <td><%= lista_funcionarios.get(i).getFun_nome() %></td>
                    <td><%= lista_funcionarios.get(i).getFun_endereco() %></td>
                    <td><%= lista_funcionarios.get(i).getFun_numero() %></td>
                    <td><%= lista_funcionarios.get(i).getFun_complemento() %></td>
                    <td><%= lista_funcionarios.get(i).getFun_bairro() %></td>
                    <td><%= lista_funcionarios.get(i).getFun_cidade() %></td>
                    <td><%= lista_funcionarios.get(i).getFun_uf() %></td>
                    <td><%= lista_funcionarios.get(i).getFun_cnpjcpf() %></td>
                    <td><%= lista_funcionarios.get(i).getFun_rgie() %></td>
                    <td><%= lista_funcionarios.get(i).getFun_sexo() %></td>
                    <td><%= lista_funcionarios.get(i).getFun_nascimento() %></td>
                    <td><%= lista_funcionarios.get(i).getFun_telefone() %></td>
                    <td><%= lista_funcionarios.get(i).getFun_celular() %></td>
                    <td><%= lista_funcionarios.get(i).getFun_email() %></td>
                    <td><%= lista_funcionarios.get(i).getFun_salario() %></td>
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
                let required_fields = [];

                switch (action) {
                    case "cadastrar":
                        required_fields = [
                            document.cadastro.fun_codigo,
                            document.cadastro.fun_nome,
                            document.cadastro.fun_endereco,
                            document.cadastro.fun_numero,
                            document.cadastro.fun_complemento,
                            document.cadastro.fun_bairro,
                            document.cadastro.fun_cidade,
                            document.cadastro.fun_uf,
                            document.cadastro.fun_cnpjcpf,
                            document.cadastro.fun_rgie,
                            document.cadastro.fun_sexo,
                            document.cadastro.fun_nascimento,
                            document.cadastro.fun_telefone,
                            document.cadastro.fun_celular,
                            document.cadastro.fun_email,
                            document.cadastro.fun_salario
                        ];
                        break;
                    case "consultar":
                        required_fields = [
                            document.cadastro.fun_codigo
                        ];
                        break;
                    case "alterar":
                        required_fields = [
                            document.cadastro.fun_codigo,
                            document.cadastro.fun_nome,
                            document.cadastro.fun_endereco,
                            document.cadastro.fun_numero,
                            document.cadastro.fun_complemento,
                            document.cadastro.fun_bairro,
                            document.cadastro.fun_cidade,
                            document.cadastro.fun_uf,
                            document.cadastro.fun_cnpjcpf,
                            document.cadastro.fun_rgie,
                            document.cadastro.fun_sexo,
                            document.cadastro.fun_nascimento,
                            document.cadastro.fun_telefone,
                            document.cadastro.fun_celular,
                            document.cadastro.fun_email,
                            document.cadastro.fun_salario
                        ];
                        break;
                    case "excluir":
                        required_fields = [
                            document.cadastro.fun_codigo
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
