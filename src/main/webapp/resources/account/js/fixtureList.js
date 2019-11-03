$(function(){
	

	
	$('.table td').dblclick(function(){
		console.log(11);
	})
	
	$('#insertSale').click(function(){
		$('#today11').val('');
		var date = new Date();
		var abc = date.getFullYear();
		abc+= "/" +(date.getMonth()+1)+"/"+date.getDate();
		$('#today11').val(abc);
		$('.modal-header>h4').text('구매정보등록');
		$('#modalBtn').text('구매 등록');
		$('#myModal').modal("show");
		
	})
	

		$.ajax({
			url:"partnerInfo.wo",
			dataType:"json",
			type:"post",
			success:function(data){
				var $pr =$('#partner');
				$pr.html("");
				$.each(data,function(index,value){
					var $option = $('<option>').val(value.partnerNum).text(value.partnerName);
					$pr.append($option);
				})
			},
			error:function(){
				console.log(11);
				
			}
		});
	$.ajax({
		url:"deptFixInfo.wo",
		dataType:"json",
		type:"post",
		success:function(data){
			var $dp =$('#deptNum');
			$dp.html("");
			$op = $('<option>').val('').text('----');
			$.each(data,function(index,value){
				var $option = $('<option>').val(value.deptNum).text(value.deptName);
				$dp.append($option);
			})
		},
		error:function(){
			console.log(11);
			
		}
	});
	
	$('#deptNum').on('change', function(){
		var dptNum = $('#deptNum').val();
		$.ajax({
			url:"deptEmpInfo.wo",
			dataType:"json",
			data:{deptNum:dptNum},
			type:"post",
			success:function(data){
				var $dp =$('#deptUser');
				$dp.html("");
				$op = $('<option>').val('').text('----');
				$.each(data,function(index,value){
					var $option = $('<option>').val(value.empNum).text(value.empName);
					$dp.append($option);
				})
			},
			error:function(){
				console.log(11);
				
			}
		});
	})
	
	
})
function paging(page){
	location.href="fixturelist.wo?page="+page;
}