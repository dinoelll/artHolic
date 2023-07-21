<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


<!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="plugins/select2/css/select2.min.css">
  <link rel="stylesheet" href="plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
  <!-- Bootstrap4 Duallistbox -->
  <link rel="stylesheet" href="plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
  <!-- BS Stepper -->
  <link rel="stylesheet" href="plugins/bs-stepper/css/bs-stepper.min.css">
  <!-- dropzonejs -->
  <link rel="stylesheet" href="plugins/dropzone/min/dropzone.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">

<link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">



<script src="js/jquery.twbsPagination.js" type="text/javascript"></script>




  <!-- 부트스트랩 JavaScript 파일 불러오기
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    -->
   <!-- 
  <script>
    $(function() {
      $("#datepicker").datepicker();
    });
  </script>
 -->


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
      
      #projectWrite{
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
      .input-group.date {
      	margin-left : 0px;
      }
      
      		#footer{
		margin-left: 0px;
	}
      /*
            #footer {
    position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
     기타 스타일 속성 추가 
}*/
      
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
            <h1 class="m-0">프로젝트 게시판</h1>
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
   
               
   <div class="projectList">
      <table>
         <tr>
            <td>
               <select id="opt" name="select">
                     <option value="default">프로젝트 검색</option>
                     <option value="project_name">프로젝트명</option>
                     <option value="project_manager">프로젝트 담당자</option>
                     <option value="field_manager">현장 관리자</option>
               </select>   
               <select id="myproject">
					<option value="">전체보기</option>									
					<option value="${sessionScope.loginId}">나의 프로젝트</option>
				</select>
               <input type="text" id="keyword" placeholder="검색어를 입력하세요.">
                  <button id="searchButton">검색</button>
            </td>      
            
            <td>
            <div>
               <input type="button" id="projectWrite" class="btn-default" data-toggle="modal" data-target="#modal-default" value="등록">
            </div>
            </td>
         </tr>
         </table>
      <table id="example1" class="table table-bordered table-striped">
         <thead>
            <tr id="thead" style="text-align:center">
                <th>프로젝트명</th>
            <th>프로젝트 담당자</th>
            <th>현장 관리자</th>
            <th>담당자 연락처</th>
            <th>일정</th>
            <th>인원 선택</th>
            <th>수정</th>
            <th>삭제</th>
            </tr>
         </thead>
         <tbody id="projectList" style="text-align:center">
           <!-- 리스트가 출력될 영역 -->
         </tbody>   
         <tr>
         <td colspan="8" id="paging">   
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
   
         <!-- 프로젝트 등록 modal 창 -->
            <div class="modal fade" id="modal-default">
               <div class="modal-dialog">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h4 class="modal-title">프로젝트 등록</h4>
                        <button type="button" class="close" data-dismiss="modal"
                           aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                        </button>
                     </div>
                     <div class="modal-body">
                        <form action="projectWrite.do" id="writeForm" method="post">
                           <table>
                              <tr>
                                 <th>프로젝트명</th>
                                 <td>
                                 	<input type="text" name="project_name" id="project_name" value="" />
                                 	<input type="hidden" name="member_id" value="${sessionScope.loginId}" />
                                 </td>
                              </tr>
                              <tr>
                                 <th>프로젝트 담당자</th>
                                 <td><input type="text" name="project_manager" id="project_manager" value="" /></td>
                              </tr>
                              <tr>
                                 <th>현장 관리자</th>
                                 <td><input type="text" name="field_manager" id="field_manager" value="" /></td>
                              </tr>
                              <tr>
                                 <th>담당자 연락처</th>
                                 <td><input type="text" name="manager_phone" id="manager_phone" value="" /></td>
                              </tr>
                              <tr>
                                 <th colspan="2" style="text-align: center;"><br>프로젝트 일정</th>
                              </tr>
                              <!-- 
                              <tr>
                                 <th>시작 일</th>
                                 <td><input type="text" name="start_date" id="start_date" readonly="readonly" /></td>
                              </tr>
                               -->
                               <tr>
                               <th>시작 일</th>
                               	 <td>
	                               	 <div class="input-group date" id="reservation" data-target-input="nearest">
	                       				 <input name="start_date" id="start_date" type="text" class="form-control datetimepicker-input" data-target="#reservation"/>
	                       				 <div class="input-group-append" data-target="#reservation" data-toggle="datetimepicker">
	                            			<div class="input-group-text"><i class="fa fa-calendar"></i></div>
	                        			</div>
	                   				 </div>
                   				 </td>
                               </tr>
                               
                               <tr>
                               <th>종료 일</th>
                                 <td>
	                               	<div class="input-group date" id="reservation2" data-target-input="nearest">
	                       				 <input name="end_date" id="end_date" type="text" class="form-control datetimepicker-input" data-target="#reservation2"/>
	                       				 <div class="input-group-append" data-target="#reservation2" data-toggle="datetimepicker">
	                            			<div class="input-group-text"><i class="fa fa-calendar"></i></div>
	                        			</div>
	                   				 </div>
                   				 </td>
                               </tr>
                               
                               <!-- 
                              <tr>
                                 <th>종료 일</th>
                                 <td><input type="text" name="end_date" id="end_date" readonly="readonly"/></td>
                              </tr>
                               -->
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
            
            
            
                     <!-- 프로젝트 수정 modal 창 -->
            <div class="modal fade" id="modal-update">
               <div class="modal-dialog">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h4 class="modal-title">프로젝트 수정</h4>
                        <button type="button" class="close" data-dismiss="modal"
                           aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                        </button>
                     </div>
                     <div class="modal-body">
                        <form action="projectUpdate.do" method="post">
                           <table>
                              <tr>
                                 <th>프로젝트명</th>
                                 <td>
                                 	<input type="text" name="project_name" id="project_name2" value="" />
                                 	<input type="hidden" name="project_id" id="project_id2" value="" />
                                 </td>
                              </tr>
                              <tr>
                                 <th>프로젝트 담당자</th>
                                 <td><input type="text" name="project_manager" id="project_manager2" value="" /></td>
                              </tr>
                              <tr>
                                 <th>현장 관리자</th>
                                 <td><input type="text" name="field_manager" id="field_manager2" value="" /></td>
                              </tr>
                              <tr>
                                 <th>담당자 연락처</th>
                                 <td><input type="text" name="manager_phone" id="manager_phone2" value="" /></td>
                              </tr>
                              <tr>
                                 <th colspan="2" style="text-align: center;"><br>프로젝트 일정</th>
                              </tr>
                              <tr>
                              <th>시작 일</th>
                               	 <td>
	                               	 <div class="input-group date" id="reservation3" data-target-input="nearest">
	                       				 <input name="start_date2" id="start_date2" type="text" class="form-control datetimepicker-input" data-target="#reservation3"/>
	                       				 <div class="input-group-append" data-target="#reservation3" data-toggle="datetimepicker">
	                            			<div class="input-group-text"><i class="fa fa-calendar"></i></div>
	                        			</div>
	                   				 </div>
                   				 </td>
                               </tr>
                               
                               <tr>
                               <th>종료 일</th>
                                 <td>
	                               	<div class="input-group date" id="reservation4" data-target-input="nearest">
	                       				 <input name="end_date2" id="end_date2" type="text" class="form-control datetimepicker-input" data-target="#reservation4"/>
	                       				 <div class="input-group-append" data-target="#reservation4" data-toggle="datetimepicker">
	                            			<div class="input-group-text"><i class="fa fa-calendar"></i></div>
	                        			</div>
	                   				 </div>
                   				 </td>
                               </tr>
                           </table>
                        </form>
                     </div>
                     <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default"
                           data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-primary btn-update">수정</button>
                     </div>
                  </div>
                  <!-- /.modal-content -->
               </div>
               <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->
            
            
            
            
            
            
            <!-- 인원추가 모달-->
                  <div class="modal fade" id="modal-lg2">
                     <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                           <div class="modal-header">
                              <h4 class="modal-title">인원 선택</h4>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                 <span aria-hidden="true">&times;</span>
                              </button>
                           </div>
                           <div class="modal-body">
                              <div class="card card-default">
                                 <div class="card-body">
                                    <div class="row">
                                       <div class="col-12">
                                          <div class="form-group">
                                          	 <input name="project_id" type="hidden" value=""/>
                                             <label>인원 추가</label>
                                             <div class="dual-listbox-container">
                                             
                                                <select id="approvers" class="duallistbox" multiple="multiple" name="sendMember">
                                                </select>
                                                
                                             </div>
                                          </div>
                                       <!-- /.form-group -->
                                       </div>
                                    <!-- /.col -->
                                    </div>
                                 </div>
                              </div>
                              <!-- /.card -->
                           </div>
                           <div class="modal-footer justify-content-between">
                              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                              <button type="button" id="submitButton" class="btn btn-primary" onclick="sendList()">인원 확정</button>            
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
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Select2 -->
<script src="plugins/select2/js/select2.full.min.js"></script>
<!-- Bootstrap4 Duallistbox -->
<script src="plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
<!-- InputMask -->
<script src="plugins/moment/moment.min.js"></script>
<script src="plugins/inputmask/jquery.inputmask.min.js"></script>
<!-- date-range-picker -->
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap color picker -->
<script src="plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- BS-Stepper -->
<script src="plugins/bs-stepper/js/bs-stepper.min.js"></script>
<!-- dropzonejs -->
<script src="plugins/dropzone/min/dropzone.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>




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

//$("#datepicker").datepicker();


//Date picker
$('#reservation').datetimepicker({
    format: 'L'
});
$('#reservation2').datetimepicker({
    format: 'L'
});
$('#reservation3').datetimepicker({
    format: 'L'
});
$('#reservation4').datetimepicker({
    format: 'L'
});


var msg = "${msg}";
if (msg != "") {
   alert(msg);

}

var showPage = 1;
var opt ='default';
var keyword ='default';
var myproject='';
var cnt='10';

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

function save() {
    console.log('저장');

    if ($('#project_name').val() == "") {
       alert("프로젝트명을 입력 해주세요.");
    } else if($('#project_manager').val() == ""){
    	alert("프로젝트 담당자를 입력 해주세요.");
    } else if($('#field_manager').val() == ""){
    	alert("현장 관리자를 입력 해주세요.");
    } else if($('#manager_phone').val() == ""){
    	alert("담당자 연락처를 입력 해주세요.");
    } else if($('#start_date').val() == ""){
    	alert("프로젝트 시작 일을 입력 해주세요.");
    } else if($('#end_date').val() == ""){
    	alert("프로젝트 종료 일을 입력 해주세요.");
    } else {
       /* $('input[name="content"]').val(content); */
       $('#writeForm').submit();

    }
 }
 
 
$('#myproject').change(function() {
	console.log("myproject change");
	myproject = $(this).val();
	console.log(myproject);
	listCall(showPage);
	$('#pagination').twbsPagination('destroy');
});



   // 리스트 불러오기
function listCall(page,cnt){
   		console.log(myproject);
   		console.log('리스트 부르기');
        var cnt = 10;
      $.ajax({
         type:'post',
         url:'/projectList.ajax',
         data:{
            'page':page,
            'cnt': cnt,
            'keyword':keyword,
            'opt':opt,
            'myproject':myproject
         },
         dataType:'json',           
         success:function(data){
           console.log("success");
            console.log(data);
            listDraw(data.projectList);
            
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
function listDraw(projectList) {
     console.log("listDraw Call");
     var content = '';
     
     
     if (projectList && Array.isArray(projectList) && projectList.length > 0) {
     projectList.forEach(function(dto,project_id){
         content += '<tr>';
         content += '<th><a href="projectCalendar.go?project_id=' + dto.project_id + '&project_name=' + dto.project_name + '">' + dto.project_name + '</a></th>';
         content += '<th>'+dto.project_manager+'</th>';
         content += '<th>'+dto.field_manager+'</th>';
         content += '<td>'+ dto.manager_phone +'</td>';
         content += '<td>'+ dto.start_date + '~' + dto.end_date +'</td>';
         console.log(dto.member_id);
         console.log('${sessionScope.loginId}');
         if(dto.member_id == '${sessionScope.loginId}') {
         content += '<td><button class="formGnb_button mailSend" data-project_id="'+dto.project_id+'" data-toggle="modal" data-target="#modal-lg2">인원선택</button></td>';
        	 content += '<td><input type="button" id="projectUpdate" class="formGnb_button mailSend" data-project_id="'+dto.project_id+'" data-toggle="modal" data-target="#modal-update" value="수정"></td>';
        	 content += '<td><button onclick="deleteConfirm('+'\'projectDel.do?project_id='+dto.project_id+'\')" class="btn btn-danger btn-sm">삭제</button></td>';
         } else {
        	 content += '<td>인원선택불가</td>'
        	 content += '<td><span>수정불가</span></td>';
        	 content += '<td><span>삭제불가</span></td>';
         }
         
         content += '</tr>';
       });
     } else {
 	    content += '<tr>';
 	    content += '<td colspan="8" style="text-align: center;">검색한 정보가 없습니다.</td>';
 	    content += '</tr>';
 	  }

     $('#projectList').empty();
     $('#projectList').append(content);
     
     $('.formGnb_button').click(function() {
    	 var data = $(this).data('project_id');
    	 console.log('data : ',data);
    	 
    	 $('input[name="project_id"]').val(data);
     })
   }
   
   function deleteConfirm(path) {
	   console.log(path);
	   if (!confirm("프로젝트를 삭제 하시겠습니까?")) {
           
       } else {
           location.href=path;
       }
   }
   
   
// 모달 수정창이 열릴 때 호출되는 함수
$('#modal-update').on('show.bs.modal', function(event) {
  var button = $(event.relatedTarget); // 모달을 열기 위해 클릭한 버튼
  var project_id = button.data('project_id'); // 클릭한 버튼의 data-id 속성 값 (project_id)
  
  $.ajax({
	    type: 'POST',
	    url: '/projectUpdateModal.ajax',
	    data: {
	    	project_id: project_id
	    },
	    success: function(response) {
	    	console.log('response 성공');
	    	console.log(response.project.project_name);
	        console.log(response);
	        $('#project_name2').val(response.project.project_name);
	        $('#project_manager2').val(response.project.project_manager);
	        $('#field_manager2').val(response.project.field_manager);
	        $('#manager_phone2').val(response.project.manager_phone);
	        $('#start_date2').val(response.project.start_date);
	        $('#end_date2').val(response.project.end_date);
	        $('#project_id2').val(response.project.project_id);
	        $('#modal-update').modal('show');
	    },
	    error: function(error) {
	        console.log(error);
	    }
	});
});



/* 프로젝트 수정 */
$(document).ready(function() {
  // 버튼 클릭 시
  $('.btn-update').click(function() {
 
	var project_name = $("#project_name2").val();
	var project_manager = $("#project_manager2").val();
	var field_manager = $("#field_manager2").val();
	var manager_phone = $("#manager_phone2").val();
	var start_date = $("#start_date2").val();
	var end_date = $("#end_date2").val();
	var project_id = $("#project_id2").val();
	
    // 서버로 요청 전송
    $.ajax({
      type: 'POST',
      url: '/projectUpdate.ajax',
      data: {
    	  project_name2: project_name,
    	  project_manager2: project_manager,
    	  field_manager2: field_manager,
    	  manager_phone2: manager_phone,
    	  start_date2: start_date,
    	  end_date2: end_date,
    	  project_id2: project_id
      },
      success: function(data) {
        // 성공 시
        alert('프로젝트 수정에 성공했습니다.');
        location.reload(); // 페이지 새로고침
      },
      error: function(error) {
        // 실패 시
        alert('프로젝트 수정에 실패했습니다.');
        console.log(error);
      }
    });

    // 모달창 닫기
    $('#modal-update').modal('hide');
  });
});
   
   
   
// 받는사람, 참조자 option 값 가져오기
$(document).ready(function() {
     $.ajax({
       url: 'projectAddOption.ajax', 
       type: 'get',
       data: {},
       dataType:'json',
       success: function(data) {
          console.log(data);
          optionPrint(data.option);
       },error: function(e){
          console.log(e);
       }
     })
     
     function optionPrint(option){
        var content;
        if(option.length>0){
           
           option.forEach(function(item,member_id){
              content += '<option value="'+item.member_id+'">'+item.dept_name+'&nbsp;&nbsp;'+item.position_name+'&nbsp;&nbsp;'
                 +item.name+'</option>';
           })
        }else{
           content += '<option>선택값이 없습니다.</option>';
        }
        $('.duallistbox').empty();
        $('.duallistbox').append(content);
        //Bootstrap Duallistbox
        $('.duallistbox').bootstrapDualListbox();
     }
})
   
   
   
 // 프로젝트 추가인원 값 보내기
function sendList() {
   var approvers = $('#approvers option:selected').map(function() {
       return this.value;
     }).get();
   
   console.log(approvers);
   
    var projectInfo = {
		'approvers' : approvers,
		'project_id' : $('input[name="project_id"]').val()
    };
    
    $.ajax({
	   url: 'addProjectMember.ajax',
	   type: 'post',
	   data : JSON.stringify(projectInfo),
   	   dataType:'json',
   	   contentType : 'application/json',
	   success: function(data) {
		   console.log(data);
		   
		 },error: function(e){
		       console.log(e);
		 }
		
   });
 // 모달창 닫기
 alert('프로젝트 인원이 추가 되었습니다.');
    $('#modal-lg2').modal('hide');
}

   
/*     $('#mailForm input[name="approvers"]').remove();
   var content ='';
   if(approvers.length>0){
      approvers.forEach(function(item){
         content += '<input type="hidden" class="approvers" name="approvers" value="'+item+'">';
      })
      
   }
   $('#mailForm').append(content);
   $('#mailForm').append(message); 
};*/
   


</script>

</html>