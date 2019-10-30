<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Date, java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="ko">
<head>
<title>workman</title>

<link rel="icon" type="image/png" sizes="16x16"
	href="resources/icons/logo1.png">
	
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' type='text/css' media='screen' href='main.css'>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<script src='main.js'></script>


<style>
    .outdiv{
    	margin-left:130px;
        margin-top: 40px;
        height: 600px;
        width: 80%;
    }
    .topdiv{
        height:200px;
    }
    .middiv{
        height:200px;
    }
    .botdiv{
        height:200px;
    }
    .indiv{
        display: inline-block;
    }
    .paddiv:hover{
        cursor: pointer;
        opacity: 0.5;
    }
    #div1{
        width:65.6%;
        height:98%;
    }
    #div2{
        width:32.62%;
        height:98%;
    }
   .paddiv{
   		height:100%;
   		padding-left:40px;
        padding-top: 90px;
    }
    #hibtn{
        font-family: "NanumSquare-EB", "나눔고딕", "Dotum", "돋움", "Helvetica", "Arial", "AppleSDGothicNeo", sans-serif;
        color: white;
        width:50%;
    }
    
    #byebtn{
        font-family: "NanumSquare-EB", "나눔고딕", "Dotum", "돋움", "Helvetica", "Arial", "AppleSDGothicNeo", sans-serif;
        color: white;
        width:50%;
    }
    
     #h2{
        font-family: "NanumSquare-EB", "나눔고딕", "Dotum", "돋움", "Helvetica", "Arial", "AppleSDGothicNeo", sans-serif;
        color: white;
    }

    p{
        font-family: "NanumSquare-EB", "나눔고딕", "Dotum", "돋움", "Helvetica", "Arial", "AppleSDGothicNeo", sans-serif;
        font-weight: bold;
        color: white;
    }
    .hidiv{
        font-family: "NanumSquare-EB", "나눔고딕", "Dotum", "돋움", "Helvetica", "Arial", "AppleSDGothicNeo", sans-serif;
        width: 25%;
        text-align: center;
        position: relative;
        left:70% ;
        bottom: 3.5%;
        background:rgb(224, 224, 235);
        border-radius: 10px;
        padding-bottom:1%;
    }
</style>
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
	<div id="main-wrapper" style="background: white;">
		<c:import url="common/header.jsp"></c:import>
		<!-- content-body -->
		<div class="content-body">
			<div class="content-fluid" style="height: 100px">

 <div class="outdiv">
 <%
  	Date today = new Date();
  	SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
  	String strToday = sdf.format(today);
  	/* 오늘날짜 value값으로 박으려고 */
  	
  	Date time = new Date();
  	SimpleDateFormat sdf2 = new SimpleDateFormat("hh:mm");
  	String strTime = sdf2.format(time);
  	/* 현재시간 value값으로 박으려고 */
 %>
	 <div class="hidiv" id="hi2">
	 	<br>
	    <h3 id="hih2">출/퇴근</h3>
	    <button class="btn mb-1 btn-rounded btn-success" type="button" id="hibtn" >출근</button>
	    <form action="attend.wo" method="post" id="form1">	    
		    <input type="hidden" name="empNum" value="${ loginMan.num }">
	        <input type="hidden" name="att_date" value="<%= strToday %>">
	        <input type="hidden" name="time_on" value="<%= strTime %>">
	        <input type="hidden" name="time_off" value="null">
	      </form>
	</div>

 	<div class="hidiv" id="bye2">
	 	<br>
	    <h3 id="hih2">출/퇴근</h3>
	    <button class="btn mb-1 btn-rounded btn-warning" type="button" id="byebtn">퇴근</button>
		<input type="hidden" name="empNum" value="${ loginMan.num }">
        <input type="hidden" name="att_date" value="<%= strToday %>">
        <input type="hidden" name="time_on" value="null">
        <input type="hidden" name="time_off" value="<%= strTime %>">
	</div>

 <script>
 	/* 출퇴근 버튼 스크립트 */
 		$(function(){
 			$("#bye2").hide(); /* 출근버튼 누르기 전에는 퇴근버튼 안보임 */
 		});
 	
 		// 출근 버튼 누르면 알림창 뜨기
 		 $("#hibtn").on("click", function(){
 			 var d = new Date();
 			 var time = d.getHours() + '시' + d.getMinutes() + '분';
 			alert(time + ' 출근.');
 			$("#bye2").show(); /* 출근버튼 눌러야 퇴근버튼 보이게 */
 			$("#hi2").hide(); /* 출근버튼은 안보이게 */
 			
 			$("#form1").submit();
 			//location.href='attend.wo';
 		});
 	
 		// 퇴근 버튼 누르면 알림창 뜨기
 		$("#byebtn").on("click", function(){
 			var d = new Date();
			var time = d.getHours() + '시' + d.getMinutes() + '분';
 			alert(time + ' 퇴근.');
 			$("#bye2").hide(); /* 퇴근버튼은 안보이게 */
 			
 			location.href='attend.wo';
 		});
 </script>
 
		<div class="topdiv">
            <div class="indiv" id="div1" style="background: rgb(133, 133, 173)">
                <div class="paddiv">
                <a href="notice.wo">
                    <h2 id="h2">공지사항</h2>
                    <p>새로운 공지사항을 확인하세요.</p>
                </a>
                </div>
            </div>
            <div class="indiv" id="div2" style="background: rgb(153, 0, 204)">
                <div class="paddiv">
                <a href="allList.wo">
                    <h2 id="h2">전자결재</h2>
                    <p>전자결재 바로가기</p>
                </a>
                </div>
            </div>
        </div>
        
        <div class="middiv">
            <div class="indiv" id="div2" style="background: rgb(204, 0, 0)">
                <div class="paddiv">
                <a href="acnoticeList.wo">
                    <h2 id="h2">총무/회계</h2>
                    <p>총부/회계부 바로가기</p>
                </a>
                </div>
            </div>
            
            <div class="indiv" id="div2" style="background: rgb(255, 153, 0)">
                <div class="paddiv">
                <a href="hrNotice.wo">
                    <h2 id="h2">인사</h2>
                    <p>인사부 바로가기</p>
                </a>
                </div>
            </div>
            
            <div class="indiv" id="div2" style="background: rgb(255, 214, 51)">
                <div class="paddiv">
                <a href="mypageView.wo">
                    <h2 id="h2">마이페이지</h2>
                    <p>마이페이지 바로가기</p>
                </a>
                </div>
            </div>
        </div>

        <div class="botdiv">
            <div class="indiv" id="div2" style="background: rgb(0, 179, 0)">
                <div class="paddiv">
                <a href="chatting.wo">
                    <h2 id="h2">사내메신저</h2>
                    <p>메신저 바로가기</p>
                </a>
                </div>
        </div>
            
            <div class="indiv" id="div1" style="background: rgb(51, 153, 255)">
                <div class="paddiv">
                <a href="calDetailView.wo">
                    <h2 id="h2">일정</h2>
                    <p>새로운 일정을 확인하세요.</p>
                </a>
                </div>
            </div>
        </div>
	</div>

			</div>
			<!-- row -->
			<div class="content-fluid"></div>
			<!-- /.container -->

			<!-- #/ container -->
		</div>
		<!--**********************************
            Content body end
        ***********************************-->
		<c:import url="common/footer.jsp"></c:import>
	</div>
	<!-- /main-wrapper -->
	<script>
	   $(function(){
		   if(${!empty success}){
			   swal.fire({
				type: 'success',
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
	   
	   
	   
	   $(function(){
		   if(${!empty login}){
			  /*  Swal.fire({
				   type: 'success',
				   title: '${login}',
				   text: '반갑습니다.',
				   padding: '3em',
				   background: 'white',
				   backdrop: `
				     rgba(0,0,123,0.4)
				     url("resources/icons/login.gif")
				     center 
				     no-repeat'
				   confirmButtonText: '확인',
				   animation: false,
				   customClass: {
				     popup: 'animated heartBeat'
				   }
				 }); */
				 Swal.fire({
				 position: 'bottom',
				 type: 'success',
				 title: '${login}',
				 /* text: '반갑습니다.', */
				  width: 600,
				  height: 100,
				  padding: '3em',
				  /* background: '#fff url(/images/trees.png)', */
				  backdrop: `
				    /* rgba(0,0,123,0.4) */
				    rgba(247,107,20,0.4)
				    /* url("resources/icons/login.gif") */
				    url("resources/icons/logo1.png")
				    center top
				    no-repeat
				  `
				});
		   }
	   })
	   
	</script>


</body>
</html>
