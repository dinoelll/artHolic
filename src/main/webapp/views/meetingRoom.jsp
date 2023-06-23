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
		background-color: 91BDCE;
		color: white;
		border-color: #91BDCE;
   }
   .title{
		font-size: 20px;
   }
   .meetingRoom-people{
		font-size: 30px;
   }
   .mettingRoom-time1{
		margin-top: 30px;
   }
   .mettingRoom-time2{
		margin-top: 30px;
		display: inline-block;
   }
   .mettingRoom-Photo{
		height: 250px;
		width: 250px;
   }
	.meetingRoom-Photo,
	.meetingRoom-people,
	.mettingRoom-time3{
	    display: inline-block;
	}
	.mettingRoom-time3{
		margin-top:10px;
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
      
      <h3 class="title">회의실 선택</h3>
	      <div class="meetingRoom-select">
	      	<hr/>
	      	 <input type="checkbox" class="mettingRoom-checkbox">
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
	      
	      <div class="meetingRoom-select">
	      	<hr/>
	      	 <input type="checkbox" class="mettingRoom-checkbox">
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

<script></script>
</html>