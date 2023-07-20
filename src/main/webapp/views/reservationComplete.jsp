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
	justify-content: center;
	align-items: center;
	height: 700px;
	text-align: center;
}

p {
	color: gray;
}

.btn-sm1 {
	color: gray;
	font-weight: bold;
	background-color: white;
	width: 114px;
	border: none;
	border-radius: 10px;
	margin-top: 30px;
}

.btn-sm2 {
	color: white;
	font-weight: bold;
	background-color: #91bdce;
	width: 114px;
	border: none;
	border-radius: 10px;
	margin-top: 30px;
	margin-left: 30px;
}

.send-icon {
	font-size: 150px;
	color: #e9ddc6;
}

#reservationComplete {
	width: 260px;
	height: 260px;
}

.infomsg {
	font-size: 20;
}
</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<jsp:include page="header.jsp" />
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<!--<h1 class="m-0">Dashboard</h1> -->
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">

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

					<img id="reservationComplete" src="/photo/reservationComplete.jpg">
					<br> <br>
					<p class="infomsg">- 회의실 예약이 완료되었습니다 -</p>
					<p class="infomsg">
						회의명 : <b>${meetingName }</b>
					</p>
					<p class="infomsg">
						참가팀 : <b>${meetionMember }</b>
					</p>
					<p class="infomsg">
						회의실명 : <b>${selectedRoom }</b>
					</p>
					<p class="infomsg">
						회의 날자 : <b>${selectedDate }</b>
					</p>
					<p class="infomsg">
						회의 시간 : <b>${startTime } ~${endTime }</b>
					</p>



					<a href="metingRoom.go" class="btn btn-primary btn-sm1 ">확인</a>
					<!--  <a href="inBox.go" class="btn btn-primary btn-sm2 ">보낸 메일함</a> -->

				</div>
				<!-- /.container-fluid -->

			</section>
			<!-- /.content -->


			<jsp:include page="footer.jsp" />
		</div>
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
	<script src="dist/js/adminlte.js"></script>

	<!-- AdminLTE for demo purposes 
   <script src="dist/js/demo.js"></script>
   -->
</body>

<script>
	
</script>
</html>