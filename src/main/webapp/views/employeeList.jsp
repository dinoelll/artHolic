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

<link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">

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
            <h1 class="m-0">사원 관리</h1>
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
   
   
   
   
   	<h3> 직원 리스트 페이지</h3>
   
	
					
	<div class="employeeList">
		<table>
			<tr>
				<td>
					<select id="select-dropdown" name="select">
							<option value="default">사원 정보 검색</option>
							<option value="name">이름</option>
							<option value="dept">부서</option>
							<option value="position">직급</option>
					</select>	
					<select id="adminProcess">
						<option value="default">관리자 여부</option>
						<option value="false">false</option>
						<option value="true">true</option>
					</select>
					<input type="text" id="employeeSearch" placeholder="내용을 입력 해 주세요">
   					<button id="searchButton">검색</button>
				</td>		
			</tr>
			</table>
		<table id="example1" class="table table-bordered table-striped">
			<thead>
				<tr id="thead">
					<th>이름</th>
					<th>부서</th>
					<th>직급</th>
					<th>사번</th>
					<th>관리자 여부</th>
					<th>관리자 권한</th>
				</tr>
			</thead>
			<tbody id="employeeList">
  			<!-- 리스트가 출력될 영역 -->
			</tbody>	
		</table>
  
	</div>
	
	<!-- 관리자 권한 부여 모달창 -->
		<div class="modal fade" id="modal-admin">
			<div class="modal-dialog">
			<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">관리자 권한 부여</h4>
					
					<!-- 폴더 id -->
           			<span class="member_id"></span>
         
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			<div class="modal-body">
				<p style="text-align: center;">관리자 권한을 <strong>부여</strong>하시겠습니까?</p>
			</div>
				<div class="modal-footer justify-content-between">
					<button type="button" class="btn btn-default"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary btn-admin">확인</button>
				</div>
		</div>
		<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
   
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
	
	<script src="plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script src="plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
	<script src="plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
</body>
<script>

$(function () {
    $("#example1").DataTable({
      "responsive": true, "lengthChange": false, "autoWidth": false,
      "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    $('#example2').DataTable({
      "paging": true,
      "ordering": true,
      "info": true,
      "responsive": true,
    });
  });



var showPage = 1;
var searchText = 'default';
var searchType = 'default';
var adminProcess = 'default';

listCall(showPage);
console.log("list call");

//검색어에 따른 출력 
$('#searchButton').click(function(){
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
});


function listCall(page,cnt){
	
	  	var cnt = 5;
	   $.ajax({
	      type:'post',
	      url:'/employeeList.ajax',
	      data:{
	    	  'page':page,
	    	  'searchText':searchText,
	    	  'searchType':searchType,
	    	  'cnt': cnt,
	    	  'adminProcess':adminProcess
	      },
	      dataType:'json',           
	      success:function(data){
	    	 console.log("success");
	         console.log(data);
	         listPrint(data.employeeList);
	         
	         // 페이징 처리를 위해 필요한 데이터
	         // 1. 총 페이지의 수
	         // 2. 현재 페이지
	         
	         // Paging Plugin (j-query의 기본기능을 가지고 만들었기 때문에  plugin)
	       	 $('#pagination').twbsPagination({
	         startPage:data.currPage, // 시작 페이지
	         totalPages:data.pages,// 총 페이지 수 
	         visiblePages:5,// 보여줄 페이지
	         next : '<span style="color: #87d1bf;">></span>', 
	         last : '<span style="color: #87d1bf;">>></span>',
	         first : '<span style="color: #87d1bf;"><<</span>',
	 		 prev : '<span style="color: #87d1bf;"><</span>',
	         onPageClick:function(event,page){ // 페이지 클릭시 동작되는 (콜백)함수
	            console.log(page,showPage);
	            if(page != showPage){
	               showPage=page;
	               listCall(page,cnt);
	               
	            }
	         	}
	         	})
	      },
	      error:function(e){
				console.log("Error");
	      }
	});
}
	
function listPrint(employeeList) {
	  console.log("listPrint Call");
	  var content = '';

	  if (employeeList && Array.isArray(employeeList) && employeeList.length > 0) {
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
	      content += '<td><button type="button" class="btn btn-default btn-icon btn-admin" data-toggle="modal" data-target="#modal-admin" data-id="' + item.member_id + '">권한 부여</button></td>'; // 버튼 추가
	      content += '</tr>';
	    });
	  } else {
	    content += '<tr>';
	    content += '<td colspan="6" style="text-align: center;">검색한 정보가 없습니다.</td>';
	    content += '</tr>';
	  }

	  $('#employeeList').empty();
	  $('#employeeList').append(content);
	}


	 //관리자 권한 부여
	$(document).on('click', '.btn-admin', function() {
		  var memberId = $(this).data('id'); // 클릭된 버튼의 data-id 값을 가져옴
		  console.log(memberId);
		  $('#modal-admin').find('.member_id').text(memberId); // 모달 내부의 특정 요소에 폴더 ID를 설정
		  
		  // 모달 열기 코드
		  $('#modal-admin').modal('show');
		});
</script>

</html>