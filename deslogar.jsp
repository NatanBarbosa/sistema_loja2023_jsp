<%
    session.setAttribute("logado", false);
    String rootPath = "sistema_loja2023";
   
    response.sendRedirect("/"+rootPath+"/index.jsp");
%>