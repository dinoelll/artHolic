<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>spring boot</title>

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
b {
	color: red;
}

table {
	width: 100%;
}

table, td, th {
	border: 1px solid;
	border-collapse: collapse;
	padding: 5px;
}

#paging {
	text-align: center;
}

#writeForm {
	float: right;
}

.main-sidebar {
	background-color: #e9ddc6;
}

.mt-2 .nav .nav-item .nav-link p {
	color: black;
}

.logo {
	width: 231px;
	height: 68px;
}

.modal {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
}

/* * {
  padding:0;
  margin:0;
  box-sizing: border-box;
} */
/* #btnWrap {
	width: 500px;
	margin: 100px auto;
} */
#popupBtn {
	width: 50px;
	height: 30px;
	padding: 4px 4px;
	float: right;
}

#modalWrap {
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	display: none;
}

#modalBody {
	width: 500px;
	height: 600px;
	padding: 86px 53px;
	margin: 109px auto;
	border: 5px solid #777;
	background-color: #fff;
}

#closeBtn {
	width: 80px;
	height: 33px;
	padding: 4px 4px;
	float: left;
	font-weight: bold;
	color: #777;
	font-size: 17px;
	cursor: pointer;
}

#delete {
	width: 80px;
	height: 33px;
	padding: 4px 4px;
	float: right;
	font-weight: bold;
	color: #777;
	font-size: 17px;
	cursor: pointer;
}
</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<jsp:include page="header.jsp" />
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<!-- Content Wrapper. Contains page content -->
			<div class="content-wrapper">
				<!-- Content Header (Page header) -->
				<div class="content-header">
					<div class="container-fluid">
						<div class="row mb-2">
							<div class="col-sm-6">
								<h1 class="m-0">프로젝트</h1>
							</div>
							<!-- /.col -->
							<div class="col-sm-6">
								<ol class="breadcrumb float-sm-right">
									<li class="breadcrumb-item"><a href="#">Home</a></li>
									<li class="breadcrumb-item active">Dashboard v1</li>
								</ol>
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.container-fluid -->
				</div>
				<!-- /.content-header -->






				<!-- Main content -->
				<section class="content">
					<div class="container-fluid">
						<div class="row">

							<!-- /.col -->
							<div class="col-md-9">
								<div class="card">
									<div class="card-header p-2">
										<ul class="nav nav-pills">
										<li class="nav-item"><a class="nav-link active"
												href="#activity" data-toggle="tab">피드</a></li>
										<li class="nav-item"><a class="nav-link"
												href="#timeline" data-toggle="tab">일정</a></li>
										</ul>
									</div>
									<!-- /.card-header -->
									<div class="card-body">
										<div class="tab-content">
											<div class="active tab-pane" id="activity">
												<!-- Post -->
												<div class="post">
													<div class="user-block">
														<img class="img-circle img-bordered-sm"
															src="../../dist/img/user1-128x128.jpg" alt="user image">
														<span class="username"> <a href="#">Jonathan
																Burke Jr.</a> <a href="#" class="float-right btn-tool"><i
																class="fas fa-times"></i></a>
														</span> <span class="description">Shared publicly - 7:30
															PM today</span>
													</div>
													<!-- /.user-block -->
													<p>Lorem ipsum represents a long-held tradition for
														designers, typographers and the like. Some people hate it
														and argue for its demise, but others ignore the hate as
														they create awesome tools to help create filler text for
														everyone from bacon lovers to Charlie Sheen fans.</p>

													<p>
														<a href="#" class="link-black text-sm mr-2"><i
															class="fas fa-share mr-1"></i> Share</a> <a href="#"
															class="link-black text-sm"><i
															class="far fa-thumbs-up mr-1"></i> Like</a> <span
															class="float-right"> <a href="#"
															class="link-black text-sm"> <i
																class="far fa-comments mr-1"></i> Comments (5)
														</a>
														</span>
													</p>

													<input class="form-control form-control-sm" type="text"
														placeholder="Type a comment">
												</div>
												<!-- /.post -->

												<!-- Post -->
												<div class="post clearfix">
													<div class="user-block">
														<img class="img-circle img-bordered-sm"
															src="../../dist/img/user7-128x128.jpg" alt="User Image">
														<span class="username"> <a href="#">Sarah Ross</a>
															<a href="#" class="float-right btn-tool"><i
																class="fas fa-times"></i></a>
														</span> <span class="description">Sent you a message - 3
															days ago</span>
													</div>
													<!-- /.user-block -->
													<p>Lorem ipsum represents a long-held tradition for
														designers, typographers and the like. Some people hate it
														and argue for its demise, but others ignore the hate as
														they create awesome tools to help create filler text for
														everyone from bacon lovers to Charlie Sheen fans.</p>

													<form class="form-horizontal">
														<div class="input-group input-group-sm mb-0">
															<input class="form-control form-control-sm"
																placeholder="Response">
															<div class="input-group-append">
																<button type="submit" class="btn btn-danger">Send</button>
															</div>
														</div>
													</form>
												</div>
												<!-- /.post -->

												<!-- Post -->
												<div class="post">
													<div class="user-block">
														<img class="img-circle img-bordered-sm"
															src="../../dist/img/user6-128x128.jpg" alt="User Image">
														<span class="username"> <a href="#">Adam Jones</a>
															<a href="#" class="float-right btn-tool"><i
																class="fas fa-times"></i></a>
														</span> <span class="description">Posted 5 photos - 5 days
															ago</span>
													</div>
													<!-- /.user-block -->
													<div class="row mb-3">
														<div class="col-sm-6">
															<img class="img-fluid" src="../../dist/img/photo1.png"
																alt="Photo">
														</div>
														<!-- /.col -->
														<div class="col-sm-6">
															<div class="row">
																<div class="col-sm-6">
																	<img class="img-fluid mb-3"
																		src="../../dist/img/photo2.png" alt="Photo"> <img
																		class="img-fluid" src="../../dist/img/photo3.jpg"
																		alt="Photo">
																</div>
																<!-- /.col -->
																<div class="col-sm-6">
																	<img class="img-fluid mb-3"
																		src="../../dist/img/photo4.jpg" alt="Photo"> <img
																		class="img-fluid" src="../../dist/img/photo1.png"
																		alt="Photo">
																</div>
																<!-- /.col -->
															</div>
															<!-- /.row -->
														</div>
														<!-- /.col -->
													</div>
													<!-- /.row -->

													<p>
														<a href="#" class="link-black text-sm mr-2"><i
															class="fas fa-share mr-1"></i> Share</a> <a href="#"
															class="link-black text-sm"><i
															class="far fa-thumbs-up mr-1"></i> Like</a> <span
															class="float-right"> <a href="#"
															class="link-black text-sm"> <i
																class="far fa-comments mr-1"></i> Comments (5)
														</a>
														</span>
													</p>

													<input class="form-control form-control-sm" type="text"
														placeholder="Type a comment">
												</div>
												<!-- /.post -->
											</div>

											<div class="tab-pane" id="timeline">
												<!-- Main content -->
												<section class="content">
													<div class="container-fluid">
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
																				<div class="external-event bg-info">Do
																					homework</div>
																				<div class="external-event bg-primary">Work on
																					UI design</div>
																				<div class="external-event bg-danger">Sleep
																					tight</div>
																				<div class="checkbox">
																					<label for="drop-remove"> <input
																						type="checkbox" id="drop-remove"> 등록 후 삭제
																					</label>
																				</div>
																			</div>
																		</div>
																		<!-- /.card-body -->
																	</div>
																	<!-- /.card -->
																	<div class="card">
																		<div class="card-header">
																			<h3 class="card-title">일정 생성</h3>
																		</div>
																		<div class="card-body">
																			<div class="btn-group"
																				style="width: 100%; margin-bottom: 10px;">
																				<ul class="fc-color-picker" id="color-chooser">
																					<li><a class="text-primary" href="#"><i
																							class="fas fa-square"></i></a></li>
																					<li><a class="text-warning" href="#"><i
																							class="fas fa-square"></i></a></li>
																					<li><a class="text-success" href="#"><i
																							class="fas fa-square"></i></a></li>
																					<li><a class="text-danger" href="#"><i
																							class="fas fa-square"></i></a></li>
																					<li><a class="text-muted" href="#"><i
																							class="fas fa-square"></i></a></li>
																				</ul>
																			</div>
																			<!-- /btn-group -->
																			<div class="input-group">
																				<input id="new-event" type="text"
																					class="form-control" placeholder="Event Title">

																				<div class="input-group-append">
																					<button id="add-new-event" type="button"
																						class="btn btn-primary">추가</button>
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
														<!-- /.row -->
													</div>
													<!-- /.container-fluid -->
												</section>


											</div>
											<!-- /.tab-pane -->
										</div>
										<!-- /.tab-content -->
									</div>
									<!-- /.card-body -->
								</div>
								<!-- /.card -->
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.container-fluid -->
				</section>



				<!-- /.content -->
			</div>
			<!-- /.content-wrapper -->





		</div>


		<jsp:include page="footer.jsp" />

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
		<script src="dist/js/adminlte.js"></script>

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