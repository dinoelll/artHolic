<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta charset="utf-8">
  <!--  <meta name="viewport" content="width=device-width, initial-scale=1"> -->
  <title>ArtHolic</title>

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
            <h1>받은 메일함</h1>
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
              <div class="mailbox-read-info">
             
              	<div class="mailboxForm"><i class="fas fa-star text-warning"></i>제목&nbsp;&nbsp;${dto.memberdto.get(0).mailSubject}</div>
              	<div class="mailboxForm" id="mailMember">보낸사람&nbsp;&nbsp;
              		<c:if test="${dto.memberdto.get(0).code_group_id=='DEPT'}">
              		${dto.memberdto.get(0).code_name}
              		</c:if>&nbsp;
              		<c:if test="${dto.memberdto.get(1).code_group_id=='POSITION'}">
              		${dto.memberdto.get(1).code_name}
              		</c:if>&nbsp;${dto.memberdto.get(0).name}
              	</div>
                <div class="mailboxForm" id="SendMember">받는사람&nbsp;&nbsp;
					<c:forEach items="${dto.dto}" var="item">
                 		<c:if test="${item.is_receiver == false}">
	                 		${item.dept_name}&nbsp; ${item.position_name}&nbsp;${item.name}
	                 	</c:if>
	                 </c:forEach>
                 </div>
                <div class="mailboxForm" id="refferMember">참조&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	<c:forEach items="${dto.dto}" var="item">
                		<c:if test="${item.is_receiver == true}">
                			${item.dept_name}&nbsp; ${item.position_name}&nbsp;${item.name}
                		</c:if>
                	</c:forEach>
                </div>
                <div class="mailboxForm">${dto.dto.get(0).writeTime}</div>
              
                
                  <!--<span class="mailbox-read-time float-right">2023.07.24 10:03</span></h6> -->
              </div>
              
              <!-- /.mailbox-controls -->
              <div class="mailbox-read-message">
                ${dto.memberdto.get(0).mailContent}
              </div>
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
                          <a href="mailPhotoDownload.do?path=${file.new_file_name}" class="btn btn-default btn-sm float-right"><i class="fas fa-cloud-download-alt"></i></a>
                        </span>
                  </div>
                </li>
                </c:forEach>
              </ul>
            </div>
            <!-- /.mailbox-read-info -->
              <div class="mailbox-controls with-border text-center">
                <div class="btn-group">
                  <button type="button" class="btn btn-default btn-sm" data-container="body" title="Delete">
                    <i class="far fa-trash-alt"></i>
                  </button>
                  <button type="button" class="btn btn-default btn-sm" data-container="body" title="Reply">
                    <i class="fas fa-reply"></i>
                  </button>
                  <button type="button" class="btn btn-default btn-sm" data-container="body" title="Forward">
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
<script src="dist/js/demo.js"></script>
<!-- Page specific script -->
<script>

  $(function () {
    //Enable check and uncheck all functionality
    $('.checkbox-toggle').click(function () {
      var clicks = $(this).data('clicks')
      if (clicks) {
        //Uncheck all checkboxes
        $('.mailbox-messages input[type=\'checkbox\']').prop('checked', false)
        $('.checkbox-toggle .far.fa-check-square').removeClass('fa-check-square').addClass('fa-square')
      } else {
        //Check all checkboxes
        $('.mailbox-messages input[type=\'checkbox\']').prop('checked', true)
        $('.checkbox-toggle .far.fa-square').removeClass('fa-square').addClass('fa-check-square')
      }
      $(this).data('clicks', !clicks)
    })

    //Handle starring for font awesome
    $('.mailbox-star').click(function (e) {
      e.preventDefault()
      //detect type
      var $this = $(this).find('a > i')
      var fa    = $this.hasClass('fa')

      //Switch states
      if (fa) {
        $this.toggleClass('fa-star')
        $this.toggleClass('fa-star-o')
      }
    })
  })
</script>
</body>
</html>
