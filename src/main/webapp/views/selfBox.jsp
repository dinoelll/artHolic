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
	
	.test{
		display:inline;
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
        <div class="test">
          <a href="mailWrite.go" class="btn btn-primary btn-sm ">메일 쓰기</a>
          <a href=mailWrite.go?selfBox=true class="btn btn-primary btn-sm ">내게 쓰기</a>
        </div>
          <div class="card card-primary card-outline">
            <div class="card-header">
            
              <div class="card-tools">
                <div class="input-group input-group-sm">
                <select name="searchFilter" id="searchFilter">
                	<option value="allMail">전체</option>
				    <option value="mailSubject">제목</option>
				    <option value="mailContent">내용</option>
				</select>
                  <input type="text" class="form-control" placeholder="Search Mail">
                  <div class="input-group-append">
                    <div class="btn btn-primary">
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
                <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="far fa-square"></i>
                </button>
                <div class="btn-group">
                  <button type="button" class="btn btn-default btn-sm">
                    <i class="far fa-trash-alt"></i>
                  </button>
                  <button type="button" class="btn btn-default btn-sm">
                    <i class="fas fa-reply"></i>
                  </button>
                  <button type="button" class="btn btn-default btn-sm">
                    <i class="fas fa-share"></i>
                  </button>
                </div>
                <!-- /.btn-group -->
                <div class="float-right">
                  1-50/200
                  <div class="btn-group">
                    <button type="button" class="btn btn-default btn-sm">
                      <i class="fas fa-chevron-left"></i>
                    </button>
                    <button type="button" class="btn btn-default btn-sm">
                      <i class="fas fa-chevron-right"></i>
                    </button>
                  </div>
                  <!-- /.btn-group -->
                </div>
                <!-- /.float-right -->
              </div>
              <div class="table-responsive mailbox-messages">
                <table class="table table-hover table-striped">

                  <tbody id="list">
                  
                  
                 <!--  <tr>
                    <td>
                      <div class="icheck-primary">
                        <input type="checkbox" value="" id="check1">
                        <label for="check1"></label>
                      </div>
                    </td>
                    <td class="mailbox-star"><a href="#"><i class="fas fa-star text-warning"></i></a></td>
                    <td class="mailbox-name"><a href="read-mail.html">강경석</a></td>
                    <td class="mailbox-subject"><b>응애</b>
                    </td>
                    <td class="mailbox-attachment"></td>
                    <td class="mailbox-date">5 분 전</td>
                  </tr>-->
                  </tbody>
                   
                </table>
                <!-- /.table -->
              </div>
              <!-- /.mail-box-messages -->
            </div>

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
	listCall();
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
  
  function listCall(){
	  $.ajax({
		 type:'post'
		 ,url:'mail/selfBox.ajax'
		 ,data:{}
	  	 ,success:function(data){
			 console.log(data);
			 listPrint(data.list);
		 },error:function(e){
			 console.log(e);
		 }
	  });
  }
  
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
			 content += '<td class="mailbox-name">'+item.name+'</a></td>';
			 content += '<td class="mailbox-subject"><a href="#" onclick="mailDetail(this)" data-mail-id="' + item.mail_id +'"><b>'+item.mailSubject+'</b></a></td>';
			 content += '<td class="mailbox-attachment">';
			 if (item.mail_file_id != null && item.mail_file_id !== 0) {
			        content += '<i class="fas fa-paperclip"></i>';
			      }
			 content += '</td>';
			 content += '</form>';
			 content += '<td class="mailbox-date">'+item.writeTime+'</td>';
			 //content += '<div class="formId"></div>'
			 content += '</tr>';
			 
			 console.log(item.mail_file_id);
		  });
	  }
	  $('#list').empty();
	  $('#list').append(content);
	  
  }
  
  function mailDetail(element){
	  var mailId = $(element).data('mail-id');
	  console.log(mailId);
	  var formId = $(element).closest('tr').find('form').attr('id');
	    console.log(formId);
	  
	    $(element).closest('tr').find('form').append('<input type="hidden" value="'+mailId+'" name="seletedMailId">');
	    $(element).closest('tr').find('form').append('<input type="hidden" value="save" name="type">');
	    $(element).closest('tr').find('form').submit();

  }
  
  $('#list').on('click', '.toggle-favorite', function (e) {
	    e.preventDefault();

	    var mailId = $(this).data('mail-id');
	    console.log(mailId);
	    // 현재 즐겨찾기 상태 가져오기
	    var isFavorite = $('#mailSubjectForm i').hasClass('fas');
	    console.log(isFavorite);

	    // AJAX 요청 생성
	    $.ajax({
	        type: 'POST',
	        url: 'mail/bookmark.ajax',
	        data: {
	            'mailId': mailId, // 서버에서 즐겨찾기 상태를 전환할 때 필요한 메일의 고유 식별자
	            'isFavorite': !isFavorite, // 현재 즐겨찾기 상태를 반대로 전환하여 서버에 전달
	            'type' : 'self'
	        },
	        dataType: 'json',
	        success: function (response) {
	        	console.log(response.isFavorite);
	        	
	            // 서버로부터의 응답 처리
	            if (response.isFavorite == true) {
	                // 즐겨찾기 상태인 경우
	                $(this).find('i').removeClass('far fa-star').addClass('fas fa-star text-warning');
	            } else {
	                // 즐겨찾기 상태가 아닌 경우
	                $(this).find('i').removeClass('fas fa-star text-warning').addClass('far fa-star');
	            }
	        },
	        error: function (error) {
	            // 오류 처리
	            console.log(error);
	        }
	    });
	});
  

  
</script>
</body>
</html>
