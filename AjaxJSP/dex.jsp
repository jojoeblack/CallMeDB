<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Demo Ajax</title>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#btnHello').click(function(){
		var fullname = $('#fuck').val();
		$.ajax({
			type:'POST',
			data:{fullname:fullname},
		
			url:'AjaxController',
			success: function(result){
				$('#result1').html(result)
			}
		})
	})
})
</script>


</head>
<body>
<form>
	Name<input type="text" value="" id="fuck">
	<input type="button" value="Hello" id="btnHello">
	<br>
	<span id="result1"></span>
</form>
</body>
</html>