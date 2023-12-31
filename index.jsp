
<%@ page import="sistema_loja2023.Service.LoginService" %>

<%
    String rootPath = "sistema_loja2023";
    if (session.getAttribute("rootPath") != null) {
        rootPath = (String) session.getAttribute("rootPath");
    }
    session.setAttribute("rootPath", rootPath);

    if(session.getAttribute("logado") != null && session.getAttribute("logado").toString().equals("true")) {
        response.sendRedirect("/"+rootPath+"/notafiscal.jsp");
    } else {
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
    
        session.setAttribute("logado", "false");
    
        if(login != null && senha != null) {
            boolean valido = LoginService.validarLogin(login, senha);
            session.setAttribute("logado", valido);
        }
    
        if(session.getAttribute("logado").toString().equals("true") ) {
            response.sendRedirect("/"+rootPath+"/notafiscal.jsp");
        }
    }
    
%>

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
                <form class="login-form" action='<%= "/" + rootPath + "/index.jsp"%>'>
                    <div class="form-outline mb-4">
                        Fala professor .... <br>

                        user = admin <br>
                        senha = 123
                    </div>

                    <div class="form-outline mb-4">
                      <label class="form-label" for="usuario">Login</label>
                      <input type="text" id="usuario" class="form-control" name="login" required/>
                    </div>
                  
                    <div class="form-outline mb-4">
                      <label class="form-label" for="senha">Senha</label>
                      <input type="password" id="senha" class="form-control" name="senha" required />
                    </div>

                    <button type="submit" class="btn btn-primary btn-block mb-4">Entrar</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
</body>
</html>
