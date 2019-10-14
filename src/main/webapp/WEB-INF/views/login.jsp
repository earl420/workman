<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%String contextPath = request.getContextPath(); %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
<meta charset="UTF-8">
<title>WEworks</title>
<style>
body {
	background-image: url('<%=contextPath%>/resources/login.jpg');
	/* background-repeat:no-repeat; */
	background-position: center;
	/* background-size:50% 50%; */
	/* background-size:cover; */
	/* background-size:contain;  */
	/* background-size:1920px 1080px;  */
}
.main {
	background-color: rgba(255, 255, 255, 0.8);
	opacity: 1;
	border: 1px solid balck;
	width: 400px;
	height:400px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -80%);
	text-align: left;
}
.main th {
	text-align: center;
}
.main table {
position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}
.main button{
	width:250px;
	height:50px;
	align: right;
}
.main small{
font-size:10px;
}
</style>
</head>
<body>

	<div class="main">
		<form id="form1">
		<table>
			<tr>
				<th colspan="2"><img src="<%=contextPath%>/resources/logo2.png" alt="no"></th>
			</tr>
			<tr>
				<td colspan="2">
					<br>
					<div class="form-group">
						<label for="id">ID</label> 
						<input type="text" class="form-control" id="id" onkeyup="test1();" placeholder="�����ȣ"> 
						<small id="idLost" class="form-text text-muted">
						���̵� �нǽ� �ʴ� ��û��. �����ȣ�ε�.
						</small>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					  <div class="form-group">
					    <label for="pwd">PW</label>
					    <input type="password" class="form-control" id="pwd" placeholder="Password">
					  </div>
				</td>
			</tr>
			<tr>
				<td><input type="checkbox" id="remember" name="rememberMe" value="true"/>���̵����� </td>
				<td align="right"><a style="color:blue;" onclick="alert('�����ϼ���');">�����?�ǿ�?</a></td>
			</tr>
			<tr>
				<td colspan="2">
				<button type="button" class="btn btn-dark" onclick="login();">
				�α���
				</button>
				</td>
			</tr>
		</table>
		</form>
	</div>
<script>
//���̵�����. �׽�Ʈ �غ�.
	$(function(){
// 		$.cookie('key',$('#id').val(),{expires:7});
// 		$.removeCookie('key');
		var key =$.cookie("key");
// 		key = 'test';
		if(key==null){
			console.log('�ΰ�!');			
		}else{
			$('#id').val(key);
			$('#remember').attr("checked",true);
		};
	});
	function login(){
		if($('#remember').prop("checked")){
			$.cookie('key',$('#id').val(),{expires:7});
		}else{
			$.removeCookie("key");
		}
		
		$('#form1').attr('method','post');
		$('#form1').attr('action','<%=contextPath%>/login.me');
		$('#form1').submit();
	}
</script>
</body>
</html>