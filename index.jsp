
 <%-- <jsp:useBean id="con" class="conexao_notafiscal.Conexao_notafiscal"/> --%>
   <%-- <jsp:useBean id="con" class="sistema.login.ConexaoLogin"/> --%>
   <%@ page import="conexao_notafiscal.Conexao_notafiscal2" %>
   <%@ page import="sistema_loja2023.TesteConexao" %>
   <%@ page import="sistema_loja2023.repository.ProdutosRepository" %>
   <%@ page import="java.util.List" %>
   <%@ page import="sistema_loja2023.model.Produto" %>

<%
    String cp_codigo=request.getParameter("cp_codigo");

    String login = request.getParameter("login");
    String senha = request.getParameter("senha");

    String retorno = "";
    Conexao_notafiscal2 cn = new Conexao_notafiscal2();
    retorno = cn.teste();

    
    // Login loginClass = new Login();
    // String retorno = loginClass.ola();

    // Teste teste = new Teste();
    // retorno = teste.teste();
    TesteConexao teste = new TesteConexao();
    retorno = teste.testar();
    // retorno = "asasas";

    // ProdutosRepository repo = new ProdutosRepository();
    // List lista = repo.obterProdutos();
    ProdutosRepository repo = new ProdutosRepository();
    List<Produto> lista = repo.obterProdutos();
    
%>

<%= lista.get(0).getPro_descricao() %>



<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <link rel="stylesheet" href="assets/estilo.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
        crossorigin="anonymous" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous" defer></script>

    <style>
        .login-form{
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
    </style>
</head>
<body>
    <div class="container login-container">
        <div class="row">
            <div class="col-12 col-lg-6 mx-auto">
                <form class="login-form">
                    <div class="form-outline mb-4">
                        Fala professor .... <br>

                        user = admin
                        senha = 123
                    </div>

                    <div class="form-outline mb-4">
                      <input type="text" id="usuario" class="form-control" name="login" required/>
                      <label class="form-label" for="usuario">Login</label>
                    </div>
                  
                    <div class="form-outline mb-4">
                      <input type="password" id="senha" class="form-control" name="senha" required />
                      <label class="form-label" for="senha">Senha</label>
                    </div>

                    <button type="submit" class="btn btn-primary btn-block mb-4">Entrar</button>
                  
                    </div>
                </form>

            </div>
        </div>
    </div>
</body>
</html>