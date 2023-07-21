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
	
	.fade-container {
	 	opacity: 0;
	  	transition: opacity 1s ease-in-out;
	}

	.fade-container.fade-in {
 		opacity: 1;
	}
	
	
	
	
	#profile{
		border: 1px solid lightgray;
		border-collapse:collapse;
		background-color: white;
		margin-bottom: 8px;
		margin-left: 15px;
		width: 330px;
		height: 450px;
		text-align: center;
	}
	
	#profile table {
   		table-layout: fixed; 
    	width: 330px;

	}		
	table th,td{
		text-align: center;
	}
	
	#profile table th {
   		text-align: right;
   		
	}	
	
	#profile table td {
   		text-align: left;
   		
	}	

	#myProject{
		border: 1px solid lightgray;
		border-collapse:collapse;
		background-color: white;
		width: 1200px;
		height: 233px;
		text-align: center;
	}
	
	#myPayment{
		border: 1px solid lightgray;
		border-collapse:collapse;
		background-color: white;
		margin-bottom: 8px;
		width: 1200px;
		height: 233px;
		text-align: center;
	}
	
	#myMail{
		border: 1px solid lightgray;
		border-collapse:collapse;
		background-color: white;
		margin-bottom: 30px;
		width: 656px;
		height: 233px;
		text-align: center;
	}
	
	#inform{
		border: 1px solid lightgray;
		border-collapse:collapse;
		background-color: white;
		margin-bottom: 30px;
		width: 515px;
		height: 233px;
		text-align: center;
	}
	
	#myAnnual{
		border: 1px solid lightgray;
		border-collapse:collapse;
		background-color: white;
		margin-bottom: 30px;
		margin-left: 15px;
		width: 330px;
		height: 341px;
		text-align: center;
	}

	h5{
		text-align: center;
		margin-top: 5px;
		font-weight: bold;
		margin-left: 70px;
	}
	
	#long {
		margin-left: 70px;
	}
	
	#profile-preview{
		margin-top: 20px;
		margin-left: 60px;
		margin-bottom: 40px;
		border: 1px solid black;
	}
	
	
	
	.circle-container {
	   display: flex;
	   align-items: center;
	   margin-left: 20px;
	}
	
	.circle-container2 {
	  	display: flex;
	  	flex-direction: row;
	}
	
	.circle {
	   display: flex;
	   flex-direction: column;
	   align-items: center;
	   margin-right: 10px;
	}
	
	
	.number {
	   display: inline-block;
	   width: 130px;
	   height: 130px;
	   background-color: #555;
	   color: #fff;
	   border-radius: 50%;
	   text-align: center;
	   line-height: 30px;
	   margin-top: 5px;
	   font-size: 60px;
	   padding-top: 45px;
	   margin-left: 85px;
	}
	
	.text {
	   margin-top: 5px;
	   margin-left: 85px;
	   font-weight: bold;
	   font-size: 15px;
	}
	
	.circle2 {
	   display: flex;
	   flex-direction: column;
	   align-items: center;
	   margin-right: 10px;
	}
	
	
	.number2 {
	   display: inline-block;
	   width: 130px;
	   height: 130px;
	   background-color: #f82a2aa3;
	   color: #fff;
	   border-radius: 50%;
	   text-align: center;
	   line-height: 30px;
	   margin-top: 5px;
	   font-size: 60px;
	   padding-top: 45px;
	   margin-left: 10px;
	}
	
	.text2 {
	   margin-left: 10px;
	   font-weight: bold;
	   font-size: 15px;
	}
	
	.number3 {
	   display: inline-block;
	   width: 130px;
	   height: 130px;
	   background-color: #91bdce;
	   color: #fff;
	   border-radius: 50%;
	   text-align: center;
	   line-height: 30px;
	   margin-top: 5px;
	   font-size: 60px;
	   padding-top: 45px;
	   margin-left: 35px;
	}
	
	.text3 {
	   margin-left: 30px;
	   font-weight: bold;
	   font-size: 15px;
	}
	
	.icon{
		font-size:15px;
	}
	
	.btn-link{
		padding-bottom: 0px;
		color: gray;
	}
	
	.info{
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
   <!--  <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
		<h1 class="m-0">Dashboard</h1>
          </div>/.col
          <div class="col-s m-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Dashboard v1</li>
            </ol>
          </div>/.col
        </div>/.row
      </div>/.container-fluid
    </div> -->
    <!-- /.content-header -->
    
    <!-- Main content -->
	 <section class="content">
	  	<div class="container-fluid">
	<div class="main-container fade-container">
	    <div id="main">
		  <div class="row">
		    <div class="col-sm-3">					        
			        <h5 class="info"><i class="fas fa-address-card"></i>   내 정보</h5>
		    <div id="profile">
		        <table>
		          <tr>
		          	<td>
			          <div style="flex-grow: 1; text-align: center; ">
			        	<img id="profile-preview"  src="/photo/${member.profile_photo}" alt="" width="200" height="200">
					  </div>
		          	</td>
		          </tr>
		          <tr>
		            <th>이름&nbsp;&nbsp;&nbsp;</th>	            
		            <td>${member.name}</td>
		          </tr>
		          <tr>
		            <th>부서&nbsp;&nbsp;&nbsp;</th>
		            <td>${member.dept_name}</td>
		          </tr>	   
		          <tr>
		            <th>직급&nbsp;&nbsp;&nbsp;</th>
		            <td>${member.position_name}</td>
		          </tr>	   
		          <tr>
		            <th>전화번호&nbsp;&nbsp;&nbsp;</th>
		            <td>${member.phone}</td>
		          </tr>	   
		          <tr>
		            <th>내선번호&nbsp;&nbsp;&nbsp;</th>
		            <td>${member.tel}</td>
		          </tr>	   
		          <tr>
		            <th>이메일&nbsp;&nbsp;&nbsp;</th>
		            <td>${member.email}</td>
		          </tr>
		        </table>
		        <br>
		        <a href="./pwchange">비밀번호 변경</a>
		      </div>	
		      <br>				  
			          <h5 class="info"><i class="fas fa-address-book"></i>   내 연차정보</h5>
		          <div id="myAnnual">
		               <div class="circle-container">
		                  <div class="circle">
		                     <span class="text">총연차</span> <span class="number">${Annaul.annual}</span>
		                  </div>
		               </div>
		                  <div class="circle-container2">
							  <div class="circle2">
							    <span class="text2">사용연차</span>
							    <span class="number2">${Annaul.useAnnual}</span>
							  </div>
							  <div class="circle2">
							    <span class="text3">남은연차</span>
							    <span class="number3">${Annaul.remainingAnnual}</span>
							  </div>
						</div>
			       </div>

		    </div>
		    <div class="col-sm-8">
		        <div class="col-sm-12">			           
		          	   <h5 class="long"><i class="far fa-folder-open"></i>   진행중인 프로젝트 <button class="btn btn-link" style="float: right;" onclick="window.location.href='/projectList.go';">more+</button></h5>
		          	   
		          <div id="myProject">
		            <table id="example1" class="table table-bordered table-striped">
		              <thead>
		                <tr>
		                  <th>프로젝트명</th>
		                  <th>프로젝트 담당</th>
		                  <th>현장 관리자</th>
		                  <th>프로젝트 일정</th>	
		                </tr>
		              </thead>
		              <tbody id="myProjectlist">

		              </tbody>
		            </table>
		          </div>
		        </div>
		        <br>
		        <br>
		        <div class="col-sm-12">			            
			            <h5 class="long"><i class="far fa-keyboard"></i>   내 결재함 <button class="btn btn-link" style="float: right;" onclick="window.location.href='/paymentList.go';">more+</button></h5>
			           
		          <div id="myPayment">
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
		              <tbody id="myPaymentlist">
		              </tbody>
		            </table>
		          </div>
		        </div>
		        <br>
		      <div class="row">
		        <div class="col-sm-6">			           
			            <h5 class="long"><i class="far fa-sticky-note"></i>   공지사항 <button class="btn btn-link" style="float: right;" onclick="window.location.href='/informList.go';">more+</button></h5>
			             
		          <div id="inform">
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
		        <div class="col-sm-6">						          
		            	<h5 class="long" style="margin-left: 70px;"><i class="far fa-envelope"></i>   메일함 <button class="btn btn-link" style="float: right;" onclick="window.location.href='/inBox.go';">more+</button></h5> 
		            	
		          <div id="myMail">
		            <table id="example1" class="table table-bordered table-striped">
		              <thead>
		                <tr>
		                  <th>부서/직급</th>
		                  <th>보낸 사람</th>
		                  <th>제목</th>
		                  <th>보낸 일자</th>	
		                </tr>
		              </thead>
		              <tbody id="myMaillist">
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

var showPage = 1;

informlistCall(showPage);
myMaillistCall(showPage);
myPaymentlistCall(showPage);
myProjectlistCall(showPage);


function informlistCall(cnt){
	
  	var cnt = 4;
   $.ajax({
      type:'post',
      url:'/mainInformList.ajax',
      data:{
    	  'cnt': cnt
      },
      dataType:'json',           
      success:function(data){
    	 console.log("success");
         console.log(data);
         informlistPrint(data.informList);
   
      },
      error:function(e){
			console.log("Error");
      }
});
}

function informlistPrint(informList) {
	  console.log("informlistPrint Call");
	  var content = '';

	  if (informList && Array.isArray(informList) && informList.length > 0) {
		  informList.forEach(function (item, informList) {
			  var subject = item.subject;
		      if (subject.length > 10) {
		    	  subject = subject.substring(0, 7) + '...';
		  }
			
	      content += '<tr>';
	      content += '<td>' + item.name + '</td>';
	      content += '<td>' + subject + '</td>';
	      content += '<td>' + item.writeTime + '</td>';
	      content += '</tr>';
	    });
	  } else {
	  }

	  $('#informList').empty();
	  $('#informList').append(content);
	}
	
	
	
	
function myMaillistCall(cnt){
	
  	var cnt = 4;
   $.ajax({
      type:'post',
      url:'/mainmyMaillistCall.ajax',
      data:{
    	  'cnt': cnt
      },
      dataType:'json',           
      success:function(data){
    	 console.log("success");
         console.log(data);
         myMaillistPrint(data.myMaillist);
   
      },
      error:function(e){
			console.log("Error");
      }
});
}

function myMaillistPrint(myMaillist) {
	  console.log("myMaillistPrint Call");
	  var content = '';

	  if (myMaillist && Array.isArray(myMaillist) && myMaillist.length > 0) {
		    myMaillist.forEach(function (item, myMaillist) {
		      var mailSubject = item.mailSubject;
	      if (mailSubject.length > 10) {
	        mailSubject = mailSubject.substring(0, 7) + '...';
		  }
			
	      content += '<tr>';
	      content += '<td>' + item.dept_name + '/' + item.position_name + '</td>';
	      content += '<td>' + item.name + '</td>';
	      content += '<td>' + mailSubject + '</td>';
	      content += '<td>' + item.writeTime + '</td>';
	      content += '</tr>';
	    });
	  } else {
		  content += '<tr>';
		  content += '<td colspan="4" style="text-align: center;">받은 메일이 없습니다.</td>';
		  content += '</tr>';
	  }

	  $('#myMaillist').empty();
	  $('#myMaillist').append(content);
	}
	
	
	
	
	
function myPaymentlistCall(cnt){
	
  	var cnt = 4;
   $.ajax({
      type:'post',
      url:'/myPaymentlistCall.ajax',
      data:{
    	  'cnt': cnt
      },
      dataType:'json',           
      success:function(data){
    	 console.log("success");
         console.log(data);
         myPaymentlistPrint(data.myPaymentlist);
   
      },
      error:function(e){
			console.log("Error");
      }
});
}

function myPaymentlistPrint(myPaymentlist) {
	  console.log("myMaillistPrint Call");
	  var content = '';

	  if (myPaymentlist && Array.isArray(myPaymentlist) && myPaymentlist.length > 0) {
		  myPaymentlist.forEach(function (item, myPaymentlist) {
			  var paySubject = item.paySubject;
		      if (paySubject.length > 15) {
		    	  paySubject = paySubject.substring(0, 12) + '...';
		  }
			
	      content += '<tr>';
	      content += '<td>' + item.limit_date + '</td>';
	      content += '<td>' + item.form_sort + '</td>';
	      content += '<td>' + item.paySubject+ '</td>';
	      content += '<td>' + item.document_id + '</td>';
	      content += '<td>' + item.state + '</td>';
	      content += '</tr>';
	    });
	  } else {
		  content += '<tr>';
		  content += '<td colspan="5" style="text-align: center;">신청한 결재가 없습니다.</td>';
		  content += '</tr>';
	  }

	  $('#myPaymentlist').empty();
	  $('#myPaymentlist').append(content);
	}
	
	
function myProjectlistCall(cnt){
	
  	var cnt = 4;
   $.ajax({
      type:'post',
      url:'/myProjectlistCall.ajax',
      data:{
    	  'cnt': cnt
      },
      dataType:'json',           
      success:function(data){
    	 console.log("success");
         console.log(data);
         myProjectlistPrint(data.myProjectlist);
   
      },
      error:function(e){
			console.log("Error");
      }
});
}

function myProjectlistPrint(myProjectlist) {
	  console.log("myProjectlist Call");
	  var content = '';

	  if (myProjectlist && Array.isArray(myProjectlist) && myProjectlist.length > 0) {
		  myProjectlist.forEach(function (item, myProjectlist) {
			  var project_name = item.project_name;
		      if (project_name.length > 15) {
		    	  project_name = project_name.substring(0, 12) + '...';
		  }
			  
			
	      content += '<tr>';
	      content += '<td>' + item.project_name + '</td>';
	      content += '<td>' + item.project_manager + '</td>';
	      content += '<td>' + item.field_manager + '</td>';
	      content += '<td>' + item.start_date + '~' + item.end_date + '</td>';
	      content += '</tr>';
	    });
	  } else {
		  content += '<tr>';
		  content += '<td colspan="4" style="text-align: center;">진행중인 프로젝트가 없습니다.</td>';
		  content += '</tr>';
	  }

	  $('#myProjectlist').empty();
	  $('#myProjectlist').append(content);
	}
	
</script>
</html>