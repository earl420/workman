<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 캘린더 보기 -->
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<title>Calendar</title>

<link rel="icon" type="image/png" sizes="16x16"
	href="resources/icons/logo1.png">
<link href='resources/css/demo-to-codepen.css' rel='stylesheet' />
<link href='https://unpkg.com/@fullcalendar/core@4.3.1/main.min.css' rel='stylesheet' />
<link href='https://unpkg.com/@fullcalendar/daygrid@4.3.0/main.min.css' rel='stylesheet' />
<link href='https://unpkg.com/@fullcalendar/timegrid@4.3.0/main.min.css' rel='stylesheet' />
<script src='resources/js/demo-to-codepen.js'></script>
<script src='https://unpkg.com/@fullcalendar/core@4.3.1/main.min.js'></script>
<script src='https://unpkg.com/@fullcalendar/interaction@4.3.0/main.min.js'></script>
<script src='https://unpkg.com/@fullcalendar/daygrid@4.3.0/main.min.js'></script>
<script src='https://unpkg.com/@fullcalendar/timegrid@4.3.0/main.min.js'></script>
<script src='https://code.jquery.com/jquery-1.11.0.min.js'></script>
<script src="resources/js/moment.js"></script>
<script src="resources/js/monthpicker.js"></script>

<style>
	tbody:hover{
   	 	cursor:pointer;
   	} 
    html, body {
      margin: 0;
      padding: 0;
      font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
      font-size: 14px;
    }
    #calendar {
	    max-width: 900px;
	    margin-left: 27%;
    }
	#external-events {
	  	width: 150px;
	    padding: 0 10px;
	    margin-left: 20%;
	    margin-top:5%;
	    display:none;
  	}
</style>

<script>
	function calendar(){
	    
	    $("#calendar").fullCalendar({
	    	 header: {
	    	        left: 'today',
	    	        center: 'title',
	    	        right: 'prev,next'
	    	      }, displayEventTime: false
	              , editable : false //스케줄 드래그
	              , eventLimit : true //이벤트 보여줄 갯수
	              , events : function (start, end, callback) { 
	            	  $.ajax({
	             
	   	           url: 'calDetailView2.wo',
		           type: "GET",
		           async:false,
		           datatype: 'json',
		           success:  function(calendarList) {
		        	   console.log(calendarList);
		        	   
		               var events = [];
		            	
		              $.map( calendarList, function(obj) {
		               for (var i=0; i<=calendarList.length; i++) //리스트 생성
		            	      {
		            	   		events.push({
		            	        title : obj.description
		            	        });
		            	      }
		            	      });
		               
		               callback(calendarList);
		              }
			   });
	              }
	      , eventAfterRender: function(event, element, view) { //리스트 사이즈 조정
	        $(element).css('width','50px');
	                }
	      , eventRender : function(event, element) {
	                  var icon  = '<div class="squre" style="width:15px; height:15px; background:blue;"></div>'
	                  $(element).find('.fc-content').append(icon);
	              }	
	});
	    }
	    
</script>

</head>


<body>

	<div id="main-wrapper" style="background: white;">
	<c:import url="../common/header.jsp"></c:import>
	
<form action="calDetailView.wo" method="post" class="outdiv">
  <div id='external-events'>
    <div class='fc-event' id="all">전체</div>
    <div class='fc-event' id="dep">부서</div>
    <div class='fc-event' id="pri">개인</div>
   </div>
 
  <div id='calendar'></div>
</form>	
		<c:import url="../common/footer.jsp"></c:import>	
	</div>

</body>



</html>