<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<style type="text/css">
	table tr{
		height: 50px;
		color: black;
		font-size: 20px;
	}
	
	b{
		font-size:20px;
		color: black;
	}
	
	
</style>
<title>비밀번호 변경</title>
</head>
<body>
	
	
	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50"> <circle
					class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3"
					stroke-miterlimit="10" /> </svg>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->


	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper" style="background: white;">
		<c:import url="../common/header.jsp"></c:import>
		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
			<div class="content-fluid" style="height: 100px;" align="center">
				<h1>비밀번호 변경</h1>
				<br><br>
				<b>비밀번호 변경 시 계정보안을 위해 로그아웃 됩니다.</b>
				<br><br><br>
				<form action="changePwd.wo">
					<table width="700" celspacing="5">
						<tr>
							<th>새로운 비밀번호</th>
							<td><input type="password" name="pwd" id="pwd" size="30"  placeholder="8~16자 영문, 숫자, 특수문자 입력" required></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td><input type="password" id="pwd2" size="30" placeholder="비밀번호 확인" required></td>
						</tr>
					</table>
					<br><br>
					<button type="submit" class="btn btn-secondary btn-lg">변경하기</button>
				</form>


			</div>
			<!-- row -->

			<!-- #/ container -->
		</div>
		<!--**********************************
            Content body end
        ***********************************-->
		<c:import url="../common/footer.jsp"></c:import>	
	</div>
	<!--**********************************
        Main wrapper end
    ***********************************-->
	
	<script type="text/javascript">
		
		var pwd = document.getElementById("pwd");
		var pwd2 = document.getElementById("pwd2");
	
		$(function(){
			$(pwd).on('blur', function(){
				
				if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,}$/.test(pwd.value)){            
			        alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
			        pwd.value="";
			    }
				
			});
			
			$(pwd2).on('blur', function(){
				
				if(pwd.value != pwd2.value){
					alert("비밀번호가 일치하지 않습니다.");
					pwd.value="";
					pwd2.value="";
				}
				
			});
			
			
			
		});
	
	
	</script>


</body>
</html>