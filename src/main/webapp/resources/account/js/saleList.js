$(function(){

	$('#acList td').dblclick(function(){
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
		
	})
	$('#insertSale').click(function(){
		$('#updateSale input').val('');
		$('.modal-header>h4').text('판매정보등록');
		$('#modalBtn').text('판매등록');
		$('#modalForm').attr('action','insertSale.wo');
		$('#myModal').modal("show");
		
	})
})
function paging(page){
	location.href="acnoticeList.wo?page="+page;
}