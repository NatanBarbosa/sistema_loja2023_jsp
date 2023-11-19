<%

    if(
        session.getAttribute("logado") == null 
    ) {
        response.sendRedirect("/sistema/index.jsp");
    }

    if(
        session.getAttribute("logado") == null || 
        !session.getAttribute("logado").toString().equals("true") 
    ) {
        response.sendRedirect("/sistema/index.jsp");
    }
    
%>