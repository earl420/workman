<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/account/css/insertNotice.css" rel="stylesheet">
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
				<div class="insertouter">
					<div class="table-responsive" style="text-align: center;">
					<h3 style="padding-top: 40px; padding-bottom: 10px;">회계 공지사항</h3>
					<table class="table table-bordered verticle-middle" id="acList" style="border: 1px solid black;">
						<thead>
							<tr>
								<th width="10%">공지 번호</th>
								<th width="50%">제목</th>
								<th width="25%">게시자</th>
								<th width="25%">등록일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>11</td>
								<td>11</td>
								<td>11</td>
								<td>11</td>
							</tr>
							<tr>
								<td>11</td>
								<td>11</td>
								<td>11</td>
								<td>11</td>
							</tr>
							<tr>
								<td>11</td>
								<td>11</td>
								<td>11</td>
								<td>11</td>
							</tr>
							<tr>
								<td>11</td>
								<td>11</td>
								<td>11</td>
								<td>11</td>
							</tr>
							<tr>
								<td>22</td>
								<td>22</td>
								<td>22</td>
								<td>22</td>
							</tr>
							<tr>
								<td>22</td>
								<td>22</td>
								<td>22</td>
								<td>22</td>
							</tr>
							<tr>
								<td>22</td>
								<td>22</td>
								<td>22</td>
								<td>22</td>
							</tr>
							<tr>
								<td>22</td>
								<td>22</td>
								<td>22</td>
								<td>22</td>
							</tr>
							<tr>
								<td>33</td>
								<td>33</td>
								<td>33</td>
								<td>33</td>
							</tr>
							<tr>
								<td>44</td>
								<td>55</td>
								<td>66</td>
								<td>77</td>
							</tr>
						</tbody>
					</table>
				</div>				
				</div>
			</div>
			<!-- row -->
			
		</div>
		<!--**********************************
            Content body end
        ***********************************-->
		<c:import url="../common/footer.jsp"></c:import>	
	</div>
	<!--**********************************
        Main wrapper end
    ***********************************-->
    <script src="resources/account/js/insertNotice.js"></script>
</body>
</html>