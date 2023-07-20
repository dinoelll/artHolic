<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>spring boot</title>

<!-- 
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
 -->
<!-- Ionicons -->
<link rel="stylesheet"
   href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!--  Google Font: Source Sans Pro -->
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

<!-- Font Awesome-->
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">

<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
   href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">

<!--  iCheck -->
<link rel="stylesheet"
   href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">

<!-- JQVMap
  <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
  -->
<!-- Theme style-->
<link rel="stylesheet" href="dist/css/adminlte.min.css">
<!-- overlayScrollbars-->
<link rel="stylesheet"
   href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  -->
<!-- summernote 
  <link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
  -->
<!-- fullCalendar (캘린더) -->
<link rel="stylesheet" href="plugins/fullcalendar/main.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
b {
   color: red;
}

table {
   width: 100%;
}

table, td, th {
   border: 1px solid;
   border-collapse: collapse;
   padding: 5px;
}

#paging {
   text-align: center;
}

#writeForm {
   float: right;
}

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

.modal {
   position: absolute;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   display: none;
   background-color: rgba(0, 0, 0, 0.4);
}

/* * {
  padding:0;
  margin:0;
  box-sizing: border-box;
} */
/* #btnWrap {
   width: 500px;
   margin: 100px auto;
} */
#popupBtn {
   width: 50px;
   height: 30px;
   padding: 4px 4px;
   float: right;
}

#modalWrap {
   position: fixed; /* Stay in place */
   z-index: 1; /* Sit on top */
   padding-top: 100px; /* Location of the box */
   left: 0;
   top: 0;
   width: 100%; /* Full width */
   height: 100%; /* Full height */
   overflow: auto; /* Enable scroll if needed */
   background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
   display: none;
}

#modalBody {
   width: 500px;
   height: 600px;
   padding: 86px 53px;
   margin: 109px auto;
   border: 5px solid #777;
   background-color: #fff;
}

#closeBtn {
   width: 80px;
   height: 33px;
   padding: 4px 4px;
   float: left;
   font-weight: bold;
   color: #777;
   font-size: 17px;
   cursor: pointer;
}

#delete {
   width: 80px;
   height: 33px;
   padding: 4px 4px;
   float: right;
   font-weight: bold;
   color: #777;
   font-size: 17px;
   cursor: pointer;
}

 .subject {
	color: black;
	text-decoration: none;
	background-color: transparent;
}  
b {
    color: black;
}


#project_name{
   color:#91bdce;
   text-align-last: center;
}
</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">

   <!-- Site wrapper -->
   <div class="wrapper">
      <jsp:include page="header.jsp" />
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
         <!-- Content Header (Page header) -->
         <section class="content-header">
            <div class="container-fluid">
               <div class="row mb-2">
                  <div class="col-sm-6">
                     <h1 class="m-0">
                        <a href="/projectCalendar.go?project_id=${project_id}&project_name=${project_name}"
                           class="subject">캘린더</a>|<a
                           href="/projectDetail.go?type=jsp&project_id=${project_id}&project_name=${project_name}"
                           class="subject"><b>피드</b></a>
                     </h1>
                  </div>
                  <div class="col-sm-6">
                     <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Project Detail</li>
                     </ol>
                  </div>
               </div>
            </div>
            <!-- /.container-fluid -->
         </section>
         <!--  <h1 id="project_name">&lt; team ${params.project_name} &gt;</h1> -->
         <!-- Main content -->
         <section class="content">

            <!-- Default box -->
            <div class="card">
               <div class="card-header">
                  <h3 class="card-title">프로젝트 피드</h3>

                  <div class="card-tools">

                     <a href="feedWrite.go?project_id=${project_id}&project_name=${project_name}"
                        class="btn btn-sm btn-primary"><i class="fas fa-edit"></i>피드등록</a>
                     <!--  <a href="projectDel.do?project_id=${project_id}"
                        class="btn btn-danger btn-sm">삭제</a> -->

                     <button type="button" class="btn btn-tool"
                        data-card-widget="collapse" title="Collapse">
                        <i class="fas fa-minus"></i>
                     </button>
                  </div>
               </div>

               <div class="card-body">
                  <div id="projectDetailContainer"></div>
               </div>
               <!-- /.card-body -->
            </div>
            <!-- /.card -->

         </section>
         <!-- /.content -->
      </div>
      <!-- /.content-wrapper -->

      <input type="hidden" id="loginId" value="${sessionScope.id}">

      <!-- Control Sidebar -->
      <aside class="control-sidebar control-sidebar-dark">
         <!-- Control sidebar content goes here -->
      </aside>
      <!-- /.control-sidebar -->
   </div>
   <!-- ./wrapper -->



   <jsp:include page="footer.jsp" />


   <!-- jQuery -->
   <script src="plugins/jquery/jquery.min.js"></script>
   <!-- jQuery UI -->
   <script src="plugins/jquery-ui/jquery-ui.min.js"></script>

   <!-- Bootstrap 4 -->
   <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
   <!-- overlayScrollbars -->
   <script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
   <!-- AdminLTE App -->
   <script src="dist/js/adminlte.js"></script>

<!-- date-range-picker -->
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap color picker -->
<script src="plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>


</body>
<script>
   var loginId = $("#loginId").val();
   console.log('id:' + loginId);
   
   

   $(document)
         .ready(
               function() {
                  console.log("함수 실행");

                  var project_id =${project_id};
                  detailAjax();

                  function detailAjax() {
                     console.log('detailAjax() 호출');
                     $.ajax({
                              url : "projectDetail.ajax?project_id="
                                    + project_id, // 서버에서 데이터를 가져올 URL
                              method : "GET",
                              async : false,
                              dataType : "json",
                              success : function(data) {
                                 var container = $("#projectDetailContainer");

                                 $.each( data.feedList, function(index, detail) {
                                                var feed_id = detail.feed_id;

                                                var html = '<div class="row">';
                                                html += '<div class="col-12 col-md-12 col-lg-8 order-2 order-md-1">';
                                                html += '<div class="row">';
                                                html += '<div class="col-12">';
                                                html += '<div class="post">';
                                                html += '<div class="user-block">';
                                                html += '<img class="img-circle img-bordered-sm" src="../../dist/img/user1-128x128.jpg" alt="user image">';
                                                html += '<span class="name">';
                                                html += '<a href="#">' + detail.name + '</a>';
                                                html += '</span>';
                                                html += '<span class="description">'
                                                      + detail.date
                                                      + '</span>';
                                                html += '</div>';
                                                html += '<p>'+ detail.content + '</p>';
                                                if (detail.feed_file_id != null) {
                                                	
                                                   html += '<div class="mailbox-feed_file-info">';
                                                   html += '<a class="mailbox-feed_file-name"><i class="fas fa-paperclip"></i> &nbsp;'
                                                         + detail.ori_photo_name
                                                         + '</a>';
                                                   html += '<a href="feed_fileDownload.do?photo_name='
                                                         + detail.photo_name
                                                         + '" class="btn btn-default btn-sm"><i class="fas fa-cloud-download-alt"></i></a>';
                                                   html += '</div>';
                                                }
                                                console.log(detail.member_id);
                                                if(detail.member_id == '${sessionScope.loginId}'){
                                                	 html += '<a href="feedUpdate.go?feed_id=' + feed_id + '&feed_file_id=' + detail.feed_file_id + '&project_id=' + detail.project_id + '&project_name=' + detail.project_name + '" class="btn btn-sm btn-primary">수정</a>'
                                                     html += '<a href="feedDel.do?feed_id=' + feed_id + '&feed_file_id=' + detail.feed_file_id + '&project_id=' + detail.project_id + '&project_name=' + detail.project_name + '" class="btn btn-danger btn-sm">삭제</a>';
                                                }
                                                html += '</div>';

                                                html += '</div></div>';
                                                html += '<hr>';
                                                html += '</div>';

                                                container
                                                      .prepend(html);

                                             });

                              },
                              error : function(xhr, status, error) {
                                 console.log(error);
                              }
                           });
                  }

               });
</script>
</html>