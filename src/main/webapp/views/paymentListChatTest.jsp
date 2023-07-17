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

#chat3 .form-control {
border-color: transparent;
}

#chat3 .form-control:focus {
border-color: transparent;
box-shadow: inset 0px 0px 0px 1px transparent;
}

.badge-dot {
border-radius: 50%;
height: 10px;
width: 10px;
margin-left: 2.9rem;
margin-top: -.75rem;
}

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
						        <p><a href="./paymentListTemp.go" id="ListGo">임시저장</a></p>
						      </div>
						    </div>
						    <div>
						      <button type="button" class="btn btn-block btn-secondary btn-lg" id="paybutton3" onclick="toggleInboxTree()">결재 수신함</button>
						      <div id="inboxTree"><!--  style="display: none;" -->
						        <p><a href="./paymentListPay.go" id="ListGo"> 결재하기</a></p>
						        <p>결재내역</p>
						        <p>수신참조</p>
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
						          	<h1 style="font-weight: 600;">결재 문서함</h1>
						          		
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
						
						<section class="py-4 px-4 w-100" style="background-color: #1f0f6b;border-radius: .5rem .5rem 0 0;">
      <style>
        #chat3 .form-control {
          border-color: transparent;
        }

        #chat3 .form-control:focus {
          border-color: transparent;
          box-shadow: inset 0px 0px 0px 1px transparent;
        }

        .badge-dot {
          border-radius: 50%;
          height: 10px;
          width: 10px;
          margin-left: 2.9rem;
          margin-top: -.75rem;
        }
      </style>
      <div class="row">
        <div class="col-md-12">

          <div class="card" id="chat3" style="border-radius: 15px;">
            <div class="card-body">

              <div class="row">
                <div class="col-md-6 col-lg-5 col-xl-5 mb-4 mb-md-0">

                  <div class="p-3">

                    <div class="input-group rounded mb-3">
                      <input type="search" class="form-control rounded" placeholder="찾다" aria-label="찾다" aria-describedby="search-addon">
                      <span class="input-group-text border-0" id="search-addon">
                        <i class="fas fa-search"></i>
                      </span>
                    </div>

                    <div data-mdb-perfect-scrollbar="true" style="position: relative; height: 400px" class="perfect-scrollbar ps ps--active-y">
                      <ul class="list-unstyled mb-0">
                        <li class="p-2 border-bottom">
                          <a href="#!" class="d-flex justify-content-between">
                            <div class="d-flex flex-row">
                              <div>
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp" alt="화신" class="d-flex align-self-center me-3" width="60">
                                <span class="badge bg-success badge-dot"></span>
                              </div>
                              <div class="pt-1">
                                <p class="fw-bold mb-0"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">마리 호비츠</font></font></p>
                                <p class="small text-muted"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">안녕하세요, 거기 계세요?</font></font></p>
                              </div>
                            </div>
                            <div class="pt-1">
                              <p class="small text-muted mb-1"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">방금</font></font></p>
                              <span class="badge bg-danger rounded-pill float-end"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">삼</font></font></span>
                            </div>
                          </a>
                        </li>
                        <li class="p-2 border-bottom">
                          <a href="#!" class="d-flex justify-content-between">
                            <div class="d-flex flex-row">
                              <div>
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava2-bg.webp" alt="화신" class="d-flex align-self-center me-3" width="60">
                                <span class="badge bg-warning badge-dot"></span>
                              </div>
                              <div class="pt-1">
                                <p class="fw-bold mb-0"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">알렉사 정</font></font></p>
                                <p class="small text-muted"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Lorem ipsum dolor sit.</font></font></p>
                              </div>
                            </div>
                            <div class="pt-1">
                              <p class="small text-muted mb-1"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">5분 전</font></font></p>
                              <span class="badge bg-danger rounded-pill float-end"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">2</font></font></span>
                            </div>
                          </a>
                        </li>
                        <li class="p-2 border-bottom">
                          <a href="#!" class="d-flex justify-content-between">
                            <div class="d-flex flex-row">
                              <div>
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3-bg.webp" alt="화신" class="d-flex align-self-center me-3" width="60">
                                <span class="badge bg-success badge-dot"></span>
                              </div>
                              <div class="pt-1">
                                <p class="fw-bold mb-0"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">대니 맥체인</font></font></p>
                                <p class="small text-muted"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Lorem ipsum dolor sit.</font></font></p>
                              </div>
                            </div>
                            <div class="pt-1">
                              <p class="small text-muted mb-1"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">어제</font></font></p>
                            </div>
                          </a>
                        </li>
                        <li class="p-2 border-bottom">
                          <a href="#!" class="d-flex justify-content-between">
                            <div class="d-flex flex-row">
                              <div>
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava4-bg.webp" alt="화신" class="d-flex align-self-center me-3" width="60">
                                <span class="badge bg-danger badge-dot"></span>
                              </div>
                              <div class="pt-1">
                                <p class="fw-bold mb-0"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">애슐리 올슨</font></font></p>
                                <p class="small text-muted"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Lorem ipsum dolor sit.</font></font></p>
                              </div>
                            </div>
                            <div class="pt-1">
                              <p class="small text-muted mb-1"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">어제</font></font></p>
                            </div>
                          </a>
                        </li>
                        <li class="p-2 border-bottom">
                          <a href="#!" class="d-flex justify-content-between">
                            <div class="d-flex flex-row">
                              <div>
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava5-bg.webp" alt="화신" class="d-flex align-self-center me-3" width="60">
                                <span class="badge bg-warning badge-dot"></span>
                              </div>
                              <div class="pt-1">
                                <p class="fw-bold mb-0"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">케이트 모스</font></font></p>
                                <p class="small text-muted"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Lorem ipsum dolor sit.</font></font></p>
                              </div>
                            </div>
                            <div class="pt-1">
                              <p class="small text-muted mb-1"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">어제</font></font></p>
                            </div>
                          </a>
                        </li>
                        <li class="p-2">
                          <a href="#!" class="d-flex justify-content-between">
                            <div class="d-flex flex-row">
                              <div>
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava6-bg.webp" alt="화신" class="d-flex align-self-center me-3" width="60">
                                <span class="badge bg-success badge-dot"></span>
                              </div>
                              <div class="pt-1">
                                <p class="fw-bold mb-0"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">벤 스미스</font></font></p>
                                <p class="small text-muted"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Lorem ipsum dolor sit.</font></font></p>
                              </div>
                            </div>
                            <div class="pt-1">
                              <p class="small text-muted mb-1"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">어제</font></font></p>
                            </div>
                          </a>
                        </li>
                      </ul>
                    <div class="ps__rail-x" style="left: 0px; bottom: -100px;"><div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div></div><div class="ps__rail-y" style="top: 100px; height: 400px; right: 0px;"><div class="ps__thumb-y" tabindex="0" style="top: 78px; height: 314px;"></div></div></div>

                  </div>

                </div>

                <div class="col-md-6 col-lg-7 col-xl-7">

                  <div class="pt-3 pe-3 perfect-scrollbar ps ps--active-y" data-mdb-perfect-scrollbar="true" style="position: relative; height: 400px">

                    <div class="d-flex flex-row justify-content-start">
                      <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava6-bg.webp" alt="아바타 1" style="width: 45px; height: 100%;">
                      <div>
                        <p class="small p-2 ms-3 mb-1 rounded-3" style="background-color: #f5f6f7;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</font></font></p>
                        <p class="small ms-3 mb-3 rounded-3 text-muted float-end"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">오후 12시 | </font><font style="vertical-align: inherit;">8월 13일</font></font></p>
                      </div>
                    </div>

                    <div class="d-flex flex-row justify-content-end">
                      <div>
                        <p class="small p-2 me-3 mb-1 text-white rounded-3 bg-primary"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</font></font></p>
                        <p class="small me-3 mb-3 rounded-3 text-muted"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">오후 12시 | </font><font style="vertical-align: inherit;">8월 13일</font></font></p>
                      </div>
                      <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp" alt="아바타 1" style="width: 45px; height: 100%;">
                    </div>

                    <div class="d-flex flex-row justify-content-start">
                      <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava6-bg.webp" alt="아바타 1" style="width: 45px; height: 100%;">
                      <div>
                        <p class="small p-2 ms-3 mb-1 rounded-3" style="background-color: #f5f6f7;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</font></font></p>
                        <p class="small ms-3 mb-3 rounded-3 text-muted float-end"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">오후 12시 | </font><font style="vertical-align: inherit;">8월 13일</font></font></p>
                      </div>
                    </div>

                    <div class="d-flex flex-row justify-content-end">
                      <div>
                        <p class="small p-2 me-3 mb-1 text-white rounded-3 bg-primary"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Exceptioneur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</font></font></p>
                        <p class="small me-3 mb-3 rounded-3 text-muted"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">오후 12시 | </font><font style="vertical-align: inherit;">8월 13일</font></font></p>
                      </div>
                      <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp" alt="아바타 1" style="width: 45px; height: 100%;">
                    </div>

                    <div class="d-flex flex-row justify-content-start">
                      <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava6-bg.webp" alt="아바타 1" style="width: 45px; height: 100%;">
                      <div>
                        <p class="small p-2 ms-3 mb-1 rounded-3" style="background-color: #f5f6f7;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo Inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</font></font></p>
                        <p class="small ms-3 mb-3 rounded-3 text-muted float-end"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">오후 12시 | </font><font style="vertical-align: inherit;">8월 13일</font></font></p>
                      </div>
                    </div>

                    <div class="d-flex flex-row justify-content-end">
                      <div>
                        <p class="small p-2 me-3 mb-1 text-white rounded-3 bg-primary"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.</font></font></p>
                        <p class="small me-3 mb-3 rounded-3 text-muted"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">오후 12시 | </font><font style="vertical-align: inherit;">8월 13일</font></font></p>
                      </div>
                      <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp" alt="아바타 1" style="width: 45px; height: 100%;">
                    </div>

                    <div class="d-flex flex-row justify-content-start">
                      <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava6-bg.webp" alt="아바타 1" style="width: 45px; height: 100%;">
                      <div>
                        <p class="small p-2 ms-3 mb-1 rounded-3" style="background-color: #f5f6f7;"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</font></font></p>
                        <p class="small ms-3 mb-3 rounded-3 text-muted float-end"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">오후 12시 | </font><font style="vertical-align: inherit;">8월 13일</font></font></p>
                      </div>
                    </div>

                    <div class="d-flex flex-row justify-content-end">
                      <div>
                        <p class="small p-2 me-3 mb-1 text-white rounded-3 bg-primary"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?</font></font></p>
                        <p class="small me-3 mb-3 rounded-3 text-muted"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">오후 12시 | </font><font style="vertical-align: inherit;">8월 13일</font></font></p>
                      </div>
                      <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava1-bg.webp" alt="아바타 1" style="width: 45px; height: 100%;">
                    </div>

                  <div class="ps__rail-x" style="left: 0px; bottom: -576px;"><div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div></div><div class="ps__rail-y" style="top: 576px; height: 400px; right: 0px;"><div class="ps__thumb-y" tabindex="0" style="top: 237px; height: 163px;"></div></div></div>

                  <div class="text-muted d-flex justify-content-start align-items-center pe-3 pt-3 mt-2">
                    <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava6-bg.webp" alt="아바타 3" style="width: 40px; height: 100%;">
                    <input type="text" class="form-control form-control-lg" id="exampleFormControlInput2" placeholder="메시지 입력">
                    <a class="ms-1 text-muted" href="#!"><i class="fas fa-paperclip"></i></a>
                    <a class="ms-3 text-muted" href="#!"><i class="fas fa-smile"></i></a>
                    <a class="ms-3" href="#!"><i class="fas fa-paper-plane"></i></a>
                  </div>

                </div>
              </div>

            </div>
          </div>

        </div>
      </div>
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
      
      
     

	

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
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

 <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
    
      <b>Version</b> 3.2.0
    </div>
    <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong> All rights reserved.
  </footer>

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
         url:'/paymentList.ajax',
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
         content += '<th><a href="projectDetail.go?project_id='+dto.limit_date+'">'+dto.limit_date+'</a></th>';
         content += '<th>'+dto.code_name+'</th>';
         content += '<th>'+dto.paySubject+'</th>';
         content += '<td>'+ dto.document_id +'</td>';
         content += '<td>'+ '<i class="fas fa-comments"></i>'+'</td>';
         

         if (dto.state === '진행중') {
             content += '<td><a class="btn btn-primary btn-sm">' + dto.state + '</a></td>';
         } else if (dto.state === '반려') {
             content += '<td><a class="btn btn-danger btn-sm">' + dto.state + '</a></td>';
         } else if (dto.state === '완료') {
             content += '<td><a class="btn btn-secondary btn-sm">' + dto.state + '</a></td>';
         }

         content += '</tr>';
     });

     $('#projectList').empty();
     $('#projectList').append(content);
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
