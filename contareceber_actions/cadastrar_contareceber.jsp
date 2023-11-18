 <%@ page contentType="text/html" language="java" import="java.sql.*"%>
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <jsp:useBean id="con" class="conexao_contareceber.Conexao_contareceber"/>
 <html>
 <head>
 <title>Cadastrar</title>
 <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
 </head>

 <body>
 <form name="form1" method="post" action="../contareceber.jsp">

 <p><strong>Tabela - Nota Fiscal </strong></p>
 <table border=1 cellspacing=0 cellpadding=0 >

   <tr>
      <td width=50><strong>
        C�digo
     </strong></td>
    <td width=50><strong>
        Valor Conta
     </strong></td>
     <td width=50><strong>
        Data Vencimento
     </strong></td>
     <td width=50><strong>
       Data Recebimento
     </strong></td>
     <td width=50><strong>
       Nota fiscal código
    </strong></td>
    <td width=50><strong>
       Observações
    </strong></td>
     </tr>


 <%
    try {

       con.setCr_codigo(Integer.parseInt(request.getParameter("cr_codigoField")));
       con.setCr_valorconta(request.getParameter("cr_valorcontaField"));
       con.setCr_datavencimento(request.getParameter("cr_datavencimentoField"));
	   con.setCr_datarecebimento(request.getParameter("cr_datarecebimentoField"));
	   con.setNf_codigo(request.getParameter("nf_codigoField"));
	   con.setCr_observacoes(request.getParameter("cr_observacoesField"));
       con.inserirDados();

       con.setConsulta();
       ResultSet temp = con.getResultado();
       temp.next();

       if(request.getParameter("cr_codigoField").equals(temp.getString("cr_codigo")))
          response.sendRedirect("http://localhost:8084/sistema_loja2023/contareceber.jsp?status=Registro j� existente");

       do{
       %>
       <tr>
           <td width=200>
                <%out.print(temp.getString("cr_codigo"));%>
          </td>
           <td width=50>
                <%out.print(temp.getString("cr_valorconta"));%>
          </td>
           <td width=30>
                <%out.print(temp.getString("cr_datavencimento"));%>
          </td>
			<td width=30>
                <%out.print(temp.getString("cr_datarecebimento"));%>
          </td>
          <td width=30>
                <%out.print(temp.getString("nf_codigo"));%>
          </td>
          <td width=30>
                <%out.print(temp.getString("cr_observacoes"));%>
          </td>
       </tr>
       <%}while (temp.next());

    }catch (Exception e) {
       e.printStackTrace();
    }

 %>
 </table>
   <p> </p>
   <p>
     <input type="submit" name="Submit" value="voltar">
 </p>
 <p><strong>Status:
     <input name="statusField" disabled type="text" id="statusField" size="36" value="<%=request.getParameter("cr_codigoField")%> foi cadastrado com sucesso">
       </strong></p>
 </form>
 </body>
 </html>
