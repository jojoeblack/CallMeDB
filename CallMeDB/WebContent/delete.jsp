<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String id=request.getParameter("did");
int no=Integer.parseInt(id);
try {
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://54.169.158.3:3306/NiHao", "root", "2xliulriI");
    Statement st = conn.createStatement();
    st.executeUpdate("DELETE FROM Vocabulary01 WHERE wordId = '"+no+"'");
    response.sendRedirect("index.jsp");
} catch(Exception e){}
%>