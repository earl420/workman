<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date, java.text.SimpleDateFormat"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>일정등록</title>
<link rel="icon" type="image/png" sizes="16x16"
	href="resources/icons/logo1.png">

 <meta charset='utf-8'>
 <meta http-equiv='X-UA-Compatible' content='IE=edge'>
 <meta name='viewport' content='width=device-width, initial-scale=1'>
<!--  <link rel='stylesheet' type='text/css' media='screen' href='resources/main.css'> -->
 <link href="resources/css/style.css" rel="stylesheet">
  <!--<script src='resources/main.js'></script> -->
 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style>
       .outdiv{
            width:70%;
            margin: auto;
            padding-left: 20px;
            padding-top:50px;
        }
        h2{
            text-align: center;
        }
        .inlinediv{
            display: inline-block;
        }
        #detailId{
            height: 300px;
            resize: none;
        }
        .butdiv{
            text-align:center;
        }
        .btn{
            width:100px;
        }
        .alignradio{
        	padding-top:5px;
        }
        #ptype{
        	margin: auto;
        }
    </style>
</head>
<body>

<div id="main-wrapper" style="background: white;">
<c:import url="../common/header.jsp"></c:import>
		
	 	<div class="content-body">
			<div class="content-fluid" style="height: 100px;" align="center">
				<div class="insertouter">
				
	<form action="calInsert.wo" method="post" class="outdiv">
        <h2 style="color:navy;">일 정&nbsp; 등 록</h2>
        <br>
        
       <input type="hidden" name="empNum" value="${ loginMan.num }">
        <input type="hidden" name="deptNum" value="${ loginMan.deftNum }">
        
     <div class="inlinediv" style="width: 70%;">
     <div class="input-group mb-3">
        <div class="input-group-text" style="width: 20%;"><p id="ptype">Type</p></div>
          <div class="form-control">
            <div class="alignradio">
                <input type="radio" name="ctype" value="전체" id="all"> 
                <label for="all">전체일정</label>&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="ctype" value="부서" id="dep"> 
                <label for="dep">부서일정</label>&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" name="ctype" value="개인" id="pri"> 
                <label for="pri">개인일정</label>
              </div>
            </div>
          </div>
        </div>
        
        <div class="inlinediv" style="width: 25%;">
           <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroup-sizing-default">작성자</span>
                </div>
            <input type="text" name="userName" class="form-control" value="${ loginMan.name }" readonly aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
         </div>
        </div> 

        <div class="inlinediv" style="width: 47.5%;">
          <div class="input-group mb-3">
            <div class="input-group-prepend">
              <span class="input-group-text" id="inputGroup-sizing-default">시작</span>
            </div>
            <%
            	Date today = new Date();
            	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            	String strToday = sdf.format(today);
            	/* 오늘날짜 value값으로 박으려고 */
            	
            	Date time = new Date();
			  	SimpleDateFormat sdf2 = new SimpleDateFormat("hh:mm");
			  	String strTime = sdf2.format(time);
			  	/* 현재시간 value값으로 박으려고 */
            %>
            <input type="date" id="start" name="start" value="<%= strToday %>" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
            <input type="time" id="startTime" value="<%= strTime %>" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
          </div>
        </div>
           
        <div class="inlinediv" style="width: 47.5%;">
          <div class="input-group mb-3">
            <div class="input-group-prepend">
              <span class="input-group-text" id="inputGroup-sizing-default">마감</span>
            </div>
            <input type="date" id="end" name="end" value="<%= strToday %>" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
            <input type="time" id="endTime" value="<%= strTime %>" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
          </div>
        </div>

         <div class="input-group mb-3" style="width: 96%;">
            <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroup-sizing-default">상세내용</span>
            </div>
            <textarea id="detailId" name="description" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"></textarea>
        </div>

        <div class="butdiv">
            <button class="btn mb-1 btn-outline-warning" type="button" onclick="location.href='calDetailView.wo';">취소</button>
            <button class="btn mb-1 btn-secondary" type="submit">등록</button>
        </div>
        <br>
    </form>	
				</div>
			</div> 
		</div>
	
		<c:import url="../common/footer.jsp"></c:import>	
	</div>
</body>
</html>