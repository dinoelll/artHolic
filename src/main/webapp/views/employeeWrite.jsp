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
	
	.employeeWrite {
		width: 1200px;
		height: 700px;
		background-color: rgba(233, 221, 198, 0.4);
		margin-top: 20px;
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
            <h1 class="m-0">사원 등록</h1>
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
   
	<div class="employeeWrite">
		<div class="emplyeeInput">
			<form action="join.do" method="post">
				<table>
					<tr>
						<th>사번</th>
						<td><input type="text" name="member_Id">   	
					</tr>	
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="pw">   	
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name">   	
					</tr>
					<tr>
						<th>생년월일<th>
						<td><input type="date" name="birthday">   	
					</tr>
					<tr>
						<th>성별</th>
							<td>
								<select id="gender-dropdown" name="gender">
									<option value="남성">남성</option>
									<option value="여성">여성</option>
								</select>
							</td>		
					</tr>
					<tr>
						<th>내선번호</th>
						<td><input type="number" name="tel">   	
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="email" name="email">   	
					</tr>
					<tr>
						<th>부서</th>
						<td>
							<select id="dept-dropdown" name="dept_code">
								<option value="인사">인사</option>
								<option value="시공">시공</option>
								<option value="설계">설계</option>
							</select>
						</td>	 	
					</tr>
					<tr>
						<th>직급</th>
						<td>
							<select id="position-dropdown" name="position_	qcode">
								<option value="사원">사원</option>
								<option value="주임">주임</option>
								<option value="대리">대리</option>
								<option value="과장">과장</option>
								<option value="차장">차장</option>
								<option value="부장">부장</option>
							</select>
						</td>	 	  	
					</tr>
				</table>	
				
				<input type="submit" value="등록하기">
			</form>
   		</div>
   </div>
   
   
   
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

</body>
<script>

	//선택된 성별 값 가져오기
	var genderDropdown = document.getElementById("gender-dropdown");
	var selectedGender = genderDropdown.value;
	
	// 선택된 성별 값 출력하기 (예시)
	console.log("선택된 성별: " + selectedGender);
	
	

</script>

</html>