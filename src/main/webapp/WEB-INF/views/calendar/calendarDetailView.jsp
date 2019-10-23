<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<title>Calendar</title>
<link rel="icon" type="image/png" sizes="16x16"
	href="resources/icons/logo1.png">
<link href='/assets/demo-to-codepen.css' rel='stylesheet' />
<style>
   html, body {
     margin: 0;
     padding: 0;
     font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
     font-size: 14px;
   }
   #calendar {
     max-width: 1000px;
     margin: auto;
   }
 </style>

<link href='https://unpkg.com/@fullcalendar/core@4.3.1/main.min.css' rel='stylesheet' />
<link href='https://unpkg.com/@fullcalendar/daygrid@4.3.0/main.min.css' rel='stylesheet' />
<link href='https://unpkg.com/@fullcalendar/timegrid@4.3.0/main.min.css' rel='stylesheet' />

<script src='/assets/demo-to-codepen.js'></script>
<script src='https://unpkg.com/@fullcalendar/core@4.3.1/main.min.js'></script>
<script src='https://unpkg.com/@fullcalendar/daygrid@4.3.0/main.min.js'></script>
<script src='https://unpkg.com/@fullcalendar/timegrid@4.3.0/main.min.js'></script>

<script>
document.addEventListener('DOMContentLoaded', function() {
	  var Calendar = FullCalendar.Calendar;
	  var Draggable = FullCalendarInteraction.Draggable;

	  var containerEl = document.getElementById('external-events');
	  var calendarEl = document.getElementById('calendar');
	  var checkbox = document.getElementById('drop-remove');

	  // initialize the external events
	  // -----------------------------------------------------------------

	  new Draggable(containerEl, {
	    itemSelector: '.fc-event',
	    eventData: function(eventEl) {
	      return {
	        title: eventEl.innerText
	      };
	    }
	  });

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'dayGrid', 'timeGrid' ],
      header: {
        left: 'today',
        center: 'title',
        right: 'prevYear,prev,next,nextYear'
      },
      editable: true,
      droppable: true, // this allows things to be dropped onto the calendar
      drop: function(info) {
        // is the "remove after drop" checkbox checked?
        if (checkbox.checked) {
          // if so, remove the element from the "Draggable Events" list
          info.draggedEl.parentNode.removeChild(info.draggedEl);
        }
      }
    });

    calendar.render();
  });
</script>

</head>
<body>
 		<div id="main-wrapper" style="background: white;">
		<c:import url="../common/header.jsp"></c:import>
		
	 	<div class="content-body">
			<div class="content-fluid" style="height: 100px;" align="center">
				<div class="insertouter">
				<div id='calendar'></div>
				</div>
			</div> 
		</div>
  
		<c:import url="../common/footer.jsp"></c:import>	
	</div>
</body>

</html>
