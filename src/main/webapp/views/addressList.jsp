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

.m-0 {
	color: #91bdce;
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
/* 
.bookmarked {
  background-color: yellow; /* 원하는 색상으로 설정하세요 */
}
*
/
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
								사내연락처</a></b>
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


				<div class="adList">
					<!-- <button type="button" class="btn btn-default" data-toggle="modal"
						data-target="#modal-default" id="upload">등록</button> -->
					<table>
						<tr>
							<td><select id="opt" name="select">
									<!-- <option value="default">조건</option> -->
									<option value="name">이름</option>
									<option value="position">직급</option>
									<option value="dept">부서명</option>
							</select> <select id="bookmark">
									<option value="">전체보기</option>									
									<option value="${sessionScope.loginId}">즐겨찾기</option>
							</select> <input type="text" id="keyword" placeholder="내용을 입력 해 주세요.">
								<button onclick="opt()" id="searchButton">검색</button></td>
						</tr>
					</table>
					<table id="example1" class="table table-bordered table-striped">
						<colgroup>
							<col width="10%" />
							<col width="10%" />
							<col width="10%" />
							<col width="10%" />
							<col width="20%" />
							<col width="20%" />
							<col width="20%" />
						</colgroup>
						<thead>
							<tr id="thead" style="text-align: center">
								<th>
									<!-- <input type="checkbox" id="all" /> -->즐겨찾기
								</th>
								<th>이름</th>
								<th>직급</th>
								<th>부서명</th>
								<th>연락처</th>
								<th>이메일</th>
								<th>내선번호</th>
							</tr>
						</thead>
						<tbody id="adList" style="text-align: center">
							<!-- 리스트가 출력될 영역 -->
						</tbody>
						<tr>
							<td colspan="7" id="paging">
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

	$('#bookmark').change(function() {
		console.log("bookmark change");
		bookmark = $(this).val();
		console.log(bookmark);
		listCall(showPage, bookmark);
		$('#pagination').twbsPagination('destroy');
	});

	function listCall(page, cnt) {

		var cnt = 10;
		$.ajax({
			type : 'post',
			url : '/adList.ajax',
			data : {
				'page' : page,
				'cnt' : cnt,
				'opt' : optValue,
				'keyword' : keywordValue,
				'bookmark' : bookmark
			},
			dataType : 'json',
			success : function(data) {
				console.log("success");
				console.log(data.pages);
				console.log(data.list);
				console.log(data.bmList);
				listPrint(data.list, data.bmList);

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

	function listPrint(adList, bmList) {
		console.log("listPrint Call");
		var content = '';

		if (adList.length > 0) {
			adList
					.forEach(function(dto, idx) {
						content += '<tr>';

						var buttonClass = isBookmarked(dto.member_id, bmList) ? 'bookmark bookmarked'
								: 'bookmark';
						var iconClass = isBookmarked(dto.member_id, bmList) ? 'fas fa-star'
								: 'far fa-star';
						content += '<td><button class="' + buttonClass + '" value="' + dto.member_id + '"><i class="' + iconClass + '"></i></button></td>';
						content += '<td>' + dto.name + '</td>';
						content += '<td>' + dto.position_name + '</td>';
						content += '<td>' + dto.dept_name + '</td>';
						content += '<td>' + dto.phone + '</td>';
						content += '<td>' + dto.email + '</td>';
						content += '<td>' + dto.tel + '</td>';
						content += '</tr>';
					});

		} else {
			content += '<tr>';
			content += '<td colspan="7" style="text-align: center;">검색한 정보가 없습니다.</td>';
			content += '</tr>';
		}
		$('#adList').empty();
		$('#adList').append(content);

		bookmarkClick();
	}

	function isBookmarked(memberId, bmList) {
		for (var i = 0; i < bmList.length; i++) {
			if (bmList[i] === memberId) {
				return true;
			}
		}
		return false;
	}

	function bookmarkClick() {

		$('.bookmark.bookmarked').click(function(e) {
			var bookmarkValue = $(this).val();
			console.log(bookmarkValue);
			console.log('즐겨찾기 해제');

			$.ajax({
				type : 'post',
				url : '/bookmarkDel.ajax',
				data : {
					'id' : bookmarkValue,
				},
				dataType : 'json',
				success : function(data) {
					console.log("success");
					console.log(data.data);
					/* alert('즐겨찾기가 해제되었습니다.'); */
					listCall(showPage);
					/* location.href='/address.go';	 */
				},
				error : function(e) {
					console.log("Error");
				}
			});

		});

		$('.bookmark:not(.bookmarked)').click(function(e) {
			var bookmarkValue = $(this).val();
			console.log(bookmarkValue);
			console.log('즐겨찾기 등록');
			$.ajax({
				type : 'post',
				url : '/bookmark.ajax',
				data : {
					'id' : bookmarkValue,
				},
				dataType : 'json',
				success : function(data) {
					console.log("success");
					console.log(data.data);
					/* alert('즐겨찾기가 등록되었습니다.'); */
					listCall(showPage);
					/* location.href='/address.go';	 */
				},
				error : function(e) {
					console.log("Error");
				}
			});

		});
	};

	/* 	$('#all').click(function(e) {
	 var $chk = $('input[type="checkbox"]');
	 console.log($chk);
	 if ($(this).is(':checked')) {
	 $chk.prop('checked', true);
	 } else {
	 $chk.prop('checked', false);
	 }
	 }); */

	/* 	function del() {

	 var checkArr = [];

	 $('input[type="checkbox"]:checked').each(function(idx, item) {
	 if ($(this).val() != 'on') {
	 checkArr.push($(this).val());
	 }
	 });

	 console.log(checkArr);

	 $.ajax({
	 type : 'get',
	 url : 'rvDelete.ajax',
	 data : {
	 'rvDelList' : checkArr
	 },
	 dataType : 'json',
	 success : function(data) {
	 console.log(data);
	 if (data.success) {
	 alert(data.msg);
	 listCall(showPage);
	 }
	 },
	 error : function(e) {
	 console.log(e);
	 }
	 });

	 } */

	/*    if (employeeList && Array.isArray(employeeList) && employeeList.length > 0) {
	      employeeList.forEach(function (item, employeeList) {
	         
	       var detpNames = {
	             HRdept : "인사",
	             CTdept : "시공",
	             DGdept : "설계"
	       };
	       
	       var positionNames = {
	             art_01 : "사원",
	             art_02 : "주임",
	             art_03 : "대리",
	             art_04 : "과장",
	             art_05 : "차장",
	             art_06 : "부장"
	       };
	       
	       var processNames = {
	             false : "사원",
	             true : "관리자"
	       };
	       
	       var detpName = detpNames[item.dept_code] || item.categoryCode;
	       var positionName = positionNames[item.position_code] || item.categoryCode;
	       var processName = processNames[item.admin] || item.inqProcess;
	       
	       content += '<tr>';
	       content += '<td>' + item.name + '</td>';
	       content += '<td>' + detpName + '</td>';
	       content += '<td>' + positionName + '</td>';
	       content += '<td>' + item.member_id + '</td>';
	       content += '<td>' + processName + '</td>';
	       content += '<td><button type="button" class="btn btn-default btn-icon btn-admin ' + (item.admin ? 'btn-danger' : 'btn-primary') + '" data-toggle="modal" data-target="#modal-admin" data-id="' + item.member_id + '" data-admin="' + item.admin + '">' + (item.admin ? '권한 해제' : '권한 부여') + '</button></td>';
	       content += '</tr>';
	     });
	   } else {
	     content += '<tr>';
	     content += '<td colspan="6" style="text-align: center;">검색한 정보가 없습니다.</td>';
	     content += '</tr>';
	   } */

	/* 	   
	 //관리자 권한 부여 모달 열기
	 $(document).on('click', '.btn-admin', function() {
	 var memberId = $(this).data('id');
	 var adminValue = $(this).data('admin');
	 console.log(memberId);
	 $('#modal-admin').find('.member_id').text(memberId);

	 // 설정된 권한 동작 텍스트 변경
	 if (adminValue) {
	 $('#modal-admin').find('.admin-action').text('해제');
	 } else {
	 $('#modal-admin').find('.admin-action').text('부여');
	 }

	 // 모달 열기
	 $('#modal-admin').modal('show');
	 });

	 /* 관리자 권한 */
	/* $(document).ready(function() {
		// 버튼 클릭 시
		$('.btn-admin').click(function() {

			var memberId = $('.member_id').text();
			var adminValue = $(this).data('admin');

			if (adminValue === 0) {
				adminValue = '1';
			} else {
				adminValue = '0';
			}

			console.log(memberId, adminValue);
			// 서버로 요청 전송
			$.ajax({
				type : 'POST',
				url : '/admin.ajax',
				data : {
					memberId : memberId,
					adminValue : adminValue
				},
				success : function(data) {
					// 성공 시
					alert('관리자 권한 처리에 성공했습니다.');
					location.reload(); // 페이지 새로고침
				},
				error : function(error) {
					// 실패 시
					alert('관리자 권한 처리에 실패했습니다.');
					console.log(error);
				}
			});

			// 모달창 닫기
			$('#modal-admin').modal('hide');
		});
	}); */
</script>

</html>