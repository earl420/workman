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
      margin-left: 27%;
    }
	#all{
		background:red;
	}
	#pri{
		background:orange;
	}
	#dep{
		background:navy;
	}
	 #external-events {
  	width: 150px;
    padding: 0 10px;
    margin-left: 20%;
    margin-top:5%;
    /* display:none; */
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
  
<script src='https://code.jquery.com/jquery-1.11.0.min.js'></script>
<script src="resources/js/moment.js"></script>
<script src="resources/js/monthpicker.js"></script>

<script>
	document.addEventListener('DOMContentLoaded', function() {
		
	 var Calendar = FullCalendar.Calendar;
	  var Draggable = FullCalendarInteraction.Draggable;

	  var containerEl = document.getElementById('external-events');
	  
    var calendarEl = document.getElementById('calendar');
    
    new Draggable(containerEl, {
	    itemSelector: '.fc-event',
	    eventData: function(eventEl) {
	      return {
	        title: eventEl.innerText
	      };
	    }
	  });
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
      selectable: true,
      header: {
        left: 'today',
        center: 'title',
        right: 'prev,next'
      },
      
      events: function (start, end, callback) {
    	  
    	  //var ctype = $("#").val();
    	  
          $.ajax({
           url: 'calDetailView2.wo',
           type: "GET",
           /* async:false, */
           datatype: 'json',
          // data: {},
           success: function(response){
        	   var fixedDate = response.map(function(array){
    				if(array.allDay&&array.start!=array.end){
    					array.end= moment(array.end).add(1,'days');
    				}    		   
	        	   return array;
        	   })
        	   callback(fixedDate);
        	   
               //console.log(data);
               /* var events = [];
              
               $.each(data, function(index, value) {
            	   
               	console.log(value);
                
                events.push({title: value.description, color:'red',start:value.start,end:value.end});
            });
               /* callback(events);
               console.log(events) */
               //callback(data);
           },
          });
      },
      eventAfterRender: function (event, element, view) {
      },
      
      editable: true,
      droppable: true,
      
      
      
      dateClick: function(info) {
        //alert('clicked ' + info.dateStr);
        location.href= 'calInsertView.wo';
    	 // $( info ).add( '.fc-day' ).css( 'background', 'red' );
      } ,
      select: function(info) {
        //alert('selected ' + info.startStr + ' to ' + info.endStr);
        location.href= 'calInsertView.wo';
      }
    });
    calendar.render();
  });
</script>

</head>
<body>

<div id="main-wrapper" style="background: white;">
<c:import url="../common/header.jsp"></c:import>

  <div id='external-events'>
    <div class='fc-event' id="all">전체</div>
    <div class='fc-event' id="dep">부서</div>
    <div class='fc-event' id="pri">개인</div>
   </div>
 
 
  <div id='calendar'></div>
  		
	
		<c:import url="../common/footer.jsp"></c:import>	
	</div>

</body>
</html>