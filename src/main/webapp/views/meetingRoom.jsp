<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
 -->
   <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!--  Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">   

  <!-- Font Awesome-->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  
  <!--  iCheck -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  
   <!-- JQVMap
  <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
  -->
  <!-- Theme style-->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- overlayScrollbars-->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  -->
  <!-- summernote 
  <link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
  -->
  <!-- fullCalendar (캘린더) -->
  <link rel="stylesheet" href="plugins/fullcalendar/main.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

		<link rel="stylesheet" type="text/css" href="dist/css/calendar.css" />
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="dist/js/calendar.js"></script>
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
   .meetingRoom-time{
		margin-left: 24px;
		background-color: 91BDCE;
		color: white;
		border-color: #91BDCE;
		width: 90px;
		height: 50px;
   }
   .title{
		font-size: 20px;
   }
   .meetingRoom-people{
		font-size: 27px;
	    margin-left: 70px;
	    margin-right: 70px;
   }
   .mettingRoom-time1{
		margin-top: 30px;
   }
   .mettingRoom-time2{
		margin-top: 30px;
		display: inline-block;
   }
   .mettingRoom-Photo{
		height: 160px;
		width: 260px;
   }
	.meetingRoom-Photo,
	.meetingRoom-people,
	.mettingRoom-time3{
	    display: inline-block;
	}
	.mettingRoom-time3{
		margin-top:10px;
		margin-bottom: 50px;
	}
	
	
.meetingRoomContainer {
  display: flex;
  align-items: center;
}

.meetingRoomContainer .mettingRoom-time3 {
  display: flex;
  align-items: center;
  flex-direction: column;
}

.calendar.month {
  font-size: 50px; /* 원하는 폰트 사이즈로 변경하세요 */
  text-align: center;
}

.calendar-header {
  font-size: 50px; /* 원하는 폰트 사이즈로 변경하세요 */
}

.calendar-yearmonth {
  font-size: 24px; /* 원하는 폰트 사이즈로 변경하세요 */
}
#calendar{
	text-aline: center;
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
            <h1 class="m-0">회의실 예약</h1>
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
			<h3 class="title">날짜 선택</h3>
			<div class="calendar month">
				<div class="calendar-header">
					<span class="calendar-yearmonth"></span>
				</div>
				<div id="calendar"></div>
			</div>
			<hr/>
			<h3 class="title">회의실 선택</h3>
			<div class="meetingRoomContainer">
				<hr/>
				<img class="mettingRoom-Photo" src="img/meetingRoom.jpg" alt="">
				<h1 class="meetingRoom-people">7명</h1>
				<div class="mettingRoom-time3">
					<div class="mettingRoom-time1">
						<button class="meetingRoom-time" style="border-left-width: 10px;">9:00</button>
						<button class="meetingRoom-time">10:00</button>
						<button class="meetingRoom-time">11:00</button>
						<button class="meetingRoom-time">12:00</button>
						<button class="meetingRoom-time">13:00</button>
					</div>
					<br/>
					<div class="mettingRoom-time2">
						<button class="meetingRoom-time">14:00</button>
						<button class="meetingRoom-time">15:00</button>
						<button class="meetingRoom-time">16:00</button>
						<button class="meetingRoom-time">17:00</button>
						<button class="meetingRoom-time">18:00</button>
					</div>
				</div>
			<hr/>
			</div> 
		</div>
	 
	<!-- /.container-fluid -->
	      
	</section>
    <!-- /.content -->
    
      
      <jsp:include page="footer.jsp"/>
      </div>
   </div>
   
   <!-- jQuery -->
   <script src="plugins/jquery/jquery.min.js"></script>
   <!-- jQuery UI -->
   <script src="plugins/jquery-ui/jquery-ui.min.js"></script>
   
   <!-- Bootstrap 4 -->
   <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
   <!-- overlayScrollbars -->
   <script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
   <!-- AdminLTE App -->
   <script src="dist/js/adminlte.js"></script>

   <!-- AdminLTE for demo purposes 
   <script src="dist/js/demo.js"></script>
   -->
</body>

<script>
var options = {
		showDay : true,
		showFullDayName : true,
		showToday : true
	};
	
	var date = new Date();
	var html = weekHTML(date, options);
	$(".calendar-yearmonth").html(date.getFullYear() + "년 " + (date.getMonth() + 1) + "월");
	$("#calendar").html(html);
	
	
	// JavaScript 코드
	var tds = document.querySelectorAll('.calendar.month td');
	var spans = document.querySelectorAll('.calendar.month td span');

	// 각 td 요소에 클릭 이벤트 리스너를 추가합니다.
	tds.forEach(function(td) {
	  // 토요일, 일요일, 오늘 날짜에는 클릭 이벤트를 제거합니다.
	  if (td.classList.contains('saturday') || td.classList.contains('sunday') || td.classList.contains('today')) {
	    td.style.pointerEvents = 'none'; // 클릭 이벤트를 비활성화합니다.
	  } else {
	    td.addEventListener('click', function(event) {
	      // 클릭한 요소가 span 요소인지 확인합니다.
	      var clickedSpan = event.target.closest('span');
	      if (!clickedSpan) {
	        return; // 클릭한 요소가 span 요소가 아닌 경우 처리 종료
	      }

	      // 모든 span 요소의 스타일을 초기화하고 "today" 클래스를 제거합니다.
	      spans.forEach(function(span) {
	        span.style.border = '';
	        span.style.borderRadius = '';
	        span.style.color = '';
	        span.style.backgroundColor = '';
	        span.classList.remove('today');
	      });

	      // 클릭한 요소에 스타일을 적용하고 "today" 클래스를 추가합니다.
	      clickedSpan.style.border = '1px solid #91BDCE';
	      clickedSpan.style.borderRadius = '50%';
	      clickedSpan.style.color = 'white';
	      clickedSpan.style.backgroundColor = '#91BDCE';
	      clickedSpan.classList.add('today');
	    });
	  }
	});
	
	
	
</script>
</html>