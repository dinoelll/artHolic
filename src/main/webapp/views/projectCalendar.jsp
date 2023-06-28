<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
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

#footer {
	margin-left: 0px;
}

.content {
	display: flex;
	/* justify-content: center;
		align-items: center;
		height: 700px;
		text-align: center; */
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

				<p>
					<a href="/projectCalendar.go">일정</a>|<a href="/projectPeed.go">피드</a>
				</p>
				
				<!-- Main content -->
				<section class="content">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-3">
								<div class="sticky-top mb-3">
									<div class="card">
										<div class="card-header">
											<h4 class="card-title">일정</h4>
										</div>
										<div class="card-body">
										
											<!-- the events -->
											<div id="external-events">
												<div class="external-event bg-success">Lunch</div>
												<div class="external-event bg-warning">Go home</div>
												<div class="external-event bg-info">Do homework</div>
												<div class="external-event bg-primary">Work on UI
													design</div>
												<div class="external-event bg-danger">Sleep tight</div>
												<div class="checkbox">
													<label for="drop-remove"> <input type="checkbox"
														id="drop-remove"> 일정 리스트에서 삭제하기
													</label>
												</div>
											</div>
										</div>
										<!-- /.card-body -->
									</div>
									<!-- /.card -->
									<div class="card">
										<div class="card-header">
											<h3 class="card-title">일정 추가하기</h3>
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
												<input id="new-event" type="text" class="form-control"
													placeholder="일정 이름을 입력해 주세요.">

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
				<!-- /.content -->
				<jsp:include page="footer.jsp" />
			</div>
			<!-- /.content-wrapper -->

		</div>
	</div>


	<!-- jQuery -->
	<script src="../plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- jQuery UI -->
	<script src="../plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../dist/js/adminlte.min.js"></script>
	<!-- fullCalendar 2.2.5 -->
	<script src="../plugins/moment/moment.min.js"></script>
	<script src="../plugins/fullcalendar/main.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="../dist/js/demo.js"></script>
	<!-- Page specific script -->

</body>
<script>



$(function () {

	  /* 외부 이벤트 초기화
	     -----------------------------------------------------------------*/
	  function ini_events(ele) {
	    ele.each(function () {

	      // 이벤트 객체 생성 (https://fullcalendar.io/docs/event-object)
	      // 시작과 끝을 필요로하지 않습니다
	      var eventObject = {
	        title: $.trim($(this).text()) // 요소의 텍스트를 이벤트 제목으로 사용
	      }

	      // 이벤트 객체를 DOM 요소에 저장하여 나중에 접근할 수 있게 합니다
	      $(this).data('eventObject', eventObject)

	      // jQuery UI를 사용하여 이벤트를 드래그 가능하게 합니다
	      $(this).draggable({
	        zIndex        : 1070,
	        revert        : true, // 드래그 후 원래 위치로 되돌아갑니다
	        revertDuration: 0  // 드래그 후 복귀하는 시간
	      })

	    })
	  }

	  ini_events($('#external-events div.external-event'))

	  /* 캘린더 초기화
	     -----------------------------------------------------------------*/
	  // 캘린더 이벤트용 날짜 (더미 데이터)
	  var date = new Date()
	  var d    = date.getDate(),
	      m    = date.getMonth(),
	      y    = date.getFullYear()

	  var Calendar = FullCalendar.Calendar;
	  var Draggable = FullCalendar.Draggable;

	  var containerEl = document.getElementById('external-events');
	  var checkbox = document.getElementById('drop-remove');
	  var calendarEl = document.getElementById('calendar');

	  // 외부 이벤트 초기화
	  // -----------------------------------------------------------------

	  new Draggable(containerEl, {
	    itemSelector: '.external-event',
	    eventData: function(eventEl) {
	      return {
	        title: eventEl.innerText,
	        backgroundColor: window.getComputedStyle(eventEl, null).getPropertyValue('background-color'),
	        borderColor: window.getComputedStyle(eventEl, null).getPropertyValue('background-color'),
	        textColor: window.getComputedStyle(eventEl, null).getPropertyValue('color'),
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
	    // 임의의 기본 이벤트
	    events: [
	      {
	        title          : '하루 종일 이벤트',
	        start          : new Date(y, m, 1),
	        backgroundColor: '#f56954', // 빨강
	        borderColor    : '#f56954', // 빨강
	        allDay         : true
	      },
	      {
	        title          : '긴 이벤트',
	        start          : new Date(y, m, d - 5),
	        end            : new Date(y, m, d - 2),
	        backgroundColor: '#f39c12', // 노랑
	        borderColor    : '#f39c12' // 노랑
	      },
	      {
	        title          : '미팅',
	        start          : new Date(y, m, d, 10, 30),
	        allDay         : false,
	        backgroundColor: '#0073b7', // 파랑
	        borderColor    : '#0073b7' // 파랑
	      },
	      {
	        title          : '점심',
	        start          : new Date(y, m, d, 12, 0),
	        end            : new Date(y, m, d, 14, 0),
	        allDay         : false,
	        backgroundColor: '#00c0ef', // 정보 (아쿠아)
	        borderColor    : '#00c0ef' // 정보 (아쿠아)
	      },
	      {
	        title          : '생일 파티',
	        start          : new Date(y, m, d + 1, 19, 0),
	        end            : new Date(y, m, d + 1, 22, 30),
	        allDay         : false,
	        backgroundColor: '#00a65a', // 성공 (녹색)
	        borderColor    : '#00a65a' // 성공 (녹색)
	      },
	      {
	        title          : 'Google에서 확인하기',
	        start          : new Date(y, m, 28),
	        end            : new Date(y, m, 29),
	        url            : 'https://www.google.com/',
	        backgroundColor: '#3c8dbc', // 주 (연한 파랑)
	        borderColor    : '#3c8dbc' // 주 (연한 파랑)
	      }
	    ],
	    editable  : true,
	    droppable : true, // 캘린더 위로 요소를 놓을 수 있게 합니다
	    drop      : function(info) {
	      // "놓은 후 삭제" 체크박스가 선택되어 있는지 확인합니다
	      if (checkbox.checked) {
	        // 체크박스가 선택되어 있다면 "Draggable Events" 목록에서 해당 요소를 제거합니다
	        info.draggedEl.parentNode.removeChild(info.draggedEl);
	      }
	    }
	  });

	  calendar.render();

	  /* 이벤트 추가 */
	  var currColor = '#3c8dbc' // 기본적으로 빨강

	  // 색상 선택 버튼
	  $('#color-chooser > li > a').click(function (e) {
	    e.preventDefault()
	    // 색상 저장
	    currColor = $(this).css('color')
	    // 버튼에 색상 효과 추가
	    $('#add-new-event').css({
	      'background-color': currColor,
	      'border-color'    : currColor
	    })
	  })

	  $('#add-new-event').click(function (e) {
	    e.preventDefault()
	    // 값 가져오고 null이 아닌지 확인합니다
	    var val = $('#new-event').val()
	    if (val.length == 0) {
	      return
	    }

	    // 이벤트 생성
	    var event = $('<div />')
	    event.css({
	      'background-color': currColor,
	      'border-color'    : currColor,
	      'color'           : '#fff'
	    }).addClass('external-event')
	    event.text(val)
	    $('#external-events').prepend(event)

	    // 드래그 가능하도록 기능 추가
	    ini_events(event)

	    // 텍스트 입력란에서 이벤트 삭제
	    $('#new-event').val('')
	  })
	})
</script>
</html>