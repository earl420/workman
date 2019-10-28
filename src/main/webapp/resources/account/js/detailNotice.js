


var accType = $('#accType');
var noticeContent1=$('#noticeContent').val();


function accountList(content){
	 $.ajax({
			url:"accountlist.wo",
			data:{
				content:noticeContent1,
			},
			dataType:"json",
			type:"post",
			success:function(data){
				var $as =$('#accountStatus');
				$as.html("");
				$.each(data,function(index,value){
					var $tr=$('<tr>');
					var $debt=$('<td>').text(value.deptside);
					var $account1=$('<td>').text(value.account1);
					var $credit=$('<td>').text(value.credit);
					var $account2=$('<td>').text(value.account2);
					$tr.append($debt);
					$tr.append($account1);
					$tr.append($credit);
					$tr.append($account2);
					$as.append($tr);
				})
			},
			error:function(){
				console.log(11);
				
			}
		}) 
}

function saleList(){
	 $.ajax({
			url:"incomelist.wo",
			data:{
				content:noticeContent1,
			},
			dataType:"json",
			type:"post",
			success:function(data){
				var $is=$('#incomeStatus');
				$is.text("");
				$.each(data,function(index,value){
					console.log(value.accountSubject);
					var $tr=$('<tr>');
					var $accountSubject= $('<td>').text(value.accountSubject);
					var $account=$('<td>').text(value.account);
					$tr.append($accountSubject);
					$tr.append($account);
					$is.append($tr);
				});
				$('#incomeStatus>tr').slice(0,1).css('font-size','1.8em').css('border-bottom','1px solid black');
				$('#incomeStatus>tr').slice(0,1).children().eq(1).text("");
				$('#incomeStatus>tr').slice(2,3).css('font-size','1.8em');
				$('#incomeStatus>tr').slice(2,3).children().eq(1).text("");
				$('#incomeStatus>tr').slice(6,7).css('font-size','1.8em');
				$('#incomeStatus>tr').slice(8,9).css('font-size','1.8em');
			},
			error:function(){
				console.log(11);
				
			}
		});
}



