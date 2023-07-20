<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


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
	background-color: red;
	border: 1px solid red;
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

#employeeJoin {
	background-color: #91bdce;
	border: 3px solid #91bdce;
	width: 50px;
	height: 30px;
	border-radius: 3px;
	color: white;
	float: right; /* 오른쪽으로 이동 */
	margin-bottom: 15px
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

#img {
	vertical-align: middle;
	border-style: none;
	width: 150px;
	height: 90px;
	float: left;
}

.room p {
	color: #333;
	font-size: 16px;
	margin-top: 10px;
	margin-right: 459px;
}

#del {
	float: left;
}

#upload {
	background-color: #91bdce;
	border: 3px solid #91bdce;
	width: 70px;
	height: 40px;
	border-radius: 3px;
	color: white;
	float: right;
	height: 40px;
}

.subject {
	color: black;
	text-decoration: none;
	background-color: transparent;
}

modal-content {
	width: 500px;
	height: 600px;
}

.modalinput {
	width: 300px;
}

#previewImage {
	width: 300px;
	height: 100px;
}

table {
	border-collapse: collapse;
	width: 100%;
}

tr {
	margin-bottom: 10px;
}

th, td {
	padding: 8px;
	border: 1px solid #ddd;
	text-align: left;
}

#delbutton {
	background-color: #f82a2aa3;
	border: 1px solid #f82a2aa3;
	font-weight: bold;
	color: white;
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
							<h1 class="m-0">
								<b><a href="/MeetingRoomList.go" class="subject">회의실 관리</a></b>
								| <a href="/ReservationList.go" class="subject">예약 관리</a>
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


				<div class="mrList">
					<button type="button" class="btn btn-default" data-toggle="modal"
						data-target="#modal-default" id="upload">등록</button>
					<table>
						<tr>
							<td><select id="opt" name="select">
									<!-- <option value="default">조건</option> -->
									<option value="mrName">회의실명</option>
									<option value="location">위치</option>
									<option value="capacity">수용인원</option>
							</select> <!-- <select id="adminProcess">
									<option value="default">관리자 여부</option>
									<option value="false">사원</option>
									<option value="true">관리자</option>
							</select>  --> <input type="text" id="keyword"
								placeholder="내용을 입력 해 주세요.">
								<button onclick="opt()" id="searchButton">검색</button></td>
						</tr>
					</table>
					<table id="example1" class="table table-bordered table-striped">
						<colgroup>
							<col width="5%" />
							<col width="20%" />
							<col width="20%" />
							<col width="20%" />
							<col width="20%" />
							<col width="15%" />
						</colgroup>
						<thead>
							<tr id="thead" style="text-align: center">
								<!-- <th>번호</th> -->
								<th><input type="checkbox" id="all" /></th>
								<th>사진</th>
								<th>회의실명</th>
								<th>수용인원</th>
								<th>위치</th>
								<th>등록일자</th>
							</tr>
						</thead>
						<tbody id="mrList" style="text-align: center">
							<!-- 리스트가 출력될 영역 -->
						</tbody>
						<tr>
							<td colspan="6" id="paging">
								<!-- <button type="button" class="btn btn-danger" onclick="del()"
									id="del">삭제</button> -->
								<button type="button" class="btn btn-delete" data-toggle="modal"
									data-target="#modal-delete" id="delbutton">삭제</button>
								<div class="container">
									<nav aria-label="Page navigation" style="text-align: center">

										<ul class="pagination" id="pagination"></ul>
									</nav>
								</div>
							</td>
						</tr>
					</table>

				</div>




				<div class="modal fade" id="modal-default">
					<div class="modal-dialog">
						<div class="modal-content" style="margin-top: 172px;">
							<div class="modal-header">
								<h4 class="modal-title">신규 회의실 등록</h4>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form action="creatingMR.do" method="post"
									enctype="multipart/form-data">
									<table>
										<tr>
											<th>회의실 이름</th>
										</tr>
										<tr>
											<td><input type="text" name="room_name" id="room_name"
												value="" placeholder="회의실 이름을 입력하세요" class="modalinput" /></td>
										</tr>
										<tr>
											<th>수용인원</th>
										</tr>
										<tr>
											<td>
												<!-- <input type="text" name="Capacity" value=""
												placeholder="수용인원을 입력하세요" class="modalinput" /> --> <select
												id="opt" name="Capacity" class="modalinput">
													<!-- <option value="default">조건</option> -->
													<option value="4">4</option>
													<option value="6">6</option>
													<option value="8">8</option>
													<option value="10">10</option>
													<option value="12">12</option>
													<option value="14">14</option>
													<option value="16">16</option>
											</select>
											</td>
										</tr>
										<tr>
											<th>회의실 위치</th>
										</tr>
										<tr>
											<td><input type="text" name="location" id="location"
												value="" placeholder="회의실 위치를 입력하세요" class="modalinput" /></td>
										</tr>
										<tr>
											<th>회의실 대표 이미지</th>
										</tr>
										<tr>
											<td><input type="file" name="mrPhoto" id="mrPhoto"
												value="" accept="image/*"></td>

										</tr>
										<tr>
											<th>미리보기</th>
										</tr>
										<tr>
											<td><img id="previewImage" src="#" alt="미리보기"></td>
										</tr>
									</table>
								</form>
							</div>
							<div class="modal-footer justify-content-between">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">닫기</button>
								<button type="button" class="btn btn-primary" onclick="save()">등록</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->


				<div class="modal fade" id="modal-delete">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">회의실 삭제</h4>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">

								<p>해당 회의실을 삭제하면 복구할 수 없습니다. 정말로 삭제하시겠습니까?</p>
							</div>
							<div class="modal-footer justify-content-between">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">닫기</button>
								<button type="button" class="btn btn-danger" onclick="del()"
									id="del">삭제</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->



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

	function save() {
		console.log('저장');
		if ($('#room_name').val().trim() == "") {
			alert("회의실 이름을 등록해주세요");
		} else if ($('#location').val().trim() == "") {
			alert("회의실 위치를 등록해주세요");
		} else if ($('#mrPhoto').val() == "") {
			alert("사진을 등록해주세요");
		} else {
			/* $('input[name="content"]').val(content); */
			$('form').submit();
		}
	}
	var showPage = 1;
	var cnt = 10;
	var optValue = '';
	var keywordValue = '';

	listCall(showPage);

	console.log("list call");

	function opt() {

		optValue = document.getElementById("opt").value;
		keywordValue = document.getElementById("keyword").value;
		showPage = 1;
		listCall(showPage);
		$('#pagination').twbsPagination('destroy');
	}

	/* $('#searchButton').click(function(){
	 //검색어 확인 
	 searchText = $('#employeeSearch').val();
	 searchType = $('#select-dropdown').val();
	 console.log(searchText,searchType);
	 var pagePerNum = 5;
	 console.log('pagePerNum :'+pagePerNum);
	 listCall(showPage,searchText, searchType, pagePerNum );
	 $('#pagination').twbsPagination('destroy');
	 }); 



	 $('#adminProcess').change(function(){
	 console.log("process change");
	 console.log(adminProcess);
	 adminProcess = $(this).val();
	 listCall(showPage);
	 $('#pagination').twbsPagination('destroy');
	 }); */

	function listCall(page, cnt) {

		var cnt = 8;
		$.ajax({
			type : 'post',
			url : '/mrList2.ajax',
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

	function listPrint(mrList) {
		console.log("listPrint Call");
		var content = '';

		if (mrList.length > 0) {
			mrList
					.forEach(function(dto, idx) {
						content += '<tr>';
						content += '<td><input type="checkbox" value="'+dto.room_id+'"/></td>';
						content += '<td><img id="img" src="/photo/'+dto.new_file_name+'"/></td>';
						content += '<td>' + dto.room_name + '</td>';
						content += '<td>' + dto.capacity + '</td>';
						content += '<td>' + dto.location + '</td>';
						var date = new Date(dto.reg_date);
						content += '<td>' + date.toLocaleDateString('ko-KR')
								+ '</td>'; //en-US 를 ko-KR로 바꿔준다.
						/* content += '<td><a href="/delete.do?room_id='
								+ dto.room_id + '${room_id}">X</a></td>' */
						content += '</tr>';
					});
		} else {
			content += '<tr>';
			content += '<td colspan="6" style="text-align: center;">검색한 정보가 없습니다.</td>';
			content += '</tr>';
		}
		$('#mrList').empty();
		$('#mrList').append(content);
	}

	$('#all').click(function(e) {
		var $chk = $('input[type="checkbox"]');
		console.log($chk);
		if ($(this).is(':checked')) {
			$chk.prop('checked', true);
		} else {
			$chk.prop('checked', false);
		}
	});

	function del() {

		var checkArr = [];

		$('input[type="checkbox"]:checked').each(function(idx, item) {
			if ($(this).val() != 'on') {
				checkArr.push($(this).val());
			}
		});

		console.log(checkArr);
		if (checkArr.length === 0) {
			alert('체크된 항목이 없습니다.');
			$('#modal-delete').modal('hide');
		} else {
			$.ajax({
				type : 'get',
				url : 'mrDelete.ajax',
				data : {
					'mrDelList' : checkArr
				},
				dataType : 'json',
				success : function(data) {
					console.log(data);
					if (data.success) {
						alert(data.msg);
						listCall(showPage);
						location.href = '/MeetingRoomList.go';
					}
				},
				error : function(e) {
					console.log(e);
					alert('해당 회의실에 예약된 정보가 존재합니다 \n 예약정보를 삭제 후 다시 시도해주세요.');
					console.log('삭제 실패!');
				}
			});
		}
	}

	$(document).ready(function() {
		// 파일 선택(input type="file") 요소
		const imageInput = $('#mrPhoto');
		// 이미지를 표시할 태그
		const previewImage = $('#previewImage');

		// 파일 선택 이벤트 감지
		imageInput.on('change', function() {
			// 선택한 파일
			const file = imageInput[0].files[0];

			if (file) {
				// FileReader 객체를 사용하여 파일을 읽습니다.
				const reader = new FileReader();

				// 파일을 읽은 후에 발생하는 이벤트
				reader.onload = function(e) {
					// 읽은 이미지 데이터를 미리보기로 표시
					previewImage.attr('src', e.target.result);
				}

				// 파일을 읽습니다.
				reader.readAsDataURL(file);
			}
		});
	});

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