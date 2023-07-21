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
	height: 1272px;
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
  
           .transfer-demo {
            width: 640px;
            height: 400px;
            margin: 0 auto;
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
						          	<a id="formGnb_button" data-toggle="modal" data-target="#modal-lg2">결재선</a>
						          	<a id="formGnb_button" data-toggle="modal" data-target="#modal-default2">임시저장</a>
						          	
						          	<a id="formGnb_button" data-toggle="modal" data-target="#modal-default3">취소</a>
						          
						          		
					          		</div>	
					          </div>
					          <div class="col-sm-6">
					            <ol class="breadcrumb float-sm-right">
					              <li class="breadcrumb-item"><a href="#">결재 작성하기</a></li>
					              <li class="breadcrumb-item active">비품구매</li>
					            </ol>
					          </div>
					        </div>
					      </div><!-- /.container-fluid -->
					      
	
              
					      
					      
					    </section>
						
						<section class="content2">
							<div class="container">
												  <div class="form-container" id="realForm" style="border: 1px solid gray; padding: 10px;">
												    <div>
												    
  												    <input type="hidden"  id="form_sort" name="vacation" value="PAYMENT_BUY">
												    
												    
												    
												      <h1 style="text-align: center; margin-top: 25px; margin-bottom: 140px;">비품 구매</h1>
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
																				  <div class="input-group date" id="reservationdate" data-target-input="nearest">
																				    <input type="date" id="limit_date" name="limit_date" style="background-color: transparent; border: none; box-shadow: none; outline: none; color: transparent; text-shadow: 0 0 0 gray;">
																			    </div>
																			  </div>
																			</td>
																            </tr>
																            <tr>
																              <th style=" width: 1%; white-space: nowrap; ">문서번호</th>
																              <td >문서번호 입력란</td>
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
																              <td >${sessionScope.name}</td>
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
														
												  </div> <!-- 제일 윗줄 row  -->
												  
												  
												   <div class="row" style="margin-bottom: 50px;">
													  
													  <table class="my-table">
													    <tr>
													      <th>작성자</th>
													     <td id="formName">${sessionScope.name}</td>
													      <th>부서</th>
													      <td>부서 입력란</td>
													    </tr>
													    
													    <tr>
													      <th>문서 분류</th>
													      <td>문서 분류 입력란</td>
													      <th>비품 종류</th>
													      <td>
													      		<div class="group">
											                        
											                        <select class="form-control" id="equipment_kind">
											                          <option>자재</option>
											                          <option>장비</option>
											                          <option>기타</option>
											                        </select>
											                      </div>
														</td>
													    </tr>
													    
													   <tr>
														  <th>금액</th>
														  <td style="text-align: center;">
														    
														  	<input type="text" id="amount" class="invisible-input" oninput="this.value=this.value.replace(/[^0-9]/g,'');" placeholder="금액을 입력하세요"  style="text-align: center; " onblur="addCurrencySymbol(this);">
														  </td>
													      <th>운송장 여부</th>
													      <td>
														     	<div class="form-check form-check-inline">
															      <input class="form-check-input" type="radio" name="radioPeriod" id="radioMorning" value="있음">
															      <label class="form-check-label" for="radioMorning">있음</label>
															    </div>
															    <div class="form-check form-check-inline">
															      <input class="form-check-input" type="radio" name="radioPeriod" id="radioAfternoon" value="없음">
															      <label class="form-check-label" for="radioAfternoon">없음</label>
														    	</div>
                          								</td>
													    </tr>
													  </table>
												  </div>
												  <div class="row" style="margin-bottom: 50px;">
													  
													  
													  <table class="my-table">
													    <tr>
													  	  
														      <td >
														     	 <a>- 운송장 있을 시 ' 있음으로 체크하고 해당 내용 파일 첨부 요망</a><br>
														     	 <a>- 파일 첨부가 힘들 경우 해당 내용 내용란에 추가 </a>
														      </td>
													    </tr>
													  </table>
													  
												  </div>
												   <div class="row" style="margin-bottom: 50px;">
													  
													  
													  <table class="my-table">
													    <tr>
													  	  <th>제목</th>
														      <td>
														     	 <input type="text" class="invisible-input" placeholder="텍스트를 입력하세요" id="paySubject">
														      </td>
													    </tr>
													  </table>
													  
												  </div>
												   <div class="row" style="margin-bottom: 50px;">
															  
															  <table class="my-table">
															    <tr>
															    	<th>내용</th>
															      <td>
																      <textarea rows="10" cols="50"  id="payContent" style="width: 100%; height: 100%; border: none; resize: none;"></textarea>
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
												                        <label class="custom-file-label" for="exampleInputFile">Choose file</label>
												                      </div>
												                      <div class="input-group-append">
												                        <span class="input-group-text">Upload</span>
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
				            
				            <input type="hidden" id="temp" value="1">
				
				
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
      
      <!--  결재선결재선결재선결재선결재선결재선결재선결재선결재선결재선결재선결재선결재선결재선결재선결재선결재선결재선결재선결재선결재선결재선결재선결재선결재선결재선결재선결재선결재선결재선-->
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
      
      
       <!--  임시저장 모달-->
      <div class="modal fade" id="modal-default2">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body" style="text-align: center;">
             <h4>임시저장 하시겠습니까?</h4>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
              <button type="button" class="btn btn-primary" onclick="writeVacationTemp()">요청</button>
              
              
              
              
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      
       <!--  결재 요청 모달-->
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
              <button type="button" class="btn btn-default" data-dismiss="modal">아니요</button>
              <button type="button" class="btn btn-primary" onclick="goBack()">예</button>
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

</div>



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

function goBack() {
    window.history.back(); // 이전 페이지로 이동
  }


function writeVacation() {
	var approversVal = $('[name="duallistbox_demo1[]"]').val();
	console.log(approversVal);
	
	  var referrer = $('[name="duallistbox_demo2[]"]').val();
	 console.log(referrer);
	 
	 

	  var fileInput = document.getElementById('exampleInputFile');
	  var file = fileInput.files[0]; // Get the selected file

	  

	  
	  
	     if (file) {
	    	 var formData = new FormData();

	  // 파일이 추가 되지 않으면 파일 append 하지 않음 (예외처리)
		  formData.append('file', file); // Append the file to the FormData object
	} else {
	    // 빈 파일 객체 추가
	    alert('파일을 추가해 주세요.');
	  } 
	  
	  
	 

	  var paymentValues = [];
	  var referrerValues = [];
	  
	  // Other parameters
	  var $limit_date = $('#limit_date');
	  var $form_sort = $('#form_sort');
	  var $equipment_kind = $('#equipment_kind');
	  var $amount = $('#amount');
	  var $paySubject = $('#paySubject');
	  var $payContent = $('#payContent');
	  var $radioPeriod = $('input[name="radioPeriod"]:checked');
	  
	   //for (var i = 0; i < approversVal.length; i++) {
		    
		   //var paymentValue= $('#payment'+[i]+'');
		  //var $payment= $('#payment'+[i]+'');
		    // payment 값을 배열에 추가
		  
		//}
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
	  	equipment_kind: $equipment_kind.val(),
	  	amount: $amount.val(),
	    radioPeriod: $radioPeriod.val(),
	    paySubject: $paySubject.val(),
	    payContent: $payContent.val()
	    
	   
	  };
		console.log(param);
		

		  // 작성 여부 확인
		  if (!param.limit_date || !param.paySubject || !param.payContent) {
		    if (!param.limit_date) {
		      alert('기안일을 선택해주세요.');
		    } else if (!param.paySubject) {
		      alert('제목을 작성해주세요.');
		    } else if (!param.payContent) {
		      alert('내용을 추가해주세요.');
		    } else {
		      alert('작성되지 않은 항목이 있습니다.');
		    }
		    return; // 작성되지 않은 항목이 있으면 함수 종료
		  }
		  
		  // 결재자 여부 확인
		  
		    if (paymentValues.length === 0) {
		    alert('결재자를 한 명 이상 추가해 주세요.');
		    return; // 함수 종료
		  }
		

	  // Append other parameters to the FormData object
	  for (var key in param) {
		    if (param[key]) {
		      formData.append(key, param[key]);
		    }
		  }

	  $.ajax({
	    type: 'POST',
	    url: 'writeVacation.ajax',
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
	        alert('전송 실패');
	      }
	    },
	    error: function(e) {
	      console.log(e);
	      alert('오류 발생');
	    }
	  });
	
}


// 임시저장 요청
function writeVacationTemp() {
	var approversVal = $('[name="duallistbox_demo1[]"]').val();
	console.log(approversVal);
	
	 var referrer = $('[name="duallistbox_demo2[]"]').val();
	 console.log(referrer);
	
	  var fileInput = document.getElementById('exampleInputFile');
	  var file = fileInput.files[0]; // Get the selected file

	  var formData = new FormData();
	  
	  // 파일이 추가 되지 않으면 파일 append 하지 않음 (예외처리)
	  if (file) {
		  formData.append('file', file); // Append the file to the FormData object
		}
	  

	  var paymentValues = [];
	  var referrerValues = [];
	  
	  // Other parameters
	  var $limit_date = $('#limit_date');
	  var $form_sort = $('#form_sort');
	  var $equipment_kind = $('#equipment_kind');
	  var $amount = $('#amount');
	  var $paySubject = $('#paySubject');
	  var $payContent = $('#payContent');
	  var $radioPeriod = $('input[name="radioPeriod"]:checked');
	  var $temp = $('#temp');
	  
	  
	   //for (var i = 0; i < approversVal.length; i++) {
		    
		   //var paymentValue= $('#payment'+[i]+'');
		  //var $payment= $('#payment'+[i]+'');
		    // payment 값을 배열에 추가
		  
		//}
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
		  	equipment_kind: $equipment_kind.val(),
		  	amount: $amount.val(),
		  	temp: $temp.val(),
		    radioPeriod: $radioPeriod.val(),
		    paySubject: $paySubject.val(),
		    payContent: $payContent.val()
		    
		   
		  };
		console.log(param);
		

		  // 작성 여부 확인
		  if (!param.limit_date || !param.paySubject || !param.payContent) {
		    if (!param.limit_date) {
		      alert('기안일을 선택해주세요.');
		    } else if (!param.paySubject) {
		      alert('제목을 작성해주세요.');
		    } else if (!param.payContent) {
		      alert('내용을 추가해주세요.');
		    } else {
		      alert('작성되지 않은 항목이 있습니다.');
		    }
		    return; // 작성되지 않은 항목이 있으면 함수 종료
		  }
		  
		  // 결재자 여부 확인
		  
		    if (paymentValues.length === 0) {
		    alert('결재자를 한 명 이상 추가해 주세요.');
		    return; // 함수 종료
		  }

	  // Append other parameters to the FormData object
	  for (var key in param) {
	    formData.append(key, param[key]);
	  }

	  $.ajax({
	    type: 'POST',
	    url: 'writeVacation.ajax',
	    data: formData,
	    dataType: 'json',
	    processData: false, // Prevent jQuery from automatically processing the data
	    contentType: false, // Prevent jQuery from automatically setting the content type
	    success: function(data) {
	      console.log(data);
	      if (data != null) {
		        alert('요청이 완료되었습니다.');
		        location.href ='/paymentListTemp.go';
	        
	      } else {
	        alert('전송 실패');
	      }
	    },
	    error: function(e) {
	      console.log(e);
	      alert('오류 발생');
	    }
	  });
	}
 

//(마무리)임시저장 요청 


/*  결재선 데이터 전송*/


$("#approvers").bootstrapDualListbox({
	  // 기타 매개변수 설정
	  infoText: false, // "Showing all {0}" 메시지 숨김
	  filterPlaceHolder: '검색어를 입력하세요' ,// 검색 입력란 플레이스홀더 변경
	  moveAllLabel: '' // "Move all" 버튼 제거
	});
$("#referrer").bootstrapDualListbox({
	  // 기타 매개변수 설정
	  infoText: false, // "Showing all {0}" 메시지 숨김
	  filterPlaceHolder: '검색어를 입력하세요' ,// 검색 입력란 플레이스홀더 변경
	  moveAllLabel: '' // "Move all" 버튼 제거
	});


var demo1 = $('select[name="duallistbox_demo1[]"]').bootstrapDualListbox();
$("#demoform").submit(function() {
  
  var approversVal = $('[name="duallistbox_demo1[]"]').val();
  console.log(approversVal);
  drawList(approversVal);  
  
  
  
  return false;
});


var demo1 = $('select[name="duallistbox_demo2[]"]').bootstrapDualListbox();
$("#demoform").submit(function() {
  
  var referrer = $('[name="duallistbox_demo2[]"]').val();
  console.log(referrer);
  drawList2(referrer);  
  return false;
});




function drawList(approversVal) {
	  var nameValue = document.getElementById('formName').textContent;
	  var content = '<table class="my-table" style="width: auto; table-layout: fixed;">';

	  content += '<tr>';
	  content += '<th style=" white-space: nowrap;" rowspan="' + (approversVal.length + 3) + '">결재</th>';
	  content += '<td style=" white-space: nowrap;">기안자</td>';

	  var loopLimit = Math.min(4, approversVal.length); // 최대 4개까지만 반복
	  for (var i = 0; i < loopLimit; i++) {
	    content += '<td style=" white-space: nowrap;">결재자</td>';
	  }
	  content += '</tr>';

	  content += '<tr>';
	  content += '<td>' + nameValue + '</td>';
	  for (var i = 0; i < loopLimit; i++) {
	    content += '<td id="payment' + [i] + '">' + approversVal[i] + '</td>';
	  }
	  content += '</tr>';

	  content += '<tr>';
	  content += '<td></td>';
	  for (var i = 0; i < loopLimit; i++) {
	    content += '<td></td>';
	  }
	  content += '</tr>';

	  content += '<tr>';
	  content += '<td></td>';
	  for (var i = 0; i < loopLimit; i++) {
	    content += '<td></td>';
	  }
	  content += '</tr>';

	  content += '</table>';

	  $('#list').html(content);

	  if (approversVal.length > 4) {
	    alert('결재자는 최대 4명까지만 표시됩니다.');
	  }
	};


function drawList2(referrer) {
	referrer.forEach(function(item,idx){
		console.log(item,idx)
		
		});
		var content2 = '<table class="my-table">'
		
		content2 += '<tr>';
		content2 += '<th style="background-color:white">참조자</th>';
		content2 += '<td>';
		content2 += '<input type="text" class="invisible-input" value="'+referrer+'">';
		content2 += '<td>';
		content2 += '<tr>';
		content2 += '</table>';
	 
	  
	  
	  $('#referrer').html(content2);
	  // 테이블을 어떤 엘리먼트에 추가할지 결정하고, 해당 엘리먼트에 HTML 내용을 할당
	  
}; 




$(function () {
	  bsCustomFileInput.init();
	});

/*  파일 미리보기 파일 ?? 아닌데.., 왜 안되지*/
 $(function () {
	  bsCustomFileInput.init();
	});
	
$(function () {
    //Initialize Select2 Elements
    $('.select2').select2()

    //Initialize Select2 Elements
    $('.select2bs4').select2({
      theme: 'bootstrap4'
    })

    //Datemask dd/mm/yyyy
    $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
    //Datemask2 mm/dd/yyyy
    $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
    //Money Euro
    $('[data-mask]').inputmask()

    //Date picker
    $('#reservationdate').datetimepicker({
        format: 'L'
    });

    //Date and time picker
    $('#reservationdatetime').datetimepicker({ icons: { time: 'far fa-clock' } });

    //Date range picker
    $('#reservation').daterangepicker()
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({
      timePicker: true,
      timePickerIncrement: 30,
      locale: {
        format: 'MM/DD/YYYY hh:mm A'
      }
    })
    //Date range as a button
    $('#daterange-btn').daterangepicker(
      {
        ranges   : {
          'Today'       : [moment(), moment()],
          'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
          'This Month'  : [moment().startOf('month'), moment().endOf('month')],
          'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        },
        startDate: moment().subtract(29, 'days'),
        endDate  : moment()
      },
      function (start, end) {
        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
      }
    )

    //Timepicker
    $('#timepicker').datetimepicker({
      format: 'LT'
    })

    //Bootstrap Duallistbox
     $('.duallistbox').bootstrapDualListbox() 

    //Colorpicker
    $('.my-colorpicker1').colorpicker()
    //color picker with addon
    $('.my-colorpicker2').colorpicker()

    $('.my-colorpicker2').on('colorpickerChange', function(event) {
      $('.my-colorpicker2 .fa-square').css('color', event.color.toString());
    })
  })
  // BS-Stepper Init
  document.addEventListener('DOMContentLoaded', function () {
    window.stepper = new Stepper(document.querySelector('.bs-stepper'))
  })

  // DropzoneJS Demo Code Start
  Dropzone.autoDiscover = false

  // Get the template HTML and remove it from the doumenthe template HTML and remove it from the doument
  var previewNode = document.querySelector("#template")
  previewNode.id = ""
  var previewTemplate = previewNode.parentNode.innerHTML
  previewNode.parentNode.removeChild(previewNode)

  var myDropzone = new Dropzone(document.body, { // Make the whole body a dropzone
    url: "/target-url", // Set the url
    thumbnailWidth: 80,
    thumbnailHeight: 80,
    parallelUploads: 20,
    previewTemplate: previewTemplate,
    autoQueue: false, // Make sure the files aren't queued until manually added
    previewsContainer: "#previews", // Define the container to display the previews
    clickable: ".fileinput-button" // Define the element that should be used as click trigger to select files.
  })

  myDropzone.on("addedfile", function(file) {
    // Hookup the start button
    file.previewElement.querySelector(".start").onclick = function() { myDropzone.enqueueFile(file) }
  })

  // Update the total progress bar
  myDropzone.on("totaluploadprogress", function(progress) {
    document.querySelector("#total-progress .progress-bar").style.width = progress + "%"
  })

  myDropzone.on("sending", function(file) {
    // Show the total progress bar when upload starts
    document.querySelector("#total-progress").style.opacity = "1"
    // And disable the start button
    file.previewElement.querySelector(".start").setAttribute("disabled", "disabled")
  })

  // Hide the total progress bar when nothing's uploading anymore
  myDropzone.on("queuecomplete", function(progress) {
    document.querySelector("#total-progress").style.opacity = "0"
  })

  // Setup the buttons for all transfers
  // The "add files" button doesn't need to be setup because the config
  // `clickable` has already been specified.
  document.querySelector("#actions .start").onclick = function() {
    myDropzone.enqueueFiles(myDropzone.getFilesWithStatus(Dropzone.ADDED))
  }
  document.querySelector("#actions .cancel").onclick = function() {
    myDropzone.removeAllFiles(true)
  }
  // DropzoneJS Demo Code End */




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




// 금액부분 추가

function addCurrencySymbol(input) {
  var value = input.value;
  if (value !== '') {
    var numberWithCommas = addCommas(value);
    input.value = '₩' + numberWithCommas;
  }
}

function addCommas(number) {
  return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
  

</script>




</body>
</html>
