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
	#forwarding,#reply,#del,#mailFilter{
        font-weight: bold;
        background-color: white;
        border: 1px solid white;
        color: black;
        font-size: 15px;
   }
   
   #forwarding:hover,#reply:hover,#del:hover,#mailFilter:hover{
        border-color: rgba(233, 221, 198, 0.4);
        color: cornflowerblue;
    }
    #mailFilter{
    	border-style: none;
    	font-weight:bold;
    	text-align: center;
    	cursor: pointer;
    	font-size: 15px;
    }
    #searchInformation{
    	text-align: center;
    	cursor: pointer;
    	font-size: 15px;
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
	#spanhidden{
		display: none;
	}
	.hidden {
	  display: none;
	}
	.notice {
	  display: block;
	  background-color: gray;
	  color: #fff;
	  padding: 10px;
	  text-align: center;
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
            <h1 id="title">내게 쓴 메일함</h1>
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
<!--                 <select name="searchMailBox" id="searchMailBox">
                	<option value="allBox">전체 메일</option>
                	<option value="SendBox">보낸 메일함</option>
                	<option value="selfBox">내게 쓴 메일함</option>
				    <option value="inBox">받은 메일함</option>
				    <option value="tempBox">임시 보관함</option>
				    <option value="trashBox">휴지통</option>
				</select> -->
				
                <select name="searchInformation" id="searchInformation">
                	<option value="allMail">제목+내용</option>
				    <option value="mailSubject">제목</option>
				    <option value="mailContent">내용</option>
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
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name = "allCheck" class="btn btn-default btn-sm checkbox-toggle">
                <div class="btn-group">
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <button type="button" class="btn btn-default btn-sm" id="del" onclick="mailtrash(this)">
                    <i class="far fa-trash-alt"></i>&nbsp;&nbsp;삭제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  </button>
                  <button type="button" class="btn btn-default btn-sm" id="reply" onclick="reply(this)">
                    <i class="fas fa-reply"></i>&nbsp;&nbsp;답장&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  </button>
                  <button type="button" class="btn btn-default btn-sm" id="forwarding">
                    <i class="fas fa-share"></i>&nbsp;&nbsp;전달 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  </button> 
                   <select id="mailFilter" name="mailFilter">
                  	<option value="" selected disabled hidden>필터</option>
                  	<!-- <option value="all">모든 메일</option>
                  	<option value="unread">안읽은 메일</option>
                  	<option value="import">중요 메일</option> -->
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


			<div id="trashMessage" class="hidden">메일이 휴지통에 이동되었습니다.</div>
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
var selectedMailFilter = "new";
//var selectedSearchMailBox = "allBox";
var type = "self";
var searchText = "";
var cnt = 10;


listCall(showPage);

/*    $('#list').on('click', '.checkbox-toggle', function (e) {
	   var checkboxes = $(this).closest('.mailbox-messages').find('input[type="checkbox"]');
	   var isChecked = checkboxes.first().prop('checked');
	   
	   checkboxes.prop('checked', !isChecked);
	   
	   if (!isChecked) {
	     $(this).find('.far.fa-square').removeClass('fa-square').addClass('fa-check-square');
	   } else {
	     $(this).find('.far.fa-check-square').removeClass('fa-check-square').addClass('fa-square');
	   }
	   
	   $(this).data('clicks', !clicks)
	 }); */
	
	
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
/* 	$('#searchInMailBox').change(function(){
		selectedSearchMailBox = $(this).val();
		console.log(selectedSearchMailBox);
	}); */
	
	//검색어에 따른 출력
	function mailSearch(){
	   //검색어 확인 
	   searchText = $('#searchInput').val();
	   console.log(searchText);
	   if(selectedSearchInformation !== "" ){
		   type='all';
		   listCall(showPage);
		   $('#title').html('검색결과');
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
			 'type':type,
			 'mailFilter':selectedMailFilter
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
	  var title = $('#title').text(); 
	  if(list.length>0){
		  list.forEach(function(item,mail_id){
			  
			 var formId = 'mail' + mail_id;
			 content += '<tr>';
			 content += '<td>';
			 content += '<form method="post" action="mailDetail.do/'+mail_id+'" id="' + formId + '">';
			 content += '<div class="icheck-primary">';
			 content += '<input type="checkbox" name="Rowcheck" value="" id="check'+formId+'" data-mail-id="' + item.mail_id +'">';
			 content += '<label for="check'+formId+'"></label>';
			 content += '</div>';
			 content += '</td>';
			 content += '<td class="mailbox-star" id="mailSubjectForm" ><a href="#" class="toggle-favorite" data-mail-id="' + item.mail_id + '">';
			 if(title != '검색결과'){
				 if(item.bookmark>0){
					 content += '<i class="fas fa-star text-warning">';
				 }else{
					 content += '<i class="far fa-star">';
				 }
			 }else{
				 if((item.is_receiver == 0 || item.is_receiver == 1) && item.blind == false ){
					 if(item.bookmark>0){
						 content += '<i class="fas fa-star text-warning">';
					 }else{
						 content += '<i class="far fa-star">';
					 }
				 }else if(item.is_receiver == 2 && item.blind == false){
					 if(item.bookmark>0){
						 content += '<i class="fas fa-star text-warning">';
					 }else{
						 content += '<i class="far fa-star">';
					 }
				 }else if(item.is_receiver == 3 && item.blind == false && item.temp == false){
					 if(item.favorites>0){
						 content += '<i class="fas fa-star text-warning">';
					 }else{
						 content += '<i class="far fa-star">';
					 }
				 }else if(item.blind == true){
					 content += '';
				 }else if(item.temp == true){
					 if(item.favorites>0){
						 content += '<i class="fas fa-star text-warning">';
					 }else{
						 content += '<i class="far fa-star">';
					 }
				 }
			 }
			 content += '</i></a></td>';
			 content += '<td>';
			 if(item.read_chk === false){
				 content += '<i class="far fa-envelope"></i>';
			 }else{
				 content += '<i class="far fa-envelope-open"></i>';
			 }
			 content += '</td>';
			 content += '<td class="mailbox-name">'+item.name+'</a></td>';
			 content += '<td class="mailbox-subject"><a href="#" onclick="mailDetail(this)" data-mail-id="' + item.mail_id +'"><span class="typespan">';
			 if (title === '검색결과'){
				 console.log(item.is_receiver);
				 if((item.is_receiver == 0 || item.is_receiver == 1) && item.blind == false ){
					 content += '<span class="type">[받은 메일함]</span>';
				 }else if(item.is_receiver == 2 && item.blind == false){
					 content += '<span class="type">[내게 쓴 메일함]</span>';
				 }else if(item.is_receiver == 3 && item.blind == false && item.temp == false){
					 content += '<span class="type">[보낸 메일함]</span>';
				 }else if(item.blind == true){
					 content += '<span class="type">[휴지통]</span>';
				 }else if(item.temp == true){
					 content += '<span class="type">[임시보관함]</span>';
				 }
			 }
			 content += '</span><b>'+item.mailSubject+'</b></a></td>';
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
			 content += '</tr>';
		  });
	  }else{
		  content += '<tr>';
		  if (title === '검색결과'){
			content += '<td colspan="7" style="text-align: center;">검색된 메일이 없습니다.<td>';
		  }else{
			content += '<td colspan="7" style="text-align: center;">메일이 없습니다.<td>';
		  }
		  content += '</tr>';
		}
	  
	  $('#list').empty();
	  $('#list').append(content);
	  $('.typespan').append('<sapn class="type" id="spanhidden">[내게 쓴 메일함]</span>');

	  
  }
  
 
  
//detail 에 파라메터 전달
   function mailDetail(element){
	var mailId = $(element).data('mail-id');
	console.log(mailId);
	var formId = $(element).closest('tr').find('form').attr('id');
	  console.log(formId);
	  
	  
	  //var typespanHTML = element.querySelector('.typespan');.
	  var typeHTML = element.querySelector('.type').innerHTML;
	  console.log(typeHTML);
	
	  if(typeHTML=='[받은 메일함]'){
		  $('.typespan').remove('#spanhidden');
		  $(element).closest('tr').find('form').append('<input type="hidden" value="'+mailId+'" name="seletedMailId">');
		  $(element).closest('tr').find('form').append('<input type="hidden" value="receive" name="type">');
	  }else if(typeHTML=='[내게 쓴 메일함]'){
		  $('.typespan').remove('#spanhidden');
		  $(element).closest('tr').find('form').append('<input type="hidden" value="'+mailId+'" name="seletedMailId">');
		  $(element).closest('tr').find('form').append('<input type="hidden" value="self" name="type">');
	  }else if(typeHTML=='[보낸 메일함]'){
		  $('.typespan').remove('#spanhidden');
		  $(element).closest('tr').find('form').append('<input type="hidden" value="'+mailId+'" name="seletedMailId">');
		  $(element).closest('tr').find('form').append('<input type="hidden" value="send" name="type">');
	  }else if(typeHTML=='[휴지통]'){
		  $('.typespan').remove('#spanhidden');
		  $(element).closest('tr').find('form').append('<input type="hidden" value="'+mailId+'" name="seletedMailId">');
		  $(element).closest('tr').find('form').append('<input type="hidden" value="trash" name="type">');
	  }else if(typeHTML=='[임시보관함]'){
		  $('.typespan').remove('#spanhidden');
		  $(element).closest('tr').find('form').append('<input type="hidden" value="'+mailId+'" name="seletedMailId">');
		  $(element).closest('tr').find('form').append('<input type="hidden" value="temp" name="type">');
		  $('#'+formId).attr('action','/mailreply.go');
	  }
	    
	    $(element).closest('tr').find('form').submit();

  } 
  
  // 즐겨찾기
  $('#list').on('click', '.toggle-favorite', function (e) {
	    e.preventDefault();

	    var mailId = $(this).data('mail-id');
	    var mailToggle = $(this).find('i');
	    console.log(mailToggle);
	    console.log(mailId);
	    // 현재 즐겨찾기 상태 가져오기
	    var isLike = $(this).find('i').hasClass('fas');
	    console.log(isLike);
	    var Like = 'self';
	    
	    var typeHTML = $(this).closest('tr').find('.typespan .type:first').text();
	    console.log(typeHTML);
	    if($('#title').text() == '검색결과'){
			if(typeHTML=='[받은 메일함]'){
				Like = 'receive';
			 }else if(typeHTML=='[내게 쓴 메일함]'){
				 Like = 'self';
			 }else if(typeHTML=='[보낸 메일함]'){
				 Like = 'send';
			 }else if(typeHTML=='[휴지통]'){
				 Like = 'trash';
			}else if(typeHTML=='[임시보관함]'){
				Like = 'temp';
			}
	    }

	    $.ajax({
	        type: 'POST',
	        url: 'mail/Like.ajax',
	        data: {
	            'mailId': mailId, // 서버에서 즐겨찾기 상태를 전환할 때 필요한 메일의 고유 식별자
	            'isLike': !isLike, // 현재 즐겨찾기 상태를 반대로 전환하여 서버에 전달
	            'type' : Like
	        },dataType: 'json'
	        ,success: function (response) {
	        	console.log(response.isLike.favorites);
                console.log(response.isLike.bookmark);
	                 if(Like=='self' || Like=='receive'){
	                	 console.log('Bookmark:', response.isLike.bookmark);
		                  // 서버로부터의 응답 처리
		                  if (response.isLike.bookmark === true) {
		                      // 즐겨찾기 상태인 경우
		                	  mailToggle.toggleClass('far fa-star fas fa-star text-warning');
		                  } else if (response.isLike.bookmark === false){
		                      // 즐겨찾기 상태가 아닌 경우
		                	  mailToggle.toggleClass('far fa-star fas fa-star text-warning');
		                  }
	                 }
                
	                 if(Like=='send' || Like=='temp'){
	                	 console.log('Favorites:', response.isLike.favorites);
		                  // 서버로부터의 응답 처리
		                  if (response.isLike.favorites === true) {
		                      // 즐겨찾기 상태인 경우
		                	  mailToggle.toggleClass('far fa-star fas fa-star text-warning');
		                  } else if(response.isLike.favorites === false){
		                      // 즐겨찾기 상태가 아닌 경우
		                      
		                	  mailToggle.toggleClass('far fa-star fas fa-star text-warning');
		                  }
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
	
	  $('.checkbox-toggle').data('clicks', false);
	// 체크박스
  /* $('.checkbox-toggle').click(function (e) {
		 console.log('클릭!');
	     var clicks = $(this).data('clicks')
	    console.log(clicks);
	     var mailId = $(this).data('mail-id');
	     console.log(mailId);
	     if (clicks === true) {
	       //Uncheck all checkboxes
	       $(this).find('.mailbox-messages input[type=\'checkbox\']').prop('checked', false)
	       $(this).find('.checkbox-toggle .far.fa-check-square').removeClass('fa-check-square').addClass('fa-square')
	     } else if (clicks === false ){
	       //Check all checkboxes
	       $(this).find('.mailbox-messages input[type=\'checkbox\']').prop('checked', true)
	       $(this).find('.checkbox-toggle .far.fa-square').removeClass('fa-square').addClass('fa-check-square')
	     }
	     $(this).data('clicks', !clicks)
	   })  */
	// 전체선택 
	   $(function(){
	      var chkObj = $("input[name='Rowcheck']");
	      var rowCnt = chkObj.length;
	      console.log(chkObj);

	        
	        $("input[name='allCheck']").click(function(){
	          var chk_listArr = $("input[name='Rowcheck']"); // 체크박스의 name 속성을 "Rowcheck"로 수정
	          for (var i=0; i<chk_listArr.length; i++){
	            chk_listArr[i].checked = this.checked;
	          }
	        });
	        $("input[name='Rowcheck']").click(function(){
	          if($("input[name='Rowcheck']:checked").length == rowCnt){ // 체크박스의 name 속성을 "Rowcheck"로 수정
	            $("input[name='allCheck']")[0].checked = true;
	          }
	          else{
	            $("input[name='allCheck']")[0].checked = false;
	          }
	        });
	      });
	   
 function mailtrash(element){
		
	  var checkedCheckboxes = $('input[type="checkbox"]:checked');
	  console.log(checkedCheckboxes);
	  checkedCheckboxes.each(function() {
	    var mailId = $(this).data('mail-id');
	  	console.log(mailId);
	
		var Like = 'self';
		    
	    var typeHTML = $(this).closest('tr').find('.typespan .type:first').text();
	    console.log(typeHTML);
	    if($('#title').text() == '검색결과'){
			if(typeHTML=='[받은 메일함]'){
				Like = 'receive';
			 }else if(typeHTML=='[내게 쓴 메일함]'){
				 Like = 'self';
			 }else if(typeHTML=='[보낸 메일함]'){
				 Like = 'send';
			 }else if(typeHTML=='[휴지통]'){
				 Like = 'trash';
			}else if(typeHTML=='[임시보관함]'){
				Like = 'temp';
			}
	    }
	    
	    $.ajax({
	        type: 'POST',
	        url: 'mail/trash.ajax',
	        data: {
	            'mailId': mailId, // 서버에서 즐겨찾기 상태를 전환할 때 필요한 메일의 고유 식별자
	            'type' : Like
	        },dataType: 'json'
	        ,success: function (response) {
	        	console.log(response.result);
	        	if(response.result){
	        		listCall(showPage);
	     		   $('#pagination').twbsPagination('destroy');
	     		  trashMessage();
	        	}
	        }
	});
	  })
} 
  
 function trashMessage() {
	  var message = document.getElementById('trashMessage');
	  message.classList.add('notice'); // 메시지를 보여주기 위해 'show' 클래스 추가

	  // 3초 후에 메시지를 숨기기 위해 setTimeout 사용
	  setTimeout(function() {
	    message.classList.remove('notice'); // 'show' 클래스 제거하여 메시지를 숨김
	  }, 1000); // 3초 (3000ms) 후에 메시지를 숨김
	} 
</script>
</body>
</html>
