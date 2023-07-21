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

<script src="js/jquery.twbsPagination.js" type="text/javascript"></script>



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
      
      .btn-primary{
         background-color: #91bdce;
         border: 1px solid #91bdce;
         font-weight: bold;
      }
      
      .btn-danger{
         background-color: red;
         border: 1px solid red;
         font-weight: bold;
         color: white;
      }
      
      .modal-title{
         margin-left: 170px;
      }
      
      .pagination{
         margin-left: 450px;   
      }
      
      #opt{
         width: 130px;
         height: 30px;
         margin-bottom: 15px;
      }
      
      #keyword{
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
      
      #informWrite{
         background-color: #91bdce;
         border: 3px solid #91bdce;
         width: 50px;
         height: 30px;
         border-radius: 3px;
         color: white;
         float: right; 
         margin-bottom: 15px;
         margin-left: 3px;
      }
      
      #delBtn{
         background-color: #91bdce;
         border: 3px solid #91bdce;
         width: 50px;
         height: 30px;
         border-radius: 3px;
         color: white;
         float: right;
         margin-bottom: 15px;
         margin-left: 3px;
      }
      
      #is_formDel{
         background-color: #91bdce;
         border: 3px solid #91bdce;
         width: 82px;
         height: 30px;
         border-radius: 3px;
         color: white;
         float: right;
         margin-bottom: 15px;
         margin-left: 3px;
      }
      /*
      #footer {
		 position: fixed;
		 bottom: 0;
		 left: 0;
		 width: 100%;
	 기타 스타일 속성 추가 
	}*/
	
		#footer{
		margin-left: 0px;
	}
	
	.fixed-title {
	    color: red; /* 원하는 색상으로 변경 */
	    font-weight: bold; /* 원하는 스타일 적용 */
	    /* 기타 원하는 스타일 속성 추가 */
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
            <h1 class="m-0">공지사항</h1>
          </div><!-- /.col -->
          <!-- 
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Dashboard v1</li>
            </ol>
             
          </div> --><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    
    <!-- Main content -->
    <section class="content">
   
               
   <div class="informList">
      <table>
         <tr>
            <td>
               <select id="opt" name="select">
                     <option value="default">공지사항 검색</option>
                     <option value="subject">제목</option>
                     <option value="name">작성자</option>
               </select>   
               <input type="text" id="keyword" placeholder="검색어를 입력하세요.">
                  <button id="searchButton">검색</button>
            </td>      
            
            <td>
            <div>
           
            <c:if test="${admin == 1}">
           		<input type="button" onclick="del()" id="delBtn" value="삭제" />
               <input style="float:right;" type="button" id="informWrite" onclick="location.href='/informWrite.go'" value="등록">
                <input type="button" onclick="is_formDel()" id="is_formDel" value="필독해제" />
             </c:if>
               
               </div>
            </td>
         </tr>
         </table>
      <table id="example1" class="table table-bordered table-striped">
         <thead>
            <tr id="thead" style="text-align:center">
             <c:if test="${admin == 1}">
               <th><input id="all" type="checkbox" /></th>
               </c:if>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일자</th>
				 <c:if test="${admin == 1}">
				<th>삭제</th>
				</c:if>
            </tr>
         </thead>
         <tbody id="informList" style="text-align:center">
           <!-- 리스트가 출력될 영역 -->
         </tbody>   
         <tr>
          <c:if test="${admin == 1}">
         <td colspan="5" id="paging">  
          </c:if> 
           <c:if test="${admin == 0}">
         <td colspan="3" id="paging">  
          </c:if>  
            <!--    플러그인 사용   (twbsPagination)   -->
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
    <div>
    
    </div>
    <jsp:include page="footer.jsp"/>
   </div>
</div>
<input type="hidden" value="${admin }" id="adminchk">
   
   
   
   
   
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

var showPage = 1;
var opt ='default';
var keyword ='default';

listCall(showPage);
console.log("list call");

//검색어에 따른 출력 
$('#searchButton').click(function(){
   //검색어 확인 
   keyword = $('#keyword').val();
   opt = $('#opt').val();
   console.log(keyword,opt);
   var pagePerNum = 5;
   console.log('pagePerNum :'+pagePerNum);
   listCall(showPage,keyword, opt, pagePerNum );
   $('#pagination').twbsPagination('destroy');
});


	// 리스트 불러오기
function listCall(page,cnt){
   
        var cnt = 8;
      $.ajax({
         type:'post',
         url:'/informList.ajax',
         data:{
            'page':page,
            'cnt': cnt,
            'keyword':keyword,
            'opt':opt,
         },
         dataType:'json',           
         success:function(data){
           console.log("success");
            console.log(data);
            listDraw(data.informList);
            
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
   
   //리스트 작성
function listDraw(informList) {
     console.log("listDraw Call");
     var content = '';
     var adminchk = $('#adminchk').val();
     informList.forEach(function(dto,board_id){
         content += '<tr>';
         if (adminchk ==1) {
         content += '<td><input type="checkbox" value="'+dto.board_id+'" /></td>';
         }
         content += '<th>'+dto.name+'</th>';
         content += '<th><a href="informDetail.do?board_id=' + dto.board_id + '&member_id='+dto.member_id+'"';
         content += ' class="' + (dto.is_form == 1 ? 'fixed-title' : '') + '"';
         content += '>' + dto.subject + '</a></th>';
         content += '<td>'+ dto.writeTime +'</td>';
        
         if (adminchk ==1) {
           content += '<th><button onclick="informDel('+'\'informDel.do?board_id='+dto.board_id+'\')">삭제</button></th>';
             // 이하 content를 사용한 JavaScript 코드
         }
         content += '</tr>';
       });

     $('#informList').empty();
     $('#informList').append(content);
}
   
function informDel(path) {
	console.log(path);
	if (!confirm("공지사항을 삭제 하시겠습니까?")) {
        
    } else {
        location.href=path;
    }
}
   
   
   // 전체 체크박스 선택
$('#all').click(function(e){	
	var $chk = $('input[type="checkbox"]');
	console.log($chk);
	if($(this).is(':checked')){
		$chk.prop('checked',true);
	}else{
		$chk.prop('checked',false);
	}	
});
   
   // 삭제
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
   
   //필독 해제
function is_formDel(){
	
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
		url:'is_formDel.ajax',
		data:{'is_formList':checkArr},
		dataType:'json',
		success:function(data){
			location.href="/informList.go";
		},
		error:function(e){
			console.log(e);
		}		
	});
	
}


   //관리자 권한 부여 모달 열기
   $(document).on('click', '.btn-admin', function () {
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
   $(document).ready(function() {
     // 버튼 클릭 시
     $('.btn-admin').click(function() {
    
       var memberId = $('.member_id').text();
       var adminValue = $(this).data('admin');
       
       if (adminValue === 0) {
           adminValue = '1';
         } else {
           adminValue = '0';
         }
       
      console.log(memberId,adminValue);
       // 서버로 요청 전송
       $.ajax({
         type: 'POST',
         url: '/admin.ajax',
         data: {
            memberId: memberId,
            adminValue: adminValue
         },
         success: function(data) {
           // 성공 시
           alert('관리자 권한 처리에 성공했습니다.');
           location.reload(); // 페이지 새로고침
         },
         error: function(error) {
           // 실패 시
           alert('관리자 권한 처리에 실패했습니다.');
           console.log(error);
         }
       });

       // 모달창 닫기
       $('#modal-admin').modal('hide');
     });
   });
</script>

</html>