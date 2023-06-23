<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>spring boot</title>


 <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- SweetAlert2 -->
  <link rel="stylesheet" href="../../plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
  <!-- Toastr -->
  <link rel="stylesheet" href="../../plugins/toastr/toastr.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">

<!-- --------------------------------------------------------------------------------------------------- -->

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
.btn-default {
    background-color: #f8f9fa;
    border-color: #ddd;
    color: #444;
    float: right;
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
			
			
			
			


				<div class="modal fade" id="modal-default">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">프로젝트 등록</h4>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<table>
												<tr>
													<th>프로젝트명</th>
													<td><input type="text" id="" value=""placeholder="프로젝트명을 입력하세요" /></td>
												</tr>
												<tr>
													<th>프로젝트담당자</th>
													<td><input type="text" id="" value=""placeholder="담당자명을 입력하세요" /></td>
												</tr>
												<tr>
													<th>연락처</th>
													<td><input type="text" id="" value=""placeholder="연락처를 입력하세요" /></td>
												</tr>
											
											</table>
											<hr>
											<h2>일정</h2>
											<table>
												<tr>
													<th>시작일</th>
													<td><input type="text" id="" value=""placeholder="시작일을 입력하세요" /></td>
												</tr>
												<tr>
													<th>종료일</th>
													<td><input type="text" id="" value=""placeholder="종료일을 입력하세요" /></td>
												</tr>
											</table>
							</div>
							<div class="modal-footer justify-content-between">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">닫기</button>
								<button type="button" class="btn btn-primary">등록</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
			
			
			
			


			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">

					<hr>
					<br> <br> <br>


					<table>
						<thead>
							<tr>
								<td colspan="5"><select id="opt">
										<option value="subject">프로젝트명</option>
										<option value="manager">프로젝트담당자</option>
								</select> <input type="text" id="keyword" value=""
									placeholder="검색어를 입력하세요" />
									<button onclick=opt()>검색</button>
									<button type="button" class="btn btn-default"
										data-toggle="modal" data-target="#modal-default">
										등록</button>	
								</td>
							</tr>
							<tr>
								<th>프로젝트명</th>
								<th>프로젝트 담당자</th>
								<th>프로젝트 일정</th>
								<th>담당자 연락처</th>
								<th>진행상태</th>

							</tr>
						</thead>
						<tbody id="list">
							<!-- 리스트가 출력될 영역 -->
						</tbody>
						<tr>
							<td colspan="6" id="paging">
								<!-- 	플러그인 사용	(twbsPagination)	-->
								<div class="container">
									<nav aria-label="Page navigation" style="text-align: center">
										<ul class="pagination" id="pagination"></ul>
									</nav>
								</div>
							</td>
						</tr>
					</table>





				</div>
				<!-- /.timeline -->

			</section>

			<!-- /.content -->





		</div>
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
	
		<!-- jQuery -->
	<script src="../../plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- SweetAlert2 -->
	<script src="../../plugins/sweetalert2/sweetalert2.min.js"></script>
	<!-- Toastr -->
	<script src="../../plugins/toastr/toastr.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../../dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="../../dist/js/demo.js"></script>
	<!-- Page specific script -->


</body>
<script>
var showPage = 1; 
var cnt=10;
var optValue ='';
var keywordValue='';

function opt() {
	
	$('#pagination').twbsPagination({
		totalPages:null //총 페이지 수 
		});
	
	
	  optValue = document.getElementById("opt").value;
	  keywordValue = document.getElementById("keyword").value;
	  showPage = 1;
	  listCall(showPage);
	  }

listCall(showPage);




function listCall(page){
	$.ajax({
		type:'post',
		url:'list.ajax',
		data:{
			'page':page,
			'cnt':cnt,
			'opt':optValue,
			'keyword':keywordValue	
		},
		dataType:'json',
		success:function(data){
			console.log(data);
			console.log(data.pages);
			listPrint(data.list);
			
			//총 페이지 수
			//현재 페이지
			
			//paging plugin
			$('#pagination').twbsPagination({
				startPage:data.currPage, //시작페이지
				totalPages:data.pages, //총 페이지 수 
				visiblePages:5, //보여줄 페이지 수 [1][2][3][4][5]
				onPageClick:function(event,page){ //페이지 클릭시 동작되는 함수 (콜백)
					console.log(event,page);
					if (page !=  showPage) {
						showPage=page; // 2
						listCall(page);
						
					}
				}
				
			});
					
			
		},	
		error:function(e){
			console.log(e);
		}		
	});
}



/* function listPrint(list) {
	var content = '';
	//java.sql.Date 는 js에서 읽지 못해 밀리세컨드로 반환한다.
	// 해결방법 1. DTO에서 Date를 String으로 반환
	// 해결방법 2. js 에서 변환
	list.forEach(function(dto,idx){
		content +='<tr>';
		content +='<td>'+dto.idx+'</td>';
		content +='<td><a href="detail.do?idx='+dto.idx+'">'+dto.subject+'</a></td>';
		content +='<td>'+dto.user_name+'</td>';
		content +='<td>'+dto.bHit+'</td>';
		var date = new Date(dto.reg_date);
		content +='<td>'+date.toLocaleDateString('ko-KR')+'</td>'; //en-US 를 ko-KR로 바꿔준다.
		content +='</tr>';
	}); */
	
	
/* 	$('#list').empty();
	$('#list').append(content);
}
 */



 const btn = document.getElementById('popupBtn');
 const modal = document.getElementById('modalWrap');
 const closeBtn = document.getElementById('closeBtn');

 btn.onclick = function() {
 	modal.style.display = 'block';
 }
 closeBtn.onclick = function() {
 	modal.style.display = 'none';
 }

 window.onclick = function(event) {
 	if (event.target == modal) {
 		modal.style.display = "none";
 	}
 }


</script>
</html>