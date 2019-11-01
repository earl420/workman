<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.Date, java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<script src="https://kit.fontawesome.com/ee2dc8e60a.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--&nbsp;Custom Stylesheet -->
<link href="resources/css/style.css" rel="stylesheet">
<style>
#bye {
	font-family: "NanumSquare-EB", "나눔고딕", "Dotum", "돋움", "Helvetica",
		"Arial", "AppleSDGothicNeo", sans-serif;
	color: white;
	width: 100px;
}

#hi {
	font-family: "NanumSquare-EB", "나눔고딕", "Dotum", "돋움", "Helvetica",
		"Arial", "AppleSDGothicNeo", sans-serif;
	color: white;
	width: 100px;
}

#header-right {
	display: inline;
}

#hi3 {
	float: left;
	padding-top: 20px;
}
</style>
</head>

<body>

	<c:set var="contextPath"></c:set>


	<!--**********************************
            Nav header start
        ***********************************-->
	<div class="nav-header" style="background: white;">
		<div class="brand-logo">
			<a href="home.wo"> <b class="logo-abbr"><img
					src="resources/icons/logo1.png" alt=""> </b> <span
				class="logo-compact"><img src="resources/icons/logo1.png"
					alt=""></span> <span class="brand-title"> <img
					src="resources/icons/logo2.png" alt="">
			</span>
			</a>
		</div>
	</div>
	<!--**********************************
            Nav header end
        ***********************************-->

	<!--**********************************
            Header start
        ***********************************-->
	<div class="header">

		<div class="header-content clearfix"
			style="border-bottom: 1px solid gray;">


			<div class="nav-control">
				<div class="hamburger">
					<span class="toggle-icon"><i class="icon-menu"></i></span>
				</div>
			</div>


			<div class="header-left">

				<%
					Date today = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
					String strToday = sdf.format(today);
					/* 오늘날짜 value값으로 박으려고 */

					Date time = new Date();
					SimpleDateFormat sdf2 = new SimpleDateFormat("hh:mm:ss");
					String strTime = sdf2.format(time);
					/* 현재시간 value값으로 박으려고 */
				%>

				<div class="hi3">


					<form action="attend.wo" method="post" id="form1">
						<input type="hidden" name="empNum" value="${ loginMan.num }">
						<input type="hidden" name="att_date" value="<%=strToday%>">
						<input type="hidden" name="time_on" value="<%=strTime%>">
						<input type="hidden" name="time_off" value="<%=strTime%>">
						<input type="hidden" name="flag" value="${flag }" id="flag">
						<c:if test="${flag eq '출'}">
							<button class="btn mb-1 btn-rounded btn-success" type="submit"
								id="hi">출근</button>
						</c:if>

						<c:if test="${flag eq '퇴'}">
							<button class="btn mb-1 btn-rounded btn-warning" type="submit"
								id="bye">퇴근</button>
						</c:if>
					</form>
				</div>

				<script>
					/* 출퇴근 버튼 스크립트 */
					$(function() {
						$("#bye").hide(); /* 출근버튼 누르기 전에는 퇴근버튼 안보임 */
					});

					// 출근 버튼 누르면 알림창 뜨기
					$("#hi").on("click", function() {
						var d = new Date();
						var time = d.getHours() + '시' + d.getMinutes() + '분';
						alert(time + ' 출근.');
						$("#bye").show(); /* 출근버튼 눌러야 퇴근버튼 보이게 */
						$("#hi").hide(); /* 출근버튼은 안보이게 */

						$("#flag").val("출");

						return true;
					});

					// 퇴근 버튼 누르면 알림창 뜨기
					$("#bye").on("click", function() {
						var d = new Date();
						var time = d.getHours() + '시' + d.getMinutes() + '분';
						alert(time + ' 퇴근.');
						$("#bye").hide(); /* 퇴근버튼은 안보이게 */

						$("#flag").val("퇴");

						return true;
					});
				</script>
			</div>

			<div class="header-right">

				<ul class="clearfix">

					<li class="icons dropdown"><c:out value="${ loginMan.name }" />
						<c:out value="${ loginMan.gradeName }" /></li>
					<li class="icons dropdown"><c:out
							value="${ loginMan.deptName }" /></li>


					<li class="icons dropdown"><a href="javascript:void(0)"
						data-toggle="dropdown"> <i class="mdi mdi-email-outline"></i>
							<span class="badge gradient-1 badge-pill badge-primary">3</span>
					</a>
						<div class="drop-down animated fadeIn dropdown-menu">
							<div
								class="dropdown-content-heading d-flex justify-content-between">
								<span class="">3 New Messages</span>

							</div>
							<div class="dropdown-content-body">
								<ul>
									<li class="notification-unread"><a
										href="javascript:void()"> <img
											class="float-left mr-3 avatar-img"
											src="resources/images/avatar/1.jpg" alt="">
											<div class="notification-content">
												<div class="notification-heading">Saiful Islam</div>
												<div class="notification-timestamp">08 Hours ago</div>
												<div class="notification-text">Hi Teddy, Just wanted
													to let you ...</div>
											</div>
									</a></li>
									<li class="notification-unread"><a
										href="javascript:void()"> <img
											class="float-left mr-3 avatar-img"
											src="resources/images/avatar/2.jpg" alt="">
											<div class="notification-content">
												<div class="notification-heading">Adam Smith</div>
												<div class="notification-timestamp">08 Hours ago</div>
												<div class="notification-text">Can you do me a favour?</div>
											</div>
									</a></li>
									<li><a href="javascript:void()"> <img
											class="float-left mr-3 avatar-img"
											src="resources/images/avatar/3.jpg" alt="">
											<div class="notification-content">
												<div class="notification-heading">Barak Obama</div>
												<div class="notification-timestamp">08 Hours ago</div>
												<div class="notification-text">Hi Teddy, Just wanted
													to let you ...</div>
											</div>
									</a></li>
									<li><a href="javascript:void()"> <img
											class="float-left mr-3 avatar-img"
											src="resources/images/avatar/4.jpg" alt="">
											<div class="notification-content">
												<div class="notification-heading">Hilari Clinton</div>
												<div class="notification-timestamp">08 Hours ago</div>
												<div class="notification-text">Hello</div>
											</div>
									</a></li>
								</ul>

							</div>
						</div></li>
					<li class="icons dropdown"><a href="javascript:void(0)"
						data-toggle="dropdown"> <i class="mdi mdi-bell-outline"></i> <span
							class="badge badge-pill gradient-2 badge-primary">3</span>
					</a>
						<div
							class="drop-down animated fadeIn dropdown-menu dropdown-notfication">
							<div
								class="dropdown-content-heading d-flex justify-content-between">
								<span class="">2 New Notifications</span>

							</div>
							<div class="dropdown-content-body">
								<ul>
									<li><a href="javascript:void()"> <span
											class="mr-3 avatar-icon bg-success-lighten-2"><i
												class="icon-present"></i></span>
											<div class="notification-content">
												<h6 class="notification-heading">Events near you</h6>
												<span class="notification-text">Within next 5 days</span>
											</div>
									</a></li>
									<li><a href="javascript:void()"> <span
											class="mr-3 avatar-icon bg-danger-lighten-2"><i
												class="icon-present"></i></span>
											<div class="notification-content">
												<h6 class="notification-heading">Event Started</h6>
												<span class="notification-text">One hour ago</span>
											</div>
									</a></li>
									<li><a href="javascript:void()"> <span
											class="mr-3 avatar-icon bg-success-lighten-2"><i
												class="icon-present"></i></span>
											<div class="notification-content">
												<h6 class="notification-heading">Event Ended
													Successfully</h6>
												<span class="notification-text">One hour ago</span>
											</div>
									</a></li>
									<li><a href="javascript:void()"> <span
											class="mr-3 avatar-icon bg-danger-lighten-2"><i
												class="icon-present"></i></span>
											<div class="notification-content">
												<h6 class="notification-heading">Events to Join</h6>
												<span class="notification-text">After two days</span>
											</div>
									</a></li>
								</ul>

							</div>

						</div></li>
					<li class="icons dropdown d-none d-md-flex"><a
						href="javascript:void(0)" class="log-user" data-toggle="dropdown">
							<i class="fa fa-angle-down f-s-14" aria-hidden="true"></i>
					</a>
						<div
							class="drop-down dropdown-language animated fadeIn  dropdown-menu">
							<div class="dropdown-content-body">
								<ul>
									<li><a href="logout.wo">로그아웃</a></li>
								</ul>
							</div>
						</div></li>
					<li class="icons dropdown">
						<div class="user-img c-pointer position-relative"
							data-toggle="dropdown">
							<span class="activity active"></span>
							<!--  <img src="views/common/images/user/1.png" height="40" width="40" alt=""> -->
						</div>
						<div class="drop-down dropdown-profile   dropdown-menu">
							<div class="dropdown-content-body">
								<ul>
									<li><a href="empInfo.wo"><i class="icon-user"></i> <span>Profile</span></a>
									</li>
									<li><a href="email-inbox.html"><i
											class="icon-envelope-open"></i> <span>Inbox</span>
											<div class="badge gradient-3 badge-pill badge-primary">3</div></a>
									</li>

									<hr class="my-2">
									<li><a href="page-lock.html"><i class="icon-lock"></i>
											<span>Lock Screen</span></a></li>
									<li><a href="logout.wo"><i class="icon-key"></i> <span>Logout</span></a></li>
								</ul>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

	<!--**********************************
            Sidebar start
        ***********************************-->
	<div class="nk-sidebar" style="padding-top: 10px;">
		<div class="nk-nav-scroll">
			<ul class="metismenu" id="menu">
				<li><a href="notice.wo" aria-expanded="false"> <i
						class="far fa-check-square"></i><span class="nav-text">공지사항</span>
				</a></li>
				<li><a class="has-arrow" href="javascript:void()"
					aria-expanded="false"> <i class="fas fa-file-signature"></i><span
						class="nav-text">전자결재</span>
				</a>
					<ul aria-expanded="false">
						<li><a class="has-arrow" href="javascript:void()"
							aria-expanded="false"> <i class=""></i><span class="">문서목록</span>
						</a>
							<ul>
								<li><a href="allList.wo">-&nbsp;전체</a></li>
								<li><a href="waitingList.wo">-&nbsp;대기</a></li>
								<li><a href="proceedingList.wo">-&nbsp;진행</a></li>
								<li><a href="approvalList.wo">-&nbsp;승인</a></li>
								<li><a href="completeList.wo">-&nbsp;완료</a></li>
							</ul></li>
						<li><a class="has-arrow" href="javascript:void()"
							aria-expanded="false"> <i class=""></i><span class="">결제요청문서</span>
						</a>
							<ul>
								<li><a href="allRequestList.wo">-&nbsp;전체</a></li>
								<li><a href="draftRequestList.wo">-&nbsp;기안서</a></li>
								<li><a href="requestRequestList.wo">-&nbsp;품의서</a></li>
								<li><a href="expenseRequestList.wo">-&nbsp;지출결의서</a></li>
								<li><a href="holiDayRequestList.wo">-&nbsp;휴가</a></li>
							</ul></li>
						<li><a class="has-arrow" href="javascript:void()"
							aria-expanded="false"> <i class=""></i><span class="">결제문서등록</span>
						</a>
							<ul>
								<li><a href="draftWrite.wo">-&nbsp;기안서작성</a></li>
								<li><a href="draftDetail.wo">-&nbsp;기안서상세</a></li>
								<li><a href="requestWrite.wo">-&nbsp;품의서작성</a></li>
								<li><a href="requestDetail.wo">-&nbsp;품의서상세</a></li>
								<li><a href="expenseWrite.wo">-&nbsp;지출결의서작성</a></li>
								<li><a href="expenseDetail.wo">-&nbsp;지출결의서상세</a></li>
								<li><a href="holiDayWrite.wo">-&nbsp;휴가작성</a></li>
								<li><a href="holiDayDetail.wo">-&nbsp;휴가상세</a></li>
							</ul></li>
						<li><a class="has-arrow" href="javascript:void()"
							aria-expanded="false"> <i class=""></i><span class="">문서보관</span>
						</a>
							<ul>
								<li><a href="companionList.wo">-&nbsp;반려</a></li>
								<li><a href="temporaryList.wo">-&nbsp;임시저장</a></li>
							</ul></li>
						<li><a class="has-arrow" href="javascript:void()"
							aria-expanded="false"> <i class=""></i><span class="">문서보관</span>
						</a>
							<ul>
								<li><a href="test.wo">-&nbsp;테스트</a></li>
							</ul></li>
					</ul></li>
				<li><a class="has-arrow" href="javascript:void()"
					aria-expanded="false"> <i class="fas fa-calculator"></i><span
						class="nav-text">총무/회계</span>
				</a>
					<ul aria-expanded="false">
						<li><a href="acnoticeList.wo">-&nbsp;공지사항</a></li>
						<li><a href="salelist.wo">-&nbsp;매출관리</a></li>
						<li><a href="oslist.wo">-&nbsp;O/S관리</a></li>
						<li><a href="fixturelist.wo">-&nbsp;사내물품 관리</a></li>
						<li><a href="salarylist.wo">-&nbsp;월급 관리</a></li>
					</ul></li>
				<li><a class="has-arrow" href="javascript:void()"
					aria-expanded="false"> <i class="fas fa-users"></i><span
						class="nav-text">인사</span>
				</a>

					<ul aria-expanded="false">
						<li><a class="" href="hrNotice.wo" aria-expanded="false">
								<i class=""></i><span class="">공지사항</span>
						</a></li>
						<li><a class="has-arrow" href="javascript:void()"
							aria-expanded="false"> <i class=""></i><span class="">인사
									정보</span>
						</a>

							<ul>
								<li><a href="empChart.wo">-&nbsp;조직도</a>
								<li><a href="empList.wo">-&nbsp;직원목록</a>
							</ul></li>
						<li><a class="has-arrow" href="javascript:void()"
							aria-expanded="false"> <i class=""></i><span class="">휴가/근태</span>
						</a>

							<ul>
								<!-- 			<li><a href="addHoliday.wo">-&nbsp;휴가신청</a> -->
								<li><a href="showHoliday.wo">-&nbsp;휴가현황</a>
								<li><a href="showAtt.wo">-&nbsp;근태현황</a>
							</ul></li>
						<li><a class="has-arrow" href="javascript:void()"
							aria-expanded="false"> <i class=""></i><span class="">인사
									관리</span>
						</a>

							<ul>
								<li><a href="mngEmpChart.wo">-&nbsp;조직관리</a>
								<li><a href="mngUser.wo">-&nbsp;사용자관리</a>
							</ul></li>
						<li><a class="has-arrow" href="javascript:void()"
							aria-expanded="false"> <i class=""></i><span class="">휴가/근태
									관리</span>
						</a>

							<ul>
								<li><a href="mngHoliday.wo">-&nbsp;직원 휴가 조회</a>
								<li><a href="mngAtt.wo">-&nbsp;직원 근태 조회</a>
							</ul></li>
					</ul></li>
				<li><a class="has-arrow" href="javascript:void()"
					aria-expanded="false"> <i class="fas fa-calendar-alt"></i><span
						class="nav-text">일정</span>
				</a>
					<ul aria-expanded="false">
						<li><a href="calDetailView.wo">-&nbsp;일정상세보기</a></li>
						<li><a href="calInsertView.wo">-&nbsp;일정 등록</a></li>

					</ul></li>
				<li><a class="has-arrow" href="javascript:void()"
					aria-expanded="false"> <i class="fas fa-user"></i> <span
						class="nav-text">마이 페이지</span>
				</a>
					<ul aria-expanded="false">
						<li><a href="mypageView.wo">-&nbsp;마이 페이지</a></li>
						<li><a href="empInfo.wo">-&nbsp;개인정보 설정</a></li>
						<li><a href="confirmPwdPage.wo">-&nbsp;비밀번호 변경</a></li>
					</ul></li>

				<li><a href="chatting.wo" aria-expanded="false"> <i
						class="far fa-comments"></i><span class="nav-text">사내메신저</span>
				</a></li>

			</ul>
		</div>
	</div>
	<!--**********************************
            Sidebar end
        ***********************************-->





	<!--**********************************
        Scripts
    ***********************************-->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="resources/plugins/common/common.min.js"></script>
	<script src="resources/js/custom.min.js"></script>
	<script src="resources/js/settings.js"></script>
	<script src="resources/js/gleek.js"></script>
	<script src="resources/js/styleSwitcher.js"></script>




</body>

</html>