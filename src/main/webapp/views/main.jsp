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
	
	.fade-container {
	 	opacity: 0;
	  	transition: opacity 1s ease-in-out;
	}

	.fade-container.fade-in {
 		opacity: 1;
	}
	
	
	
	
	#profile{
		border: 1px solid blakc;
		border-collapse:collapse;
		background-color: #91bdce;
		margin: 30px;
		width: 250px;
		height: 350px;
	}
	
	#myProject{
		border: 1px solid blakc;
		border-collapse:collapse;
		background-color: #91bdce;
		margin: 30px;
		width: 1200px;
		height: 350px;
	}
	
	#myPayment{
		border: 1px solid blakc;
		border-collapse:collapse;
		background-color: #91bdce;
		margin: 30px;
		width: 1200px;
		height: 350px;
	}
	
	#myMail{
		border: 1px solid blakc;
		border-collapse:collapse;
		background-color: #91bdce;
		margin: 30px;
		width: 550px;
		height: 400px;
	}
	
	#inform{
		border: 1px solid blakc;
		border-collapse:collapse;
		background-color: #91bdce;
		margin: 30px;
		width: 550px;
		height: 400px;
	}
	
	#myCalendar{
		border: 1px solid blakc;
		border-collapse:collapse;
		background-color: #91bdce;
		margin: 30px;
		width: 250px;
		height: 350px;
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
		<!--<h1 class="m-0">Dashboard</h1> -->
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
			<div class="main-container fade-container">
	    <div id="main">
		  <div class="row">
		    <div class="col-md-4">
		      <div id="profile">
		        <h4>내 정보</h4>
		        <table>
		          <tr>
		            <th>이름</th>
		            <td>정재훈</td>
		          </tr>
		          <tr>
		            <th>부서</th>
		            <td>설계</td>
		          </tr>	   
		          <tr>
		            <th>직급</th>
		            <td>팀장</td>
		          </tr>	   
		          <tr>
		            <th>전화번호</th>
		            <td>010-1234-1234</td>
		          </tr>	   
		          <tr>
		            <th>내선번호</th>
		            <td>031-231-1242</td>
		          </tr>	   
		          <tr>
		            <th>이메일</th>
		            <td>test@naver.com</td>
		          </tr>
		        </table>
		        <a href="./pwchange">비밀번호 변경</a>
		      </div>
		      <div class="col-md-4">
		          <div id="myCalendar">
		            <h4>캘린더</h4>
		          </div>
		        </div>
		    </div>
		    <div class="col-md-8">
		      <div class="row">
		        
		        <div class="col-md-6">
		          <div id="myProject">
		            <h4>진행중인 프로젝트</h4>
		            <table id="example1" class="table table-bordered table-striped">
		              <thead>
		                <tr>
		                  <th>프로젝트명</th>
		                  <th>프로젝트 담당</th>
		                  <th>현장 관리자</th>
		                  <th>프로젝트 일정</th>
		                  <th>진행 상태</th>		    		
		                </tr>
		              </thead>
		              <tbody id="projectList">
		              </tbody>
		            </table>
		          </div>
		        </div>
		      </div>
		      <div class="row">
		        <div class="col-md-6">
		          <div id="myPayment">
		            <h4>내 결재함</h4>
		            <table id="example1" class="table table-bordered table-striped">
		              <thead>
		                <tr>
		                  <th>기안일</th>
		                  <th>결재 양식</th>
		                  <th>제목</th>
		                  <th>문서 번호</th>
		                  <th>결재 상태</th>		    		
		                </tr>
		              </thead>
		              <tbody id="paymentList">
		              </tbody>
		            </table>
		          </div>
		        </div>
		      </div>
		      <div class="row">
		        <div class="col-md-6">
		          <div id="myMail">
		            <h4>메일함</h4>
		            <table id="example1" class="table table-bordered table-striped">
		              <thead>
		                <tr>
		                  <th>보낸 사람</th>
		                  <th>제목</th>
		                  <th>보낸 일자</th>	
		                </tr>
		              </thead>
		              <tbody id="mailList">
		              </tbody>
		            </table>
		          </div>
		        </div>
		        <div class="col-md-6">
		          <div id="inform">
		            <h4>공지사항</h4>
		            <table id="example1" class="table table-bordered table-striped">
		              <thead>
		                <tr>
		                  <th>작성자</th>
		                  <th>제목</th>
		                  <th>작성 일자</th>	
		                </tr>
		              </thead>
		              <tbody id="informList">
		              </tbody>
		            </table>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
	    
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

//페이지 로드 시 페이드 효과 적용
window.addEventListener("load", function() {
  var fadeContainer = document.querySelector(".fade-container");
  fadeContainer.classList.add("fade-in");
});

var msg = "${msg}"; 
if (msg !== "") {
  alert(msg);
}

</script>
</html>