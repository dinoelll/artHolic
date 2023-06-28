<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
 -->
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!--  Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

<!-- Font Awesome-->
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">

<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">

<!--  iCheck -->
<link rel="stylesheet"
	href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">

<!-- JQVMap
  <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
  -->
<!-- Theme style-->
<link rel="stylesheet" href="dist/css/adminlte.min.css">
<!-- overlayScrollbars-->
<link rel="stylesheet"
	href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  -->
<!-- summernote 
  <link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
  -->
<!-- fullCalendar (캘린더) -->
<link rel="stylesheet" href="plugins/fullcalendar/main.css">
<style>
	.main-sidebar {
		background-color: #e9ddc6;
	}
	.mt-2 .nav .nav-item .nav-link p {
		color : black;
	}
	.logo {
		width : 231px;
		height : 68px;
	}

	#footer {
		margin-left: 0px;
	}
</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
	<jsp:include page="header.jsp"/>
	
	<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Dashboard</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Dashboard v1</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    
    <!-- Main content -->
 <section class="content">
   <div class="container-fluid">
    <h1>막대 차트</h1>
    <!-- BAR CHART -->
            <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">Bar Chart</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <div class="card-body">
                <div class="chart">
                  <canvas id="barChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
                </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
    
    
    
    <h1>타임 라인</h1>
        <!-- Timelime example  -->
        <div class="row">
          <div class="col-md-12">
            <!-- The time line -->
            <div class="timeline">
              <!-- timeline time label -->
              <div class="time-label">
                <span class="bg-red">10 Feb. 2014</span>
              </div>
              <!-- /.timeline-label -->
              <!-- timeline item -->
              <div>
                <i class="fas fa-envelope bg-blue"></i>
                <div class="timeline-item">
                  <span class="time"><i class="fas fa-clock"></i> 12:05</span>
                  <h3 class="timeline-header"><a href="#">Support Team</a> sent you an email</h3>

                  <div class="timeline-body">
                    Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles,
                    weebly ning heekya handango imeem plugg dopplr jibjab, movity
                    jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle
                    quora plaxo ideeli hulu weebly balihoo...
                  </div>
                  <div class="timeline-footer">
                    <a class="btn btn-primary btn-sm">Read more</a>
                    <a class="btn btn-danger btn-sm">Delete</a>
                  </div>
                </div>
              </div>
              <!-- END timeline item -->
              <!-- timeline item -->
              <div>
                <i class="fas fa-user bg-green"></i>
                <div class="timeline-item">
                  <span class="time"><i class="fas fa-clock"></i> 5 mins ago</span>
                  <h3 class="timeline-header no-border"><a href="#">Sarah Young</a> accepted your friend request</h3>
                </div>
              </div>
              <!-- END timeline item -->
              <!-- timeline item -->
              <div>
                <i class="fas fa-comments bg-yellow"></i>
                <div class="timeline-item">
                  <span class="time"><i class="fas fa-clock"></i> 27 mins ago</span>
                  <h3 class="timeline-header"><a href="#">Jay White</a> commented on your post</h3>
                  <div class="timeline-body">
                    Take me to your leader!
                    Switzerland is small and neutral!
                    We are more like Germany, ambitious and misunderstood!
                  </div>
                  <div class="timeline-footer">
                    <a class="btn btn-warning btn-sm">View comment</a>
                  </div>
                </div>
              </div>
              <!-- END timeline item -->
              <!-- timeline time label -->
              <div class="time-label">
                <span class="bg-green">3 Jan. 2014</span>
              </div>
              <!-- /.timeline-label -->
              <!-- timeline item -->
              <div>
                <i class="fa fa-camera bg-purple"></i>
                <div class="timeline-item">
                  <span class="time"><i class="fas fa-clock"></i> 2 days ago</span>
                  <h3 class="timeline-header"><a href="#">Mina Lee</a> uploaded new photos</h3>
                  <div class="timeline-body">
                    <img src="https://placehold.it/150x100" alt="...">
                    <img src="https://placehold.it/150x100" alt="...">
                    <img src="https://placehold.it/150x100" alt="...">
                    <img src="https://placehold.it/150x100" alt="...">
                    <img src="https://placehold.it/150x100" alt="...">
                  </div>
                </div>
              </div>
              <!-- END timeline item -->
              <!-- timeline item -->
              <div>
                <i class="fas fa-video bg-maroon"></i>

                <div class="timeline-item">
                  <span class="time"><i class="fas fa-clock"></i> 5 days ago</span>

                  <h3 class="timeline-header"><a href="#">Mr. Doe</a> shared a video</h3>

                  <div class="timeline-body">
                    <div class="embed-responsive embed-responsive-16by9">
                      <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/tMWkeBIohBs" allowfullscreen></iframe>
                    </div>
                  </div>
                  <div class="timeline-footer">
                    <a href="#" class="btn btn-sm bg-maroon">See comments</a>
                  </div>
                </div>
              </div>
              <!-- END timeline item -->
              <div>
                <i class="fas fa-clock bg-gray"></i>
              </div>
            </div>
          </div>
          <!-- /.col -->
        </div>
        
        <h1>캘린더</h1>
        
        <div class="row">
          <div class="col-md-3">
            <div class="sticky-top mb-3">
              <div class="card">
                <div class="card-header">
                  <h4 class="card-title">Draggable Events</h4>
                </div>
                <div class="card-body">
                  <!-- the events -->
                  <div id="external-events">
                    <div class="external-event bg-success">Lunch</div>
                    <div class="external-event bg-warning">Go home</div>
                    <div class="external-event bg-info">Do homework</div>
                    <div class="external-event bg-primary">Work on UI design</div>
                    <div class="external-event bg-danger">Sleep tight</div>
                    <div class="checkbox">
                      <label for="drop-remove">
                        <input type="checkbox" id="drop-remove">
                        remove after drop
                      </label>
                    </div>
                  </div>
                </div>
                <!-- /.card-body -->
              </div>
              <!-- /.card -->
              <div class="card">
                <div class="card-header">
                  <h3 class="card-title">Create Event</h3>
                </div>
                <div class="card-body">
                  <div class="btn-group" style="width: 100%; margin-bottom: 10px;">
                    <ul class="fc-color-picker" id="color-chooser">
                      <li><a class="text-primary" href="#"><i class="fas fa-square"></i></a></li>
                      <li><a class="text-warning" href="#"><i class="fas fa-square"></i></a></li>
                      <li><a class="text-success" href="#"><i class="fas fa-square"></i></a></li>
                      <li><a class="text-danger" href="#"><i class="fas fa-square"></i></a></li>
                      <li><a class="text-muted" href="#"><i class="fas fa-square"></i></a></li>
                    </ul>
                  </div>
                  <!-- /btn-group -->
                  <div class="input-group">
                    <input id="new-event" type="text" class="form-control" placeholder="Event Title">

                    <div class="input-group-append">
                      <button id="add-new-event" type="button" class="btn btn-primary">Add</button>
                    </div>
                    <!-- /btn-group -->
                  </div>
                  <!-- /input-group -->
                </div>
              </div>
            </div>
          </div>
          <!-- /.col -->
          <div class="col-md-9">
            <div class="card card-primary">
              <div class="card-body p-0">
                <!-- THE CALENDAR -->
                <div id="calendar"></div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
      </div>
      <!-- /.timeline -->
      
    </section>
    <!-- /.content -->
    
    <jsp:include page="footer.jsp"/>
	</div>
	 
	  
	<!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
	


	
</div>

	


<!-- jQuery -->
	<script src="plugins/jquery/jquery.min.js"></script>
	<!-- jQuery UI -->
	<script src="plugins/jquery-ui/jquery-ui.min.js"></script>

	<!-- Bootstrap 4 -->
	<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- overlayScrollbars -->
	<script
		src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/adminlte.min.js"></script>

	<!-- AdminLTE for demo purposes 
<script src="dist/js/demo.js"></script>
-->

	<!-- ChartJS(차트) -->
	<script src="plugins/chart.js/Chart.min.js"></script>

	<!-- fullCalendar 2.2.5 (캘린더) -->
	<script src="plugins/moment/moment.min.js"></script>
	<script src="plugins/fullcalendar/main.js"></script>



</body>
<script>
$(function () {
    /* ChartJS
     * -------
     * Here we will create a few charts using ChartJS
     */

    //--------------
    //- AREA CHART -
    //--------------

    // Get context with jQuery - using jQuery's .get() method.
    
    //var areaChartCanvas = $('#areaChart').get(0).getContext('2d')

    var areaChartData = {
      labels  : ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
      datasets: [
        {
          label               : 'Digital Goods',
          backgroundColor     : 'rgba(60,141,188,0.9)',
          borderColor         : 'rgba(60,141,188,0.8)',
          pointRadius          : false,
          pointColor          : '#3b8bba',
          pointStrokeColor    : 'rgba(60,141,188,1)',
          pointHighlightFill  : '#fff',
          pointHighlightStroke: 'rgba(60,141,188,1)',
          data                : [28, 48, 40, 19, 86, 27, 90]
        },
        {
          label               : 'Electronics',
          backgroundColor     : 'rgba(210, 214, 222, 1)',
          borderColor         : 'rgba(210, 214, 222, 1)',
          pointRadius         : false,
          pointColor          : 'rgba(210, 214, 222, 1)',
          pointStrokeColor    : '#c1c7d1',
          pointHighlightFill  : '#fff',
          pointHighlightStroke: 'rgba(220,220,220,1)',
          data                : [65, 59, 80, 81, 56, 55, 40]
        },
      ]
    }

    var areaChartOptions = {
      maintainAspectRatio : false,
      responsive : true,
      legend: {
        display: false
      },
      scales: {
        xAxes: [{
          gridLines : {
            display : false,
          }
        }],
        yAxes: [{
          gridLines : {
            display : false,
          }
        }]
      }
    }

    // This will get the first returned node in the jQuery collection.
    /*
    new Chart(areaChartCanvas, {
      type: 'line',
      data: areaChartData,
      options: areaChartOptions
    })
    */
  

    //-------------
    //- BAR CHART -
    //-------------
    var barChartCanvas = $('#barChart').get(0).getContext('2d')
    var barChartData = $.extend(true, {}, areaChartData)
    var temp0 = areaChartData.datasets[0]
    var temp1 = areaChartData.datasets[1]
    barChartData.datasets[0] = temp1
    barChartData.datasets[1] = temp0

    var barChartOptions = {
      responsive              : true,
      maintainAspectRatio     : false,
      datasetFill             : false
    }

    new Chart(barChartCanvas, {
      type: 'bar',
      data: barChartData,
      options: barChartOptions
    })
    
    
    
    /* initialize the external events
    -----------------------------------------------------------------*/
   function ini_events(ele) {
     ele.each(function () {

       // create an Event Object (https://fullcalendar.io/docs/event-object)
       // it doesn't need to have a start or end
       var eventObject = {
         title: $.trim($(this).text()) // use the element's text as the event title
       }

       // store the Event Object in the DOM element so we can get to it later
       $(this).data('eventObject', eventObject)

       // make the event draggable using jQuery UI
       $(this).draggable({
         zIndex        : 1070,
         revert        : true, // will cause the event to go back to its
         revertDuration: 0  //  original position after the drag
       })

     })
   }

   ini_events($('#external-events div.external-event'))

   /* initialize the calendar
    -----------------------------------------------------------------*/
   //Date for the calendar events (dummy data)
   var date = new Date()
   var d    = date.getDate(),
       m    = date.getMonth(),
       y    = date.getFullYear()

   var Calendar = FullCalendar.Calendar;
   var Draggable = FullCalendar.Draggable;

   var containerEl = document.getElementById('external-events');
   var checkbox = document.getElementById('drop-remove');
   var calendarEl = document.getElementById('calendar');

   // initialize the external events
   // -----------------------------------------------------------------
	
   new Draggable(containerEl, {
     itemSelector: '.external-event',
     eventData: function(eventEl) {
       return {
         title: eventEl.innerText,
         backgroundColor: window.getComputedStyle( eventEl ,null).getPropertyValue('background-color'),
         borderColor: window.getComputedStyle( eventEl ,null).getPropertyValue('background-color'),
         textColor: window.getComputedStyle( eventEl ,null).getPropertyValue('color'),
       };
     }
   });

   var calendar = new Calendar(calendarEl, {
     headerToolbar: {
       left  : 'prev,next today',
       center: 'title',
       right : 'dayGridMonth,timeGridWeek,timeGridDay'
     },
     themeSystem: 'bootstrap',
     //Random default events
     events: [
       {
         title          : 'All Day Event',
         start          : new Date(y, m, 1),
         backgroundColor: '#f56954', //red
         borderColor    : '#f56954', //red
         allDay         : true
       },
       {
         title          : 'Long Event',
         start          : new Date(y, m, d - 5),
         end            : new Date(y, m, d - 2),
         backgroundColor: '#f39c12', //yellow
         borderColor    : '#f39c12' //yellow
       },
       {
         title          : 'Meeting',
         start          : new Date(y, m, d, 10, 30),
         allDay         : false,
         backgroundColor: '#0073b7', //Blue
         borderColor    : '#0073b7' //Blue
       },
       {
         title          : 'Lunch',
         start          : new Date(y, m, d, 12, 0),
         end            : new Date(y, m, d, 14, 0),
         allDay         : false,
         backgroundColor: '#00c0ef', //Info (aqua)
         borderColor    : '#00c0ef' //Info (aqua)
       },
       {
         title          : 'Birthday Party',
         start          : new Date(y, m, d + 1, 19, 0),
         end            : new Date(y, m, d + 1, 22, 30),
         allDay         : false,
         backgroundColor: '#00a65a', //Success (green)
         borderColor    : '#00a65a' //Success (green)
       },
       {
         title          : 'Click for Google',
         start          : new Date(y, m, 28),
         end            : new Date(y, m, 29),
         url            : 'https://www.google.com/',
         backgroundColor: '#3c8dbc', //Primary (light-blue)
         borderColor    : '#3c8dbc' //Primary (light-blue)
       }
     ],
     editable  : true,
     droppable : true, // this allows things to be dropped onto the calendar !!!
     drop      : function(info) {
       // is the "remove after drop" checkbox checked?
       if (checkbox.checked) {
         // if so, remove the element from the "Draggable Events" list
         info.draggedEl.parentNode.removeChild(info.draggedEl);
       }
     }
   });

   calendar.render();
   // $('#calendar').fullCalendar()

   /* ADDING EVENTS */
   var currColor = '#3c8dbc' //Red by default
   // Color chooser button
   $('#color-chooser > li > a').click(function (e) {
     e.preventDefault()
     // Save color
     currColor = $(this).css('color')
     // Add color effect to button
     $('#add-new-event').css({
       'background-color': currColor,
       'border-color'    : currColor
     })
   })
   $('#add-new-event').click(function (e) {
     e.preventDefault()
     // Get value and make sure it is not null
     var val = $('#new-event').val()
     if (val.length == 0) {
       return
     }

     // Create events
     var event = $('<div />')
     event.css({
       'background-color': currColor,
       'border-color'    : currColor,
       'color'           : '#fff'
     }).addClass('external-event')
     event.text(val)
     $('#external-events').prepend(event)

     // Add draggable funtionality
     ini_events(event)

     // Remove event from text input
     $('#new-event').val('')
   })
  })
</script>

</html>