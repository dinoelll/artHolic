<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta charset="utf-8">
  <title>ArtHolic</title>
  
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  
  <!-- Editor -->
  <link rel="stylesheet" href="/richtexteditor/res/style.css">
<link rel="stylesheet" href="/richtexteditor/rte_theme_default.css">
<script src="/richtexteditor/rte.js"></script>
<script src="/richtexteditor/plugins/all_plugins.js"></script>

  
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
	
		input[type="text"]{
		width: 100%;
		border : 1px solid lightgray;
	}
	table{
		magin-left: 45px;
	}
	
  </style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
	<jsp:include page="header.jsp"/>
	
	<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h3>현장설명회 등록</h3>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
	<form id="inform" action="/briefingWrite.do" method="post">
		<table>
			<tr>
				<td>
				<input type="hidden" name="member_id" value="${sessionScope.loginId}" />
					<input type="text" class="subject" name="subject"/>
		    	</td>
			</tr>
			<tr>
				<td>
					<div id="div_editor"></div>
					<input id="content" type="hidden" name="content"/>
				</td>
			</tr>
			<tr>
				<td>
				<input style="float:right;" type="button" onclick="location.href='briefingList.go'" value="취소"/>
					<input style="float:right;" type="button" onclick="save()" value="등록" />
					
				</td>
			</tr>
		</table>
	</form>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
</div>


<jsp:include page="footer.jsp"/>

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->

</body>
<script>
var config = {};
config.editorResizeMode = "none"; // 에디터 크기조절 : none

//파일 업로드
config.file_upload_handler = function(file,callback){//file 정보, 이미지 경로 변경 함수
	console.log(file);//크기, 이름, 종류 등을 알 수 있다.
	if(file.size > (1*1024*1024)){
		alert('1MB 이상의 파일은 올릴수가 없습니다.');
		callback('/img/noimage.png');
	}
}


var editor = new RichTextEditor("#div_editor",config);

function save(){
	console.log('저장');
	var content = editor.getHTMLCode();
	console.log(content.length);
	if(content.length>(4*1024*1024)){
		alert('컨텐츠의 크기가 너무 큽니다. 이미지의 크기나 갯수를 줄여 주세요');
	}else{
		$('input[name="content"]').val(content);
		$('form').submit();
	}
	
	
}
</script>
</html>
