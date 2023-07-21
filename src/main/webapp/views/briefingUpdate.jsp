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
	
	#content{
		display: none;
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
            <h3>현장설명회 수정</h3>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
	<form action="/briefingUpdate.do" method="post">
		<table>
			<tr>
				<td>
					<input type="text" name="subject" value="${briefing.subject}"/>
		    		<input type="hidden" name="board_id" value="${briefing.board_id}"/>
		    		<input type="hidden" name="member_id" value="${sessionScope.loginId}" />
		    	</td>
			</tr>
			<tr>
				<td>
					<div id="div_editor"></div>
					
					<div id="content">
					${briefing.content}
						<input id="contents" name="content" type="hidden" value=""/>
					</div>
					
				</td>
			</tr>
			<tr>
				<td>
					<input style="float:right;" type="button" onclick="location.href='/briefingList.go'" value="취소"/>
					<input type="button" onclick="updateDo()" style="float:right;" value="수정" />
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


// 상세보기에서는 필요한 툴바만 노출할 예정(html 저장, 출력, pdf 저장, 코드보기)
config.toolbar="simple";
config.toolbar_simple="{save, print, html2pdf, code}";

editor.setHTMLCode($("#content").html()); // editor 에 내용 넣기

function updateDo(){
var content = editor.getHTMLCode();
$("#contents").val(content);
$('form').submit();
//editor.setReadOnly();
}


</script>
</html>
