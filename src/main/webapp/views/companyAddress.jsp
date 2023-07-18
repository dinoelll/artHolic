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
		}
		
		.btn-danger{
			background-color: #f82a2aa3;
			border: 1px solid #f82a2aa3;
			font-weight: bold;
			color: white;
		}
		
		.btn-detail{
			background-color: #91bdce;
			border: 1px solid #91bdce;
			font-weight: bold;
			color: white;
			padding-bottom: 0px;
    		padding-top: 0px;	
		}
		
		.btn-delete{
			background-color: #f82a2aa3;
			border: 1px solid #f82a2aa3;
			font-weight: bold;
			color: white;
			padding-bottom: 0px;
    		padding-top: 0px;	
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
		
		#companyWrite{
			background-color: #91bdce;
			border: 3px solid #91bdce;
			width: 50px;
			height: 30px;
			border-radius: 3px;
			color: white;
			margin-bottom: 15px;
			margin-left: 1210px;
		}
		
		.input{
			border: 1px solid #ccc; 
			border-radius: 5px; 
			padding: 5px; 
			background-color: white;
			padding-top: 10px;
			padding-bottom: 10px;
			margin: 15px;
			width: 450px;
		}
		
		.btn-update{
			background-color: #f82a2aa3;
			border: 1px solid #f82a2aa3;
			font-weight: bold;
			color: white;			
		    padding-bottom: 0px;
		    padding-top: 0px;
		    width: 58px;
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
            <h1 class="m-0">협력업체 연락처</h1>
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
   
					
	<div class="employeeList">
		<table>
			<tr>
				<td>
					<select id="select-dropdown" name="select">
							<option value="default">검색</option>
							<option value="name">이름</option>
							<option value="business">사업자명</option>
					</select>	
					<input type="text" id="companySearch" placeholder="내용을 입력 해 주세요.">
   					<button id="searchButton">검색</button>
				</td>		
					<c:if test="${admin eq 'true'}">
						<td><input type="button" id="companyWrite" value="등록" data-toggle="modal" data-target="#modal-company"></td>
					</c:if>			
			</tr>	
		</table>
				
		<table id="example1" class="table table-bordered table-striped">
			<thead>
				<tr id="thead" style="text-align:center">
					<th>사업자명</th>
					<th>이름</th>
					<th>담당</th>
					<th>연락처</th>
					<c:if test="${admin eq 'true'}">
					<th colspan="2">수정/삭제</th>
					</c:if>
				</tr>
			</thead>
			<tbody id="companyList" style="text-align:center">
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
	
			<!-- 협력업체 등록 모달창 -->
			<div class="modal fade" id="modal-company">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h4 class="modal-title">협력업체 등록</h4>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      	<form action="companyWrite.do">
			      		<div class="Write">
			      		<input type="text" class="input" name="business" id="business" placeholder="사업자명">
			      		<input type="text" class="input"name="name" id="name" placeholder="이름">
						<input type="text" class="input"name="part" id="part" placeholder="담당">		
						<input type="text" class="input"name="tel" id="tel" oninput="formatPhoneNumber()" placeholder="전화번호">	 
						</div>     	
			      	</form>
			      <div class="modal-footer justify-content-between">
			        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			        <button type="button" class="btn btn-primary btn-company">등록</button>
			      </div>
			    </div>
			    <!-- /.modal-content -->
			  </div>
			  <!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
			
			<!-- 협력업체 수정 모달창 -->
			<div class="modal fade" id="modal-detail">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h4 class="modal-title">협력업체 수정</h4>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      	<form action="companyUpdate.do">
			      		<div class="Write">
			      			<input type="hidden" id="cooper_id2" value="">
			      			<input type="text" class="input" name="business" id="business2" value="">
							<input type="text" class="input" name="name" id="name2" value="">
							<input type="text" class="input" name="part" id="part2" value="">
							<input type="text" class="input" name="tel" id="tel2" oninput="formatPhoneNumber2()" value=""> 
						</div>     	
			      	</form>
			      <div class="modal-footer justify-content-between">
			        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			        <button type="button" class="btn btn-primary btn-update">수정</button>
			      </div>
			    </div>
			    <!-- /.modal-content -->
			  </div>
			  <!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
			
			<!-- 협력업체 삭제 모달창 -->
			<div class="modal fade" id="modal-delete">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h4 class="modal-title">협력업체 삭제</h4>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      	<input type="hidden" id="cooper_id3" value="">
			      	<p style="text-align: center;">연락처를 정말로 <strong>삭제</strong>하시겠습니까?</p>
			      <div class="modal-footer justify-content-between">
			        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			        <button type="button" class="btn btn-primary btn-delete">삭제</button>
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

function formatPhoneNumber() {
	  var phoneInput = document.getElementById("tel");
	  var phoneNumber = phoneInput.value;

	  phoneNumber = phoneNumber.replace(/-/g, "");

	  if (phoneNumber.length > 3 && phoneNumber.length <= 7) {
	    phoneNumber = phoneNumber.replace(/(\d{3})(\d+)/, "$1-$2");
	  } else if (phoneNumber.length > 7) {
	    phoneNumber = phoneNumber.replace(/(\d{3})(\d{4})(\d+)/, "$1-$2-$3");
	  }

	  phoneInput.value = phoneNumber;
	}
	
function formatPhoneNumber2() {
	  var phoneInput = document.getElementById("tel2");
	  var phoneNumber = phoneInput.value;

	  phoneNumber = phoneNumber.replace(/-/g, "");

	  if (phoneNumber.length > 3 && phoneNumber.length <= 7) {
	    phoneNumber = phoneNumber.replace(/(\d{3})(\d+)/, "$1-$2");
	  } else if (phoneNumber.length > 7) {
	    phoneNumber = phoneNumber.replace(/(\d{3})(\d{4})(\d+)/, "$1-$2-$3");
	  }

	  phoneInput.value = phoneNumber;
	}

//검색어에 따른 출력 
$('#searchButton').click(function(){
   //검색어 확인 
   searchText = $('#companySearch').val();
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
	      url:'/companyList.ajax',
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
	         listPrint(data.companyList);
	         
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
	
function listPrint(companyList) {
	  console.log("listPrint Call");
	  var content = '';

	  if (companyList && Array.isArray(companyList) && companyList.length > 0) {
	    companyList.forEach(function (item) {

	      content += '<tr>';
	      content += '<td>' + item.business + '</td>';
	      content += '<td>' + item.name + '</td>';
	      content += '<td>' + item.part + '</td>';
	      content += '<td>' + item.tel + '</td>';
	      
	      if (${admin eq 'true'}) {
	        content += '<td><button type="button" class="btn btn-default btn-icon btn-detail" data-toggle="modal" data-target="#modal-detail" data-id="' + item.cooper_id + '">수정</button></td>';
	        content += '<td><button type="button" class="btn btn-default btn-icon btn-delete" data-toggle="modal" data-target="#modal-delete" data-id="' + item.cooper_id + '">삭제</button></td>';
	      }
	      
	      content += '</tr>';
	    });
	  } else {
	    content += '<tr>';
	    content += '<td colspan="6" style="text-align: center;">검색한 정보가 없습니다.</td>';
	    content += '</tr>';
	  }

	  $('#companyList').empty();
	  $('#companyList').append(content);
	}
	 
	/* 협력업체 등록 */
	$(document).ready(function() {
	  // 버튼 클릭 시
	  $('.btn-company').click(function() {
	 
		var business = $("#business").val();
		var name = $("#name").val();
		var part = $("#part").val();
		var tel = $("#tel").val();
		
		if (business === '') {
	       	alert('사업자명을 입력하세요.');
	        return;
	    } else if (name === ''){
	    	alert('이름을 입력하세요.');
	        return;
	    } else if (part === ''){
	    	alert('담당을 입력하세요.');
	    	return;
	    } else if (tel === ''){
	    	alert('전화번호를 입력하세요.');
	    	return;
	    }
		
	    // 서버로 요청 전송
	    $.ajax({
	      type: 'POST',
	      url: '/companyWrite.ajax',
	      data: {
	    	  business: business,
	    	  name: name,
	    	  part: part,
	    	  tel: tel
	      },
	      success: function(data) {
	        // 성공 시
	        alert('협력업체 등록에 성공했습니다.');
	        location.reload(); // 페이지 새로고침
	      },
	      error: function(error) {
	        // 실패 시
	        alert('협력업체 등록에 실패했습니다.');
	        console.log(error);
	      }
	    });

	    // 모달창 닫기
	    $('#modal-company').modal('hide');
	  });
	});
	
	// 모달 창이 열릴 때 호출되는 함수
	$('#modal-detail').on('show.bs.modal', function(event) {
	  var button = $(event.relatedTarget); // 모달을 열기 위해 클릭한 버튼
	  var cooper_id = button.data('id'); // 클릭한 버튼의 data-id 속성 값 (cooper_id)
	  
	  $.ajax({
		    type: 'POST',
		    url: '/companyDetail.ajax',
		    data: {
		        cooper_id: cooper_id
		    },
		    success: function(response) {
		    	console.log('response 성공');
		    	console.log(response.company.business);
		        console.log(response);
		        $('#business2').val(response.company.business);
		        $('#name2').val(response.company.name);
		        $('#part2').val(response.company.part);
		        $('#tel2').val(response.company.tel);
		        $('#cooper_id2').val(response.company.cooper_id);
		        $('#modal-detail').modal('show');
		    },
		    error: function(error) {
		        console.log(error);
		    }
		});
	});
	
	/* 협력업체 수정 */
	$(document).ready(function() {
	  // 버튼 클릭 시
	  $('.btn-update').click(function() {
	 
		var business = $("#business2").val();
		var name = $("#name2").val();
		var part = $("#part2").val();
		var tel = $("#tel2").val();
		var cooper_id = $("#cooper_id2").val();
		
		if (business === '') {
	       	alert('사업자명을 입력하세요.');
	        return;
	    } else if (name === ''){
	    	alert('이름을 입력하세요.');
	        return;
	    } else if (part === ''){
	    	alert('담당을 입력하세요.');
	    	return;
	    } else if (tel === ''){
	    	alert('전화번호를 입력하세요.');
	    	return;
	    }
		
	    // 서버로 요청 전송
	    $.ajax({
	      type: 'POST',
	      url: '/companyUpdate.ajax',
	      data: {
	    	  business2: business,
	    	  name2: name,
	    	  part2: part,
	    	  tel2: tel,
	    	  cooper_id2: cooper_id
	      },
	      success: function(data) {
	        // 성공 시
	        alert('협력업체 수정에 성공했습니다.');
	        location.reload(); // 페이지 새로고침
	      },
	      error: function(error) {
	        // 실패 시
	        alert('협력업체 수정에 실패했습니다.');
	        console.log(error);
	      }
	    });

	    // 모달창 닫기
	    $('#modal-detail').modal('hide');
	  });
	});
	
	
	// 협력업체 삭제
	$(document).on('click', '.btn-delete', function() {
	  var cooper_id = $(this).data('id');
	  $('#modal-delete').find('#cooper_id3').val(cooper_id);
	  $('#modal-delete').modal('show');
	});

	/* 협력업체 삭제 */
	$(document).ready(function() {
	  // 버튼 클릭 시
	  $('.btn-delete').click(function() {
	    var cooper_id = $("#cooper_id3").val();

	    // 서버로 요청 전송
	    $.ajax({
	      type: 'POST',
	      url: '/companyDelete.ajax',
	      data: {
	        cooper_id3: cooper_id
	      },
	      success: function(data) {
	        // 성공 시
	        alert('협력업체 삭제에 성공했습니다.');
	        location.reload(); // 페이지 새로고침
	      },
	      error: function(error) {
	        // 실패 시
	        alert('협력업체 삭제에 실패했습니다.');
	        console.log(error);
	      }
	    });

	    // 모달창 닫기
	    $('#modal-delete').modal('hide');
	  });
	});
	
</script>

</html>