<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="ko">



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
  
    <!-- SweetAlert2 -->
  <link rel="stylesheet" href="plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
  <!-- Toastr -->
  <link rel="stylesheet" href="plugins/toastr/toastr.min.css">
  
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
	width: 1650px;
    height: 1483px;

}
#formGnb{
	margin-left: 40px;

}
#formGnb_button{
	margin-right: 20px;
	font-size: 20px;
	cursor: pointer;
	
}
#realForm{
	border: 1px soild gray;
	width: 1012px;
	height: 1163px;
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

#topRow {
    margin-bottom: 50px;
    justify-content: space-between;
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
	              <li class="breadcrumb-item active">Dashboard v1</li>
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
		
		<!-- 여기는 작성부분!!!!&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& -->
		
		
			<div class="col-sm-9">
				<div class="container-fluid">
					<div class="card" id="paymentForm_vacation">
						<section class="content-header">
					      <div class="container-fluid">
					        <div class="row mb-2">
					          <div class="col-sm-6">
						          <div id="formGnb" >
						          	<br><br>
						          	<a id="formGnb_button" data-toggle="modal" data-target="#modal-default">결재요청</a>
						          	<a id="formGnb_button" data-toggle="modal" data-target="#modal-default3">취소</a>
						          
						          		
					          		</div>	
					          </div>
					          <div class="col-sm-6">
					            <ol class="breadcrumb float-sm-right">
					              <li class="breadcrumb-item"><a href="#">결재 작성하기</a></li>
					              <li class="breadcrumb-item active">휴가신청</li>
					            </ol>
					          </div>
					        </div>
					      </div><!-- /.container-fluid -->
					      
	
              
					      
					      
					    </section>
						
						<section class="content2">
							<div class="container">
												  <div class="form-container" id="realForm" style="border: 1px solid gray; padding: 10px;">
												    <div>
												      <h1 style="text-align: center; margin-top: 25px; margin-bottom: 140px;">프로젝트 신청</h1>
												      <div class="row" style="margin-bottom: 50px;" id="topRow">
												        
												         				<div class="left-table" style="border :1px soild black;">
																	          <table class="my-table" style="width: auto; table-layout: fixed; margin-left:5px; margin-top: 50px;  ">
																	            <colgroup>
																	              <col style="width: 30%;">
																	              <col style="width: 70%;">
																	            </colgroup>
																	            <tr>
																	              <th style="width: 1%; white-space: nowrap; vertical-align: middle;">기안일</th>
																	              <td>
																					<div class="group">
																					  ${form.limit_date}
																				  </div>
																				</td>
																	            </tr>
																	            <tr>
																	              <th style=" width: 1%; white-space: nowrap; ">문서번호</th>
																	              <td id="document_id">${form.document_id}</td>
																	            </tr>
																	          </table>
																	        </div>
												        
												       
												         				 <div class="right-table" style="border :1px soild black;">
																	        
																       		<div id="list" class="right" >
																	          <table class="my-table" style="width: auto; table-layout: fixed; ">
					
																	            <tr>
																	              <th style=" white-space: nowrap; " rowspan="4" >결재</th>
																	              <td style=" white-space: nowrap; ">기안자</td>
																	            </tr>
																	            <tr>
																	              <td></td>
																	            </tr>
																	            <tr>
																	              <td ></td>
																	            </tr>
																	             <tr>
																	              <td ></td>
																	            </tr>
																	            
																		    </table>
																		    </div>
																		
																		</div>
												  </div>
												   <div class="row" style="margin-bottom: 50px;">
													  
													  <table class="my-table">
													    <tr>
													      <th>작성자</th>
													      <td id="formName">${form.name}</td>
													      <th>부서</th>
													      <td>${form.dept_name}</td>
													    </tr>
													    
													    <tr>
													      <th>문서 분류</th>
													      <td>${form.code_name}</td>
													      <th>프로젝트 종류</th>
													      <td>
													      		<div class="group">
											                        <select class="form-control">
																	   <c:if test="${form.project_kind eq '주택'}"> 
																	    <option selected>주택</option>
																	  </c:if>
																	  <c:if test="${form.project_kind eq '공공기관'}">
																	    <option selected>공공기관</option>
																	  </c:if>
																	  <c:if test="${form.project_kind eq '상가'}">
																	    <option selected>상가</option>
																	  </c:if> 
																	</select>
											                        
											                      </div>
														</td>
													    </tr>
													    
													    <tr>
													     <th>기간 및 일시</th>
													      <td style="justify-content: center; ">
													      		 <div class="group">
												                  <div class="input-group"  style="justify-content: space-around;">
												                    ${form.start_date}~${form.end_date}
												                  </div>
												                  <!-- /.input group -->
												                </div>
														</td>
													      <th>프로젝트 리더</th>
													      <td>
														     	 <input type="text" class="invisible-input" value="${form.project_leader}" id="project_leader">
														      </td>
													    </tr>
													  </table>
												  </div>
												 
												   <div class="row" style="margin-bottom: 50px;">
													  
													  
													  <table class="my-table">
													    <tr>
													  	  <th>제목</th>
														      <td>
														     	 <input type="text" class="invisible-input" placeholder="텍스트를 입력하세요" value="${form.paySubject}" id="paySubject">
														      </td>
													    </tr>
													  </table>
													  
												  </div>
												   <div class="row" style="margin-bottom: 50px;">
															  
															  <table class="my-table">
															    <tr>
															    	<th>내용</th>
															      <td>
																      <textarea rows="10" cols="50" id="payContent" style="width: 100%; height: 100%; border: none; resize: none;">${form.payContent}</textarea>
    															</td>
															    </tr>
															  </table>
											  	</div>
											  	<div class="row" style="margin-bottom: 50px;">
													  <table class="my-table">
													    <tr>
													  	  <th>파일첨부</th>
														      <td>
														     	 <div class="group">
												                    	
												                    <div class="input-group">
												                      <div class="custom-file">
												                        <input type="file" class="custom-file-input" id="exampleInputFile">
												                        <label class="custom-file-label" for="exampleInputFile">${form.ori_file_name }</label>
												                      </div>
												                      <div class="input-group-append">
												                        <span class="input-group-text">download</span>
												                      </div>
												                    </div>
												                  </div>
														      
														      
														      </td>
													    </tr>
													  </table>
												  </div>
												  
												  <div class="row" style="margin-bottom: 50px;">
													  <table class="my-table" id="referrer">
													    <tr>
													  	  <th style="background-color:white">참조자</th>
														      <td>
														     	 <input type="text" class="invisible-input" value="">
														      </td>
													    </tr>
													  </table>
													  
													  
													  
												  </div>
											  	
										  </div><!-- 그냥 감싸는 내용 div  -->
									</div><!--form container  -->	
								</div>
     					 </section>
					</div>
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
      
      
      
      
      
      <!--  결재 요청 모달-->
      <div class="modal fade" id="modal-default">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body" style="text-align: center;">
             <h4>결재 요청 하시겠습니까?</h4>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
              <button type="button" class="btn btn-primary" onclick="writeVacation()" >요청</button>
            </div>
          </div>
          <!-- /.modal-content --> 
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      
      
      <!--  결재선 모달-->
      <div class="modal fade" id="modal-lg2">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">결재선</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
		              <div class="card card-default">
					          
					          
					         <form id="demoform" action="#" method="post">
					          <div class="card-body">
								  <div class="row">
										  <div class="col-12">
										    <div class="form-group">
										      <label style="font-size:27px;">결재선 선택</label>
										      <div class="dual-listbox-container">
										        <select id="approvers" class="duallistbox" multiple="multiple" name="duallistbox_demo1[]">
										          <c:forEach items="${member}" var="member">
										          
										          <option value="${member.code_name} ${member.name} " >${member.code_name} ${member.name}</option>
										          

										          </c:forEach>
										        </select>
										      </div>
										    </div>
										    <!-- /.form-group -->
										  </div>
										  <!-- /.col -->
										</div>
									  <!-- /.row -->
									  
									  <div class="row">
										  <div class="col-12">
										    <div class="form-group">
										      <label style="font-size:27px;">참조자 선택</label>
										      <div class="dual-listbox-container">
										        <select id="referrer" class="duallistbox" multiple="multiple" name="duallistbox_demo2[]">
										           <c:forEach items="${member}" var="member">
										          
										          <option value="${member.code_name} ${member.name} " >${member.code_name} ${member.name}</option>
										        </c:forEach>
										        </select>
										      </div>
										    </div>
										   <!--  /.form-group -->
										  </div>
										  <!-- /.col -->
										</div>
									  <!-- /.row  -->

								</div>
					        </div>
					        <!-- /.card -->
					        
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				<button type="submit" id="submitButton" class="btn btn-primary" >요청</button>            
				</form>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      
      
      
      
					      
      
      <!--  결재 취소 모달-->
      <div class="modal fade" id="modal-default3">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body" style="text-align: center;">
             <h4>취소 하시겠습니까?</h4>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
              <button type="button" class="btn btn-primary">예</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      
      
      
     
     
      
	
	
 <jsp:include page="footer.jsp" />

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
</div><!--  제일 큰거-->
<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>

<!-- Bootstrap4 Duallistbox -->
<script src="plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>

<!-- bs-custom-file-input -->
<script src="plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>



<!-- jQuery -->
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
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- Page specific script -->



<script>



$(document).ready(function() {
    var document_id = $('#document_id').text();
    console.log('document_id :' + document_id );
	
    $.ajax({
        type: 'POST',
        url: 'payList.ajax',
        data: { document_id: document_id },
        dataType: 'json',
        success: function(data) {
            console.log(data);
            drawList(data.payList);
            /* drawList2(data.referrer); */
            if (data.success != null) {
            	
            } else {
                
            }
        },
        error: function(e) {
            console.log(e);
            alert('오류 발생');
        }
    });
});



	 
	 function drawList(approversVal) {
		  var nameValue = document.getElementById('formName').textContent;

		  var content = '<table class="my-table" style="width: auto; table-layout: fixed;">';

		  content += '<tr>';
		  content += '<th style=" white-space: nowrap;" rowspan="' + (approversVal.length + 3) + '">결재</th>';
		  content += '<td style=" white-space: nowrap;">기안자</td>';
		  for (var i = 0; i < approversVal.length; i++) {
		    content += '<td style=" white-space: nowrap;">결재자</td>';
		  }
		  content += '</tr>';

		  if (Array.isArray(approversVal) && approversVal.length > 0) {
		    content += '<tr>';
		    content += '<td>' + nameValue + '</td>';
		    for (var i = 0; i < approversVal.length; i++) {
		      var noteValue = approversVal[i].note;
		      content += '<td>' + approversVal[i].code_name + ' ' + approversVal[i].name + '</td>';
		    }
		    content += '</tr>';

		    content += '<tr>';
		    content += '<td>' + '신청' + '</td>';
		    for (var i = 0; i < approversVal.length; i++) {
		    	  var noteValue = approversVal[i].result;
		    	  var approvalStatus = '';

		    	  if (noteValue === '결재완료') {
		    	    approvalStatus = '승인';
		    	  } else if (noteValue === '반려') {
		    	    approvalStatus = '반려';
		    	  }

		    	  content += '<td>' + (approvalStatus !== '' ? approvalStatus : '') + '</td>';
		    	}
		    content += '</tr>';

		    content += '<tr>';
		    content += '<td>' + approversVal[0].reg_date + '</td>';
		    for (var i = 0; i < approversVal.length; i++) {
		      var noteValue = approversVal[i].note;
		      content += '<td>' + (noteValue !== null ? approversVal[i].modi_date : '') + '</td>';
		    }
		    content += '</tr>';
		  } else {
		    content += '<tr>';
		    content += '<td>' + nameValue + '</td>';
		    content += '<td></td>';
		    content += '</tr>';

		    content += '<tr>';
		    content += '<td>' + '신청' + '</td>';
		    content += '<td></td>';
		    content += '</tr>';

		    content += '<tr>';
		    content += '<td></td>';
		    content += '<td></td>';
		    content += '</tr>';
		  }

		  content += '</table>';

		  $('#list').html(content);
		}
	
	/* 
	 function drawList2(referrer) {
		  referrer.forEach(function(item, idx) {
		    console.log(item, idx);
		  });

		  var content2 = '<table class="my-table">';
		  content2 += '<tr>';
		  content2 += '<th style="background-color:white">참조자</th>';
		  content2 += '<td>';
		  referrer.forEach(function(item, idx) {
		    content2 += '<input type="text" class="invisible-input" value="' + item.name + '">';
		  });
		  content2 += '<td>';
		  content2 += '<tr>';
		  content2 += '</table>';

		  $('#referrer').html(content2);
		};
	
	 
	 */



$(function () {
	  bsCustomFileInput.init();
	});

/*  파일 미리보기 파일 ?? 아닌데.., 왜 안되지*/
 $(function () {
	  bsCustomFileInput.init();
	});



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
	  

function writeVacation() {
	  var approversVal = $('[name="duallistbox_demo1[]"]').val();
	  console.log(approversVal);

	  var referrer = $('[name="duallistbox_demo2[]"]').val();
	  console.log(referrer);

	  var fileInput = document.getElementById('exampleInputFile');
	  var file = fileInput.files[0]; // Get the selected file


	  var paymentValues = [];
	  var referrerValues = [];

	 var document_id = $('#document_id').text();
    console.log('document_id :' + document_id );
	  
	  // Other parameters
	  var $limit_date = $('#limit_date');
	  var $form_sort = $('#form_sort');
	  var $project_kind = $('#project_kind');
	  var $reservationtime = $('#reservationtime');
	  var $paySubject = $('#paySubject');
	  var $payContent = $('#payContent');
	  var $projectLeader = $('#projectLeader');
	  var $temp = $('#temp');


	  for (var i = 0; i < approversVal.length; i++) {
	    paymentValues.push(approversVal[i]);
	  }

	  for (var i = 0; i < referrer.length; i++) {
	    referrerValues.push(referrer[i]);
	  }
	  
	  var param = {
			  payment: paymentValues,
			  referrer: referrerValues,
		  	limit_date: $limit_date.val(),
		  	form_sort: $form_sort.val(),
		  	project_kind: $project_kind.val(),
		    reservationtime: $reservationtime.val(),
		    projectLeader: $projectLeader.val(),
		    temp: $temp.val(),
		    paySubject: $paySubject.val(),
		    payContent: $payContent.val()
		    
		   
		  };

	  console.log(param);


	
	  var formData = new FormData();

	  // Append other parameters to the FormData object
	  for (var key in param) {
	    if (param[key]) {
	      formData.append(key, param[key]);
	    }
	  }

	  formData.append('file', file); // Append the file to the FormData object

	  $.ajax({
	    type: 'POST',
	    url: 'writeVacationTemp.ajax',
	    data: formData,
	    dataType: 'json',
	    processData: false, // Prevent jQuery from automatically processing the data
	    contentType: false, // Prevent jQuery from automatically setting the content type
	    success: function(data) {
	      console.log(data);
  	      if (data != null) {
	  	        alert('요청이 완료되었습니다.');
	  	        location.href ='/paymentList.go';
	      } else {
	        alert('요청이 완료되었습니다.');
	      }
	    },
	    error: function(e) {
	      console.log(e);
	      alert('오류 발생');
	    }
	  });
}

</script>




</body>
</html>
