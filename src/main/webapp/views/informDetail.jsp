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
		margin: 0 auto;
		width: 75%;
	}
	 
 	table, td, th {
		border: 1px solid black;
		border-collapse: collapse;
		padding: 30px;
		padding-bottom: 15px;
	}
	
	 #updateBtn{
         background-color: #91bdce;
         border: 3px solid #91bdce;
         width: 50px;
         height: 30px;
         border-radius: 3px;
         color: white;
         float: right;
         margin-left: 3px;
      }
      
      #delBtn{
         background-color: #91bdce;
         border: 3px solid #91bdce;
         width: 50px;
         height: 30px;
         border-radius: 3px;
         color: white;
         float: right;
         margin-left: 3px;
      }
      
      #listBtn{
         background-color: #91bdce;
         border: 3px solid #91bdce;
         width: 70px;
         height: 30px;
         border-radius: 3px;
         color: white;
         float: right;
         margin-left: 3px;
      }
      
      #footer {
    position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
    /* 기타 스타일 속성 추가 */
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
            <h3>공지사항</h3>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
   
	<form action="/informUpdate.go" method="get">
		<table>
         <tr>
            <td>
            <input type="hidden" value="${inform.board_id}" name="board_id" />
            	<div style="font-size:22px;"><b>${inform.subject}</b></div>
            	<div style="margin-top: 10px;">${inform.name} &nbsp;&nbsp; ${inform.writeTime}
            		<c:if test="${sessionScope.admin eq true}">
		            	<button id="updateBtn" style="float:right;">수정</button>
						<button id="delBtn" type="button" onclick="informDel('informDel.do?board_id=${inform.board_id}')" >삭제</button>
					</c:if>
					
					<button id="listBtn" type="button" onclick="location.href='/informList.go'" >리스트</button>
					</div>
            </td>
         </tr>
         <tr>
            <td><div id="content">${inform.content}</div></td>
         </tr>
      </table>
      
	</form>
    </section>
    <!-- /.content -->
    <div id="footer">
    <jsp:include page="footer.jsp"/>
    </div>
  </div>
  <!-- /.content-wrapper -->
  
</div>




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
config.editorResizeMode = "none"; // editor 크기 조절 : none
// 상세보기에서는 필요한 툴바만 노출할 예정(html 저장, 출력, pdf 저장, 코드보기)
config.toolbar="simple";
config.toolbar_simple="{save, print, html2pdf, code}";


var editor = new RichTextEditor("#div_editor",config);
editor.setHTMLCode($("#content").html()); // editor 에 내용 넣기
editor.setReadOnly();

function informDel(path) {
	console.log(path);
	if(!confirm('공지사항을 삭제 하시겠습니까?')) {
		
	}else {
		location.href=path;
	}
}

</script>
</html>
