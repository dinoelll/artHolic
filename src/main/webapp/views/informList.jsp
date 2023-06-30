<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ArtHolic</title>


 <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- SweetAlert2 -->
  <link rel="stylesheet" href="plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
  <!-- Toastr -->
  <link rel="stylesheet" href="plugins/toastr/toastr.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">

<!-- --------------------------------------------------------------------------------------------------- -->


	<!-- jQuery -->
	<script src="plugins/jquery/jquery.min.js"></script>
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
<!-- fullCalendar (캘린더) 
<link rel="stylesheet" href="plugins/fullcalendar/main.css">-->



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
							<h1 class="m-0">공지사항</h1>
						</div>
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->


			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<hr>
					<br> <br> <br>
					<table>
						<thead>
							<tr>
								<td colspan="5">
									<select id="opt">
										<option value="subject">제목</option>
										<option value="member_id">작성자</option>
									</select> 
								<input type="text" id="keyword" value=""
									placeholder="검색어를 입력하세요" />
									<button onclick="opt()">검색</button>
									<button onclick="del()" style="float:right;" type="button" class="btn btn-sm btn-primary">삭제</button>
									<button style="float:right;" type="button" onclick="location.href='/informWrite.go'" class="btn btn-sm btn-primary">등록</button>
									<button style="float:right;" type="button" class="btn btn-sm btn-primary">필독삭제</button>
								</td>
							</tr>
							<tr>
								<th><input id="all" type="checkbox" /></th>
								<th>작성자</th>
								<th>제목</th>
								<th>작성일자</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody id="list">
							<!--<c:forEach items="${informList}" var="dto">
								<tr>
									<td><input type="checkbox" value="${dto.board_id}" /></td>
									<th><a href="employeeDetail.go?member_id=${dto.member_id}">${dto.member_id}</a> </th>
									<th><a href="informDetail.do?board_id=${dto.board_id}">${dto.subject}</a></th>
									<td>작성시간</td>
									<th><a href="informDel.do?board_id=${dto.board_id}">삭제</a></th>
								</tr>
							</c:forEach> -->
						</tbody>
						<tr>
							<td colspan="5" id="paging">
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
	<!-- SweetAlert2 
	<script src="plugins/sweetalert2/sweetalert2.min.js"></script>-->
	<!-- Toastr -->
	<script src="plugins/toastr/toastr.min.js"></script>

	


</body>
<script>
var showPage = 1; 
var cnt=10;
var optValue ='';
var keywordValue='';

listCall(showPage);

function opt() {
	
	/*
	$('#pagination').twbsPagination({
		totalPages:null //총 페이지 수 
		});
	*/
	  optValue = document.getElementById("opt").value;
	  keywordValue = document.getElementById("keyword").value;
	  showPage = 1;
	  listCall(showPage);
	  $('#pagination').twbsPagination('destroy');
	  }



function listCall(page){
	$.ajax({
		type:'post',
		url:'informList.ajax',
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
			listDraw(data.list);
			
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


function listDraw(list){
	var content = '';
	list.forEach(function(dto,board_id){
		content += '<tr>';
		content += '<td><input type="checkbox" value="'+dto.board_id+'" /></td>';
		content += '<th><a href="employeeDetail.go?member_id='+dto.member_id+'">'+dto.member_id+'</a> </th>';
		content += '<th><a href="informDetail.do?board_id='+dto.board_id+'">'+dto.subject+'</a></th>';
		content += '<td>작성시간</td>';
		content += '<th><a href="informDel.do?board_id='+dto.board_id+'">삭제</a></th>';		
		content += '</tr>';
	});
	$('#list').empty();
	$('#list').append(content);
}



$('#all').click(function(e){	
	var $chk = $('input[type="checkbox"]');
	console.log($chk);
	if($(this).is(':checked')){
		$chk.prop('checked',true);
	}else{
		$chk.prop('checked',false);
	}	
});

function del(){
	
	var checkArr = [];
	
	$('input[type="checkbox"]:checked').each(function(idx,item){		
		//checkbox 에 value 를 지정하지 않으면 기본값을 on 으로 스스로 지정한다.
		if($(this).val()!='on'){
			//console.log(idx,$(this).val());
			checkArr.push($(this).val());
		}	
	});
	
	console.log(checkArr);
		
	$.ajax({
		type:'get',
		url:'informDel.ajax',
		data:{'delList':checkArr},
		dataType:'json',
		success:function(data){
			location.href="/informList.go";
		},
		error:function(e){
			console.log(e);
		}		
	});
	
}





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