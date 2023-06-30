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
  
  <style>

/* gnb 스타일 */

 #payController{
	margin-top: 20px; 
	margin-left: 40px;
	
     align-items: center;
		
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
	margin-left: 0px;
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
  
    
  
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<!--   타임 라인 시작 !!!!-->
  <!-- Content Wrapper. Contains page content -->

	<div class="row"> 
		<div class="col-sm-2">
			<section class="content" >
			
					<div class="sidebar">
					
						<div class="card" id="payController" style="align-items: center; text-align: center;">
							
							
							<div >
						        <button type="button" class="btn btn-block btn-primary btn-lg" id="paybutton" data-toggle="modal" data-target="#modal-lg">결재 작성하기</button>
						      </div>
						       <div >
						        <button type="button" class="btn btn-block btn-secondary btn-lg" id="paybutton2">결재HOME</button>
						      </div>
						        <div >
						        <button type="button" class="btn btn-block btn-secondary btn-lg" id="paybutton2">결재 생산함</button>
						      </div>
						        <p>결재 문서함 </p>
						        <p>임시저장 </p>
					         <div >
						        <button type="button" class="btn btn-block btn-secondary btn-lg" id="paybutton2">결재 수신함</button>
						      </div>
						        <p>결재하기 </p>
						        <p>결재내역 </p>
						        <p>수신참조 </p>
						      
						      
							      
						</div>
					</div>
			</section>
		</div><!--  sm-2 왼쪽 컨트롤러 부분-->
		
		
		
		<div class="col-sm-10">
		<div class="row">
			<div class="col-sm-6">
		   		<section class="content-header">
				     <div class="container-fluid">
				       <div class="row mb-2">
				         <div class="col-sm-6">
				           <h1>나의 결재현황</h1>
				         </div>
				         <div class="col-sm-6">
				           <ol class="breadcrumb float-sm-right">
				
				           </ol>
				         </div>
				       </div>
				     </div><!-- /.container-fluid -->
				   </section>
				   <!-- Content Header (Page header) -->
				
				   <!-- Main content -->
				   <section class="content2">
						<div class="card" id="timelineCard">
				     <div class="container-fluid">
				
				       <!-- Timelime example  -->
				       <div class="row">
				         <div class="col-md-12">
				           <!-- The time line -->
				           <div class="timeline" style="margin-top:10px;">
				             <!-- timeline time label -->
				             <div class="time-label">
				               <span class="bg-gray">10 Feb. 2014</span>
				             </div>
				             <!-- /.timeline-label -->
				             <!-- timeline item -->
				             <div>
				               <i class="fas fa-solid fa-download bg-gray"></i> 
				               <div class="timeline-item">
				                 <span class="time"><i class="fas fa-clock"></i> 2014-02-10 16:34:29</span>
				                 <h3 class="timeline-header"><a href="#" >휴가 신청</a> </h3>
				                 <div class="timeline-body">
								      <div class="d-flex justify-content-between align-items-center">
								      
								        <div >
								          기안자: 형준 사원<br>
								          기안일자: 2014.02.11<br>
								          결재양식: 휴가신청
								        </div>
								        <a class="btn btn-primary btn-sm float-right">진행중</a>
								      </div>
								    </div>
				               </div>
				             </div>
				             <!-- END timeline item -->
				             <!-- timeline item -->
				             <div>
				               <i class="fas fa-check bg-green"></i>
				                <div class="timeline-item">
				                 <span class="time"><i class="fas fa-clock"></i> 2014-02-10 16:34:29</span>
				                 <h3 class="timeline-header"><a href="#" >휴가 신청</a> </h3>
				                 <div class="timeline-body">
								      <div class="d-flex justify-content-between align-items-center">
								        <div >
								          기안자: 형준 사원<br>
								          기안일자: 2014.02.11<br>
								          <a style="color:#9d9d9d">결재양식 : 프로젝트 신청</a>
								        </div>
								        <a class="btn btn-Secondary  btn-sm float-right bs-tertiary-color">완료</a>
								      </div>
								    </div>
				               </div>
				             </div>
				             <div class="time-label">
				               <span class="bg-gray">9 Feb. 2014</span>
				             </div>
				             <!-- END timeline item -->
				             <!-- timeline item -->
				             <div>
				               <i class="fas fa-clock bg-blue"></i>
				               <div class="timeline-item">
				                 <span class="time"><i class="fas fa-clock"></i> 2014-02-10 16:34:29</span>
				                 <h3 class="timeline-header"><a href="#" >가위 비품 신청</a> </h3>
				                 <div class="timeline-body">
								      <div class="d-flex justify-content-between align-items-center">
								        <div >
								          기안자: 형준 사원<br>
								          기안일자: 2014.02.11<br>
								          <a style="color:#9d9d9d">결재양식 : 비품 신청</a>
								        </div>
								        <a class="btn btn-primary btn-sm float-right">진행중</a>
								      </div>
								    </div>
				               </div>
				             </div>
				             <!-- END timeline item -->
				             <!-- timeline time label -->
				             <!-- /.timeline-label -->
				             <!-- timeline item -->
				             <div>
				               <i class="fa  fa-book bg-yellow" style="color:#ffffff"></i>
				               <div class="timeline-item">
				                 <span class="time"><i class="fas fa-clock"></i> 2014-02-10 16:34:29</span>
				                 <h3 class="timeline-header"><a href="#" >휴가신청</a> </h3>
				                 <div class="timeline-body">
								      <div class="d-flex justify-content-between align-items-center">
								        <div >
								          기안자: 형준 사원<br>
								          기안일자: 2014.02.11<br>
								          <a style="color:#9d9d9d">결재양식 : 비품 신청</a>
								        </div>
								        <a class="btn btn-primary btn-sm float-right">진행중</a>
								      </div>
								    </div>
				               </div>
				             </div>
				             <!-- END timeline item -->
				             <!-- timeline item -->
				             <!-- END timeline item -->
				           </div>
				         </div>
				         <!-- /.col -->
				       </div>
				     </div>
				     <!-- /.timeline -->
				
			 		</div> <!--카드  -->
				   </section>
				   <!-- /.content -->
				 
			 	</div> <!--col-md-6  -->
			  	<div class="col-sm-6">
			  		<section class="content-header">
					      <div class="container-fluid">
					        <div class="row mb-2">
					          <div class="col-sm-6">
					            <h1>반려함</h1>
					          </div>
					          <div class="col-sm-6">
					            <ol class="breadcrumb float-sm-right">
					            	<li class="breadcrumb-item" style="margin-right:50px;"><a href="#">more ></a></li>
					            </ol>
					          </div>
					        </div>
					      </div><!-- /.container-fluid -->
			    	</section>
				    	<section class="content2">
							<div class="card" id="reject">
								<div class="card-body p-0">
										<table class="table table-sm" >
												<thead>
													<tr>
														<th style="width: 0%" class="center">#</th>
														<th style="width: 17%" class="center">기안자</th>
														<th style="width: 55%" class="center">제목</th>
														<th style="width: 20%" class="center">종료일</th>
													</tr>
												</thead>
												<tbody>
												<%-- 
													<c:if test="${list.size()==0 }">
														<tr><th colspan="5">게시물이 없습니다.</th></tr>
													</c:if>
													<c:forEach items="${list}" var="bbs">
														<tr>
															<td>${bbs.id}</td>
															<td>${bbs.name}</td>
															<td>${bbs.age}</td>
														</tr>			
													</c:forEach>
												 --%>
													<tr>
														<td>1.</td>
														<td>형준사원</td>
														<td>브라켓  검토를 위한 연장...</td>
														<td>2014-02-10</td>
													</tr>
												<tr>
													<td>2.</td>
													<td>형준사원</td>
													<td>고속터미널 공사 관련 결...</td>
													<td>2014-02-10</td>
												<tr>
													<td>3.</td>
													<td>형준사원</td>
													<td>연차 쓰고 싶어요</td>
													<td>2014-02-10</td>
												</tr>
												<tr>
													<td>4.</td>
													<td>형준사원</td>
													<td>연봉 협상 관련 결재입니...</td>
													<td>2014-02-10</td>
												</tr>
												</tbody>
										</table>
								</div>
							</div>
						</section>	
						<section class="content-header">
					      <div class="container-fluid">
					        <div class="row mb-2">
					          <div class="col-sm-6">
					            <h1>결재완료</h1>
					          </div>
					          <div class="col-sm-6">
					            <ol class="breadcrumb float-sm-right">
					            	<li class="breadcrumb-item" style="margin-right:50px;"><a href="#">more ></a></li>
					            </ol>
					          </div>
					        </div>
					      </div><!-- /.container-fluid -->
			    	</section>
			    	<section class="content2">
							 <div class="card-body" id="donePayment">
				                <div class="callout callout-Danger">
						                  <h5>인테리어 디자인 승인건</h5>
						
						                  <p>
						                  <div class="row">
						                  <div class="col-sm-1">
						                  		<img class="img-fluid rounded-circle" src="../../dist/img/man_default.png" alt="">
						                  </div>
						                  <div class="col-sm-7">
						                  기안자 : 김형준 <br>
						                  종료일 : 2014-01-04
						                  </div>
						                  <div class="col-sm-3">
						                 
						                  </div>
						                  </div>
						                    </p>
				                </div>
				                <div class="callout callout-info">
						                 <h5>비품관련</h5>
						
						                  <p>
						                  <div class="row">
						                  <div class="col-sm-1">
						                  		<img class="img-fluid rounded-circle" src="../../dist/img/여자 증명사진.png" alt="">
						                  </div>
						                  <div class="col-sm-7">
						                  기안자 : 아무개 <br>
						                  종료일 : 2014-01-02
						                  </div>
						                  <div class="col-sm-3">
						                 
						                  </div>
						                  </div>
						                    </p>
				                </div>
				                <div class="callout callout-success">
						                  <h5>프로젝트 승인건</h5>
						
						                  <p>
						                  <div class="row">
						                  <div class="col-sm-1">
						                  		<img class="img-fluid rounded-circle" src="../../dist/img/man_default.png" alt="">
						                  </div>
						                  <div class="col-sm-7">
						                  기안자 : 홍길동 <br>
						                  종료일 : 2014-01-04
						                  </div>
						                  <div class="col-sm-3">
						                 
						                  </div>
						                  </div>
						                    </p>
				                </div>
			              </div>
			              <!-- /.card-body -->
					
							
					</section>
			  	</div><!-- col-md-6 -->
			  	
		  	</div>
	  	</div>	
		
	  </div><!--  col-sm-9 -->	
</div>
  
  <!-- /.content-wrapper -->
	
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

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>

<!-- SweetAlert2 -->
<script src="plugins/sweetalert2/sweetalert2.min.js"></script>
<!-- Toastr -->
<script src="plugins/toastr/toastr.min.js"></script>


<script>
$(function() {
    var Toast = Swal.mixin({
      toast: true,
      position: 'top-end',
      showConfirmButton: false,
      timer: 3000
    });

    $('.swalDefaultSuccess').click(function() {
      Toast.fire({
        icon: 'success',
        title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.swalDefaultInfo').click(function() {
      Toast.fire({
        icon: 'info',
        title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.swalDefaultError').click(function() {
      Toast.fire({
        icon: 'error',
        title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.swalDefaultWarning').click(function() {
      Toast.fire({
        icon: 'warning',
        title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.swalDefaultQuestion').click(function() {
      Toast.fire({
        icon: 'question',
        title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });

    $('.toastrDefaultSuccess').click(function() {
      toastr.success('Lorem ipsum dolor sit amet, consetetur sadipscing elitr.')
    });
    $('.toastrDefaultInfo').click(function() {
      toastr.info('Lorem ipsum dolor sit amet, consetetur sadipscing elitr.')
    });
    $('.toastrDefaultError').click(function() {
      toastr.error('Lorem ipsum dolor sit amet, consetetur sadipscing elitr.')
    });
    $('.toastrDefaultWarning').click(function() {
      toastr.warning('Lorem ipsum dolor sit amet, consetetur sadipscing elitr.')
    });

    $('.toastsDefaultDefault').click(function() {
      $(document).Toasts('create', {
        title: 'Toast Title',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultTopLeft').click(function() {
      $(document).Toasts('create', {
        title: 'Toast Title',
        position: 'topLeft',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultBottomRight').click(function() {
      $(document).Toasts('create', {
        title: 'Toast Title',
        position: 'bottomRight',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultBottomLeft').click(function() {
      $(document).Toasts('create', {
        title: 'Toast Title',
        position: 'bottomLeft',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultAutohide').click(function() {
      $(document).Toasts('create', {
        title: 'Toast Title',
        autohide: true,
        delay: 750,
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultNotFixed').click(function() {
      $(document).Toasts('create', {
        title: 'Toast Title',
        fixed: false,
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultFull').click(function() {
      $(document).Toasts('create', {
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.',
        title: 'Toast Title',
        subtitle: 'Subtitle',
        icon: 'fas fa-envelope fa-lg',
      })
    });
    $('.toastsDefaultFullImage').click(function() {
      $(document).Toasts('create', {
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.',
        title: 'Toast Title',
        subtitle: 'Subtitle',
        image: '../../dist/img/user3-128x128.jpg',
        imageAlt: 'User Picture',
      })
    });
    $('.toastsDefaultSuccess').click(function() {
      $(document).Toasts('create', {
        class: 'bg-success',
        title: 'Toast Title',
        subtitle: 'Subtitle',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultInfo').click(function() {
      $(document).Toasts('create', {
        class: 'bg-info',
        title: 'Toast Title',
        subtitle: 'Subtitle',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultWarning').click(function() {
      $(document).Toasts('create', {
        class: 'bg-warning',
        title: 'Toast Title',
        subtitle: 'Subtitle',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultDanger').click(function() {
      $(document).Toasts('create', {
        class: 'bg-danger',
        title: 'Toast Title',
        subtitle: 'Subtitle',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultMaroon').click(function() {
      $(document).Toasts('create', {
        class: 'bg-maroon',
        title: 'Toast Title',
        subtitle: 'Subtitle',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
  });

</script>


</body>
</html>
