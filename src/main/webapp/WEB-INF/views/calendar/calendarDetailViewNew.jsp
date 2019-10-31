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
      margin-left: 27%
    }

  </style>


<link href='https://unpkg.com/@fullcalendar/core@4.3.1/main.min.css' rel='stylesheet' />


  

  <link href='https://unpkg.com/@fullcalendar/daygrid@4.3.0/main.min.css' rel='stylesheet' />

  <link href='https://unpkg.com/@fullcalendar/timegrid@4.3.0/main.min.css' rel='stylesheet' />


<script src='resources/js/demo-to-codepen.js'></script>

<script src='https://unpkg.com/@fullcalendar/core@4.3.1/main.min.js'></script>




  <script src='https://unpkg.com/@fullcalendar/interaction@4.3.0/main.min.js'></script>

  <script src='https://unpkg.com/@fullcalendar/daygrid@4.3.0/main.min.js'></script>

  <script src='https://unpkg.com/@fullcalendar/timegrid@4.3.0/main.min.js'></script>

<script>

document.addEventListener('DOMContentLoaded', function() {
    
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
      selectable: true,
      header: {
        left: 'today',
        center: 'title',
        right: 'prev,next'
      },
      dateClick: function(info) {
        //alert('clicked ' + info.dateStr);
        location.href= 'calInsertView.wo';
    	 // $( info ).add( '.fc-day' ).css( 'background', 'red' );
      } ,
      select: function(info) {
        //alert('selected ' + info.startStr + ' to ' + info.endStr);
        location.href= 'calInsertView.wo';
      }
          /* 	, eventSources: [{
             	  events: function(info, successCallback, failureCallback) {
             		   $.ajax({
             			   url:'calInsertView.wo',
             			   type:'post',
             			   dataType:'json',
             			   data:{
             				   start: info.startStr,
             			       end: info.endStr
             			   },
             			   success: function(data){
             				   successCallback(data);
             			   }
             		   });
             		  }
               }]*/
          }); 

    calendar.render();
  });
  
</script>

</head>
<body>
<div id="main-wrapper" style="background: white;">
<c:import url="../common/header.jsp"></c:import>

  <div id='calendar'></div>
  
  		
	
		<c:import url="../common/footer.jsp"></c:import>	
	</div>

</body>
</html>