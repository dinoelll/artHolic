<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>spring boot</title>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>

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
</style>
</head>
<body>

	<h2>현장설명게시판</h2>
	<hr>
	<br><br><br>
	

	<fieldset>

		<select id="opt">
			<option value="name">이름</option>
			<option value="subject">제목</option>
		</select> <input type="text" id="keyword" value="" placeholder="검색어를 입력하세요" />
		<button onclick=opt()>검색</button>
		<button onclick="location.href='/briefingWrite.go'" id="writeForm">글쓰기</button>
	</fieldset>

	<table>
		<thead>
			<tr>
				<th>idx</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>

			</tr>
		</thead>
		<tbody id="list">
			<!-- 리스트가 출력될 영역 -->
		</tbody>
		<tr>
			<td colspan="6" id="paging">
				<!-- 	플러그인 사용	(twbsPagination)	-->
				<div class="container">
					<nav aria-label="Page navigation" style="text-align: center">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
			</td>
		</tr>
	</table>

</body>
<script>
var showPage = 1; 
var cnt=10;
var optValue ='';
var keywordValue='';

listCall(showPage);

function opt() {
	
	/*
	$('#pagination').twbsPagination({
		totalPages:null //총 페이지 수 
	});
	*/
	
	  optValue = document.getElementById("opt").value;
	  keywordValue = document.getElementById("keyword").value;
	  showPage = 1;
	  listCall(showPage);
	  $('#pagination').twbsPagination('destroy');
}






function listCall(page){
	$.ajax({
		type:'post',
		url:'/briefingList.ajax',
		data:{
			'page':page,
			'cnt':cnt,
			'opt':optValue,
			'keyword':keywordValue	
		},
		dataType:'json',
		success:function(data){
			//console.log(data);
			console.log(data.pages);
		
			
			listPrint(data.list);
			
			//총 페이지 수
			//현재 페이지
			
			/*
			sleep(3000).then(function() {
 				 console.log('Do something...')
			})
			*/
			//paging plugin
			$('#pagination').twbsPagination({
				startPage:data.currPage, //시작페이지
				totalPages:data.pages, //총 페이지 수 
				visiblePages:5, //보여줄 페이지 수 [1][2][3][4][5]
				
				onPageClick:function(event,page){ //페이지 클릭시 동작되는 함수 (콜백)
					//console.log(event,page);
				
					if (page !=  showPage) {
						console.log('if문 호출');
						showPage=page; // 2
						listCall(page);
						
					}
				}
				
			});
			
			
		},	
		error:function(e){
			console.log(e);
		}		
	});
}

function listPrint(list) {
	var content = '';
	//java.sql.Date 는 js에서 읽지 못해 밀리세컨드로 반환한다.
	// 해결방법 1. DTO에서 Date를 String으로 반환
	// 해결방법 2. js 에서 변환
	list.forEach(function(dto,idx){
		content +='<tr>';
		content +='<td>'+dto.idx+'</td>';
		content +='<td><a href="briefingDetail.do?idx='+dto.idx+'">'+dto.subject+'</a></td>';
		content +='<td>'+dto.user_name+'</td>';
		content +='<td>'+dto.bHit+'</td>';
		var date = new Date(dto.reg_date);
		content +='<td>'+date.toLocaleDateString('ko-KR')+'</td>'; //en-US 를 ko-KR로 바꿔준다.
		content +='</tr>';
	});
	
	
	$('#list').empty();
	$('#list').append(content);
}

function sleep(ms) {
	  return new Promise((resolve) => setTimeout(resolve, ms))
}




</script>
</html>