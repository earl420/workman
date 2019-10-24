





function accountList(content){
	 $.ajax({
			url:"accountlist.wo",
			data:{
				content:content,
			},
			type:"post",
			success:function(data){
				console.log(data);
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

function saleList(content){
	 $.ajax({
			url:"incomelist.wo",
			data:{
				content:content,
			},
			type:"post",
			success:function(data){
				console.log(data);
				var $is=$('#incomeStatus');
				$is.html("");
				$.each(data,function(index,value){
					var $tr=$('<tr>');
					var $accountSubject= $('<td>').val(value.accountSubject);
					var $account=$('<td>').val(value.account);
					$tr.append($accountSubject);
					$tr.append($account);
					$is.append($tr);
				});
			},
			error:function(){
				console.log(11);
				
			}
		});
}



