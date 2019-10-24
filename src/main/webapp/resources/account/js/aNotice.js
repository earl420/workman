$(function(){
	

	
	$('.table td').click(function(){
		console.log(11);
		var aNo=$(this).parent().children().eq(0).text();
		location.href="acDetail.wo?noticeNum="+aNo;
	})
	
})
function paging(page){
	location.href="acnoticeList.wo?page="+page;
}