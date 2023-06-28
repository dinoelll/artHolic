<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Basic Editor</title>
<link rel="stylesheet"
	href="richtexteditor/rte_theme_default.css">
<link rel="stylesheet" href="richtexteditor/res/style.css">
<script src="richtexteditor/rte.js"></script>
<script src="richtexteditor/plugins/all_plugins.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
table {
	magin-left: 45px;
	width: 1330px;
	height: 416px;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px 10px;
}

#content {
	display: none;
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
	width: 244px;
    height: 95px;
    padding: 22px 40px;
    margin: 0 auto;
    border: 5px solid #777;
    background-color: #fff;
}

#closeBtn{
	width: 50px;
	height: 30px;
	padding: 4px 4px;
	float: left;
	font-weight: bold;
	color: #777;
	font-size: 10px;
	cursor: pointer;
}
#delete{
	width: 50px;
	height: 30px;
	padding: 4px 4px;
	float: right;
	font-weight: bold;
	color: #777;
	font-size: 10px;
	cursor: pointer;
}
</style>
</head>
<body>


	<h2>현장설명게시판</h2>
	<hr>
	<br>
	<br>
	<br>

	
	<button type="button" id="popupBtn">삭제</button>
	

	<div id="modalWrap">
		<div id="modalBody">
			<!-- <span id="closeBtn">&times;</span> -->
			<p>게시물을 정말 삭제하시겠습니까?</p>
			<button id= "delete" onclick="location.href='/briefingDelete.do?idx=${bbs.idx }'">예</button>
			<button id="closeBtn">아니오</button>
		</div>
	</div>

	


	<table>
		<tr>
			<td>작성자 : ${bbs.user_name }</td>
		</tr>
		<tr>
			<td>제목 : ${bbs.subject }</td>
		</tr>
		<tr>
			<td>
				<div id="div_editor"></div>
			</td>
		</tr>
		<tr>
			<td>
				<button onclick="location.href='/'">돌아가기</button>
			</td>
		</tr>
	</table>
	<div id="content">${bbs.content }</div>
</body>
<script>
	var msg;
	if (msg != null) {
		alert(msg);
	}

	var config = {}
	config.editorResizeMode = "none"; //에디터 크기조절:none
	//상세보기에서는 필요한 툴바만 노출할 예정(html저장, 출력, pdf저장, 코드보기)
	config.toolbar = "simple";
	config.toolbar_simple = "{save, print, html2pdf,code}"; 

	var editor = new RichTextEditor("#div_editor", config);
	editor.setHTMLCode($("#content").html()); //editor 에 내용 넣기
	editor.setReadOnly();
	
	
	

	const btn = document.getElementById('popupBtn');
	const modal = document.getElementById('modalWrap');
	const closeBtn = document.getElementById('closeBtn');

	btn.onclick = function() {
		modal.style.display = 'block';
	}
	closeBtn.onclick = function() {
		modal.style.display = 'none';
	}

	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
</script>
</html>