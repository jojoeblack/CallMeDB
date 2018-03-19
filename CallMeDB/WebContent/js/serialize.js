var table = '#voctable'

$(function(){
		$('table tr:eq(1)').prepend('<th>ID</th>')
		var id = 0;
		$('table tr:gt(1)').each(function(){
			id++
			$(this).prepend('<td>'+id+'</td>')
		})
})
	