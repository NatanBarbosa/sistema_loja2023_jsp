 <%@ page contentType="text/html" language="java" import="java.sql.*"%>  
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
 <jsp:useBean id="con" class="conexao_notafiscal.Conexao_notafiscal"/>  
    <html>  
    <head>  
    <title>Listar</title>  
    <meta http-equiv="Content-Type" content="text/html; charset=iso--">  
    </head>  
      
   <body>  
   <form name="form" method="post" action="notafiscal.jsp">  
     
   <p><strong>Tabela Nota Fiscal </strong></p>  
   <table border=1 cellspacing=0 cellpadding=0 >  
   
    <tr>  
     <td width=50><strong>  
       Código  
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
        
      }catch (Exception e) {  
         e.printStackTrace();  
      }  
        
   %>  
   </table>  
     <p>  
       <input type="submit" name="Submit" value="voltar">  
   </p>  
   </form>  
   </body>  
   </html>  