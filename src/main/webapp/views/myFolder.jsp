<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>ArtHolic</title>
<!-- 
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
 -->
	<!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!--  Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">	

  <!-- Font Awesome-->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  
  <!--  iCheck -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  
   <!-- JQVMap
  <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
  -->
  <!-- Theme style-->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- overlayScrollbars-->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
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
	#footer {
		margin-left: 251px;	
	}
	
	.content {
	  	display: flex;
		justify-content: center;
		align-items: center;
		height: 700px;
		text-align: center;
	}
	
	#folderUpdate{
		height: 30px;
		width: 350px;
		margin-left: 55px;
	}
	
	#folderCreate{
		height: 30px;
		width: 350px;
		margin-left: 55px;
	}
	
	.modal-title{
		margin-left: 180px;
	}
	
	.rectangle {
		width: 400px;
		height: 700px;
		background-color: rgba(233, 221, 198, 0.4);
		margin-top: 100px;
	}
	
	.rectangle_list {
		width: 1200px;
		height: 700px;
		background-color: rgba(233, 221, 198, 0.4);
		margin-top: 100px;
	}
    
	.folder-container {
		display: flex;
		align-items: center;
		justify-content: center; /* 요소들을 수평 가운데 정렬 */
		margin-left: 150px;
		position: relative;
	}	
	
	.file-container {
		display: flex;
		align-items: center;
		justify-content: center; /* 요소들을 수평 가운데 정렬 */
		margin-left: 550px;
		position: relative;
	}
	
	.btn-icon {
		margin-left: 100px;
		background: none;
		border: none;
		position: absolute;
		top: 5px;
  		right: 20px;
	}
	
	.folder-title {
		margin-top: 20px;
		white-space: nowrap; /* 폴더 이름이 한 줄에 표시되도록 설정 */
		margin-right: 150px;
	}
	
	.horizontal-line {
	    width: 100%;
	    height: 1px;
	    background-color: #ccc;
	    margin-top: 5px;
	    margin-bottom: 20px;
	}
	
	.folder-icon {
    	font-size: 32px;
    	margin-right: 10px;
    	color: #91bdce;
	}
	
	.file-icon {
    	font-size: 32px;
    	margin-right: 10px;
    	color: #91bdce;
	}
	
	.btn-container {
		margin-left: 350px;
		margin-right: 20px;
	}	
	
	#file-list {
	  	list-style-type: none;
	  	padding: 0;
	}
	
	#file-list li {
	  	margin-bottom: 5px;
	}
	
	#file-list li {
		display: flex;
		align-items: center;
		justify-content: space-between;
	}

	.delete-file {
		margin-left: auto;
	}
	
	.file-size {
  		color: #91bdce;
	}
	
	input[type="file"] {
		display: none;
	}

	label.file-input-label {
		/* 파일 선택 버튼을 스타일링할 레이블 요소에 스타일 적용 */
		background-color: #91bdce;
		color: white;
		padding: 10px 20px;
		border: 1px solid #91bdce;
		cursor: pointer;
		align-items: center;
		width: 475px;
		text-align: center;
		border-radius: 5px;
	}
	
	label.file-input-label:hover {
		/* 호버 상태일 때의 스타일 */
		background-color: #ddd;
	}
	
	label.file-input-label::after {
		/* 파일 선택 버튼 아이콘 추가 (예: Font Awesome 아이콘 사용) */
		content: "\f07b";
		font-family: "Font Awesome 5 Free";
		font-weight: 900;
		margin-left: 10px;
	}
	
	/* 파일 선택 버튼을 눌렀을 때의 스타일 (선택한 파일명 표시 등) */
	input[type="file"]:focus + label.file-input-label {
		/* 파일 선택 버튼에 포커스가 있을 때 스타일 적용 */
		outline: 2px solid #aaa;
	}
	
	.btn-primary{
		background-color: #91bdce;
		border: 1px solid #91bdce;
	}
	
	img {
 		width: 70px;
  		height: 70px;
	}

	.file-gallery {
		display: grid;
		grid-template-columns: repeat(10, minmax(1200px, 1fr));
		grid-gap: 20px;
		justify-items: center;
		overflow-x:hidden; 
		overflow-y: auto;
 		max-height: 500px;
	}

	.file-list {
		display: flex;
		flex-direction: row;
		flex-wrap: wrap; 
		margin-left: 60px;
	}

	.file-item {
		display: flex;
		flex-direction: column;
		align-items: center;
		margin: 5px;
		justify-content: center;
		width: 130px;
		height: 120px;
	}

	.file-icon {
	    max-width: 100%;
	    height: auto;
	}

	.file-ext {
	    font-size: 12px;
	    margin-top: 5px;
	}
	
	.file-name {
 		text-align: center;
 		font-size:14px;
	}
	
	.delete-file {
		height: 17px;
		width: 15px;
		padding-left: 0px;
		padding-right: 0px;
		padding-top: 0px;
		padding-bottom: 0px;
		border: none;
		margin-left: 5px;
	}
	
	.btn-folder{
		margin-top: 15px;
	}
	
	.btn-upload{
		margin-top: 15px;
	}
	
</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<jsp:include page="header.jsp"/>
	 	<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
	    <!-- Content Header (Page header) -->
	    <div class="content-header">
	      <div class="container-fluid">
	        <div class="row mb-2">
	          <div class="col-sm-6">
			  <h1 class="m-0">내 문서</h1>
	          </div><!-- /.col -->
	          <div class="col-sm-6">
	            <ol class="breadcrumb float-sm-right">
	              <li class="breadcrumb-item"><a href="#">Home</a></li>
	              <li class="breadcrumb-item active">Dashboard v1</li>
	            </ol>
	          </div><!-- /.col -->
	        </div><!-- /.row -->
	      </div><!-- /.container-fluid -->
	    </div>
	    <!-- /.content-header -->
    
    <!-- Main content -->
<section class="content">
    <div class="container-fluid">
    
    <!-- 폴더 리스트 -->
      <div class="row">
        <div class="col-md-3">
          <div class="rectangle">
            <div class="folder-container">
              <i class="fas fa-folder folder-icon"></i>
              <h4 class="folder-title">내 폴더</h4>
              <button type="button" class="btn btn-default btn-icon btn-folder" data-toggle="modal" data-target="#modal-default">
                <i class="fas fa-plus"></i>
              </button>	
            </div>	
            <div class="horizontal-line"></div>
	            <table id="folder-list-table" class="table">
				  <thead>
				  </thead>
				  <tbody id="folder-list"></tbody>
				</table>
          </div>
        </div>
        
	<!-- 파일 리스트 -->
        <div class="col-md-6">
          <div class="rectangle_list">	
            <div class="file-container">
				<i class="fas fa-file file-icon"></i>
             	<h4 class="folder-title">내 파일</h4>
             	
             	<span id="folderFileId" class="folder_id file" hidden=""></span>
             	
             	<div class="btn-container">
	            	<button type="button" class="btn btn-default btn-icon btn-upload" data-toggle="modal" data-target="#modal-upload" data-id="">
	              	<i class="fas fa-plus"></i>
	              	</button>
	              	
	            </div>	
            </div>	
            <div class="horizontal-line"></div>
            
            	<div id="file-gallery" class="file-gallery">
  					<div id="file-list" class="file-list"></div>
				</div>
            	<!-- <table id="file-list-table" class="table">
				  <thead>
				  </thead>
				  <tbody id="file-list"></tbody>
				</table> -->
            </div>
        </div>
      </div>
    </div>
  </section>
  <!-- /.content -->
</div>
	
   		<!-- 폴더 등록 모달창 -->
		<div class="modal fade" id="modal-default">
			<div class="modal-dialog">
			<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">폴더 생성</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			<div class="modal-body">
				<table>
					<tr>
						<td><input type="text" id="folderCreate" placeholder="폴더 이름을 입력해주세요." /></td>
					</tr>
				</table>		
			</div>
				<div class="modal-footer justify-content-between">
					<button type="button" class="btn btn-default"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary btn-create">생성</button>
				</div>
		</div>
		<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
		
		
		<!-- 폴더 수정 모달창 -->
		<div class="modal fade" id="modal-update">
			<div class="modal-dialog">
			<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">폴더 수정</h4>
					
					<!-- 폴더 id -->
           			<span class="folder_id update" hidden=""></span>
         
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			<div class="modal-body">
				<table>
					<tr>
						<td><input type="text" id="folderUpdate" placeholder="변경할 폴더 이름을 입력해주세요." /></td>
					</tr>
				</table>		
			</div>
				<div class="modal-footer justify-content-between">
					<button type="button" class="btn btn-default"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary btn-update">수정</button>
				</div>
		</div>
		<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
		
		
		<!-- 폴더 삭제 모달창 -->
		<div class="modal fade" id="modal-delete">
			<div class="modal-dialog">
			<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">폴더 삭제</h4>
					
					<!-- 폴더 id -->
           			<span class="folder_id delete" hidden=""></span>
         
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
			<div class="modal-body">
				<p style="text-align: center;">폴더를 정말로 <strong>삭제</strong>하시겠습니까?</p>
				<br>
				<p style="text-align: center; font-size: 20px;">*삭제된 폴더는 <span style="color: red; font-weight: bolder;">복구</span>되지 않습니다.*</p>
			</div>
				<div class="modal-footer justify-content-between">
					<button type="button" class="btn btn-default"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary btn-delete">삭제</button>
				</div>
		</div>
		<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
		
		
		
		<!-- 파일 업로드 모달창 -->
		<div class="modal fade" id="modal-upload">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h4 class="modal-title">파일 업로드</h4>
		
		      	<!-- 폴더 id -->
           		<span class="folder_id upload" hidden=""></span>
           		
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <ul id="upload-list"></ul>
				    <table>
				        <tr>
				            <td><input type="file" id="file-input" multiple /></td>
				            <label for="file-input" class="file-input-label">파일 선택</label>
				        </tr>
				    </table>
		      </div>
		      <div class="modal-footer justify-content-between">
		        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary btn-primary-file" id="upload-button">업로드</button>
		      </div>
		    </div>
		    <!-- /.modal-content -->
		  </div>
		  <!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
		
        <!-- 파일 삭제 모달창 -->
        <div class="modal fade" id="modal-fileDelete">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h4 class="modal-title">파일 삭제</h4>
        
                  <!-- 폴더 id -->
                   <span class="folder_id upload" hidden=""></span>
                   
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                    <input type="hidden" id="fileName" value="">
                      <p style="text-align: center;">파일을 정말로 <strong>삭제</strong>하시겠습니까?</p>
                      <br>
                    <p style="text-align: center; font-size: 20px;">*삭제된 파일는 <span style="color: red; font-weight: bolder;">복구</span>되지 않습니다.*</p>
              </div>
              <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary btn-fileDelete" >삭제</button>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
	   <jsp:include page="footer.jsp"/>
	   
	</div>
    <!-- /.container-fluid -->

	
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

	<!-- AdminLTE for demo purposes 
	<script src="dist/js/demo.js"></script>
	-->
</body>

<script>

listcall();
filelistcall();

	/* 폴더 생성 */
	$(document).ready(function() {
		// 생성 버튼 클릭 시
		$('.btn-create').click(function() {
		// 입력된 폴더 이름 가져오기
	    var folderName = $('#folderCreate').val().trim();
	        
	    // 폴더 이름이 공백인 경우 경고창 띄우고 함수 종료
        if (folderName.trim() === '') {
	       	alert('폴더 이름을 입력하세요.');
	        return;
	    }
		// 서버로 폴더 생성 요청 전송
		$.ajax({
			type: 'POST',
			url: '/createFolder.ajax',
			data: { folderName: folderName },
			success: function(data) {
			  // 폴더 생성 성공 시
			  alert('폴더 생성에 성공했습니다.');
			  location.reload(); // 페이지 새로고침
			},
			error: function(error) {
			  // 폴더 생성 실패 시
			  alert('폴더 생성에 실패했습니다.');
			  console.log(error);
			}
		});
		
			// 모달창 닫기
			$('#modal-default').modal('hide');
			});
	});
		
	/* 폴더 수정 */
	$(document).ready(function() {
	  // 수정 버튼 클릭 시
	  $('.btn-update').click(function() {
	    // 입력된 폴더 이름 가져오기
	    var folderName = $('#folderUpdate').val();
	    var folderId = $('.folder_id.update').text();
		console.log(folderName,folderId);
		
		  // 폴더 이름이 공백인 경우 경고창 띄우고 함수 종료
	    if (folderName.trim() === '') {
	       	alert('폴더 이름을 입력하세요.');
	        return;
	    }
		  
	    // 서버로 폴더 수정 요청 전송
	    $.ajax({
	      type: 'POST',
	      url: '/updateFolder.ajax',
	      data: {
	        folderName: folderName,
	        folder_id: folderId
	      },
	      success: function(data) {
	        // 폴더 수정 성공 시
	        alert('폴더 이름 변경에 성공했습니다.');
	        location.reload(); // 페이지 새로고침
	      },
	      error: function(error) {
	        // 폴더 수정 실패 시
	        alert('폴더 이름 변경에 실패했습니다.');
	        console.log(error);
	      }
	    });

	    // 모달창 닫기
	    $('#modal-update').modal('hide');
	  });
	});
	
	/* 폴더 삭제 */
	$(document).ready(function() {
	  // 삭제 버튼 클릭 시
	  $('.btn-delete').click(function() {
	    var folderId = $('.folder_id.delete').text();
		console.log(folderId);
	    // 서버로 폴더 삭제 요청 전송
	    $.ajax({
	      type: 'POST',
	      url: '/deleteFolder.ajax',
	      data: {
	        folder_id: folderId
	      },
	      success: function(data) {
	        // 폴더 삭제 성공 시
	        alert('폴더 삭제에 성공했습니다.');
	        location.reload(); // 페이지 새로고침
	      },
	      error: function(error) {
	        // 폴더 삭제 실패 시
	        alert('폴더에 있는 파일을 모두 삭제 해주세요.');
	        console.log(error);
	      }
	    });

	    // 모달창 닫기
	    $('#modal-delete').modal('hide');
	  });
	});
	
	// 폴더 수정 
	$(document).on('click', '.btn-edit', function() {
		  var folderId = $(this).data('id'); // 클릭된 버튼의 data-id 값을 가져옴
		  console.log(folderId);
		  $('#modal-update').find('.folder_id.update').text(folderId); // 모달 내부의 특정 요소에 폴더 ID를 설정
		  
		  // 모달 열기 코드
		  $('#modal-update').modal('show');
		});
	
	// 폴더 삭제
	$(document).on('click', '.btn-delete', function() {
		  var folderId = $(this).data('id'); // 클릭된 버튼의 data-id 값을 가져옴
		  console.log(folderId);
		  $('#modal-delete').find('.folder_id.delete').text(folderId); // 모달 내부의 특정 요소에 폴더 ID를 설정
		  
		  // 모달 열기 코드
		  $('#modal-delete').modal('show');
		});
	
	// 파일 업로드
	$(document).on('click', '.btn-upload', function() {
		var folderId = $(this).data('id'); // 클릭된 버튼의 data-id 값을 가져옴
		console.log(folderId);
		console.log('업로드 버튼 클릭 이벤트');
	    console.log('folderID : ' + $('#folderFileId').text());
	    
	    // $('#modal-upload').attr('data-id', $('#folderFileId').text());
	    
		$('#modal-upload').find('.folder_id.upload').text(folderId); // 모달 내부의 특정 요소에 폴더 ID를 설정
		  
		  // 모달 열기 코드
		  $('#modal-upload').modal('show');
		});
	
	
	
	
	/* 파일 업로드 */
	$(document).ready(function() {
	  // 파일 선택 시
	  $('#file-input').change(function() {
	    var fileList = $('#file-input')[0].files; // 선택된 파일들의 리스트
	    var fileListContainer = $('#upload-list'); // 파일 목록을 표시할 컨테이너
		
	    console.log('파일 선택 시');
	    console.log(fileList);
	    
	    // 기존 파일 목록 초기화
	    fileListContainer.empty();
	
	 	// 선택된 파일들의 리스트를 동적으로 생성하여 파일 목록 컨테이너에 추가
	    for (var i = 0; i < fileList.length; i++) {
	    	var listItem = $('<li>').css('display', 'flex').css('justify-content', 'space-between').html(
	    			  '<span class="file-info">' +
	    			    fileList[i].name + '<br>' +
	    			    '<span class="file-size">' + formatFileSize(fileList[i].size) + '</span>' +
	    			  '</span>'
	    			);
	    	var deleteButton = $('<button>').text('X').addClass('btn btn-xs btn-danger delete-file').css({
	    		  height: '23px',
	    		  width: '19px'
	    		});
			listItem.append(deleteButton);
			fileListContainer.append(listItem);
	    }
	  });
	  
	// 파일 삭제 버튼 클릭 시
		$('#upload-list').on('click', '.delete-file', function() {
			$(this).parent().remove();
		});
	  
	});
	 
	// 파일 크기를 읽기 좋은 형식으로 변환하는 함수
	function formatFileSize(size) {
	  var kilobyte = 1024;
	  var megabyte = kilobyte * 1024;
	  var gigabyte = megabyte * 1024;
	  var terabyte = gigabyte * 1024;

	  if (size < kilobyte) {
	    return size + ' 바이트';
	  } else if (size < megabyte) {
	    return (size / kilobyte).toFixed(2) + ' KB';
	  } else if (size < gigabyte) {
	    return (size / megabyte).toFixed(2) + ' MB';
	  } else if (size < terabyte) {
	    return (size / gigabyte).toFixed(2) + ' GB';
	  } else {
	    return (size / terabyte).toFixed(2) + ' TB';
	  }
	}
	
	  // 업로드 버튼 클릭 시
	  $('#upload-button').click(function() {
	    // 선택된 파일 가져오기
	    var fileList = $('#file-input')[0].files;
	    console.log('업로드 클릭 시');
	    console.log(fileList);
	    
	    // FormData 객체 생성
	    var formData = new FormData();
	    for (var i = 0; i < fileList.length; i++) {
	    	console.log(fileList[i]);
	      formData.append('file', fileList[i]);
	    }
	   
	    //console.log(formData);
	    
	    // 저장된 폴더 ID 가져오기
	    var folderId = $('#folderFileId').text();
	    formData.append('folderId',folderId);
	    console.log(formData);
	    
	    console.log('folderID : ' + $('#folderFileId').text());
	    console.log('folderID : ' + folderId);
	    
	    // 서버로 파일 업로드 요청 전송
	    $.ajax({
	      	type: 'POST',
	      	url: '/uploadFile.ajax',
	      	data: formData,
	        enctype: 'multipart/form-data',
	        processData: false,
	        contentType: false,
			success: function(data) {
	        // 파일 업로드 성공 시
	        alert('파일 업로드에 성공했습니다.');
	        location.reload(); // 페이지 새로고침
	      },
	      error: function(error) {
	        // 파일 업로드 실패 시
	        alert('파일 업로드에 실패했습니다.');
	        console.log(error);
	      }
	    });
	    
	    // 모달창 닫기
	    $('#modal-upload').modal('hide');
	  });	
		
	  
	  	// 폴더 리스트 
		function listcall(){
			
			$.ajax({
				type : 'get',
				url : '/list.ajax',
				data : {},
				dataType : 'json',
				success:function(data){
					console.log(data);
					drawList(data['folder-list']);
				},
				error:function(e){
					console.log(e);
				}
				
			});
			
		}
		
		function drawList(list) {
		    var content = '';
		    list.forEach(function(item, idx) {
		        content += '<tr>';
		        content += '<td style="width: 150px;"><button type="button" class="btn btn-link text-dark folder-id font-weight-bold" data-folder="' + item.folder_id + '">' + item.folder_name + '</button></td>';
		        content += '<td class="text-right">';
		        content += '<div class="btn-group" role="group">';
		        content += '<button type="button" class="btn btn-default btn-icon btn-edit" data-toggle="modal" data-target="#modal-update" data-id="' + item.folder_id + '"><i class="fas fa-cog"></i></button>';
		        content += '<button type="button" class="btn btn-default btn-icon btn-delete" data-toggle="modal" data-target="#modal-delete" data-id="' + item.folder_id + '"><i class="fas fa-trash-alt"></i></button>';
		        content += '</div>';
		        content += '</td>';
		        content += '</tr>';
		    });
		    
		    $('#folder-list').html(content);
		    
			 // 폴더 이름 추가
			if (list.length > 0) {
				var folderId = list[0].folder_id; // 첫 번째 폴더의 ID를 가져옴
				filelistcall(folderId); // 첫 번째 폴더에 해당하는 파일 리스트 가져오기
				var folderName = list[0].folder_name; // 첫 번째 폴더의 이름을 가져옴
				updateFolderName(folderName);
		    }
		}
		// 폴더 생성 후 자동 새로고침
		  function refreshPage() {
		    location.reload();
		  }
		
		// 폴더 클릭 이벤트 처리
		  $('#folder-list').on('click', '.folder-id', function () {
		    var folderId = $(this).data('folder');
		    console.log(folderId);
		    filelistcall(folderId);
		    $('#modal-upload').data('folder-id', folderId);
		    
		    // 폴더 이름 업데이트
		    var folderName = $(this).text();
		    updateFolderName(folderName);
		    
		  });
		
		// 파일 리스트 
			function filelistcall(folderId){
				
				$.ajax({
					type : 'post',
					url : '/filelist.ajax',
					data: { folder_id: folderId },
					dataType : 'json',
					success:function(data){
						console.log(data);
						drawFileList(data['file-list']);
						$('#folderFileId').text(folderId);
					},
					error:function(e){
						console.log(e);
					}
					
				});
				
			}
			
			function drawFileList(fileList) {
				  var content = '';
				  fileList.reverse(); // 파일 순서를 역순으로 변경하여 최신 파일이 오른쪽에 표시되도록 함
				  fileList.forEach(function(item, idx) {
					  content += '<div class="file-item" data-new-file-name="' + item.new_fileName + '">';
				    if (item.ext === '.png' || item.ext === '.jpg' || item.ext === '.txt' || item.ext === '.gif' || item.ext === '.hwp') {
				      // 파일 확장자에 따라 이미지 소스를 동적으로 생성합니다.
				      var imageSrc = 'img/' + item.ext.substring(1) + '.png';
				      content += '<img src="' + imageSrc + '" alt="" class="file-icon" onclick="downloadFile(\'' + item.ori_fileName + '\', \'' + item.new_fileName + '\')">'; // 이미지 클릭 시 downloadFile 함수 호출
				    } else {
				      content += '<div class="file-ext">' + item.ext + '</div>';
				    }
				    var fileNameWithoutExtension = item.ori_fileName.substring(0, item.ori_fileName.lastIndexOf('.'));
				    content += '<div class="file-info">';
				    content += '<div class="file-name">' + fileNameWithoutExtension;
				    var deleteButton = $('<button>').text('x').addClass('btn btn-xs btn-danger delete-file').css({
				      height: '15px',
				      width: '15px',
	      
				    });
				    content += deleteButton.prop('outerHTML'); // 삭제 버튼 추가
				    content += '</div>';
				    content += '</div>';
				    content += '</div>';
				  });

				  
				  $('#file-list').html(content);
				}
            
            $(document).on('click', '.delete-file', function() {
                var fileName = $(this).closest('.file-item').data('new-file-name');
                 $('#modal-fileDelete').find('#fileName').text(fileName); // 모달 내에 파일 이름 출력
                 $('#modal-fileDelete').modal('show');
               });
           
           $('.btn-fileDelete').on('click', function() {
                 var fileName = $('#modal-fileDelete').find('#fileName').text();
                 deleteFile(fileName);
           });
			
			function deleteFile(fileName) {
		
				  // 삭제 요청 보내기
				  $.ajax({
				    url: '/deleteFile.ajax', // 삭제 요청을 보낼 URL
				    method: 'POST',
				    data: { fileName: fileName }, // 삭제할 파일 이름을 서버로 전달
				    success: function(response) {
				      // drawFileList(fileList); // 파일 리스트 다시 그리기
                      alert('파일 삭제에 성공 했습니다.');
				      location.reload();
				    },
				    error: function(error) {
                      alert('파일 삭제에 실패 했습니다.');
				      console.log(error);
				    }
				  });
			}
			
			function downloadFile(ori_fileName, new_fileName) {
				  console.log('파일 다운로드');
				  window.location.href = '/download.do?ori_fileName=' + ori_fileName + '&new_fileName=' + new_fileName; // 파일 다운로드를 위한 요청
				}
			
			function updateFolderName(folderName) {
				  $('.folder-title').text(folderName);
				}
			
			// 파일 생성 후 자동 새로고침
			  function refreshPage() {
			    location.reload();
			  }
			

</script>
</html>