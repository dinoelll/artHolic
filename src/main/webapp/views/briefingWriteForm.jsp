<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Basic Editor</title>
<link rel="stylesheet" href="richtexteditor/rte_theme_default.css">
<link rel="stylesheet" href="richtexteditor/res/style.css">
<script src="richtexteditor/rte.js"></script>
<script src="richtexteditor/plugins/all_plugins.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
input[type="text"]{
	width: 100%;
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px 10px;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px 10px;
}
input[type="button"]{
	float: right;
}


</style>
</head>
<body>


	<h2>현장설명게시판</h2>
	<hr>
	<br><br><br>
	

	<form id="bbs" action="briefingWrite.do" method="post">
		<table>
			<tr>
				<td>작성자 : <input type="text" name="user_name" placeholder="작성자 이름"></td>
			</tr>
			<tr>
				<td>제목 : <input type="text" name="subject" placeholder="제목을 적으세요"></td>
			</tr>
			<tr>		
				<td>
					<div id="div_editor"></div>
					<input id="content" type=hidden name="content"/>			
				</td>
			</tr>
		</table>
		<input type="button" onclick="save()" value="저장"/>
	</form>
</body>
<script>
	var config={}
	config.editorResizeMode = "none"; //에디터 크기조절:none
	
	//파일 업로드
	config.file_upload_handler = function(file,callback){// file정보, 이미지 경로 변경 함수
		console.log(file);// 크기, 이름, 종류 등을 알 수 있다.
		console.log(callback);
		if (file.size > (1*1024*1024)) {
			alert('1MB이상의 파일은 올릴 수 가 없습니다.');
			callback('/img/noimage.png');
		}
	}
	
	var editor = new RichTextEditor("#div_editor",config);
	
	function save(){
		console.log('저장');
		var content = editor.getHTMLCode();
		console.log(content.length);
		if (content.length >(4*1024*1024)) {
			alert('컨텐츠의 크기가 너무 큽니다. 이미지의 크기나 갯수를 줄여주세요');
		}else{
			$('input[name="content"]').val(content);
			$('form').submit();
		}
	}
	
	/* data:image 방식
		장점: 서버에서 별도의 파일처리 과정이 없어 사용이 간단하다.
		단점: 용량제어가 어렵고, 기존파일보다 용량이 커진다.(base64 인코딩시 크기가 커진다.)
		
		tomcat에서 post방식으로 허용하는 기본 크기는 2MB이다.(텍스트만..)
		data:image를 사용하면 문자열의 크기가 커지기 때문에 controller에서 null로 받게 된다.
		
		해결방법 1 : server.xml에서 Connector에 maxPostSize="-1"(무제한)을 해주거나 2MB보다 큰 수를 지정한다.
		
		해결방법 2 : 내장톰캣 사용시 application.properties에서 설정 해 준다.
		
	*/
</script>
</html>