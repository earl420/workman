$(function(){
	
})
function paging(){
	var page = $(this).text();
	console.log("1"+page);
	location.href="acnoticeList.wo?page="+page;
}