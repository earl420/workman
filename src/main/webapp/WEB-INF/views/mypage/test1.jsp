<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	#left{
		width: 500px;
		height: 800px;
		float: left;
		margin-bottom: 20px;
	}
	
	#right{
		width: 750px;
		height: 800px;
		float: left;
		margin-bottom: 20px;
	}
	
	div{
		border: 1px solid black;
	
	}

</style>


<title>마이 페이지</title>
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
			<div class="content-fluid" style="height: 100px;" align="center" border="1">
				
				<div id="left">
					<img alt="" src="">
					<br><br>
					<label>ㅇㄴㅇㅁㄹ</label>
					
					
				</div>
				
				<div id="right">
					<br><br>
					
					<div>
						결제처리
						<br><br>
					</div>
					<br><br>
					
					<div>
						내 프로젝트
						<br><br>
						<table align="center" border="1" cellspacing="0" width="700">
							<tr>
								<th>프로젝트명</th>
								<th>상태</th>
								<th>총 점수</th>
							</tr>
						
						</table>
						
					</div>
				</div>
			
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
</body>
</html>