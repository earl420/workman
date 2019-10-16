<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Calendar</title>
<link rel="icon" type="image/png" sizes="16x16"
	href="resources/icons/logo1.png">

 <meta charset='utf-8'>
 <meta http-equiv='X-UA-Compatible' content='IE=edge'>
 <meta name='viewport' content='width=device-width, initial-scale=1'>
 <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
 <script src='main.js'></script>
 
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
        }
        .butdiv{
            text-align:center;
        }
        .btn{
            width:100px;
        }
    </style>
</head>
<body>

<div id="main-wrapper" style="background: white;">
<c:import url="../common/header.jsp"></c:import>
		
	 	<div class="content-body">
			<div class="content-fluid" style="height: 100px;" align="center">
				<div class="insertouter">
				
				
    <div class="outdiv">
        <h2>일 정&nbsp; 등 록</h2>
        <br>
        
        <div class="inlinediv" style="width: 70%;">
          <div class="input-group mb-3">
             <div class="input-group-prepend">
               <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Type</button>
               <div class="dropdown-menu">
                 <a class="dropdown-item" href="#">전체일정</a>
                 <a class="dropdown-item" href="#">총무/회계</a>
                 <a class="dropdown-item" href="#">인사</a>
               </div>
             </div>
             <input type="text" class="form-control" aria-label="Text input with dropdown button" placeholder="제목을 입력하세요.">
           </div>
        </div>

        <div class="inlinediv" style="width: 25%;">
           <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroup-sizing-default">작성자</span>
                </div>
            <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
         </div>
        </div>  

        <div class="inlinediv" style="width: 40.5%;">
          <div class="input-group mb-3">
            <div class="input-group-prepend">
              <span class="input-group-text" id="inputGroup-sizing-default">시작</span>
            </div>
            <input type="datetime-local" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
          </div>
        </div>
           
        <div class="inlinediv" style="width: 40.5%;">
          <div class="input-group mb-3">
            <div class="input-group-prepend">
              <span class="input-group-text" id="inputGroup-sizing-default">마감</span>
            </div>
            <input type="datetime-local" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
          </div>
        </div>

        <div class="inlinediv">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <div class="input-group-text">
                    <input type="checkbox" aria-label="Checkbox for following text input">
                    </div>
                </div>
                <p class="form-control" aria-label="Text input with checkbox">&nbsp;ALL DAY&nbsp;</p>
            </div>
         </div>

        <!--  <div class="inlinediv" style="width: 48%;">
         <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroup-sizing-default">배경색</span>
            </div>
            <input type="color" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
        </div>
        </div>

        <div class="inlinediv" style="width: 48%;">
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroup-sizing-default">글자색</span>
            </div>
            <input type="color" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
        </div>
       </div> -->

         <div class="input-group mb-3" style="width: 96%;">
            <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroup-sizing-default">상세내용</span>
            </div>
            <input type="text" id="detailId" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
        </div>

        <div class="butdiv">
            <button type="reset" class="btn btn-outline-danger">취소</button>
            <button type="submit" class="btn btn-secondary">등록</button>
        </div>
        <br>

    </div>
    
    
				</div>
			</div> 
		</div>
  
		<c:import url="../common/footer.jsp"></c:import>	
	</div>

</body>
</html>