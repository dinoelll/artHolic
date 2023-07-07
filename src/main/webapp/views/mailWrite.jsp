<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="utf-8">
<!--  <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<title>ArtHolic</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<!-- icheck bootstrap -->
<link rel="stylesheet"
	href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/adminlte.min.css">
<!-- summernote -->
<link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
<!-- Bootstrap4 Duallistbox -->
<link rel="stylesheet"
	href="plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
<style>
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

#footer {
	margin-left: 0px;
}

#preview-button, .mailBox, .selfBox, #send, .send {
	font-weight: bold;
	background-color: white;
	border: 1px solid white;
	color: black;
}

#preview-button:hover.mailBox:hover, .selfBox:hover, #send:hover, .send:hover
	{
	border-color: rgba(233, 221, 198, 0.4);
}

.hidden {
	display: none;
}

#preview {
	border-radius: 14px;
	width: 763px;
	height: 466px;
	padding: 31px 28px;
	margin: 12px auto;
	border: 1px solid lightgrey;
	background-color: #fff;
	overflow-x: hidden;
	overflow-y: auto;
	max-height: 483px;
}

#madalpreview {
	max-width: 800px;
}

.error {
	color: gray;
	font-size: smaller;
	text-align: -webkit-center;
}
</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<jsp:include page="header.jsp" />

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>메일 쓰기</h1>
							<input type="hidden" id="id-input-hidden" value="${id}">
							<input type="hidden" id="name-input-hidden" value="${name}">
							<input type="hidden" id="name-input-hidden" value="${dept}">
							<input type="hidden" id="name-input-hidden" value="${position}">							
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
				</div>
				<!-- /.container-fluid -->
			</section>




			<div class="modal fade" id="modal-default">
				<div class="modal-dialog" id="madalpreview">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">미리보기</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body" id="preview">
							<table>
								<tr>
									<th>보낸사람:</th>
									<td>&nbsp;&nbsp;&nbsp;<span id="preview-sender"></span></td>
								</tr>
								<tr>
									<th>받는사람:</th>
									<td>&nbsp;&nbsp;&nbsp;<span id="preview-recipient"></span></td>
								</tr>
								<tr>
									<th>참조:</th>
									<td>&nbsp;&nbsp;&nbsp;<span id="preview-cc"></span></td>
								</tr>
								<tr>
									<th>첨부파일:</th>
									<td>&nbsp;&nbsp;&nbsp;<span id="preview-attachment"
										style="white-space: pre-wrap;"></span></td>
								</tr>
								<tr>
									<th>제목:</th>
									<td>&nbsp;&nbsp;&nbsp;<span id="preview-mailSubject"></span></td>
								</tr>
								<tr>
									<td colspan="2"><p></p></td>
								</tr>
								<tr>
									<td colspan="2"><span id="preview-mailContent"></span></td>
								</tr>
							</table>
						</div>
						<div class="modal-footer justify-content-between">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">수정</button>
							<button type="button" class="btn btn-primary">보내기</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->




			<!-- Main content -->
			<section class="content">
				<div class="row1">

					<!-- /.col -->
					<div class="col-md-9">
						<div class="card card-primary card-outline">
							<div class="card-header">
								<button id="send">보내기</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" id="preview-button"
									class="btn btn-default" data-toggle="modal"
									data-target="#modal-default">미리보기</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button id="send">임시저장</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button id="selfBox" class="selfBox">내게쓰기</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button id="formGnb_button" data-toggle="modal"
									data-target="#modal-lg2" class="send">받는이선택</button>
							</div>
							<!-- /.card-header -->

							<!--  받는이선택 모달-->
							<div class="modal fade" id="modal-lg2">
								<div class="modal-dialog modal-lg">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title">받는이 선택</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<div class="card card-default">
												<div class="card-body">
													<div class="row">
														<div class="col-12">
															<div class="form-group">
																<label>받는이 선택</label>
																<div class="dual-listbox-container">
																	<select id="approvers" class="duallistbox"
																		multiple="multiple" name="sendMember">
																		<!-- <option value="1">대리 김형준</option>
																	<option value="2">과장 아무개</option>
																	<option value="3">California</option>
																	<option value="4">Delaware</option>
																	<option value="5">Tennessee</option>
																	<option value="6">Texas</option>
																	<option value="7">Washington</option> -->
																		<option id="option" class="option"></option>
																	</select>
																</div>
															</div>
															<!-- /.form-group -->
														</div>
														<!-- /.col -->
													</div>
													<!-- /.row -->
													<div class="row">
														<div class="col-12">
															<div class="form-group">
																<label>참조자 선택</label>
																<div class="dual-listbox-container">
																	<select id="referrer" class="duallistbox"
																		multiple="multiple" name="referenceMember">
																		<!-- <option value="1">대리 김형준</option>
																	<option value="2">과장 아무개</option>
																	<option value="3">California</option>
																	<option value="4">Delaware</option>
																	<option value="5">Tennessee</option>
																	<option value="6">Texas</option>
																	<option value="7">Washington</option> -->
																		<option id="option" class="option"></option>
																	</select>
																</div>
															</div>
															<!-- /.form-group -->
														</div>
														<!-- /.col -->
													</div>
													<!-- /.row -->
												</div>
											</div>
											<!-- /.card -->
										</div>
										<div class="modal-footer justify-content-between">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Close</button>
											<button type="button" id="submitButton"
												class="btn btn-primary">Save changes</button>
										</div>
									</div>
									<!-- /.modal-content -->
								</div>
								<!-- /.modal-dialog -->
							</div>
							<!-- /.modal -->



							<form action="mailWrite.do" method="post"
								enctype="multipart/form-data" id="mailForm">
								<div class="card-body">
									<c:if test="${id != '' && name != ''&& dept != ''&& position != ''}">
										<div class="form-group">
											받는사람 <input class="form-control" name="sendMember"
												id="recipient-input" value="${dept} ${position} ${name}" readOnly>
										</div>
									</c:if>
									<c:if test="${id == '' && name == ''&& dept == ''&& position == ''}">
										<div class="form-group">
											받는사람 <input class="form-control" name="sendMember"
												id="recipient-input" readOnly>
										</div>
									</c:if>
									<div class="form-group">
										참조 <input class="form-control" name="referenceMember"
											id="cc-input" readOnly>
									</div>
									<div class="form-group">
										제목 <input class="form-control" name="mailSubject"
											id="mailSubject">
									</div>
									<div class="form-group" id="mailMessage"></div>
									<div class="form-group">
										<textarea id="compose-textarea" class="form-control"
											style="height: 300px" name="mailContent">
									</textarea>
									</div>
									<div class="form-group">
										<div class="btn btn-default btn-file">
											<i class="fas fa-paperclip"></i> Attachment <input
												type="file" name="attachment" multiple="multiple"
												id="attachment-input">
										</div>
										<div id="attachment-info"></div>
									</div>
								</div>
								<!-- /.card-body -->
								<div class="card-footer">
									<div class="float-right">
										<button type="submit" class="btn btn-primary">
											<i class="far fa-envelope"></i> 보내기
										</button>
										<button type="reset" class="btn btn-default">
											<i class="fas fa-times"></i> 취소
										</button>
									</div>
								</div>
							</form>
							<!-- /.card-footer -->
						</div>
						<!-- /.card -->
					</div>
					<!-- /.col -->
				</div>






				<!--  내게 쓰기 -->
				<div class="row2 hidden">

					<!-- /.col -->
					<div class="col-md-9">
						<div class="card card-primary card-outline">
							<div class="card-header">
								<button id="send">저장</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button id="send">임시저장</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button id="mailBox" class="mailBox">메일쓰기</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</div>
							<!-- /.card-header -->
							<form action="myMailWrite.do" method="post"
								enctype="multipart/form-data" id="myMailForm">
								<div class="card-body">
									<div class="form-group">
										제목 <input class="form-control" name="mailSubject"
											id="mymailSubject">
									</div>
									<div class="form-group" id="mymailMessage"></div>
									<div class="form-group">
										<textarea id="mycompose-textarea" class="form-control"
											style="height: 300px" name="mailContent"></textarea>
									</div>
									<div class="form-group">
										<div class="btn btn-default btn-file">
											<i class="fas fa-paperclip"></i> Attachment <input
												type="file" name="attachment" multiple="multiple"
												id="myattachment-input">
										</div>
										<div id="myattachment-info"></div>
									</div>
								</div>
							</form>
							<!-- /.card-body -->
							<div class="card-footer">
								<div class="float-right">
									<button type="submit" class="btn btn-primary">
										<i class="far fa-envelope"></i> 보내기
									</button>
									<button type="reset" class="btn btn-default">
										<i class="fas fa-times"></i> 취소
									</button>
								</div>
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
			<jsp:include page="footer.jsp" />
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

	<!-- Page specific script -->
	<!-- Summernote -->
	<script src="plugins/summernote/summernote-bs4.min.js"></script>
	<!-- Bootstrap4 Duallistbox -->
	<script
		src="plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
	<script>
		$(function() {
			//Enable check and uncheck all functionality
			$('.checkbox-toggle').click(
					function() {
						var clicks = $(this).data('clicks')
						if (clicks) {
							//Uncheck all checkboxes
							$('.mailbox-messages input[type=\'checkbox\']')
									.prop('checked', false)
							$('.checkbox-toggle .far.fa-check-square')
									.removeClass('fa-check-square').addClass(
											'fa-square')
						} else {
							//Check all checkboxes
							$('.mailbox-messages input[type=\'checkbox\']')
									.prop('checked', true)
							$('.checkbox-toggle .far.fa-square').removeClass(
									'fa-square').addClass('fa-check-square')
						}
						$(this).data('clicks', !clicks)
					})

			//Handle starring for font awesome
			$('.mailbox-star').click(function(e) {
				e.preventDefault()
				//detect type
				var $this = $(this).find('a > i')
				var fa = $this.hasClass('fa')

				//Switch states
				if (fa) {
					$this.toggleClass('fa-star')
					$this.toggleClass('fa-star-o')
				}
			})
		})

		//Bootstrap Duallistbox
		$('.duallistbox').bootstrapDualListbox()

		$(document).ready(function() {
			function initializeEditor() {
				$('#compose-textarea').summernote();
				$('#mycompose-textarea').summernote();
			}

			initializeEditor();
		});

		// 메일쓰기 파일명+확장자 표시
		document.getElementById('attachment-input').addEventListener(
				'change',
				function(e) {
					// 선택된 파일 가져오기
					var files = e.target.files;

					// 파일 정보 표시
					var attachmentInfo = document
							.getElementById('attachment-info');
					attachmentInfo.innerHTML = ''; // 기존 내용 지우기

					for (var i = 0; i < files.length; i++) {
						var file = files[i];

						// 파일 정보 생성
						var fileInfo = document.createElement('p');
						fileInfo.textContent = file.name + ' ('
								+ formatFileSize(file.size) + ')';

						// 파일 정보 추가
						attachmentInfo.appendChild(fileInfo);
					}
				});

		// 파일 크기 포맷팅 함수 
		function formatFileSize(bytes) {
			if (bytes === 0)
				return '0 Bytes';
			var k = 1024, sizes = [ 'Bytes', 'KB', 'MB', 'GB', 'TB' ], i = Math
					.floor(Math.log(bytes) / Math.log(k));
			return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' '
					+ sizes[i];
		}

		// 내게쓰기 파일명+확장자 표시
		document.getElementById('myattachment-input').addEventListener(
				'change',
				function(e) {
					// 선택된 파일 가져오기
					var files = e.target.files;

					// 파일 정보 표시
					var attachmentInfo = document
							.getElementById('myattachment-info');
					attachmentInfo.innerHTML = ''; // 기존 내용 지우기

					for (var i = 0; i < files.length; i++) {
						var file = files[i];

						// 파일 정보 생성
						var fileInfo = document.createElement('p');
						fileInfo.textContent = file.name + ' ('
								+ formatFileSize(file.size) + ')';

						// 파일 정보 추가
						attachmentInfo.appendChild(fileInfo);
					}
				});

		// 파일 크기 포맷팅 함수
		function formatFileSize(bytes) {
			if (bytes === 0)
				return '0 Bytes';
			var k = 1024, sizes = [ 'Bytes', 'KB', 'MB', 'GB', 'TB' ], i = Math
					.floor(Math.log(bytes) / Math.log(k));
			return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' '
					+ sizes[i];
		}

		$(document).ready(function() {
			$('#submitButton').click(function() {
				console.log('버튼이 클릭되었습니다.'); // 버튼 클릭 시 메시지 출력
				var selectedOptions = $('#approvers').val();
				var referrerselectedOptions = $('#referrer').val();
				console.log(selectedOptions, referrerselectedOptions); // 선택된 옵션 값 출력
			});
		});

		// 받는사람, 참조자 선택 함수
		$(document).ready(
				function() {
					$('#submitButton').click(
							function() {
								var selectedApprovers = $(
										'#approvers option:selected').map(
										function() {
											return $(this).text();
										}).get().join(', ');
								var selectedReferrers = $(
										'#referrer option:selected').map(
										function() {
											return $(this).text();
										}).get().join(', ');

								$('#recipient-input').val(selectedApprovers);
								$('#cc-input').val(selectedReferrers);
							});
				});

		// 받는사람, 참조자 option 값 가져오기
		$(document)
				.ready(
						function() {
							// DB에서 값을 가져와서 select 요소에 동적으로 option을 추가
							$.ajax({
								url : 'mail/getOption.ajax', // DB에서 값 가져오는 API 엔드포인트
								type : 'get',
								data : {},
								dataType : 'json',
								success : function(data) {
									console.log(data);
									optionPrint(data.option);
								},
								error : function(e) {
									console.log(e);
								}
							})

							function optionPrint(option) {
								var content;
								if (option.length > 0) {

									option
											.forEach(function(item, member_id) {
												content += '<option value="'+item.member_id+'">'
														+ item.dept_code
														+ '&nbsp;&nbsp;'
														+ item.position_code
														+ '&nbsp;&nbsp;'
														+ item.name
														+ '</option>';
											})

								} else {
									content += '<option>선택값이 없습니다.</option>';
								}
								$('.duallistbox').empty();
								$('.duallistbox').append(content);
							}
						})

		// 내게쓰기 메일쓰기 체인지
		$(document).ready(function() {
			$('#selfBox').click(function() {
				$('.row2').removeClass('hidden');
				$('.row1').addClass('hidden');
			});
			$('#mailBox').click(function() {
				$('.row1').removeClass('hidden');
				$('.row2').addClass('hidden');
			});
		});

		// 미리보기 버튼 클릭 시 이벤트 핸들러
		document
				.getElementById('preview-button')
				.addEventListener(
						'click',
						function() {
							// 받는사람, 참조, 제목, 내용 입력된 값 가져오기
							var recipient = document
									.getElementById('recipient-input').value;
							var cc = document.getElementById('cc-input').value;
							var subject = document
									.getElementById('mailSubject').value;
							var content = $('#compose-textarea').summernote(
									'code'); // Summernote의 내용을 가져옴
							var attachment = document
									.getElementById('attachment-info').textContent;

							// 값 업데이트 (태그 이스케이프 처리)
							document.getElementById('preview-recipient').innerHTML = escapeHTML(recipient);
							document.getElementById('preview-cc').innerHTML = escapeHTML(cc);
							document.getElementById('preview-mailSubject').innerHTML = escapeHTML(subject);
							document.getElementById('preview-mailContent').innerHTML = content; // Summernote의 내용을 그대로 삽입
							document.getElementById('preview-attachment').innerHTML = escapeHTML(attachment);
						});

		// HTML 태그 이스케이프 함수
		function escapeHTML(text) {
			var element = document.createElement('div');
			element.textContent = text;
			return element.innerHTML;
		}

		$(document).ready(
				function() {
					// selfBox 버튼 클릭 이벤트 처리
					$('#selfBox')
							.click(
									function() {
										// 원래 섹션의 값 가져오기
										var mailSubject = $('#mailSubject')
												.val();
										var composeEditorContent = $(
												'#compose-textarea')
												.summernote('code');
										var attachmentInfo = $(
												'#attachment-info').html();

										// 새로운 섹션에 값 설정하기
										$('#mymailSubject').val(mailSubject);
										$('#mycompose-textarea').summernote(
												'code', composeEditorContent);
										$('#myattachment-info').html(
												attachmentInfo);
									});

					// mailBox 버튼 클릭 이벤트 처리
					$('#mailBox').click(
							function() {
								// 새로운 섹션의 값 가져오기
								var mymailSubject = $('#mymailSubject').val();
								var mycomposeEditorContent = $(
										'#mycompose-textarea').summernote(
										'code');
								var myattachmentInfo = $('#myattachment-info')
										.html();

								// 원래 섹션에 값 설정하기
								$('#mailSubject').val(mymailSubject);
								$('#compose-textarea').summernote('code',
										mycomposeEditorContent);
								$('#attachment-info').html(myattachmentInfo);
							});
				});

		$(document).ready(
				function() {
					$('#mailForm').submit(
							function(event) {
								var recipientInput = $('#recipient-input')
										.val();
								var mailSubject = $('#mailSubject').val();
								var composeTextarea = $('#compose-textarea')
										.val();

								if (recipientInput == "" || mailSubject == ""
										|| composeTextarea == "") {
									var Message = "받는사람, 제목, 내용을 모두 입력해주세요.";
									$('#mailMessage').html(
											'<p class="error">' + Message
													+ '</p>');
									event.preventDefault();
								} else {
									$('#mailMessage').empty(); // 문구 삭제
								}
							});

					$('#myMailForm').submit(
							function(event) {
								var mymailSubject = $('#mymailSubject').val();
								var mycomposeTextarea = $('#mycomposeTextarea')
										.val();

								if (mymailSubject == ""
										|| mycomposeTextarea == "") {
									var myMessage = "제목과 내용을 모두 입력해주세요.";
									$('#mymailMessage').html(
											'<p class="error">' + myMessage
													+ '</p>');
									event.preventDefault();
								} else {
									$('#mymailMessage').empty(); // 문구 삭제
								}
							});
				});
	</script>
</body>
</html>
