<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="ko">

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Timeline</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- AdminLTE css -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  
  <!--  추가적으로 넣어줌-->
  
  <!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">

<!--  iCheck -->
<link rel="stylesheet"
	href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">

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
  
 <!--페이징  -->
<script src="/js/jquery.twbsPagination.js" type="text/javascript"></script> 
  
  
  <style>

/* gnb 스타일 */

 #payController{
	margin-top: 20px; 
	margin-left: 40px;
	
     align-items: center;
     width: 205px;
    height: 460px;
		
	}
	#paybutton{
		margin-top: 20px;
		margin-bottom: 30px;
		width: 161px;
	    height: 49px;
	
	}
	#paybutton2 {
	    margin-bottom: 10px;
	    font-size: 16px;
	    width: 150px;
	    background-color: #c3c3c3;
	    border: 0px;
	    color: black;
	    
    }
    	#paybutton3 {
	    margin-bottom: 10px;
	    font-size: 16px;
	    width: 150px;
	    background-color: #c3c3c3;
	    border: 0px;
	    color: black;
	    
    }
    
    
    #ListGo{
	color: black;
	}
    
    
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
	
	.content {
	  	display: flex;
		justify-content: center;
		align-items: center;
		height: 700px;
		text-align: center;
	}

/* gnb 스타일 */

 	.center {
        text-align: center;
        
    }
#reject{
	margin-right: 50px;
}
#timelineCard{
	margin-top: 0px;
	margin-left: 23px;
}
#donePayment{
	margin-right: 94px;
	margin-left: :37px;
}    
#payController{
	margin-top: 20px; 
	margin-left: 40px;
	display: flex;
     flex-direction: column;
     align-items: center;
	
}
#paybutton{
	margin-top: 20px;
	margin-left: 20px;
	margin-right: 20px;
	
	
}
#previewBox{
	border: 1px solid gray;
	width: 550px;
	height: 700px;
	
}
#paymentForm_vacation{
	margin-top: 20px;

}
#formGnb{
	

}
#formGnb2{
	margin-left: 40px;
	margin-top: -23px;
	margin-bottom: -18px;

}
#formGnb_button{
	margin-right: 28px;
	font-size: 20px;
	cursor: pointer;
	
}

#optt{
	margin-right: 28px;
	font-size: 20px;
	cursor: pointer;
	color: black;
	
}
#realForm{
	border: 1px soild gray;
	width: 1012px;
	height: 1172px;
	margin-left: 60px;
	margin-right: 50px; 
	margin-top: 50px;
	

}

 table.my-table {
    width: 100%;
    border-collapse: collapse;
    text-align: center;
  }

  table.my-table th,
  table.my-table td {
    padding: 10px;
    border: 1px solid gray;
  }

  table.my-table th {
    background-color: #f2f2f2;
  }
    /*  안보이는 박스 설정*/
    .invisible-input {
    border: none;
    background-color: transparent;
    font-size: inherit;
    padding: 0;
    margin: 0;
    width: 100%;
    color: transparent;
    text-shadow: 0 0 0 black;
    
  }
  
/*  테이블 추가 부분 */
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


</style>
  
  
</head>
<body class="hold-transition sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">
	<jsp:include page="header.jsp"/>
		 	<!-- Content Wrapper. Contains page content -->
	  <div class="content-wrapper">
	    <!-- Content Header (Page header) -->
	    <div class="content-header">
	      <div class="container-fluid">
	        <div class="row mb-2">
	          <div class="col-sm-6">
			<!--<h1 class="m-0">Dashboard</h1> -->
	          </div><!-- /.col -->
	          <div class="col-sm-6">
	            <ol class="breadcrumb float-sm-right">
	              <li class="breadcrumb-item"><a href="#">Home</a></li>
	              <li class="breadcrumb-item active">전자결재</li>
	            </ol>
	          </div><!-- /.col -->
	        </div><!-- /.row -->
	      </div><!-- /.container-fluid -->
	    </div>
	    <!-- /.content-header -->
    
  
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ-->
<!--   타임 라인 시작 !!!!-->
  <!-- Content Wrapper. Contains page content -->

		<div class="row"> 
		<div class="col-sm-2">
			<section class="content" >
			
					<div class="sidebar">
						  <div class="card" id="payController" style="align-items: center; text-align: center;">
						    <div>
						      <button type="button" class="btn btn-block btn-primary btn-lg" id="paybutton" data-toggle="modal" data-target="#modal-lg">결재 작성하기</button>
						    </div>
						    <div >
							        <button type="button" class="btn btn-block btn-secondary btn-lg" id="paybutton2"><a href="./paymentMain.go" id="ListGo">결재HOME</a></button>
						      </div>
						    
						    <div>
						      <button type="button" class="btn btn-block btn-secondary btn-lg" id="paybutton2" onclick="toggleDocumentTree()">결재 생산함</button>
						      <div id="documentTree" ><!-- style="display: none;" -->
						        <p><a href="./paymentList.go" id="ListGo">결재 문서함</a></p>
						        <p><a href="./paymentListTemp.go" id="ListGo">결재 임시저장</a></p>
						      </div>
						    </div>
						    <div>
						      <button type="button" class="btn btn-block btn-secondary btn-lg" id="paybutton3" onclick="toggleInboxTree()">결재 수신함</button>
						      <div id="inboxTree"><!--  style="display: none;" -->
						        <p><a href="./paymentListPay.go" id="ListGo"> 결재하기</a></p>
						        <p><a href="./paymentListDone.go" id="ListGo"> 결재내역</a></p>
						        <p><a href="./paymentListTake.go" id="ListGo">수신참조</a></p>
						      </div>
						    </div>
						  </div>
						</div>
			</section>
		</div><!--  sm-2 왼쪽 컨트롤러 부분-->
		
		<!-- 여기는 표 부분!!!!&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
		
		
		
			<div class="col-sm-9">
				<div class="container-fluid">
						<section class="content-header">
					      <div class="container-fluid">
					        <div class="row mb-2">
					          <div class="col-sm-6">
						          <div id="formGnb" >
						          	<br><br>
						          	<h1 style="font-weight: 600;">수신 참조</h1>
						          		
					          		</div>	
					          </div>
					        </div>
					        	<div class="row">
						          <div class="col-sm-6">
							          <div id="formGnb2" >
							          	<br><br>
							          	<a class="optt" id="optt" value="전체">전체</a>
							          	<a class="optt" id="optt" value="진행중">진행중</a>
							          	<a class="optt" id="optt" value="반려">반려</a>
							          	<a class="optt" id="optt" value="완료">완료</a>
						          		</div>	
						          </div>
						          <div class="col-sm-6">
						           
						          </div>
					        </div>
					      </div><!-- /.container-fluid -->
					     
					    </section>
					    
								
					<div class="card" id="paymentForm_vacation">
						
								<section class="content2">
									<div class="card">
							              <div class="card-body">
								              	<div class="projectList">
										              	<table>
															<tr >
																<td>
																	<select id="opt" name="select">
																			<!-- <option value="default">조건</option> -->
																			<option value="paySubject">제목</option>
																			<option value="code_name">결재양식</option>
																			<option value="document_id">문서번호</option>
																	</select> 
																	
																	<input type="text" id="keyword" placeholder="내용을 입력 해 주세요.">
																		<button id="searchButton">검색</button>
																</td>
															</tr>
														</table>
								             
							              
							              <!-- /.card-header -->
							            
										                <table id="example1" class="table table-bordered table-striped">
										                  
												                  <colgroup>
																		<col width="8%" />
																		<col width="7%" />
																		<col width="18%" />
																		<col width="6%" />
																		<col width="3%" />
																		<col width="6%" />
																		<col width="7%" />
																  </colgroup>
												                  <thead>
													                  <tr id="thead" style="text-align:center">
													                     <th>기안일</th>
													                    <th>결재양식</th>
													                    <th>제목</th>
													                    <th>문서번호</th>
													                    <th>의견</th>
													                    <th>결재 상태</th>
													                    <th>신청 시간</th>
													                  </tr>
												                  </thead>
												                  <tbody id="projectList" style="text-align:center; align-item:center; ">
														                 
														                 <!--  리스트 출력 영역-->
												                 
												                  </tbody>
										                </table>
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
										                  
						              		
						              			</div><!--  adList-->
							            	</div>
							            </div>
							            <!-- /.card -->
		     					 </section>
		     					 
					</div><!--  div 카드 리스트 젤 큰 부분 -->
					
					
				</div>
		  	</div>	<!-- sm- 9 부분!! -->
		  	
		  	
		  	
	  </div><!--  제일큰row 부분-->	

  
  <!-- /.content-wrapper -->
	
	
      
      
			<!-- 모달모달!! 숨겨진 -->
				<div class="modal fade" id="modal-lg" data-backdrop="static">
				  <div class="modal-dialog modal-lg">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h4 class="modal-title">결재 양식 선택</h4>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="restoreButtonColor()">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <div class="row">
				          <div class="col-sm-3">
				            <table class="table table-bordered text-center">
				              <tbody>
				                <tr>
				                  <td>
				                    <button type="button" class="btn btn-block btn-outline-dark" onclick="vacation(this)" id="vacation">휴가 신청</button>
				                  </td>
				                </tr>
				                <tr>
				                  <td>
				                    <button type="button" class="btn btn-block btn-outline-dark" onclick="item(this)" id="item">비품 구매</button>
				                  </td>
				
				                </tr>
				                <tr>
				                  <td>
				                    <button type="button" class="btn btn-block btn-outline-dark" onclick="project(this)" id="project">프로젝트 신청</button>
				                  </td>
				
				                </tr>
				              </tbody>
				            </table>
				          </div>
				          <div class="col-sm-9">
				            <div id="previewBox">
				
				            </div>
				
				
				          </div>
				        </div>
				      </div><!--  모달 바디-->
				      <div class="modal-footer justify-content-between">
				        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="restoreButtonColor()">취소</button>
				        <a type="button" class="btn btn-primary" id="paymentButton" onclick="handlePayment()" >사용하기</a>
				      </div>
				    </div>
				    <!-- /.modal-content -->
				  </div>
				  <!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
      
      
     <!-- 결재 의견 모달 -->
				<div class="modal fade" id="modal-default">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					      
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					        <h4 style="font-weight: 700; margin-bottom: 31px; margin-left: 30px;">결재 의견</h4>
					        <a style="margin-left:33px; font-size:17px;"></a>
					        <div style="margin-top: 31px;">
					          <c:forEach items="${note}" var="e">ㄴ
					            <c:set var="cardColor" value="" />
					            <c:choose>
					              <c:when test="${e.result == '반려'}">
					                <c:set var="cardColor" value="callout-Danger" />
					              </c:when>
					              <c:when test="${e.form_sort == 'PAYMENT_PRO'}">
					                <c:set var="cardColor" value="callout-info" />
					              </c:when>
					              <c:when test="${e.result == '결재완료'}">
					                <c:set var="cardColor" value="callout-success" />
					              </c:when>
					            </c:choose>
					            <div class="row">
					              <div class="col-sm-1">
					                <div class="rounded-circle" style="width: 50px; height: 50px; overflow: hidden;">
					                  <img class="img-fluid" src="dist/img/여자 증명사진.png" alt="" style="width: 100%; height: 100%; object-fit: cover;">
					                </div>
					              </div>
					              <div class="col-sm-11">
					                <div class="callout ${cardColor}" style="margin-bottom: 10px; margin-left: 18px; width: 395px; position: relative;">
					                  <p>${e.note}</p><br>
					                  <c:choose>
					                    <c:when test="${e.result == '결재완료'}">
					                      <p style=" margin-bottom: 0px;">${e.name} ${e.position} (승인)</p>
					                      
					
					                    </c:when>
					                    <c:when test="${e.result == '반려'}">
					                      <p style=" margin-bottom: 0px;">${e.name} ${e.position} (반려)</p>
					                      
					
					                    </c:when>
					                  </c:choose>
					                  <p class="bottom-right-text" style=" margin-bottom: 5px; margin-right: 8px;">${e.modi_date}</p>
					                </div>
					              </div>
					            </div>
					          </c:forEach>
					        </div>
					      </div>
					    </div>
					  </div>
					</div>
     



  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
</div>
	 <jsp:include page="footer.jsp" />
 
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

 

<script>

var msg = "${msg}";
if (msg != "") {
	alert(msg);

}

var showPage = 1;
var opt ='default';
var optt ='default';
var keyword ='default';
var temp = 0 ;

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
   listCall(showPage,pagePerNum );
   $('#pagination').twbsPagination('destroy');
});

// 위에 창에서 검색 실행
$('.optt').click(function() {
   // 선택된 요소에 active 클래스 추가
   $('.optt').removeClass('active');
   $(this).addClass('active');
  
   // 검색어 확인
   
   optt = $(this).attr('value');
   console.log('optt 진짜 :'+optt);
   var pagePerNum = 5;
   console.log('pagePerNum: ' + pagePerNum);
   listCall(showPage, pagePerNum);
   $('#pagination').twbsPagination('destroy');
});

	// 리스트 불러오기
function listCall(page,cnt){
   		console.log('keyword : ' + keyword);
   		console.log('page : ' + page);
   		console.log('cnt : ' + cnt);
   		console.log('optt : ' + optt);
   		console.log('opt : ' + opt);
        var cnt = 8;
      $.ajax({
         type:'post',
         url:'/paymentListTake.ajax',
         data:{
        	 'temp':temp,
            'page':page,
            'cnt': cnt,
            'keyword':keyword,
            'optt':optt,
            'opt':opt
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

  projectList.forEach(function(dto,project_id){
      content += '<tr>';
      content += '<th>'+dto.limit_date+'</th>';      content += '<th>'+dto.code_name+'</th>';
      content += '<th><a href="./paymentVacationFormDetail.go?document_id='+dto.document_id+'">'+dto.paySubject+'</th>';
      content += '<td>'+ dto.document_id +'</td>';
      content += '<td>'+ '<i class="fas fa-comments" data-toggle="modal" data-target="#modal-default" onclick="note(\''+dto.document_id+'\')"></i>'+'</td>';
      

      if (dto.state === '진행중') {
          content += '<td><a class="btn btn-primary btn-sm">' + dto.state + '</a></td>';
      } else if (dto.state === '반려') {
          content += '<td><a class="btn btn-danger btn-sm">' + dto.state + '</a></td>';
      } else if (dto.state === '완료') {
          content += '<td><a class="btn btn-secondary btn-sm">' + dto.state + '</a></td>';
      }
      content += '<td>'+ dto.reg_date  +'</td>';
      content += '</tr>';
  });

  $('#projectList').empty();
  $('#projectList').append(content);
}



function noteSuccess(data) {
 console.log("success");
 console.log(data);

 var content = '';
 var noteArray = data.note;

 for (var i = 0; i < noteArray.length; i++) {
     var note = noteArray[i];

     var cardColor = '';
     if (note.result === '반려') {
         cardColor = 'callout-Danger';
     } else if (note.form_sort === 'PAYMENT_PRO') {
         cardColor = 'callout-info';
     } else if (note.result === '결재완료') {
         cardColor = 'callout-success';
     }

     content += '<div class="row">';
     content += '<div class="col-sm-1">';
     content += '<div class="rounded-circle" style="width: 50px; height: 50px; overflow: hidden;">';
     if (note.profile_photo) {
   	  content += '<img class="img-fluid" src="/photo/' + note.profile_photo + '" alt="" style="width: 100%; height: 100%; object-fit: cover;">';
   	} else {
   	  content += '<img class="img-fluid" src="/photo/기본프로필.jpg" alt="" style="width: 100%; height: 100%; object-fit: cover;">';
   	}     
     content += '</div>';
     content += '</div>';
     content += '<div class="col-sm-11">';
     content += '<div class="callout ' + cardColor + '" style="margin-bottom: 10px; margin-left: 18px; width: 395px; position: relative;">';
     content += '<p>' + note.note + '</p><br>';

     if (note.result === '결재완료') {
         content += '<p style="margin-bottom: 0px;">' + note.name + ' ' + note.position + ' (승인)</p>';
     } else if (note.result === '반려') {
         content += '<p style="margin-bottom: 0px;">' + note.name + ' ' + note.position + ' (반려)</p>';
     }

     content += '<p class="bottom-right-text" style="margin-bottom: 5px; margin-right: 8px;">' + note.modi_date + '</p>';
     content += '</div>';
     content += '</div>';
     content += '</div>';
 }

 $('#modal-default .modal-body .row').remove();
 $('#modal-default .modal-body').append(content);
}

function note(document_id) {
 console.log(document_id);
 $.ajax({
     type: 'post',
     url: '/note.ajax',
     data: {
         'document_id': document_id
     },
     dataType: 'json',
     success: noteSuccess,
     error: function(e) {
         console.log("Error");
     }
 });
}




  
/*결재 작성하기 모달  */

function item(button) {
	  // 버튼 클래스 변경
	  $('#previewBox').empty();
	  var vacationButton = document.getElementById("vacation");
	  vacationButton.className = "btn btn-block btn-outline-dark";
	  var projectButton = document.getElementById("project");
	  projectButton.className = "btn btn-block btn-outline-dark";
	  
	  
	  button.className = "btn btn-block btn-primary";
	  $('#previewBox').append("<img src=\"img/buyItem.jpg\"  style=\"max-width: 100%; max-height: 100%; width: auto; height: auto;\">")
	

	// 사용하기 버튼의 href 변경
	    document.getElementById("paymentButton").setAttribute("href", "./paymentBuyItemForm.go");

	  
	}

function vacation(button) {
	  // 버튼 클래스 변경
	  $('#previewBox').empty();
	  var projectButton = document.getElementById("project");
	  projectButton.className = "btn btn-block btn-outline-dark";
	  var itemButton = document.getElementById("item");
	  itemButton.className = "btn btn-block btn-outline-dark";
	  
	  
	  button.className = "btn btn-block btn-primary";
	  $('#previewBox').append("<img src=\"img/vacationFormMini.jpg\"  style=\"max-width: 100%; max-height: 100%; width: auto; height: auto;\">")
	
	// 사용하기 버튼의 href 변경
	    document.getElementById("paymentButton").setAttribute("href", "./paymentVacationForm.go");
	 }	
	
function project(button) {
	  // 버튼 클래스 변경
	  $('#previewBox').empty();
	  var vacationButton = document.getElementById("vacation");
	  vacationButton.className = "btn btn-block btn-outline-dark";
	  
	  var itemButton = document.getElementById("item");
	  itemButton.className = "btn btn-block btn-outline-dark";
	  
	  
	  button.className = "btn btn-block btn-primary";
	  $('#previewBox').append("<img src=\"img/projectForm.jpg\"  style=\"max-width: 100%; max-height: 100%; width: auto; height: auto;\">")
	
	// 사용하기 버튼의 href 변경
	    document.getElementById("paymentButton").setAttribute("href", "./paymentProjectForm.go");
	  }	
	
function restoreButtonColor() {
	  // 버튼 클래스 복원
	  var vacationButton = document.getElementById("vacation");
	  vacationButton.className = "btn btn-block btn-outline-dark";
	  
	  var itemButton = document.getElementById("item");
	  itemButton.className = "btn btn-block btn-outline-dark";
	  
	  var projectButton = document.getElementById("project");
	  projectButton.className = "btn btn-block btn-outline-dark";
	  
	  $('#previewBox').empty();
	  
	  
	  document.getElementById("paymentButton").removeAttribute("href");
	  
	}	
  
</script>




</body>
</html>
