<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%String contextPath = request.getContextPath(); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="resources/icons/logo1.png">

<meta charset="UTF-8">
<title>WEworks</title>
<style>
	html {
	  background-color: #56baed;
	}
	
	body {
	  font-family: "Poppins", sans-serif;
	  height: 100vh;
	  overflow: hidden;
	}
	
	a {
	  color: #92badd;
	  display:inline-block;
	  text-decoration: none;
	  font-weight: 400;
	}
	
	h2 {
	  text-align: center;
	  font-size: 16px;
	  font-weight: 600;
	  text-transform: uppercase;
	  display:inline-block;
	  margin: 40px 8px 10px 8px; 
	  color: #cccccc;
	}
	
	
	
	/* STRUCTURE */
	
	.wrapper {
	  display: flex;
	  align-items: center;
	  flex-direction: column; 
	  justify-content: center;
	  width: 100%;
	  min-height: 100%;
	  padding: 20px;
	}
	
	#formContent {
	  -webkit-border-radius: 10px 10px 10px 10px;
	  border-radius: 10px 10px 10px 10px;
	  background: #fff;
	  padding: 30px;
	  width: 90%;
	  max-width: 450px;
	  position: relative;
	  padding: 0px;
	  -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
	  box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
	  text-align: center;
	}
	
	#formFooter {
	  background-color: #f6f6f6;
	  border-top: 1px solid #dce8f1;
	  padding: 25px;
	  text-align: center;
	  -webkit-border-radius: 0 0 10px 10px;
	  border-radius: 0 0 10px 10px;
	}
	
	
	
	/* TABS */
	
	h2.inactive {
	  color: #cccccc;
	}
	
	h2.active {
	  color: #0d0d0d;
	  border-bottom: 2px solid #5fbae9;
	}
	
	
	
	/* FORM TYPOGRAPHY*/
	
	input[type=button], input[type=submit], input[type=reset]  {
	  background-color: #56baed;
	  border: none;
	  color: white;
	  padding: 15px 80px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  text-transform: uppercase;
	  font-size: 13px;
	  -webkit-box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
	  box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
	  -webkit-border-radius: 5px 5px 5px 5px;
	  border-radius: 5px 5px 5px 5px;
	  margin: 5px 20px 40px 20px;
	  -webkit-transition: all 0.3s ease-in-out;
	  -moz-transition: all 0.3s ease-in-out;
	  -ms-transition: all 0.3s ease-in-out;
	  -o-transition: all 0.3s ease-in-out;
	  transition: all 0.3s ease-in-out;
	}
	
	input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover  {
	  background-color: #39ace7;
	}
	
	input[type=button]:active, input[type=submit]:active, input[type=reset]:active  {
	  -moz-transform: scale(0.95);
	  -webkit-transform: scale(0.95);
	  -o-transform: scale(0.95);
	  -ms-transform: scale(0.95);
	  transform: scale(0.95);
	}
	
	input[type=number] {
	  background-color: #f6f6f6;
	  border: none;
	  color: #0d0d0d;
	  padding: 15px 32px;
	  text-align: left;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 16px;
	  margin: 5px;
	  width: 85%;
	  border: 2px solid #f6f6f6;
	  -webkit-transition: all 0.5s ease-in-out;
	  -moz-transition: all 0.5s ease-in-out;
	  -ms-transition: all 0.5s ease-in-out;
	  -o-transition: all 0.5s ease-in-out;
	  transition: all 0.5s ease-in-out;
	  -webkit-border-radius: 5px 5px 5px 5px;
	  border-radius: 5px 5px 5px 5px;
	}
	
	input[type=number]:focus {
	  background-color: #fff;
	  border-bottom: 2px solid #5fbae9;
	}
	
	input[type=number]:placeholder {
	  color: #cccccc;
	}
	
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
	    -webkit-appearance: none;
	    margin: 0;
	}


	
	input[type=password] {
	  background-color: #f6f6f6;
	  border: none;
	  color: #0d0d0d;
	  padding: 15px 32px;
	  text-align: left;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 16px;
	  margin: 5px;
	  width: 85%;
	  border: 2px solid #f6f6f6;
	  -webkit-transition: all 0.5s ease-in-out;
	  -moz-transition: all 0.5s ease-in-out;
	  -ms-transition: all 0.5s ease-in-out;
	  -o-transition: all 0.5s ease-in-out;
	  transition: all 0.5s ease-in-out;
	  -webkit-border-radius: 5px 5px 5px 5px;
	  border-radius: 5px 5px 5px 5px;
	}
	
	input[type=password]:focus {
	  background-color: #fff;
	  border-bottom: 2px solid #5fbae9;
	}
	
	input[type=password]:placeholder {
	  color: #cccccc;
	}
	
	
	
	/* ANIMATIONS */
	
	/* Simple CSS3 Fade-in-down Animation */
	.fadeInDown {
	  -webkit-animation-name: fadeInDown;
	  animation-name: fadeInDown;
	  -webkit-animation-duration: 1s;
	  animation-duration: 1s;
	  -webkit-animation-fill-mode: both;
	  animation-fill-mode: both;
	}
	
	@-webkit-keyframes fadeInDown {
	  0% {
	    opacity: 0;
	    -webkit-transform: translate3d(0, -100%, 0);
	    transform: translate3d(0, -100%, 0);
	  }
	  100% {
	    opacity: 1;
	    -webkit-transform: none;
	    transform: none;
	  }
	}
	
	@keyframes fadeInDown {
	  0% {
	    opacity: 0;
	    -webkit-transform: translate3d(0, -100%, 0);
	    transform: translate3d(0, -100%, 0);
	  }
	  100% {
	    opacity: 1;
	    -webkit-transform: none;
	    transform: none;
	  }
	}
	
	/* Simple CSS3 Fade-in Animation */
	@-webkit-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
	@-moz-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
	@keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
	
	.fadeIn {
	  opacity:0;
	  -webkit-animation:fadeIn ease-in 1;
	  -moz-animation:fadeIn ease-in 1;
	  animation:fadeIn ease-in 1;
	
	  -webkit-animation-fill-mode:forwards;
	  -moz-animation-fill-mode:forwards;
	  animation-fill-mode:forwards;
	
	  -webkit-animation-duration:1s;
	  -moz-animation-duration:1s;
	  animation-duration:1s;
	}
	
	.fadeIn.first {
	  -webkit-animation-delay: 0.4s;
	  -moz-animation-delay: 0.4s;
	  animation-delay: 0.4s;
	}
	
	.fadeIn.second {
	  -webkit-animation-delay: 0.6s;
	  -moz-animation-delay: 0.6s;
	  animation-delay: 0.6s;
	}
	
	.fadeIn.third {
	  -webkit-animation-delay: 0.8s;
	  -moz-animation-delay: 0.8s;
	  animation-delay: 0.8s;
	}
	
	.fadeIn.fourth {
	  -webkit-animation-delay: 1s;
	  -moz-animation-delay: 1s;
	  animation-delay: 1s;
	}
	
	.fadeIn.Fiveth {
	  -webkit-animation-delay: 1.2s;
	  -moz-animation-delay: 1.2s;
	  animation-delay: 1.2s;
	}
	
	.fadeIn.sixth {
	  -webkit-animation-delay: 1.4s;
	  -moz-animation-delay: 1.4s;
	  animation-delay: 1.4s;
	}
	
	
	
	/* Simple CSS3 Fade-in Animation */
	.underlineHover:after {
	  display: block;
	  left: 0;
	  bottom: -10px;
	  width: 0;
	  height: 2px;
	  background-color: #56baed;
	  content: "";
	  transition: width 0.2s;
	}
	
	.underlineHover:hover {
	  color: #0d0d0d;
	}
	
	.underlineHover:hover:after{
	  width: 100%;
	}
	
	
	
	/* OTHERS */
	
	*:focus {
	    outline: none;
	} 
	
	#icon {
	  width:60%;
	}

</style>
</head>
<body onload="printClock()">
	

	<div class="wrapper fadeInDown">
		<div id="formContent">
	    	<!-- Tabs Titles -->
	
	    	<!-- Icon -->
	    	<div class="fadeIn first">
	      		<img src="resources/icons/logo1.png" id="icon" alt="User Icon" />
	    	</div>
	
		    <!-- Login Form -->
		    <form  action="returnPwd.wo" method="post">
		    	<input type="hidden" class="fadeIn first" name="num" value="${ returnPwd.num }" readonly>
	        	<input type="password" class="fadeIn second" id="pwd" name="pwd" placeholder="새로운 비밀번호" required>
	        	<input type="password" class="fadeIn third" id="pwd2" placeholder="비밀번호 확인" required><br>
	        	<input type="submit" class="fadeIn forth" value="비밀번호 변경">
		    </form>
		    
		    <div id="formFooter">
			      <a class="underlineHover" style="cursor:pointer" href="loginPage.wo">처음으로</a>
		   	</div>

		</div>
		<div style=" width:600px; height:200px; line-height:100px; color:#666;font-size:80px; text-align:center;" id="clock"></div>
	</div>
	
	<script type="text/javascript">
	
		$(function(){
			
			var pwd = document.getElementById("pwd");
			var pwd2 = document.getElementById("pwd2");
			
			$(pwd).on('blur', function(){
				
				if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,}$/.test(pwd.value)){            
			        swal.fire('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
			        pwd.value="";
			    }
			});
			
			$(pwd2).on('blur', function(){
				
				if(pwd.value != pwd2.value){
					swal.fire("비밀번호가 일치하지 않습니다.");
					pwd.value="";
					pwd2.value="";
				}
			});
		});

		   
		   
		   function printClock() {

			    var clock = document.getElementById("clock");            // 출력할 장소 선택
			    var currentDate = new Date();                                     // 현재시간
			    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
			    var amPm = '오전'; // 초기값 AM
			    var currentHours = addZeros(currentDate.getHours(),2);
			    var currentMinute = addZeros(currentDate.getMinutes() ,2);
			    var currentSeconds =  addZeros(currentDate.getSeconds(),2);

			    if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
			        amPm = '오후';
			        currentHours = addZeros(currentHours - 12,2);
			    }

			    if(currentSeconds >= 50){// 50초 이상일 때 색을 변환해 준다.
			        currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
			    }

			    clock.innerHTML = amPm+"</span>" + currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:50px;'>"; //날짜를 출력해 줌
			    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
			}



			function addZeros(num, digit) { // 자릿수 맞춰주기

			    var zero = '';
			    num = num.toString();
			    if (num.length < digit) {
			        for (i = 0; i < digit - num.length; i++) {
			            zero += '0';
			        }
			    }
			    
			    return zero + num;
			    }
		
	</script>
	
</body>
</html>