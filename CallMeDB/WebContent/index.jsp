<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" >
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel = "stylesheet " href="bootstrap/css/bootstrap.css">
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/jquery.tablesorter.pager.js"></script>
    <script type="text/javascript" src="js/jquery.tablesorter.combined.js"></script>
    <script type="text/javascript" src="js/pagination.js"></script>
    <script type="text/javascript" src="js/serialize.js"></script>
<title>vocabulary table</title>
<script>
  $(function() {
	  $("#voctable").tablesorter();
	});
  </script> 

</head>

<body>
<div class="container bg-info"  >
<p><br/></p>

 <h1 align="center">Vocabulary01 Table</h1>
 
 	  
<div class="row">
	<div  class="col-sm-2">
		<form role="form" action="addRecord.jsp" method="post" width="20%">
		   
			<div class="form-group"  >
				<label>ranNum </label>  
				<input type="text" class="form-control" name="ranNum" placeholder="random number">
			</div>
			<div class="form-group" >
				<label>level  </label>
				<input type="text" class="form-control" name="level" placeholder="input Level">
			</div>
			<div class="form-group" >
				<label>Eng  </label>
				<input type="text" class="form-control" name="Eng" placeholder="input English">
			</div>
			<div class="form-group" >
				<label>Ch</label>
				<input type="text" class="form-control" name="Ch" placeholder="input Chinese">
			</div>
			<div class="form-group" >
				<label>pinyin  </label>				
				<input type="text" class="form-control" name="pinyin" placeholder="input pinyin " >
			</div>
			<div class="form-group" >
				<label>example  </label>
				<input type="text" class="form-control" name="example" placeholder="input example">
			</div>
			<div class="form-group"  >
				<label>def  </label>
				<input type="text" class="form-control" name="def" placeholder="input definition">
			</div>
			<div class="form-group" >
				<label>img  </label>
				<input type="text" class="form-control" name="img"  placeholder="input link">
			</div>
			
			<button class="btn btn-info btn-block "  type="submit">Add</button>
		</form>
	</div>
	<div class="col-sm-8">
	<table >
	   
	     <thead align="right"> 

	       <tr>
	       <td >
	       <span style="color:transparent;">aaaaaaaaaaaaaaaaaaaaaaaaaa</span>
	       </td>
	       <td>
             <form action=""  method="get"  >
			   	<input type="text" class="form-control" name="q"  placeholder="level/Ch/Eng" >	
			  </form>
		    </td>
		    </tr>    
		    </thead>	
		  
	</table>
	    
	
		<table class="table  table-striped table-hover tablesorter "  id="voctable">
		  
			<thead align="center">
				<tr>
					<th >ranNum   </th>
					<th >level  </th>
					<th >Eng</th>
					<th >Ch</th>
					<th>pinyin</th>
					<th  >example</th>
					<th>def</th>
					<th>img</th>
					
					<th></th>
				</tr>
			<thead>
			
			<tbody align="left">

                <%
                response.setContentType("text/html;charset=UTF-8"); 
                request.setCharacterEncoding("UTF-8");
                String Host = "jdbc:mysql://54.169.158.3:3306/NiHao";
                Connection connection = null;
                Statement statement = null;
                ResultSet rs = null;
                Class.forName("com.mysql.jdbc.Driver");
                connection =DriverManager.getConnection("jdbc:mysql://54.169.158.3:3306/NiHao?user=root&password=2xliulriI&useUnicode=true&characterEncoding=utf-8");
                statement = connection.createStatement();
                String query =request.getParameter("q"); 
                
                String Data ;
                if(query!=null){
                	Data  ="select * from Vocabulary01 where level like '%"+query+"%'  or Eng like '%"+query+"%' or Ch like '%"+query+"%' ";

                }else
                { 
                	Data  ="select * from Vocabulary01 order by wordId desc"; 
                } 
                
                rs = statement.executeQuery(Data);
                while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getInt("ranNum")%></td>
                    <td><%=rs.getInt("level")%></td>
                    <td><%=rs.getString("Eng")%></td>
                    <td style="white-space:nowrap"><%=rs.getString("Ch")%></td>
                    <td style="white-space:nowrap"><%=rs.getString("pinyin")%></td>
                    <td ><%=rs.getString("example")%></td>
                    <td><%=rs.getString("def")%></td>
                    <td><img  width="80" height="60"  alt="pic" src="<%=rs.getString("img")%>"></td>
                                                         
                    <td class="text-left" >
                        <a href='edit.jsp?uid=<%=rs.getString("wordId")%>' class="btn btn-success"  >UPDATE</a>
                        <a href='delete.jsp?did=<%=rs.getString("wordId")%>' class="btn btn-danger">DELETE</a>
                    </td>
                </tr>
                <%
                }
                %>
                
  			</tbody>
		</table>
        <div>
    <a href="#" class="paginate" id="previous">Previous</a> |
    <a href="#" class="paginate" id="next">Next</a>
</div>
	</div>
 </div>
</div>
</body>

</html>
