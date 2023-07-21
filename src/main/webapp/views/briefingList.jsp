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
      
      #briefingWrite{
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
            <h1 class="m-0">현장설명회</h1>
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
   
               
   <div class="briefingList">
      <table>
         <tr>
            <td>
               <select id="opt" name="select">
                     <option value="default">현장설명 검색</option>
                     <option value="subject">제목</option>
                     <option value="name">작성자</option>
               </select>   
               <input type="text" id="keyword" placeholder="검색어를 입력하세요.">
                  <button id="searchButton">검색</button>
            </td>      
            
            <td>
            <div>
            <c:if test="${admin == 1}">
               <input style="float:right;" type="button" id="briefingWrite" onclick="location.href='/briefingWrite.go'" value="등록">
            </c:if>
            </div>
            </td>
         </tr>
         </table>
      <table id="example1" class="table table-bordered table-striped">
         <thead>
            <tr id="thead" style="text-align:center">
               <th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
            </tr>
         </thead>
         <tbody id="briefingList" style="text-align:center">
           <!-- 리스트가 출력될 영역 -->
         </tbody>   
         <tr>
         <td colspan="4" id="paging">   
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
   
            <!-- 모달창 -->
         <div class="modal fade" id="modal-admin">
           <div class="modal-dialog">
             <div class="modal-content">
               <div class="modal-header">
                 <h4 class="modal-title">관리자 권한</h4>
                 <!-- 폴더 id -->
                 <span class="member_id" hidden=""></span>
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                   <span aria-hidden="true">&times;</span>
                 </button>
               </div>
               <div class="modal-body">
                 <p style="text-align: center;">관리자 권한을 <strong><span class="admin-action"></span></strong>하시겠습니까?</p>
               </div>
               <div class="modal-footer justify-content-between">
                 <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
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
    <div>
    
    </div>
    <jsp:include page="footer.jsp"/>
   </div>
   
</div>

   
   
   
   
   <!-- jQuery 
	<script src="plugins/jquery/jquery.min.js"></script>-->
   
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
         url:'/briefingList.ajax',
         data:{
            'page':page,
            'cnt': cnt,
            'keyword':keyword,
            'opt':opt
         },
         dataType:'json',           
         success:function(data){
           console.log("success");
            console.log(data);
            listDraw(data.briefingList);
            
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
function listDraw(briefingList) {
     console.log("listDraw Call");
     var content = '';

     briefingList.forEach(function(dto,board_id){
         content += '<tr>';
         content += '<td><p>'+dto.board_id+'</p></td>';
         content += '<th><a href="briefingDetail.do?board_id='+dto.board_id+'&member_id='+dto.member_id+'">'+dto.subject+'</a></th>';
         content += '<th>'+dto.name+'</th>';
         content += '<td>'+ dto.writeTime +'</td>';
         content += '</tr>';
       });

     $('#briefingList').empty();
     $('#briefingList').append(content);
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