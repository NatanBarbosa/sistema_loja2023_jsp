 <%@ page contentType="text/html" language="java" import="java.sql.*"%>  
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
 <jsp:useBean id="con" class="conexao_notafiscal.Conexao_notafiscal"/> 
 <html>  
 <head>  
 <title>Excluir</title>  
 <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">  
 </head>  
   
 <body>  
 <form name="form1" method="post" action="notafiscal.jsp">  
   
 <p><strong>Tabela Cidade </strong></p>  
 <table border=1 cellspacing=0 cellpadding=0 >  
   
    <tr>  
     <td width=50><strong>  
       C�digo  
    </strong></td> 
	<td width=50><strong>  
       Valor
    </strong></td> 	
    <td width=50><strong>  
       Taxa de imposto
    </strong></td>      
    <td width=50><strong>  
       Valor do imposto
    </strong></td>  
    </tr>  
   
   
 <%      
    try {  
   
       con.setNf_codigo(Integer.parseInt(request.getParameter("nf_codigoField")));  
   
       if (con.excluirDados())  
       {  
          con.setConsulta();  
          ResultSet temp = con.getResultado();  
         
          while (temp.next()){  
          %>  
             <tr>  
           <td width=200>  
                <%out.print(temp.getString("nf_codigo"));%>  
          </td>  
           <td width=50>  
                <%out.print(temp.getString("nf_valornf"));%>  
          </td>  
           <td width=30>  
                <%out.print(temp.getString("nf_taxaimpostonf"));%>  
          </td> 
			<td width=30>  
                <%out.print(temp.getString("nf_valorimposto"));%>  
          </td>
		  </tr>  
          <%}  
       }  
       else{  
          response.sendRedirect("http://localhost:8084/sistema_loja2023/notafiscal.jsp?status=Registro n�o encontrado");  
       }     
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
     <input name="statusField" disabled type="text" id="statusField" size="36" value="<%=request.getParameter("nf_codigoField")%> foi excluido com sucesso">  
       </strong></p>  
 </form>  
 </body>  
 </html> 