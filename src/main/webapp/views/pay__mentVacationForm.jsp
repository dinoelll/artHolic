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
  
  
  
  <!--  duallist-->
<link rel="stylesheet" href="dist/css/icon_font/css/icon_font.css">
<link rel="stylesheet" href="dist/css/dual/jquery.transfer.css">  

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
  
  
          .transfer-demo {
            width: 640px;
            height: 400px;
            margin: 0 auto;
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
						        <p>임시저장</p>
						      </div>
						    </div>
						    <div>
						      <button type="button" class="btn btn-block btn-secondary btn-lg" id="paybutton3" onclick="toggleInboxTree()">결재 수신함</button>
						      <div id="inboxTree"><!--  style="display: none;" -->
						        <p>결재하기</p>
						        <p>결재내역</p>
						        <p>수신참조</p>
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
					              <li class="breadcrumb-item active">휴가신청</li>
					            </ol>
					          </div>
					        </div>
					      </div><!-- /.container-fluid -->
					      
	
              
					      
					      
					    </section>
						
						<section class="content2">
							<div class="container">
								<form action="paymentWrite.do" method="post">
												  <div class="form-container" id="realForm" style="border: 1px solid gray; padding: 10px;">
												    <div>
												      <h1 style="text-align: center; margin-top: 25px; margin-bottom: 140px;">휴가 신청</h1>
												      <div class="row" style="margin-bottom: 50px;">
												        
												          <table class="my-table" style="width: auto; table-layout: fixed; margin-left:5px; margin-top: 50px; margin-right: 530px;">
												            <colgroup>
												              <col style="width: 30%;">
												              <col style="width: 70%;">
												            </colgroup>
												            <tr>
												              <th style="width: 1%; white-space: nowrap; vertical-align: middle;">기안일</th>
												              <td>
																<div class="group">
																  <div class="input-group date" id="reservationdate" data-target-input="nearest">
																    <input type="date" style="background-color: transparent; border: none; box-shadow: none; outline: none; color: transparent; text-shadow: 0 0 0 gray;">
																   
																      
																    </div>
																  </div>
																</div>
															</td>
												            </tr>
												            <tr>
												              <th style=" width: 1%; white-space: nowrap; ">문서번호</th>
												              <td >문서번호 입력란</td>
												            </tr>
												          </table>
												        
												       
												          <table class="my-table" style="width: auto; table-layout: fixed;">
												            <colgroup>
												              <col style="width: 15%;">
												              <col style="width: 42.5%;">
												              <col style="width: 42.5%;">
												            </colgroup>
												            <tr>
												              <th style=" width: 1%; white-space: nowrap; " rowspan="4" >결재</th>
												              <td style=" width: 1%; white-space: nowrap; ">기안자</td>
												              
												            </tr>
												            <tr>
												              
												              <td >김형준</td>
												              
												            </tr>
												            <tr>
												              
												              <td ></td>
												              
												            </tr>
												             <tr>
												              <td ></td>
												              
												            </tr>
													    </table>
												  </div>
												   <div class="row" style="margin-bottom: 50px;">
													  
													  <table class="my-table">
													    <tr>
													      <th>작성자</th>
													      <td>작성자 입력란</td>
													      <th>부서</th>
													      <td>부서 입력란</td>
													    </tr>
													    
													    <tr>
													      <th>문서 분류</th>
													      <td>문서 분류 입력란</td>
													      <th>종류</th>
													      <td>
													      		<div class="group">
											                        
											                        <select class="form-control" >
											                          <option>휴가</option>
											                          <option>연차</option>
											                          <option>반차</option>
											                        </select>
											                      </div>
														</td>
													    </tr>
													    
													    <tr>
													      <th>기간 및 일시</th>
													      <td>
													      		 <div class="group">
												                  
												
												                  <div class="input-group" >
												                    <div class="input-group-prepend">
												                      <span class="input-group-text"><i class="far fa-clock"></i></span>
												                    </div>
												                    <input type="text" class="form-control float-right" id="reservationtime">
												                  </div>
												                  <!-- /.input group -->
												                </div>
														</td>
													      <th>반차 여부</th>
													      <td>
														     <div class="form-check form-check-inline">
															      <input class="form-check-input" type="radio" name="radioPeriod" id="radioMorning">
															      <label class="form-check-label" for="radioMorning">오전</label>
															    </div>
															    <div class="form-check form-check-inline">
															      <input class="form-check-input" type="radio" name="radioPeriod" id="radioAfternoon">
															      <label class="form-check-label" for="radioAfternoon">오후</label>
														    </div>
                          								</td>
													    </tr>
													  </table>
												  </div>
												   <div class="row" style="margin-bottom: 50px;">
													  
													  
													  <table class="my-table">
													    <tr>
													  	  <th>제목</th>
														      <td>
														     	 <input type="text" class="invisible-input" placeholder="텍스트를 입력하세요">
														      </td>
													    </tr>
													  </table>
													  
												  </div>
												   <div class="row" style="margin-bottom: 50px;">
															  
															  <table class="my-table">
															    <tr>
															    	<th>내용</th>
															      <td>
																      <textarea rows="10" cols="50" style="width: 100%; height: 100%; border: none; resize: none;"></textarea>
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
													  
													  
													  <table class="my-table">
													    <tr>
													  	  <th style="background-color:white">참조자</th>
														      <td>
														     	 <input type="text" class="invisible-input" placeholder="텍스트를 입력하세요">
														      </td>
													    </tr>
													  </table>
													  
												  </div>
											  	<button>전송</button>
										  </div><!-- 그냥 감싸는 내용 div  -->
										  </form>
									</div><!--form container  -->	
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
					          
					          
					          <div class="card-body">
								  <div class="row">
										  <div class="col-12">
										    <div class="form-group">
										      <label style="font-size:27px;">결재선 선택</label>
										      <div>
											      
											        <div id="transfer3" class="transfer-demo"></div>
											        <div id="transfer4" class="transfer-demo"></div>
											    </div>
										      <!-- <div class="dual-listbox-container">
										        <select id="approvers" name="approvers" class="duallistbox" multiple="multiple">
										          <option selected id="deri" name="deri" value="deri">대리 김형준</option>
										          <option value="amugae">과장 아무개</option>
										          <option>California</option>
										          <option>Delaware</option>
										          <option>Tennessee</option>
										          <option>Texas</option>
										          <option>Washington</option>
										        </select>
										      </div> -->
										    </div>
										    <!-- /.form-group -->
										  </div>
										  <!-- /.col -->
										</div>
									  <!-- /.row -->
									<!--   <div class="row">
										  <div class="col-12">
										    <div class="form-group">
										      <label style="font-size:27px;">참조자 선택</label>
										      <div class="dual-listbox-container">
										        <select id="referrer" class="duallistbox" multiple="multiple">
										          <option selected>대리 김형준</option>
										          <option>과장 아무개</option>
										          <option>California</option>
										          <option>Delaware</option>
										          <option>Tennessee</option>
										          <option>Texas</option>
										          <option>Washington</option>
										        </select>
										      </div>
										    </div>
										    /.form-group
										  </div>
										  /.col
										</div>
									  /.row
								    -->
              

								</div>

					        </div>
					        <!-- /.card -->
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				<button type="button" id="submitButton" class="btn btn-primary">요청</button>            
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
              <button type="button" class="btn btn-primary">요청</button>
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
              <button type="button" class="btn btn-primary">요청</button>
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
              <button type="button" class="btn btn-primary">예</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
      
      
      
     
     
     
      
	
	
  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
    
      <b>Version</b> 3.2.0
    </div>
    <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong> All rights reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
</div><!--  제일큰 거-->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>


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

<!-- duallist  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="dist/js/jquery.transfer.js?v=0.0.6"></script>
<script type="text/javascript">
   
    var groupDataArray1 = [
        {
            "groupName": "China",
            "groupData": [
                {
                    "city": "Beijing",
                    "value": 122
                },
                {
                    "city": "Shanghai",
                    "value": 643
                },
                {
                    "city": "Qingdao",
                    "value": 422
                },
                {
                    "city": "Tianjin",
                    "value": 622
                }
            ]
        },
        {
            "groupName": "Japan",
            "groupData": [
                {
                    "city": "Tokyo",
                    "value": 132
                },
                {
                    "city": "Osaka",
                    "value": 112
                },
                {
                    "city": "Yokohama",
                    "value": 191
                }
            ]
        }
    ];

    var settings3 = {
        "groupDataArray": groupDataArray1,
        "groupItemName": "groupName",
        "groupArrayName": "groupData",
        "itemName": "city",
        "valueName": "value",
        "callable": function (items) {
            console.dir(items)
        }
    };

    $("#transfer3").transfer(settings3);
</script>

<script>
var groupDataArray2 = [
        {
            "groupName": "China",
            "groupData": [
                {
                    "city": "Beijing",
                    "value": 122,
                    "selected": true
                },
                {
                    "city": "Shanghai",
                    "value": 643,
                    "disabled": true
                },
                {
                    "city": "Qingdao",
                    "value": 422
                },
                {
                    "city": "Tianjin",
                    "value": 622
                }
            ]
        },
        {
            "groupName": "Japan",
            "groupData": [
                {
                    "city": "Tokyo",
                    "value": 132,
                    "selected": true
                },
                {
                    "city": "Osaka",
                    "value": 112,
                    "selected": true
                },
                {
                    "city": "Yokohama",
                    "value": 191,
                    "selected": true
                }
            ]
        }
    ];

    var settings4 = {
        "groupDataArray": groupDataArray2,
        "groupItemName": "groupName",
        "groupArrayName": "groupData",
        "itemName": "city",
        "valueName": "value",
        "callable": function (items) {
            console.dir(items)
        }
    };

    var transfer = $("#transfer4").transfer(settings4);
    // get selected items
    var items = transfer.getSelectedItems()
    console.log("Manually get selected items: %o", items);
</script>

<script>



/* $(document).ready(function() {
	  $('#submitButton').click(function() {
	    console.log('이벤트 실행됨');
	    console.log('요청 들어옴!!!!');
	    console.log('approvers');
	    var formData = new FormData();
	    formData.append('approvers', $approvers.val());
	   
	    console.log(formData);
	  });
	});
 */

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
  
/* $(document).ready(function() {
    

    $('#submitButton').click(function() {
      console.log('버튼이 클릭되었습니다.'); // 버튼 클릭 시 메시지 출력
      var selectedOptions = $('#approvers').val();
      console.log(selectedOptions); // 선택된 옵션 값 출력

      $.ajax({
        url: 'your_controller_url',
        method: 'POST',
        data: {
          selectedOptions: selectedOptions
        },
        success: function(response) {
          console.log('전송 완료');
        },
        error: function(xhr, status, error) {
          console.error('전송 실패');
        }
      });
    });
  }); */

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


  


</script>




</body>
</html>
