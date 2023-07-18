<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>ArtHolic</title>

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

<link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">

<script src="/js/jquery.twbsPagination.js" type="text/javascript"></script>



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
		
		.btn-primary{
			background-color: #91bdce;
			border: 1px solid #91bdce;
			font-weight: bold;
			color: white;
		}
		
		.btn-danger{
			background-color: #f82a2aa3;
			border: 1px solid #f82a2aa3;
			font-weight: bold;
			color: white;
		}
		
		.detail{
			background-color: #f82a2aa3;
			border: 1px solid #f82a2aa3;
			font-weight: bold;
			color: white;
		}
		
		.modal-title{
			margin-left: 170px;
		}
		
		.pagination{
			margin-left: 450px;	
		}
		
		#select-dropdown{
			width: 130px;
			height: 30px;
			margin-bottom: 15px;
		}
		
		#adminProcess{
			width: 110px;
			height: 30px;
			margin-bottom: 15px;
		}
		
		#employeeSearch{
			width: 200px;
			height: 30px;
			margin-bottom: 15px
		}
		
		#searchButton{
			background-color: #91bdce;
			border: 3px solid #91bdce;
			width: 50px;
			height: 30px;
			border-radius: 3px;
			color: white;
		}
		
		#employeeJoin{
			background-color: #91bdce;
			border: 3px solid #91bdce;
			width: 50px;
			height: 30px;
			border-radius: 3px;
			color: white;
			margin-bottom: 15px;
			margin-left: 1082px;
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
            <h1>
            <a href="/employeeList.go"  >전체 사원</a>
            |
            <a href="/employeeBlindList.go"  >비공개 사원</a>
            </h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/main">Home</a></li>
              <li class="breadcrumb-item active">사원 관리</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    
    <!-- Main content -->
 	<section class="content">
   
					
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
					
					<input type="text" id="employeeSearch" placeholder="내용을 입력 해 주세요.">
   					<button id="searchButton">검색</button>
				</td>		
			</tr>			
		</table>
				
		<table id="example1" class="table table-bordered table-striped">
			<thead>
				<tr id="thead" style="text-align:center">
					<th>이름</th>
					<th>부서</th>
					<th>직급</th>
					<th>사번</th>
					<th>블라인드 처리 날짜</th>
					<th>상세보기</th>
				</tr>
			</thead>
			<tbody id="employeeBlindList" style="text-align:center">
  			<!-- 리스트가 출력될 영역 -->
			</tbody>	
			<tr>
			<td colspan="6" id="paging">	
				<!-- 	플러그인 사용	(twbsPagination)	-->
				<div class="container" >									
					<nav aria-label="Page navigation" style="text-align:center">
						<ul class="pagination" id="pagination"></ul>
					</nav>					
				</div>
			</td>
		</tr>
		</table>
  
	</div>
	
		
   
    </section>
    <!-- /.content -->

    <jsp:include page="footer.jsp"/>
	</div>
	
</div>

	
	
	
	
	
	<!-- jQuery UI -->
	<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
	
	<!-- Bootstrap 4 -->
	<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- overlayScrollbars -->
	<script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/adminlte.js"></script>
	<!-- DataTables  & Plugins -->
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>

<script src="plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
</body>
<script>

var msg = "${msg}";
if (msg !== "") {
    alert(msg);
}

var showPage = 1;
var searchText = 'default';
var searchType = 'default';

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



function listCall(page,cnt){
	
	  	var cnt = 8;
	   $.ajax({
	      type:'post',
	      url:'/employeeBlindList.ajax',
	      data:{
	    	  'page':page,
	    	  'searchText':searchText,
	    	  'searchType':searchType,
	    	  'cnt': cnt,
	      },
	      dataType:'json',           
	      success:function(data){
	    	 console.log("success");
	         console.log(data);
	         listPrint(data.employeeBlindList);
	         
	      // Paging Plugin (j-query의 기본기능을 가지고 만들었기 때문에  plugin)
	         $('#pagination').twbsPagination({
	         startPage:data.currPage, // 시작 페이지
	         totalPages:data.pages,// 총 페이지 수 
	         visiblePages:5,// 보여줄 페이지
	         next : '<span style="color: #91bdce;">></span>', 
	         last : '<span style="color: #91bdce;">>></span>',
	         first : '<span style="color: #91bdce;"><<</span>',
	 		 prev : '<span style="color: #91bdce;"><</span>',
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
	
function listPrint(employeeBlindList) {
	  console.log("listPrint Call");
	  var content = '';

	  if (employeeBlindList && Array.isArray(employeeBlindList) && employeeBlindList.length > 0) {
		  employeeBlindList.forEach(function (item, employeeBlindList) {
			  
			var detpNames = {
					dept_hr : "인사팀",
					dept_ct : "시공팀",
					dept_dg : "설계팀"
			};
			
			var positionNames = {
					art_01 : "부장",
					art_02 : "차장",
					art_03 : "과장",
					art_04 : "대리",
					art_05 : "주임",
					art_06 : "사원"
			};
			
			var processNames = {
					false : "사원",
					true : "관리자"
			};
			
			var detpName = detpNames[item.dept_code] || item.categoryCode;
			var positionName = positionNames[item.position_code] || item.categoryCode;
			
	      content += '<tr>';
	      content += '<td>' + item.name + '</td>';
	      content += '<td>' + detpName + '</td>';
	      content += '<td>' + positionName + '</td>';
	      content += '<td>' + item.member_id + '</td>';
	      content += '<td>' + item.modi_date + '</td>';
	      content += '<td><button class="detail" onclick="location.href=\'/updateMember.go?member_id=' + item.member_id + '\'">상세보기</button></td>';
	      content += '</tr>';
	    });
	  } else {
	    content += '<tr>';
	    content += '<td colspan="6" style="text-align: center;">검색한 정보가 없습니다.</td>';
	    content += '</tr>';
	  }

	  $('#employeeBlindList').empty();
	  $('#employeeBlindList').append(content);
	}
	 
</script>

</html>