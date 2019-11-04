$(function(){
	$.ajax({
		url:"checkAttendance.wo",
		dataType:"json",
		type:"post",
		success:function(data){
			if(data.result>0){
				$('#hi').css('display','none');
				$('#bye').removeAttr('style');
				$('#bye').css('color','white').css('width', '100px').css('margin-top','20px');
			}else{
				$('#bye').css('display','none');
				$('#hi').removeAttr('style');
				$('hi').css('color','white').css('width', '100px').css('margin-top','20px');
			}
		},
		error:function(){
			console.log(11);
			
		}
	});
})