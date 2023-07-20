<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>ArtHolic</title>
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
	
	.content {
	  	display: flex;
		justify-content: center;
		align-items: center;
		height: 700px;
		text-align: center;
	}
	
	input[type="password"] {
		margin-left: 30px;
		width: 300px;
		height: 30px;
		border-radius: 10px;
		border: none;
		font-size: 12px;
		padding-left: 5px;
	}
	
	p{
		color: gray;
	}
	
	.password{
		color: black;
	}
	
	input[type="button"] {
		color: white;
		font-weight: bold;
		background-color: #91bdce;
		width: 70px;
		border: none;
		border-radius: 10px;
		margin-top: 30px;
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
	    
	    
	    
		<h2 style="margin-bottom: 150px">비밀번호 변경</h2>
		
		
		<p class="password">
		<strong>새로운 비밀번호</strong>
		<input type="password" id="pw" placeholder="새 비밀번호를 입력 하세요."> 
		</p>
		
		<p class="password">
		<strong>새 비밀번호 확인</strong>
		<input type="password" id="pwChk" placeholder="새 비밀번호를 한번 더 입력하세요."> 
		</p>
		
		<font id="chkNotice" size="2"></font>
        <span id="passwordStrength"></span>
        <br>
        <br>
		
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<p> - 8자 ~ 16자의 영문 대/소문자, 숫자, 특수기호를 사용하여 비밀번호를 조합할 수 있습니다.</p>
		<p> 
		- 생년월일,전화번호,사번 등 개인정보와 관련된 숫자, 연속된 숫자, 연속된 키보드 배열과 같이 쉬운 비밀번호는 <br>
			타인이 쉽게 알아낼 수 있으니 사용을 자제 해 주세요.
		</p>
		<p> - 이전에 사용했던 비밀번호나 타 사이트와 다른 비밀번호를 사용하고, 비밀번호는 주기적으로 변경 해 주세요.</p>
	    
	    <input type="button" id="pwchange" value="변경" onclick="changePw()">
	    
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

function evaluatePasswordStrength(password) {
    
    if (password.length >= 8) {
      return "높음";
    } else if (password.length >= 6) {
      return "중간";
    } else {
      return "낮음";
    }
  }
  
$('#pw').keyup(function() {
    var password = $(this).val();
    var strength = evaluatePasswordStrength(password);
    
    var strengthText;
    if (strength === "높음") {
      strengthText = "높음";
      $('#passwordStrength').css({
        'color': 'green',
        'font-size': '14px'
      });
    } else if (strength === "중간") {
      strengthText = "중간";
      $('#passwordStrength').css({
        'color': 'orange',
        'font-size': '14px'
      });
    } else {
      strengthText = "낮음";
      $('#passwordStrength').css({
        'color': 'red',
        'font-size': '14px'
      });
    }
    
    $('#passwordStrength').text(strengthText);
  });

$(document).ready(function() {
	  $('#pw').keyup(function() {
	    $('#chkNotice').html('');
	  });

	  $('#pwChk').keyup(function() {
	    if ($('#pw').val() != $('#pwChk').val()) {
	      $('#chkNotice').html('비밀번호가 일치하지 않습니다.<br><br>');
	      $('#chkNotice').css('color', '#f82a2aa3');
	    } else {
	      $('#chkNotice').html('비밀번호가 일치합니다.<br><br>');
	      $('#chkNotice').css('color', '#199894b3');
	    }
	  });
	});

function changePw() {
	  var pw = $('#pw').val();
	  var pwChk = $('#pwChk').val();

	  if (pw == '') {
	    alert('변경할 비밀번호를 입력 해 주세요.');
	  } else if (pwChk == '') {
	    alert('변경할 비밀번호를 한번 더 입력해 주세요.');
	  } else if ($('#pw').val() != $('#pwChk').val()) {
	    alert('비밀번호가 일치하지 않습니다.');
	  } else {
	    $.ajax({
	      type: 'post',
	      url: 'changePw.ajax',
	      data: { 'pw': pw },
	      dataType: 'json',
	      success: function(data) {
	        console.log(data);
	        console.log(data.success);
	        if (data.success == 1) {
	          alert('비밀번호 수정이 완료되었습니다.');
	          location.reload(); // 페이지 새로고침
	        } else {
	          alert('비밀번호 수정에 실패했습니다.\r\n다시 시도해 주세요.');
	        }
	      },
	      error: function(e) {
	        console.log(e);
	        alert('오류가 발생했습니다.\r\n다시 시도해 주세요.');
	      }
	    });
	  }
	}
</script>
</html>