<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
response.setContentType("text/html;charset=UTF-8"); 
request.setCharacterEncoding("UTF-8");

String ranNum=request.getParameter("ranNum");
String level=request.getParameter("level");
String Eng=request.getParameter("Eng");
String Ch=request.getParameter("Ch");
String pinyin=request.getParameter("pinyin");
String example=request.getParameter("example");
String def=request.getParameter("def");
String img=request.getParameter("img");
String imgName=request.getParameter("imgName");

int row=0;
String url = "jdbc:mysql://54.169.158.3:3306/NiHao";
Connection conn=null;
PreparedStatement ps=null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
if(Ch!=null ){
    try{
        conn=DriverManager.getConnection("jdbc:mysql://54.169.158.3:3306/NiHao?user=root&password=2xliulriI&useUnicode=true&characterEncoding=utf-8");
        String query="Insert into Vocabulary01(ranNum,level,Eng,Ch,pinyin,example,def,img,imgName) values(?,?,?,?,?,?,?,?,?)";
        ps=conn.prepareStatement(query);
        
        ps.setString(1,ranNum);
        ps.setString(2,level);
        ps.setString(3,Eng);
        ps.setString(4,Ch);
        ps.setString(5,pinyin);
        ps.setString(6,example);
        ps.setString(7,def);
        ps.setString(8,img);
        ps.setString(9,imgName);
        
        row = ps.executeUpdate();
        if (row>0){
        	response.sendRedirect("index.jsp");
        			}
        else{
        	out.println("fail");
        }
    }catch(Exception ex){
        out.println("Your Connection Failed");
    }
}
%>
</body>
</html>