
$(function(){

	$('#noticeType').on('change',function(){
		if($('#noticeType').val()==1){
			displayEditor();
			disappearterm();
			disappeardate();
			disappearchterm();
			disappearchterm2();
			$('#insertFile').removeAttr("style");
			$('#insertFile').css("padding-left","30px");
			$('#noticeTitle').val("").removeAttr("readonly");
			
		}else if($('#noticeType').val()==2){
			displayAccountStatus();
			disappearterm();
			displaydate();
			disappearchterm();
			disappearchterm2();
			$('#insertFile').css("display","none");
		}else{
			displayIncomeStatus();
			$('#insertFile').css("display","none");
			disappeardate();
			displayterm();
			$('#termselect').on("change",function(){
				
				if($('#termselect').val()=="년"){
					
					disappearchterm();
					displaychterm2();
				}else{
					
					displaychterm();
					disappearchterm2();
				}
			})
		}
	});
	
	
	$('#quarter').on("change",function(){
		insertIncomeStatus();
	})
	
	$('#noticeYear').on("change",function(){
		insertIncomeStatus();
	})
	
	
	$('#inputDate').on("change",function(){
		insertAccountStatus();
	})
	
	

})

function check(){
	if($('#inputDate')==null && $('#inputDate')==""&&$('#quarter')==null && $('#quarter')==""&&$('#noticeYear')==null && $('#noticeYear')==""){
		alert("값을 모두 입력해주세요");
		return false;
	}else{
		if($('#noticeType').val()!=1){
			var content = $('#noticeTitle').val();
			$.ajax({
				url:"check.wo",
			data:{
				content:content,
			},
			dataType:"json",
			type:"post",
			success:function(data){
				if(data>0){
					alert('이미 등록 된 공지 입니다.');
				}
			}
			,
			error:function(){
				console.log(11);
				
			}
			})
		}
		
	}
}	


function insertAccountStatus(){
	var split = ($('#inputDate').val()).split("-");
	var content=$('#termselect').val()+" "+split[0] + " " + split[1]+"/"+split[2];
	$("#noticeTitle").val($('#inputDate').val()+" 재무상태표").attr("readonly","readonly");
	$('#noticeContent').val(content);
	$.ajax({
			url:"accountlist.wo",
			data:{
				content:content,
			},
			dataType:"json",
			type:"post",
			success:function(data){
				var $as =$('#accountStatus1');
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
function insertIncomeStatus(){
	var content =$('#termselect').val();
	if($('#chterm1').css("display") != "none"){
		content+=" "+ $('#quarter').val();
		$("#noticeTitle").val($('#quarter').val()+" 손익계산서").attr("readonly","readonly");
	}else{
		content+=" "+$('#noticeYear').val();
		$("#noticeTitle").val($('#noticeYear').val()+" 손익계산서").attr("readonly","readonly");
	}
	var noticeTitle =$('#noticeTitle').val();
	$('#noticeContent').val(content);
	$.ajax({
			url:"incomelist.wo",
			data:{
				content:content,
				noticeTitle:noticeTitle
			},
			dataType:"json",
			type:"post",
			success:function(data){
				
				var $is=$('#incomeStatus1');
				$is.html("");
				$.each(data,function(index,value){
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
				$('#incomeStatus>tr').slice(7,8).css('font-size','1.8em');
				$('#incomeStatus>tr').slice(9,10).css('font-size','1.8em');
			},
			error:function(){
				console.log(11);
				
			}
		});
}
function displayterm(){
	 
	$('#lterm').removeAttr("style");
	$('#term').removeAttr("style");
}
function disappearterm(){
	$('#lterm').css("display","none");
	$('#term').css("display","none");
}
function displaydate(){
	$('#ldate').removeAttr("style");
	$('#date').removeAttr("style");
}
function disappeardate(){
	$('#ldate').css("display","none");
	$('#date').css("display","none");
}
function displaychterm(){
	$('#lchterm').removeAttr("style");
	$('#chterm1').removeAttr("style");
	var today = new Date();
	var month = today.getMonth()+1;
	var $option1;
	var $option2;
	var $option3;
	if(month<4){
		$option1=$('<option>').val(today.getFullYear()-1+" "+"4/4").text(today.getFullYear()-1 +"년" +"4/4분기");
		$option2=$('<option>').val(today.getFullYear()-1+" "+"3/4").text(today.getFullYear()-1 +"년" +"3/4분기");
		$option3=$('<option>').val(today.getFullYear()-1+" "+"2/4").text(today.getFullYear()-1 +"년" +"2/4분기");
	}else if(month<7){
		$option1=$('<option>').val(today.getFullYear()+" "+"1/4").text(today.getFullYear() +"년" +"1/4분기");
		$option2=$('<option>').val(today.getFullYear()-1+" "+"4/4").text(today.getFullYear()-1 +"년" +"4/4분기");
		$option3=$('<option>').val(today.getFullYear()-1+" "+"3/4").text(today.getFullYear()-1 +"년" +"3/4분기");
	}else if(month<10){
		$option1=$('<option>').val(today.getFullYear()+" "+"2/4").text(today.getFullYear() +"년" +"2/4분기");
		$option2=$('<option>').val(today.getFullYear()+" "+"1/4").text(today.getFullYear() +"년" +"1/4분기");
		$option3=$('<option>').val(today.getFullYear()-1+" "+"4/4").text(today.getFullYear()-1 +"년" +"4/4분기");
	}else{
		$option1=$('<option>').val(today.getFullYear()+" "+"3/4").text(today.getFullYear() +"년" +"3/4분기");
		$option2=$('<option>').val(today.getFullYear()+" "+"2/4").text(today.getFullYear() +"년" +"2/4분기");
		$option3=$('<option>').val(today.getFullYear()+" "+"1/4").text(today.getFullYear() +"년" +"1/4분기");
	}
	$('#quarter').html("");
	var $blank=$('<option>').text('-------').val("");
	
	$('#quarter').append($blank);
	$('#quarter').append($option1);
	$('#quarter').append($option2);
	$('#quarter').append($option3);
	
}
function disappearchterm(){
	$('#lchterm').css("display","none");
	$('#chterm1').css("display","none");
}
function displaychterm2(){
	$('#lchterm2').removeAttr("style");
	$('#chterm2').removeAttr("style");
	$('#chterm2>#noticeYear').html("");
	var today1 = new Date();
	var year1=today1.getFullYear();
	var $option = $('<option>').val((year1-1)).text((year1-1)+"년");
	var $blank=$('<option>').text("----").val("");
	$('#noticeYear').append($blank);
	$('#noticeYear').append($option);
}
function disappearchterm2(){
	$('#lchterm2').css("display","none");
	$('#chterm2').css("display","none");
}
function displayEditor(){
	$('#incomeStatus').css("display","none");
	$('#accountStatus').css("display","none");
	$('#editor').removeAttr("style");
}
function displayIncomeStatus(){
	$('#incomeStatus').removeAttr("style");
	$('#accountStatus').css("display","none");
	$('#editor').css("display","none");
}
function displayAccountStatus(){
	$('#incomeStatus').css("display","none");
	$('#accountStatus').removeAttr("style");
	$('#editor').css("display","none");
}
