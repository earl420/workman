<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>비밀번호 변경</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="resources/icons/logo1.png">
<!-- Custom Stylesheet -->
<!-- Custom Stylesheet -->
<link
	href="resources/plugins/tables/css/datatable/dataTables.bootstrap4.min.css"
	rel="stylesheet">

</head>

<body>
	<!-- preloader -->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50"> <circle
					class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3"
					stroke-miterlimit="10" /> </svg>
		</div>
	</div>
	<!-- /preloader -->


	<!-- main wrapper -->
	<div id="main-wrapper" style="">
		<c:import url="../common/header.jsp"></c:import>
		<!-- content-body -->
		<div class="content-body" style="min-height: 889px;">

			<div class="row page-titles mx-0">
				<div class="col p-md-0"></div>
			</div>
			<!-- row -->

			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<h5>비밀번호 변경</h5>
								<h5 align="center">비밀번호 변경 시 계정보안을 위해 로그아웃 됩니다.</h5>
								<br>
								<div class="form-validation">
									<form class="form-valide" action="changePwd.wo" method="post">
										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="pwd">새로운 비밀번호
												<span class="text-danger"></span>
											</label>
											<div class="col-lg-6">
												<input type="password" class="form-control" id="pwd" name="pwd" placeholder="숫자+영문자+특수문자 조합으로 8자리 이상 " required>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="pwd2">비밀번호 확인
												<span class="text-danger"></span>
											</label>
											<div class="col-lg-6">
												<input type="password" class="form-control" id="pwd2" placeholder="한번 더 입력 해주세요" required>
											</div>
										</div>
										<div class="form-group row">
											<div class="col-lg-8 ml-auto">
												<button type="submit" id="btn" class="btn btn-primary">비밀번호 변경</button>
											</div>
										</div>
										
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- #/ container -->
		</div>
		<!-- /content-body -->
		<c:import url="../common/footer.jsp"	></c:import>
	</div>
	<!-- /main-wrapper -->
	
	
	<script type="text/javascript">
		
		var pwd = document.getElementById("pwd");
		var pwd2 = document.getElementById("pwd2");
	
		$(function(){
			$(pwd).on('blur', function(){
				
				if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,}$/.test(pwd.value)){            
				    swal.fire({
				    	type: 'error',
						title : '숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.',
						confirmButtonText: '확인'
				    });
			        pwd.value="";
			    }
			});
			
			$(pwd2).on('blur', function(){
				
				if(pwd.value != pwd2.value){
				    swal.fire({
				    	type: 'error',
						title : '비밀번호가 일치하지 않습니다.',
						confirmButtonText: '확인'
				    });
					pwd.value="";
					pwd2.value="";
				}
			});
		});
		
		$(function(){
			   if(${!empty success}){
				   swal.fire({
					type: 'warning',
					title : '${success}',
					confirmButtonText: '확인'
				   });
			   }
		   });
		   $(function(){
			   if(${!empty error}){
				   swal.fire({
					type: 'error',
					title : '${error}',
					confirmButtonText: '확인'
				   });
			   }
		   });
		
		
	</script>

</body>
<iframe id="google_esf" name="google_esf"
	src="https://googleads.g.doubleclick.net/pagead/html/r20191003/r20190131/zrt_lookup.html#"
	data-ad-client="ca-pub-2783044520727903" style="display: none;"></iframe>
</html>