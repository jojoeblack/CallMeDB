<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link href="css/site.css" rel="stylesheet">
<style>


tr:nth-child(even) {
  background-color: Beige ;
}


tr:nth-child(odd) {
  background-color: white;
}
</style>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<script src="js/dynamic-table.jquery.js"></script>
<script>
$("#books").dynamicTable({
    fillParent : false,
    showCounter: true,
    background-color:#ffffff
});
</script>

<sql:setDataSource 
driver="com.mysql.jdbc.Driver"
url="jdbc:mysql://54.169.158.3:3306/scif_library?user=root&password=2xliulriI"

/>

<sql:query var="result">
select * from books
</sql:query>
<div id="books">
<table border="1" class="table" >
		<thead id="th1">
		<tr>
			<th>書名</th>
			<th>作者</th>
			<th>頁數</th>
		</tr>
	</thead>
	<c:forEach var="row" items="${result.rows }">
		<tr>
		<td>${row.title}</td>
		<!--<td><fmt:formatNumber value="${row.population}" type="number"/></td>  -->
        <td>${row.author}</td>
        <td>${row.pages}</td>
        </tr>
	</c:forEach>
</table>
</div>
</body>
</html>