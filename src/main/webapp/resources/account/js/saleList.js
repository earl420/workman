$(function(){
	/*$('#acList td').dblclick(function(){
		var sale=$(this).parent().children().eq(1).text();
		var place=$(this).parent().children().eq(2).text();
		var saler=$(this).parent().children().eq(3).text();
		var price=$(this).parent().children().eq(4).text();
		var term =$(this).parent().children().eq(5).text();
		$('#updateSale input').val('');
		$('#updateSale input').slice(0,1).val(sale);
		$('#updateSale input').slice(1,2).val(place);
		$('#updateSale input').slice(2,3).val(saler);
		$('#updateSale input').slice(3,4).val(price);
		$('#updateSale input').slice(4,5).val(term);
		$('.modal-header>h4').text('판매정보수정');
		$('#modalBtn').text('판매변경');
		$('#modalForm').attr('action','updateSale.wo');
		$('#myModal').modal("show");
		
	})*/
	$('#insertSale').click(function(){
		$('#today11').val('');
		var date = new Date();
		var abc = date.getFullYear();
		abc+= "/" +(date.getMonth()+1)+"/"+date.getDate();
		$('#today11').val(abc);
		$('.modal-header>h4').text('판매정보등록');
		$('#modalBtn').text('판매등록');
		$('#modalForm').attr('action','insertsale.wo');
		$('#myModal').modal("show");
		
	})
	
	
   

$.ajax({
	url:"productinfo.wo",
	dataType:"json",
	type:"post",
	success:function(data){
		console.log(data);
		var $pr =$('#product');
		$pr.html("");
		$.each(data,function(index,value){
			var $option = $('<option>').val(value.productCode).text(value.productName);
			$pr.append($option);
		})
	},
	error:function(){
		console.log(11);
		
	}
});

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
	
	
})
function paging(page){
	location.href="salelist.wo?page="+page;
}
function checkCount(){
	var count =$('#saleCount').val();
	if(count<1){
		alert('판매갯수는 1개이상이어야 합니다');
		return false;
	}else{
		return true;
	}
	
}