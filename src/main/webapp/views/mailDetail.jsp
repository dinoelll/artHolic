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
  <link rel="stylesheet" href="<%= request.getContextPath() %>/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="<%= request.getContextPath() %>/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%= request.getContextPath() %>/dist/css/adminlte.min.css">
  <base href="<%= request.getContextPath() %>/" target="_self">
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
   
   .forwarding,.reply,.del{
      font-weight: bold;
        background-color: white;
        border: 1px solid white;
        color: black;
   }
   .mailIMG{
      width: 250px;
      height: 133px !important;
   }
   .hidden{
       display: none;
    }
    .subject{
    	font-size: 25px;
    	font-weight: bold;
    }
    #star{
    	font-size: 25px;
    }
    #forwarding:hover,#reply:hover,#del:hover{
        border-color: rgba(233, 221, 198, 0.4);
        color: cornflowerblue;
    }
    #writeTimeDisplay{
    	color: gray;
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
	          <c:if test="${type.equals('receive')}">
	            <h1 class="title">받은 메일함</h1>
	          </c:if>
	          <c:if test="${type.equals('send')}">
	            <h1 id="title">보낸 메일함</h1>
	          </c:if>
	          <c:if test="${type.equals('temp')}">
	            <h1 class="title">임시 보관함</h1>
	          </c:if>
	          <c:if test="${type.equals('self')}">
	            <h1 class="title">내게 쓴 메일함</h1>
	          </c:if>
	          <c:if test="${type.equals('trash')}">
	            <h1 class="title">휴지통</h1>
	          </c:if>
	          <c:if test="${type.equals('import')}">
	            <h1 class="title">중요 메일함</h1>
	          </c:if>
          </div>
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
              <a href="mailWrite.go" class="btn btn-primary btn-sm ">메일 쓰기</a>
              <a href="mailWrite.go?selfBox=true" class="btn btn-primary btn-sm ">내게 쓰기</a>
              <div class="card-tools">
            <button id="reply" class="reply" onclick="reply()">답장</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button id="forwarding" class="Forwarding" onclick="forwarding()">전달</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button id="del" class="del" onclick="del()">삭제</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body p-0">
            <form action="" method="post" id="formaction">
              <div class="mailbox-read-info">
                <!-- <i class="fas fa-star text-warning"></i> -->
                
                 <div class="mailboxForm"><a href="#" id="mailSubjectForm">
                 <c:if test="${type.equals('receive')|| type.equals('self') }">
                 	<c:if test="${dto.memberdto.get(0).bookmark==false}">
                 		<i class="far fa-star" id="star" ></i>
                 	</c:if>
                 	<c:if test="${dto.memberdto.get(0).bookmark==true}">
                 		<i class="fas fa-star text-warning" id="star" ></i>
                 	</c:if>
                 </c:if>
                 <c:if test="${type.equals('send')}">
                 	<c:if test="${dto.memberdto.get(0).favorites==false}">
                 		<i class="far fa-star" id="star" ></i>
                 	</c:if>
                 	<c:if test="${dto.memberdto.get(0).favorites==true}">
                 		<i class="fas fa-star text-warning" id="star" ></i>
                 	</c:if>
                 </c:if>
                 </a><span class="subject">&nbsp;&nbsp;${dto.memberdto.get(0).mailSubject}</span></div>
                 <div class="mailboxForm" id="mailMember">보낸사람&nbsp;&nbsp;
                    ${dto.memberdto.get(0).dept_name}팀&nbsp;${dto.memberdto.get(0).position_name}&nbsp;${dto.memberdto.get(0).name}
                 </div>
                <div class="mailboxForm" id="SendMember">받는사람&nbsp;&nbsp;
               <c:forEach items="${dto.dto}" var="item">
                       <c:if test="${item.is_receiver == 0 || item.is_receiver == 2}">
                          ${item.dept_name}팀&nbsp;${item.position_name}&nbsp;${item.name}
                       </c:if>
                    </c:forEach>
                 </div>
                 <c:forEach items="${dto.dto}" var="item">
                 </c:forEach>
                <div class="mailboxForm" id="refferMember">참조&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <c:forEach items="${dto.dto}" var="item">
                      <c:if test="${item.is_receiver == 1}">
                         ${item.dept_name}&nbsp; ${item.position_name}&nbsp;${item.name}
                      </c:if>
                   </c:forEach>
                </div>
                <div class="mailboxForm" id="writeTimeDisplay">${dto.memberdto.get(0).writeTime}</div>
                <input type="hidden" value="${dto.memberdto.get(0).mail_id}" name="mail_id" id="mail_id">
                <input type="hidden" value="${dto.memberdto.get(0).mail_id}" name="seletedMailId" id="seletedMailId">
                <input type="hidden" value="${type}" name="type" id="type">
                <%-- <c:forEach items="${dto.dto}" var="item">
                	<input type="hidden" value="${item.dept_name}&nbsp; ${item.position_name}&nbsp;${item.name}" name="refferMember">
                </c:forEach>
                <c:forEach items="${dto.mailpthotoList}" var = "file">
                <input type="hidden" value="${file.ori_file_name }" name="file">
                </c:forEach>
                <input type="hidden" value=" ${dto.memberdto.get(0).dept_name}&nbsp;${dto.memberdto.get(0).position_name}&nbsp;${dto.memberdto.get(0).name}" name = "mailMember">
                <input type="hidden" value="${dto.memberdto.get(0).mailContent}" name="mailConent">
                
                <input type="hidden" value="${dto.memberdto.get(0).mailSubject}" name="mailSubject"> --%>
                <input type="hidden" name="set" value="" id="set">
                  <!--<span class="mailbox-read-time float-right">2023.07.24 10:03</span></h6> -->
              </div>
              
              <!-- /.mailbox-controls -->
              <div class="mailbox-read-message">
                ${dto.memberdto.get(0).mailContent}
              <!-- /.mailbox-read-message -->
            </div>
            <!-- /.card-body -->
            <div class="card-footer bg-white">
              <ul class="mailbox-attachments d-flex align-items-stretch clearfix">
              <c:forEach items="${dto.mailpthotoList}" var = "file">
                <li>
                  <span class="mailbox-attachment-icon has-img"><img src="/photo/${file.new_file_name}" alt="Attachment" class="mailIMG"></span>

                  <div class="mailbox-attachment-info">
                    <a href="#" class="mailbox-attachment-name"><i class="fas fa-camera"></i> ${file.ori_file_name }</a>
                        <span class="mailbox-attachment-size clearfix mt-1">
                          <span>2.67 MB</span>
                          <a href="mailPhotoDownload.do?path=${file.new_file_name}&file=${file.ori_file_name }" class="btn btn-default btn-sm float-right"><i class="fas fa-cloud-download-alt"></i></a>
                        </span>
                  </div>
                </li>
                </c:forEach>
              </ul>
            </div>
            </form>
            <!-- /.mailbox-read-info -->
              <div class="mailbox-controls with-border text-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-default btn-sm" data-container="body" title="Delete" onclick="del()">
                    <i class="far fa-trash-alt"></i>
                  </button>
                  <button type="button" class="btn btn-default btn-sm" data-container="body" title="Reply" onclick="reply()">
                    <i class="fas fa-reply"></i>
                  </button>
                  <button type="button" class="btn btn-default btn-sm" data-container="body" title="Forward" onclick="forwarding()">
                    <i class="fas fa-share"></i>
                  </button>
                </div>
                <!-- /.btn-group -->
              </div>
            <!-- /.card-footer -->
            <div class="card-footer">
            </div>
            <!-- /.card-footer -->
          </div>
          <!-- /.card -->
        </div>
        <!-- /.col -->
      </div>
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
<!-- AdminLTE for demo purposes -->
<!-- <script src="dist/js/demo.js"></script>
Page specific script -->
<script>
function formatDate(dateTimeString) {
	  const date = new Date(dateTimeString);
	  const formattedTime = date.toLocaleString('ko-KR', { timeZone: 'Asia/Seoul' });
	  return formattedTime;
	}
	
  $(document).ready(function() {
    
     $('#mailSubjectForm').click(function (e) {
          e.preventDefault();

          // 현재 즐겨찾기 상태 가져오기
          var isLike = $('#mailSubjectForm i').hasClass('fas');
          var type = $('#type').val();
          console.log(isLike);
          console.log(type);
          console.log(!isLike);

          // AJAX 요청 생성
          $.ajax({
              type: 'POST',
              url: 'mail/Like.ajax',
              data: {
                  'mailId': $('#mail_id').val(), // 서버에서 즐겨찾기 상태를 전환할 때 필요한 메일의 고유 식별자
                  'isLike': !isLike, // 현재 즐겨찾기 상태를 반대로 전환하여 서버에 전달
                  'type': type
              },
              dataType: 'json',
              success: function (response) {
                 console.log(response.isLike.favorites);
                 console.log(response.isLike.bookmark);
	                 if(type=='self' || type=='receive'){
	                	 console.log('Bookmark:', response.isLike.bookmark);
		                  // 서버로부터의 응답 처리
		                  if (response.isLike.bookmark === true) {
		                      // 즐겨찾기 상태인 경우
		                      $('#mailSubjectForm i').toggleClass('far fa-star fas fa-star text-warning');
		                  } else if (response.isLike.bookmark === false){
		                      // 즐겨찾기 상태가 아닌 경우
		                      $('#mailSubjectForm i').toggleClass('far fa-star fas fa-star text-warning');
		                  }
	                 }
                 
	                 if(type=='send' || type=='temp'){
	                	 console.log('Favorites:', response.isLike.favorites);
		                  // 서버로부터의 응답 처리
		                  if (response.isLike.favorites === true) {
		                      // 즐겨찾기 상태인 경우
		                      $('#mailSubjectForm i').removeClass('far fa-star').addClass('fas fa-star text-warning');
		                  } else if(response.isLike.favorites === false){
		                      // 즐겨찾기 상태가 아닌 경우
		                      
		                      $('#mailSubjectForm i').removeClass('fas fa-star text-warning').addClass('far fa-star');
		                  }
	                }
              },
              error: function (error) {
                  // 오류 처리
                  console.log(error);
              }
          });
      });
  })
  
function del(){
	   var mail_id = $('#mail_id').val();
	   var type = $('#type').val();
	   
	   if (type === 'trash') {
		    var confirmation = confirm("영구 삭제시, 복원되지 않습니다. 정말로 삭제하시겠습니까?");
		    if (!confirmation) {
		      // 삭제 취소
		      return;
		    }
		  }
	$.ajax({
		type: 'POST',
		url: 'mail/trash.ajax',
		data: {
		    'mailId': mail_id, // 서버에서 즐겨찾기 상태를 전환할 때 필요한 메일의 고유 식별자
		    'type' : type
		},dataType: 'json'
		,success: function (response) {
			console.log(response.result);
			if(type=='receive'){
				window.location.href = './inBox.go';
			}else if(type=='self'){
				window.location.href = './selfBox.go';
			}else if(type=='send'){
				window.location.href = './sendBox.go';
			}else if(type=='trash'){
				window.location.href = './trashBox.go';
			}else if(type=='import'){
				window.location.href = './importBox.go';
			}
		}
	});
}
  
function reply(){
	var mail_id = $('#mail_id').val();
	var type = $('#type').val();
	console.log(mail_id);
	console.log(type);
	//$('#formaction').attr('action','/mailreply.do');
	$('#set').attr('value','reply');
	$('#formaction').attr('action','/mailreply.go?');
	$('#formaction').submit();
}

function forwarding(){
	var mail_id = $('#mail_id').val();
	var type = $('#type').val();
	console.log(mail_id);
	console.log(type);
	$('#set').attr('value','forwarding');
	$('#formaction').attr('action','/mailreply.go?');
	$('#formaction').submit();
}
  

  
  
</script>
</body>
</html>