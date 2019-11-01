$(function(){
	

	
	$('.table td').click(function(){
		var sNo=$(this).parent().children().eq(0).text();
		location.href='salarydetail.wo?empNum='+sNo;
	})
	
})
function paging(page){
	location.href="salarylist.wo?page="+page;
}