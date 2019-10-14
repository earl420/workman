<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />


  <title>
    Calendar
  </title>


<link href='/assets/demo-to-codepen.css' rel='stylesheet' />


  <style>

    html, body {
      margin: 0;
      padding: 0;
      font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
      font-size: 14px;
    }

    #calendar {
      max-width: 900px;
      margin: 40px auto;
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
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'dayGrid', 'timeGrid' ],
      header: {
        left: 'today',
        center: 'title',
        right: 'prevYear,prev,next,nextYear'
      }
    });

    calendar.render();
  });

</script>

</head>
<body>
 
  <div id='calendar'></div>
</body>

</html>
