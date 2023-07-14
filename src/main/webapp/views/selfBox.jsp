<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta charset="utf-8">
  <!--  <meta name="viewport" content="width=device-width, initial-scale=1"> -->
  <title>ArtHolic</title>

	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  
 
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
	
	#footer{
		margin-left: 0px;
	}
	
	.test{
		display:inline;
	}
	#forwarding,#reply,#del{
        font-weight: bold;
        background-color: white;
        border: 1px solid white;
        color: black;
   }
   
   #forwarding:hover,#reply:hover,#del:hover,#mailFilter:hover{
        border-color: rgba(233, 221, 198, 0.4);
    }
    #mailFilter{
    	border-style: none;
    	font-weight:bold;
    	text-align: center;
    	cursor: pointer;
    }
	#paging {
	  position: fixed;
	  bottom: 0;
	  width: 100%;
	  background-color: #f8f9fa;
	  padding: 10px 0;
	  z-index: 9999;
	}
	.col-md-9{
		flex: 0 0 100%;
    	max-width: 100%;
	}
	.pagination{
		padding-left: 315px;
	}
  </style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
<jsp:include page="header.jsp"/>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>내게 쓴 메일함</h1>
          </div>
          <!--  
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Inbox</li>
            </ol>
          </div>
          -->
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
          
        <!-- /.col -->
        <div class="col-md-9">
          <div class="card card-primary card-outline">
            <div class="card-header">
	           	<div class="test">
		          <a href="mailWrite.go" class="btn btn-primary btn-sm ">메일 쓰기</a>
		          <a href=mailWrite.go?selfBox=true class="btn btn-primary btn-sm ">내게 쓰기</a>
		        </div>
              <div class="card-tools">
                <div class="input-group input-group-sm">
                <select name="searchMailBox" id="searchMailBox">
                	<option value="allBox">전체 메일</option>
                	<option value="SendBox">보낸 메일함</option>
                	<option value="selfBox">내게 쓴 메일함</option>
				    <option value="inBox">받은 메일함</option>
				    <option value="tempBox">임시 보관함</option>
				    <option value="trashBox">휴지통</option>
				</select>
				
                <select name="searchInformation" id="searchInformation">
                	<option value="allMail">전체 검색</option>
                	<option value="mailSender">보낸 사람</option>
                	<option value="mailRecipient">받는 사람</option>
				    <option value="mailSubject">제목</option>
				    <option value="mailContent">내용</option>
				    <option value="mailAttachment">첨부파일</option>
				</select>
                  <input type="text" class="form-control" placeholder="Search Mail" id="searchInput">
                  <div class="input-group-append" onclick="mailSearch()">
                    <div class="btn btn-primary" >
                      <i class="fas fa-search"></i>
                    </div>
                  </div>
                </div>
              </div>
              <!-- /.card-tools -->
            </div>
            <!-- /.card-header -->
            <div class="card-body p-0">
              <div class="mailbox-controls">
                <!-- Check all button -->
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="far fa-square"></i>
                </button>
                <div class="btn-group">
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <button type="button" class="btn btn-default btn-sm" id="del">
                    <i class="far fa-trash-alt"></i>&nbsp;&nbsp;삭제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  </button>
                  <button type="button" class="btn btn-default btn-sm" id="reply">
                    <i class="fas fa-reply"></i>&nbsp;&nbsp;답장&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  </button>
                  <button type="button" class="btn btn-default btn-sm" id="forwarding">
                    <i class="fas fa-share"></i>&nbsp;&nbsp;전달 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  </button>
                  <select id="mailFilter">
                  	<option value="" selected disabled hidden>필터</option>
                  	<option value="all">모든 메일</option>
                  	<option value="unread">안읽은 메일</option>
                  	<option value="import">중요 메일</option>
                  	<option value="new">최신순</option>
                  	<option value="old">오래된순</option>
                  </select>
                </div>
                <!-- /.btn-group -->
                <!-- <div class="float-right">
                  1-50/200
                  <div class="btn-group">
                    <button type="button" class="btn btn-default btn-sm">
                      <i class="fas fa-chevron-left"></i>
                    </button>
                    <button type="button" class="btn btn-default btn-sm">
                      <i class="fas fa-chevron-right"></i>
                    </button>
                  </div>
                  /.btn-group
                </div> -->
                <!-- /.float-right -->
              </div>
              <div class="table-responsive mailbox-messages">
                <table class="table table-hover table-striped">
				  <colgroup>
				  	<col width=5%/>
				  	<col width=5%/>
				  	<col width=5%/>
				  	<col width=15%/>
				  	<col width=45%/>
				  	<col width=5%/>
				  	<col width=20%/>
				  </colgroup>
                  <tbody id="list">
                  </tbody>
                   
                </table>
                <!-- /.table -->
              </div>
              <!-- /.mail-box-messages -->
            </div>


			
          <!-- /.card -->
          <div id="paging">	
			<!-- 	플러그인 사용	(twbsPagination)	-->
			<div class="container">									
				<nav aria-label="Page navigation" style="text-align:center">
					<ul class="pagination" id="pagination"></ul>
				</nav>					
			</div>
		  </div>
        </div>
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
    <jsp:include page="footer.jsp"/>
  </div>
  <!-- /.content-wrapper -->
  
  

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
 <script src="js/jquery.twbsPagination.js" type="text/javascript"></script>
 
<!-- Page specific script -->
<script>

var showPage = 1;
var selectedSearchInformation = "allMail";
var selectedMailFilter = "all";
var selectedSearchMailBox = "allBox";
var type = "self";
var searchText = "";
var cnt = 15;

listCall(showPage);
  $(function () {
    //Enable check and uncheck all functionality
    $('.checkbox-toggle').click(function () {
      var clicks = $(this).data('clicks')
      if (clicks) {
        //Uncheck all checkboxes
        $(this).find('.mailbox-messages input[type=\'checkbox\']').prop('checked', false)
        $(this).find('.checkbox-toggle .far.fa-check-square').removeClass('fa-check-square').addClass('fa-square')
      } else {
        //Check all checkboxes
        $(this).find('.mailbox-messages input[type=\'checkbox\']').prop('checked', true)
        $(this).find('.checkbox-toggle .far.fa-square').removeClass('fa-square').addClass('fa-check-square')
      }
      $(this).data('clicks', !clicks)
    })
  }) 
  
	
	
  $('#pagePerNum').change(function(){
		listCall(showPage);
		$('#pagination').twbsPagination('destroy');
	});
  
	//메일 검색 조건방식 선택에 따른 출력
	$('#searchInformation').change(function(){
		selectedSearchInformation = $(this).val();
		console.log(selectedSearchInformation);
	});
	
	// 메일함 검색 조건 방식 선택에 따른 출력
	$('#searchInMailBox').change(function(){
		selectedSearchInMailBox = $(this).val();
		console.log(selectedSearchInMailBox);
	});
	
	//검색어에 따른 출력
	function mailSearch(){
	   //검색어 확인 
	   searchText = $('#searchInput').val();
	   console.log(searchText);
	   if(selectedSearchInformation !== "" && selectedSearchMailBox != ""){
		   listCall(showPage);
		   $('#pagination').twbsPagination('destroy');
	   }
	};
	
	// 메일 필터 선택에 따른 출력
	$('#mailFilter').change(function(){
		selectedMailFilter = $(this).val();
		console.log(selectedMailFilter);
		if(selectedMailFilter !== ""){
		   listCall(showPage);
		   $('#pagination').twbsPagination('destroy');
		}
	});
	
  // 리스트 부르기
  function listCall(page){
	  $.ajax({
		 type:'post'
		 ,url:'mail/selfBox.ajax'
		 ,data:{
			 'page':page,
			 'cnt': cnt,
			 'searchInformation': selectedSearchInformation,
			 'searchText': searchText,
			 'mailFilter': selectedMailFilter,
			 'type':type,
			 'searchMailBox':selectedSearchMailBox
		 },dataType: 'json'
	  	 ,success:function(data){
			 console.log(data);
			 listPrint(data.list);
			 
			//paging plugin
				$('#pagination').twbsPagination({
					startPage:data.currPage, // 시작 페이지
					totalPages:data.pages,// 총 페이지 수 
					visiblePages:5,// 보여줄 페이지
					next : '<span style="color: #87d1bf;">></span>', 
					last : '<span style="color: #87d1bf;">>></span>',
					first : '<span style="color: #87d1bf;"><<</span>',
					prev : '<span style="color: #87d1bf;"><</span>',
					onPageClick:function(event,page){ // 페이지 클릭시 동작되는 (콜백)함수
					   console.log(page,showPage);
					   if(page != showPage){
					      showPage=page;
					      listCall(page);
					   }
					}
				});
		 },error:function(e){
			 console.log(e);
		 }
	  });
  }
  
  // 리스트 아작스
  function listPrint(list){
	  var content = '';
	  if(list.length>0){
		  list.forEach(function(item,mail_id){
			  
			 var formId = 'mail' + mail_id;
			 content += '<tr>';
			 content += '<td>';
			 content += '<form method="post" action="mailDetail.do/'+mail_id+'" id="' + formId + '">';
			 content += '<div class="icheck-primary">';
			 content += '<input type="checkbox" value="" id="check1">';
			 content += '<label for="check1"></label>';
			 content += '</div>';
			 content += '</td>';
			 content += '<td class="mailbox-star" id="mailSubjectForm" ><a href="#" class="toggle-favorite" data-mail-id="' + item.mail_id + '">';
			 if (item.favorites>0){
				 content += '<i class="fas fa-star text-warning">';
			 }else {
				 content += '<i class="far fa-star">';
			 }
			 content += '</i></a></td>';
			 content += '<td>'+item.read_chk+'</td>'
			 content += '<td class="mailbox-name">'+item.name+'</a></td>';
			 content += '<td class="mailbox-subject"><a href="#" onclick="mailDetail(this)" data-mail-id="' + item.mail_id +'"><b>'+item.mailSubject+'</b></a></td>';
			 content += '<td class="mailbox-attachment">';
			 if (item.mail_file_id != null && item.mail_file_id !== 0) {
			        content += '<i class="fas fa-paperclip"></i>';
			      }
			 content += '</td>';
			 content += '</form>';
			 var timestamp = item.writeTime; // 예시: timestamp 값
			 var date = new Date(timestamp);
			 var formattedDateTime = date.getFullYear() + '-' + addZero(date.getMonth() + 1) + '-' + addZero(date.getDate()) + ' ' + addZero(date.getHours()) + ':' + addZero(date.getMinutes()) + ':' + addZero(date.getSeconds());
			 content += '<td class="mailbox-date">' + formattedDateTime + '</td>';
			 //content += '<div class="formId"></div>'
			 content += '</tr>';
			 
		  });
	  }
	  $('#list').empty();
	  $('#list').append(content);
	  
  }
  
  // detail 에 파라메터 전달
  function mailDetail(element){
	  var mailId = $(element).data('mail-id');
	  console.log(mailId);
	  var formId = $(element).closest('tr').find('form').attr('id');
	    console.log(formId);
	  
	    $(element).closest('tr').find('form').append('<input type="hidden" value="'+mailId+'" name="seletedMailId">');
	    $(element).closest('tr').find('form').append('<input type="hidden" value="save" name="type">');
	    $(element).closest('tr').find('form').submit();

  }
  
  // 즐겨찾기
  $('#list').on('click', '.toggle-favorite', function (e) {
	    e.preventDefault();

	    var mailId = $(this).data('mail-id');
	    var mailToggle = $(this).find('i');
	    console.log(mailId);
	    // 현재 즐겨찾기 상태 가져오기
	    var isFavorite = $(this).find('i').hasClass('fas');
	    console.log(isFavorite);

	    // AJAX 요청 생성
	    $.ajax({
	        type: 'POST',
	        url: 'mail/bookmark.ajax',
	        data: {
	            'mailId': mailId, // 서버에서 즐겨찾기 상태를 전환할 때 필요한 메일의 고유 식별자
	            'isFavorite': !isFavorite, // 현재 즐겨찾기 상태를 반대로 전환하여 서버에 전달
	            'type' : 'self'
	        },dataType: 'json'
	        ,success: function (response) {
	        	console.log(response.isFavorite);
	        	
	            // 서버로부터의 응답 처리
	            if (response.isFavorite == true) {
	                // 즐겨찾기 상태인 경우
	                mailToggle.removeClass('far fa-star').addClass('fas fa-star text-warning');
	            } else {
	                // 즐겨찾기 상태가 아닌 경우
	                mailToggle.removeClass('fas fa-star text-warning').addClass('far fa-star');
	            }
	        },
	        error: function (error) {
	            // 오류 처리
	            console.log(error);
	        }
	    });
	});
  
	//일의 자릿수가 한 자리일 경우 앞에 0을 추가하는 함수
	  function addZero(value) {
	    return value < 10 ? '0' + value : value;
	  }
  
</script>
</body>
</html>
