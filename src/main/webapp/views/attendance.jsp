<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>ArtHolic</title>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


<!-- Font Awesome CSS 파일을 추가합니다.  별 모양-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />


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

<link rel="stylesheet"
	href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet"
	href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet"
	href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">

<script src="/js/jquery.twbsPagination.js" type="text/javascript"></script>
<!-- 
<link rel="stylesheet" href="plugins/fullcalendar/main.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->


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

.btn-primary {
	background-color: #91bdce;
	border: 1px solid #91bdce;
	font-weight: bold;
}

.btn-danger {
	background-color: #f82a2aa3;
	border: 1px solid #f82a2aa3;
	font-weight: bold;
	color: white;
}

.modal-title {
	margin-left: 170px;
}

.pagination {
	margin-left: 450px;
}

#select-dropdown {
	width: 130px;
	height: 30px;
	margin-bottom: 15px;
}

#adminProcess {
	width: 110px;
	height: 30px;
	margin-bottom: 15px;
}

#employeeSearch {
	width: 200px;
	height: 30px;
	margin-bottom: 15px
}

#searchButton {
	background-color: #91bdce;
	border: 3px solid #91bdce;
	width: 50px;
	height: 30px;
	border-radius: 3px;
	color: white;
}

#companyWrite {
	background-color: #91bdce;
	border: 3px solid #91bdce;
	width: 50px;
	height: 30px;
	border-radius: 3px;
	color: white;
	margin-bottom: 15px;
	margin-left: 1210px;
}

.input {
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 5px;
	background-color: white;
	padding-top: 10px;
	padding-bottom: 10px;
	margin: 15px;
	width: 450px;
}

.btn-update {
	background-color: #f82a2aa3;
	border: 1px solid #f82a2aa3;
	font-weight: bold;
	color: white;
	padding-bottom: 0px;
	padding-top: 0px;
	width: 58px;
}



.bookmark {
	display: inline-block;
	background-color: transparent;
	border: none;
	outline: none;
	cursor: pointer;
	font-size: 0;
}

.bookmark i {
	font-size: 16px;
}

/* #memberExp {
	background-color: yellow;
	width: 60%;
	height: 150px;
	margin-left: 400;
} */
.rectangle {
	display: flex;
	align-items: center;
	width: 60%;
	height: 180px;
	background-color: #f0f0f0;
	/* background-color: #f5f5f5;  */
	padding: 10px;
	margin-left: 350px;
	border: 1px;
}

#text1 {
	margin-left: 400px;
}

.rectangle img {
	width: 150px; /* 사진 크기 조정 */
	height: 150px;
	object-fit: cover;
	border-radius: 50%;
	margin-right: 10px;
}

.info {
	display: flex;
	flex-direction: column;
	margin-right: 20px;
	margin-left: 50px;
}

.names {
	font-weight: bold;
	font-size: 26px;
}

.position, .department {
	font-size: 20px;
}

.circle-container {
	display: flex;
	align-items: center;
	margin-left: 150px;
}

.circle {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-right: 10px;
}

.text {
	font-size: 12px;
}

.number {
	display: inline-block;
	width: 100px;
	height: 100px;
	background-color: #555;
	color: #fff;
	border-radius: 50%;
	text-align: center;
	line-height: 30px;
	margin-top: 5px;
	font-size: 50px;
	padding-top: 30px;
	margin-left: 50px;
}

.text {
	margin-left: 50px;
	font-weight: bold;
	font-size: 15px;
}

select {
	width: 80px;
	height: 30px;
}

/* img {
	width: 100px;
} */

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
							<h1 class="m-0">
								근태관리</a></b>
							</h1>
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

			<!-- Main content -->
			<section class="content">

				<div class="rectangle">
					<p id="text1">회원의 이름을 클릭해주세요.</p>


				</div>



				<div class="adList">
					<!-- <button type="button" class="btn btn-default" data-toggle="modal"
						data-target="#modal-default" id="upload">등록</button> -->

					<div id="search">
						<select id="opt" name="select">
							<!-- <option value="default">조건</option> -->
							<option value="name">이름</option>
							<option value="position">직급</option>
							<option value="dept">부서명</option>
						</select> <input type="text" id="keyword" placeholder="내용을 입력 해 주세요."
							style="margin-left: 20px; margin-right: 20px; width: 220px;">
						<button onclick="opt()" id="searchButton">검색</button>
					</div>

					<table id="example1" class="table table-bordered table-striped">
						<colgroup>
							<col width="10%" />
							<col width="10%" />
							<col width="10%" />
							<col width="20%" />
							<col width="20%" />
							<col width="20%" />
						</colgroup>
						<thead>
							<tr id="thead" style="text-align: center">
								<th>이름</th>
								<th>직급</th>
								<th>부서명</th>
								<th>종류</th>
								<th>시작일</th>
								<th>종료일</th>
							</tr>
						</thead>
						<tbody id="atList" style="text-align: center">
							<!-- 리스트가 출력될 영역 -->
						</tbody>
						<tr>
							<td colspan="6" id="paging">
								<!-- <button type="button" class="btn btn-danger" onclick="del()"
									id="del">취소</button> -->
								<div class="container">
									<nav aria-label="Page navigation" style="text-align: center">

										<ul class="pagination" id="pagination"></ul>
									</nav>
								</div>
							</td>
						</tr>
					</table>

				</div>





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
	<!-- DataTables  & Plugins -->
	<script src="plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
	<script src="plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
	<script src="plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>

	<script src="plugins/datatables-buttons/js/buttons.print.min.js"></script>
	<script src="plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
</body>
<script>
	var msg = "${msg}";
	if (msg != "") {
		alert(msg);

	}

	var showPage = 1;
	var cnt = 10;
	var optValue = '';
	var keywordValue = '';
	var bookmark = '';

	listCall(showPage);

	console.log("list call");

	function opt() {

		optValue = document.getElementById("opt").value;
		keywordValue = document.getElementById("keyword").value;
		showPage = 1;
		listCall(showPage);
		$('#pagination').twbsPagination('destroy');
	}

	/* 	 $('#searchButton').click(function(){
	 //검색어 확인 
	 searchText = $('#employeeSearch').val();
	 searchType = $('#select-dropdown').val();
	 console.log(searchText,searchType);
	 var pagePerNum = 5;
	 console.log('pagePerNum :'+pagePerNum);
	 listCall(showPage,searchText, searchType, pagePerNum );
	 $('#pagination').twbsPagination('destroy');
	 });  */

	function listCall(page, cnt) {

		var cnt = 10;
		$.ajax({
			type : 'post',
			url : '/atList.ajax',
			data : {
				'page' : page,
				'cnt' : cnt,
				'opt' : optValue,
				'keyword' : keywordValue
			},
			dataType : 'json',
			success : function(data) {
				console.log("success");
				console.log(data.pages);
				console.log(data.list);
				listPrint(data.list);

				// Paging Plugin (j-query의 기본기능을 가지고 만들었기 때문에  plugin)
				$('#pagination').twbsPagination({
					startPage : data.currPage, // 시작 페이지
					totalPages : data.pages,// 총 페이지 수 
					visiblePages : 5,// 보여줄 페이지
					next : '<span style="color: #91bdce;">></span>',
					last : '<span style="color: #91bdce;">>></span>',
					first : '<span style="color: #91bdce;"><<</span>',
					prev : '<span style="color: #91bdce;"><</span>',
					onPageClick : function(event, page) { // 페이지 클릭시 동작되는 (콜백)함수
						console.log(page, showPage);
						if (page != showPage) {
							showPage = page;
							listCall(page, cnt);

						}
					}
				})

			},
			error : function(e) {
				console.log("Error");
			}
		});
	}

	function listPrint(atList) {
		console.log("listPrint Call");
		var content = '';

		if (atList.length > 0) {
			atList.forEach(function(dto, idx) {
				content += '<tr>';
				content += '<td><span class="name" id="' + dto.member_id + '">'
						+ dto.name + '</span></td>';
				content += '<td>' + dto.position_name + '</td>';
				content += '<td>' + dto.dept_name + '</td>';
				content += '<td>' + dto.vacation_kind + '</td>';
				content += '<td>' + dto.start_date + '</td>';
				content += '<td>' + dto.end_date + '</td>';
				content += '</tr>';
			});

		} else {
			content += '<tr>';
			content += '<td colspan="6" style="text-align: center;">검색한 정보가 없습니다.</td>';
			content += '</tr>';
		}
		$('#atList').empty();
		$('#atList').append(content);

	}

	$(document).ready(function() {
		$(document).on("click", ".name", function() {
			var clickedId = $(this).prop('id');
			console.log(clickedId);
			$.ajax({
				url : "/attendance.ajax",
				type : "POST",
				data : {
					member_id : clickedId
				},
				dataType : "json",
				success : function(response) {
					console.log(response);
					createRectangle(response.attendance);
				},
				error : function(xhr, status, error) {
					console.error(error);
				}
			});
		});
	});

	function createRectangle(attendance) {
		var rectangleHTML =
		/*   '<div class="rectangle">' + */
		'<img id="img" src="/photo/' +
		      attendance.profile_photo +
		      '" />'
				+ '<div class="info">' + '<span class="names">'
				+ attendance.name
				+ '</span>'
				+ '<span class="position">'
				+ attendance.position_name
				+ '</span>'
				+ '<span class="department">'
				+ attendance.dept_name
				+ '팀</span>'
				+ '</div>'
				+ '<div class="circle-container">'
				+ '<div class="circle">'
				+ '<span class="text">총연차</span>'
				+ '<span class="number">'
				+ attendance.annual
				+ '</span>'
				+ '</div>'
				+ '<div class="circle">'
				+ '<span class="text">사용연차</span>'
				+ '<span class="number">'
				+ attendance.useAnnual
				+ '</span>'
				+ '</div>'
				+ '<div class="circle">'
				+ '<span class="text">남은연차</span>'
				+ '<span class="number">'
				+ attendance.remainingAnnual
				+ '</span>' + '</div>' + '</div>';
		/* + '</div>'; */
		$('.rectangle').empty();
		$(".rectangle").append(rectangleHTML);
	}
</script>

</html>