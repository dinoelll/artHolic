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
							<h1 class="m-0">회의실 관리</h1>
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
								<h4 class="modal-title">신규 회의실 등록</h4>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<table>
												<tr>
													<th>회의실 이름</th>
													<td><input type="text" id="" value=""placeholder="회의실 이름을 입력하세요" /></td>
												</tr>
												<tr>
													<th>수용인원</th>
													<td><input type="text" id="" value=""placeholder="수용인원을 입력하세요" /></td>
												</tr>
												<tr>
													<th>회의실 위치</th>
													<td><input type="text" id="" value=""placeholder="회의실 위치를 입력하세요" /></td>
												</tr>
												<tr>
													<th>회의실 대표 이미지</th>
													<td>
														<input type="file" id="" value="">
														<button>등록</button>
													</td>
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
								<td colspan="5"><select id="meetingRoomSearch">
										<option value="default">검색조건</option>
										<option value="room_id">회의실명</option>
										<option value="meeting_id">회의명</option>
										<option value="team_member">신청자</option>
								</select> <input type="text" id="searchInput" value=""
									placeholder="검색어를 입력하세요" />
									<button id="searchButton" onclick=opt()>검색</button>
									<button type="button" class="btn btn-default"
										data-toggle="modal" data-target="#modal-default">
										등록</button>	
								</td>
							</tr>
							<tr>
								<th>번호</th>
								<th>회의실명</th>
								<th>수용인원</th>
								<th>위치</th>
								<th>등록일자</th>
							</tr>
						</thead>
						<tbody id="list">
							<!-- 리스트가 출력될 영역 -->
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
    
      
      <jsp:include page="footer.jsp"/>
   
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
var showPage = 1;
var meetingRoomSearch = 'default';
var searchText = 'default';
console.log(meetingRoomSearch);
listCall(showPage);

$('#pagePerNum').change(function(){
	listCall(showPage);
	// 페이지처리 부분이 이미 만들어져 버려서 pagePerNum 이 변경되면 수정이 안된다.
	// 그래서 pagePerNum 이 변경되면 부수고 다시 만들어야 한다.
	$('#pagination').twbsPagination('destroy');
});

//검색어에 따른 출력
$('#searchButton').click(function(){
	   //검색어 확인 
	   searchText = $('#searchInput').val();
	   if(selectedBoardSearch){
	   listCall(showPage);
	   $('#pagination').twbsPagination('destroy');
	   }
	});

// 조건방식 선택에 따른 출력
$('#meetingRoomSearch').change(function(){
    selectedBoardSearch = $(this).val();
});

function listCall(page){
	$.ajax({
		type:'post',
		url:'meetingRoomList.ajax',
		data:{
			'page':page,
			'meetingRoomSearch':meetingRoomSearch,
			'search':searchText,
			'cnt':$('#pagePerNum').val()
		},
		dataType:'json',
		success:function(data){
			console.log(data);
			listPrint(data.list);			
			
			//paging plugin
			$('#pagination').twbsPagination({
	         startPage:data.currPage, // 시작 페이지
	         totalPages:data.pages,// 총 페이지 수 
	         visiblePages:5,// 보여줄 페이지
	         next : '<span style="color: #e9ddc6;">></span>', 
				last : '<span style="color: #e9ddc6;">>></span>',
				first : '<span style="color: #e9ddc6;"><<</span>',
				prev : '<span style="color: #e9ddc6;"><</span>',
	         onPageClick:function(event,page){ // 페이지 클릭시 동작되는 (콜백)함수
	            console.log(page,showPage);
	            if(page != showPage){
	               showPage=page;
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


function listPrint(list){
	var content;
	if (list.length > 0){
		
		list.forEach(function(item,boardNum){
			content += '<tr>';
			content += '<input type="checkbox" id="MRcheckbox"/>'
			content += '<td id="room_id">'+item.room_id+'</td>';
			content += '<td id ="room_name">'+item.room_name+'</td>';
			content += '<td id ="Capacity">'+item.Capacity+'</td>';
			content += '<td id="location">'+item.location+'</td>';
			
			var date = new Date(item.cteate_date);
			content += '<td>'+date.toLocaleDateString('ko-KR')+'</td>'; //String('ko-KR')
			
			content += '</tr>';
		});
		}else{
			content += '<tr>';
			content += '<td colspan="5" style="text-align: center;">등록된 글이 없습니다.<td>';
			content += '</tr>';
		}
		$('#list').empty();
		$('#list').append(content);
}
</script>
</html>