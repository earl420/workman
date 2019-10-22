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
<meta charset="UTF-8">
<title>WEworks</title>
<style>
body {
   /* background-image: url('<%=contextPath%>/resources/login.jpg'); */
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
   /* align: right; */
}
.main small{
font-size:10px;
}
table tr{
	height: 50px;
	color: black;
	font-size: 20px;
}
</style>
</head>
<body>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript"> 
$(function(){
    var msg = "<c:out value="${msg}" />";
    if(msg != ""){
        alert(msg);
    }
});
</script>

   <div class="main">
      <form id="form1" action="login.wo" method="post">
	      <table width="500" selspacing="5">
	         <tr>
	            <th colspan="2"><img src="resources/icons/logo2.png" alt="no"></th>
	         </tr>
	         <tr>
	            <td colspan="2">
	               <br>
	               <div class="form-group">
	                  <input type="number" class="form-control" id="num" name="num" placeholder="사원번호"> 
	               </div>
	            </td>
	         </tr>
	         <tr>
	            <td colspan="2">
	               <div class="form-group">
	                  <input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호">
	               </div>
	            </td>
	         </tr>
	         <tr>
	            <td><input type="checkbox" id="remember" name="rememberMe" value="true"/>아이디저장 </td>
	            <td align="right"></td>
	         </tr>
	         <tr>
	            <td colspan="2" align="center">
			    	<button type="submit" class="btn btn-secondary btn-lg btn-block">로그인</button>
	            </td>
	         </tr>
	         <tr>
	            <td align="left"><a href="findNoPage.wo">사원번호 찾기</a></td>
	            <td align="right"><a href="findPwdPage.wo">비밀번호 찾기</a></td>
	         </tr>
	      </table>
	      <br><br>
      </form>
   </div>
<script>
//아이디저장. 테스트 해봄.
//   $(function(){
//       $.cookie('key',$('#id').val(),{expires:7});
//       $.removeCookie('key');
 //     var key =$.cookie("key");
//       key = 'test';
    //  if(key==null){
       //  console.log('널값!');         
    //  }else{
       //  $('#num').val(key);
      //   $('#remember').attr("checked",true);
   //   };
 //  });

</script>
</body>
</html>