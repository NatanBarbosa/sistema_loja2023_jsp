<%
    String rootPath = "sistema_loja2023";
    if (session.getAttribute("rootPath") != null) {
        rootPath = (String) session.getAttribute("rootPath");
    }

    if(
        session.getAttribute("logado") == null 
    ) {
        response.sendRedirect("/"+rootPath+"/index.jsp");
    }

    if(
        session.getAttribute("logado") == null || 
        !session.getAttribute("logado").toString().equals("true")
    ) {
        response.sendRedirect("/"+rootPath+"/index.jsp");
    }
%>