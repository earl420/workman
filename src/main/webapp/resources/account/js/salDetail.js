$(function(){
	
})

function checkCount(){
	if($('#salary').val()<20000000 || $('#salary').val()==null||$('#salary').val()==""){
		alert('연봉이 2000만원보다 작을수 없습니다');
		return false;
	}
	return true;
}

$('#updateSalary').click(function(){
	
	$('#myModal').modal("show");
	
})