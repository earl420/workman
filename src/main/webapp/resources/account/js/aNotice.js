$(function(){
	

	
	$('.table td').click(function(){
		console.log(11);
		var aNo=$(this).parent().children().eq(0).text();
		location.href="acDetail.wo";
	})
	
})
function paging(){
	var page = $(this).text();
	console.log("1"+page);
	location.href="acnoticeList.wo?page="+page;
}