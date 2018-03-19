<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel = "stylesheet " href="bootstrap/css/bootstrap.css">
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
</head>
        <p><br/></p>
        <%
        response.setContentType("text/html;charset=UTF-8"); 
        request.setCharacterEncoding("UTF-8");
        Connection connection = null;
        Statement statement = null;
        ResultSet rs = null;
        PreparedStatement ps=null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        connection = DriverManager.getConnection("jdbc:mysql://54.169.158.3:3306/NiHao?user=root&password=2xliulriI&useUnicode=true&characterEncoding=utf-8");
        %>
        <div class="container bg-info ">
           <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-6"><h3>Edit/Update Data</h3></div>
                    <div class="col-md-6 text-right">
                        <a href="index.jsp" class="btn btn-info">Back to Home</a>
                    </div>
                </div>
                <p></p>
                
                <form action="" method="post">
                    <%
                    statement = connection.createStatement();
                    String u=request.getParameter("uid");
                    int num=Integer.parseInt(u);
                    String Data = "select * from Vocabulary01 where wordId='"+num+"'";
                    rs = statement.executeQuery(Data);
                    while (rs.next()) {
                    %>   
                    <input type="hidden" name="wordId" value="<%=rs.getInt("wordId") %>">
					<div class="form-group"> 
					<label> ranNum </label>
					<input type="text" name="ranNum" value="<%=rs.getInt("ranNum") %>" class="form-control">
					</div>
					<div class="form-group">
					<label> level </label>
					<input type="text" name="level" value="<%=rs.getInt("level") %>" class="form-control">
					</div>
					<div class="form-group">
					<label> Eng </label>
					<input type="text" name="Eng" value="<%=rs.getString("Eng") %>" class="form-control">
					</div>
					<div class="form-group">
					<label> Ch </label>
					<input type="text" name="Ch" value="<%=rs.getString("Ch") %>" class="form-control">
					</div>
					<div class="form-group">
					<label> pinyin </label>
					<input type="text" name="pinyin" value="<%=rs.getString("pinyin") %>" class="form-control">
					</div>
					<div class="form-group">
					<label> example </label>
					<input type="text" name="example" value="<%=rs.getString("example") %>" class="form-control">
					</div>
					<div class="form-group">
					<label> def </label>
					<input type="text" name="def" value="<%=rs.getString("def") %>"class="form-control">
					</div>
					<div class="form-group">
					<label> img </label>
					<input type="text" name="img" value="<%=rs.getString("img") %>" class="form-control">
					</div>
					<div class="form-group">
					<label> imgName </label>
					<input type="text" name="imgName" value="<%=rs.getString("imgName") %>" class="form-control">
					</div>
                    <%   
                    }
                    %>
                    <button type="submit" class="btn btn-warning">Update</button>
                </form>
            </div>
        </div>
      </div>
</html>
<%
String a=request.getParameter("wordId");
String b=request.getParameter("ranNum");
String c=request.getParameter("level");
String d=request.getParameter("Eng");
String e=request.getParameter("Ch");
String f=request.getParameter("pinyin");
String g=request.getParameter("example");
String h=request.getParameter("def");
String i=request.getParameter("img");
String j=request.getParameter("imgName");
int updateQuery = 0;
if(f!=null){
    try{
        String query="update Vocabulary01 set ranNum=?,level=?,Eng=?,Ch=?,pinyin=?,example=?,def=?,img=?,imgName=? where wordId='"+a+"'";
        ps=connection.prepareStatement(query);
        ps.setString(1,b);
        ps.setString(2,c);
        ps.setString(3,d);
        ps.setString(4,e);
        ps.setString(5,f);
        ps.setString(6,g);
        ps.setString(7,h);
        ps.setString(8,i);
        ps.setString(9,j);
        
        updateQuery=ps.executeUpdate();
        if(updateQuery!=0){
            response.sendRedirect("index.jsp");
        }
    }catch(Exception ex){
        out.println("Your Connection: "+ex);
    }finally{
        ps.close();
        connection.close();
    }
}
%>