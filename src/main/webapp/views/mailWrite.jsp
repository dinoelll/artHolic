<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html xmlns:th="http://www.thymeleaf.org">
<head>
  <meta charset="utf-8">
  <!--  <meta name="viewport" content="width=device-width, initial-scale=1"> -->
  <title>ArtHolic</title>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- summernote -->
  <link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
  <!-- Bootstrap4 Duallistbox -->
  <link rel="stylesheet" href="plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
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
   
   .mymailSend,.mailSend,#preview-button,.mailBox,.selfBox,#send,.send{
        font-weight: bold;
        background-color: white;
        border: 1px solid white;
        color: black;
   }
   
   .mailSend:hovor,.mymailSend:hover,#preview-button:hover.mailBox:hover,.selfBox:hover,#send:hover,.send:hover {
        border-color: rgba(233, 221, 198, 0.4);
    }
    .hidden{
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
   #madalpreview{
      max-width: 800px;
   }
   
   .error{
      color: gray;
       font-size: smaller;
       text-align: -webkit-center;
   }
   .mailSend,.mymailSend,#preview-button{
   		font-size: 15px;
   }
   #send:hover,.mailSend:hover,.mymailSend:hover,#preview-button:hover{
   		border-color: rgba(233, 221, 198, 0.4);
        color: cornflowerblue;
   }
   .hidden {
	  display: none;
	}
	.notice {
	  display: block;
	  background-color: gray;
	  color: #fff;
	  padding: 10px;
	  text-align: center;
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
                     <h1 id="title">메일 쓰기</h1>
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
         
         
         
         
         <div class="modal fade" id="modal-default">
               <div class="modal-dialog" id="madalpreview">
                  <div class="modal-content">
                     <div class="modal-header">
                        <h4 class="modal-title">미리보기</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                        </button>
                     </div>
                     <div class="modal-body" id="preview">
                        <table>
                           <tr>
                              <th>보낸사람: </th> 
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
                              <td>&nbsp;&nbsp;&nbsp;<span id="preview-attachment" style="white-space: pre-wrap;"></span></td>
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
                        <button type="submit" class="btn btn-primary" onclick="send()">보내기</button>
                     </div>
                  </div>
                  <!-- /.modal-content -->
               </div>
               <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->
            
            
            
            
            <!--  받는이선택 모달-->
                  <div class="modal fade" id="modal-lg2">
                     <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                           <div class="modal-header">
                              <h4 class="modal-title">받는이 선택</h4>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
                                             
                                                <select id="approvers" class="duallistbox" multiple="multiple" name="sendMember">
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
                                                <select id="referrer" class="duallistbox" multiple="multiple" name="referenceMember">
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
                              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                              <button type="button" id="submitButton" class="btn btn-primary" onclick="sendList()">Save changes</button>            
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
                        <div class="mailCard1">
                           <button id="send" class="mailSend" onclick="send()">보내기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <button type="button" id="preview-button"class="btn btn-default div-hidden"data-toggle="modal" data-target="#modal-default">미리보기</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <!-- <button id="temp_save" class="mailSend" onclick="temp()">임시저장</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
                           <button id="formGnb_button" data-toggle="modal" data-target="#modal-lg2" class="mailSend">받는이선택</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <button id="selfBox" class="mailSend" onclick="selfBox()">내게쓰기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                        
                        <div class="mailCard2 hidden">
                           <button id="save" class="mymailSend" onclick="save()">저장</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <button id="temp_storage" class="mymailSend" onclick="temp()">임시저장</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <button id="mailBox" class="mymailSend" onclick="mailBox()">메일쓰기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         </div>
                     </div>
                       
                  <!-- /.card-header -->
                     
                  <form action="mailWrite.do" method="post" enctype="multipart/form-data" id="mailForm">
                     <div class="card-body">
                        <div class="form-group" id="form-sendMember">
                           받는사람 <input class="form-control" name="sendMember" id="recipient-input" readOnly>
                        </div>
                        <div class="form-group" id="form-referenceMember">
                           참조 <input class="form-control" name="referenceMember" id="cc-input" readOnly>
                        </div>
                        <div class="form-group">
                           제목 <input class="form-control" name="mailSubject" id="mailSubject">
                        </div>
                        <div class="form-group" id="mailMessage">
                           
                        </div>
                        <div class="form-group">
                           <textarea id="compose-textarea" class="form-control" style="height: 300px" name="mailContent">
                           </textarea>
                        </div>
                        <div class="form-group">
                           <div class="btn btn-default btn-file">
                              <i class="fas fa-paperclip"></i> Attachment
                              <input type="file" name="attachment" multiple="multiple" id="attachment-input">
                           </div>
                           <div id="attachment-info">
			                </div>
                        </div>
                     </div>
                     <!-- /.card-body -->
                     <div class="card-footer">
                        <div class="float-right">
                           <button class="btn btn-primary" id="sendButton" type="button" onclick="send()"><i class="far fa-envelope"></i> 보내기</button>
                           <button class="btn btn-primary hidden" id="mysendButton" type="button" onclick="save()"><i class="far fa-envelope"></i> 보내기</button>
                           <button type="reset" class="btn btn-default"><i class="fas fa-times"></i> 취소</button>
                        </div>
                     </div>
                     <div class="tempList" id="tempList">
                        
                     </div>
                  </form>
                  <!-- /.card-footer -->
                  </div>
               <!-- /.card -->
               </div>
            <!-- /.col -->
            </div>
            
		<div id="tempMessage" class="hidden">임시 저장했습니다. 임시 보관함에서 확인해 주세요.</div>
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

<!-- Page specific script -->
<!-- Summernote -->
<script src="plugins/summernote/summernote-bs4.min.js"></script>
<!-- Bootstrap4 Duallistbox -->
<script src="plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
<script>

   // 메일쓰기 숨기기

	  function selfBox() {
		    // 받는사람과 참조자 입력값 가져오기
		    var recipient = document.getElementById("recipient-input").value;
		    var cc = document.getElementById("cc-input").value;
		    
		    // 받는사람이나 참조자가 추가되어 있는지 확인
		    if (recipient.trim() !== "" || cc.trim() !== "") {
		        // 확인 대화상자 표시
		        var confirmResult = confirm("내게 쓰기 시에는 다른 사람에게 메일을 보낼 수 없습니다. 내게 쓰기 모드로 전환하시겠습니까?");
		        
		        // 사용자가 "확인" 버튼을 눌렀을 때
		        if (confirmResult) {
		            // 받는사람과 참조자 지우기
		            document.getElementById("recipient-input").value = "";
		            document.getElementById("cc-input").value = "";
		            
		            // selfBox 함수의 나머지 내용 실행
		            console.log(title);
		            document.querySelector('.mailCard2').classList.remove('hidden');
		            document.querySelector('.mailCard1').classList.add('hidden');
		            document.getElementById('form-sendMember').style.display = 'none';
		            document.getElementById('form-referenceMember').style.display = 'none';
		            document.getElementById('sendButton').classList.add('hidden');
		            document.getElementById('mysendButton').classList.remove('hidden');
		            var approvers = document.getElementsByClassName('approvers');
		            while (approvers.length > 0) {
		                approvers[0].remove();
		            }
		            var referrer = document.getElementsByClassName('referrer');
		            while (referrer.length > 0) {
		                referrer[0].remove();
		            }
		        }
		    } else {
		        // 받는사람과 참조자가 없을 때는 그냥 selfBox 함수 실행
		        console.log(title);
		        document.querySelector('.mailCard2').classList.remove('hidden');
		        document.querySelector('.mailCard1').classList.add('hidden');
		        document.getElementById('form-sendMember').style.display = 'none';
		        document.getElementById('form-referenceMember').style.display = 'none';
		        document.getElementById('sendButton').classList.add('hidden');
		        document.getElementById('mysendButton').classList.remove('hidden');
		        var approvers = document.getElementsByClassName('approvers');
		        while (approvers.length > 0) {
		            approvers[0].remove();
		        }
		        var referrer = document.getElementsByClassName('referrer');
		        while (referrer.length > 0) {
		            referrer[0].remove();
		        }
		    }
		}
   
   // 내게쓰기 숨기기
   function mailBox(){
      document.querySelector('.mailCard1').classList.remove('hidden');
      document.querySelector('.mailCard2').classList.add('hidden');
      document.getElementById('form-sendMember').style.display = 'block';
       document.getElementById('form-referenceMember').style.display = 'block';
       document.getElementById('mysendButton').classList.add('hidden');
       document.getElementById('sendButton').classList.remove('hidden');
   }
   
   // URL에서 매개변수 추출
   const urlParams = new URLSearchParams(window.location.search);
   const selfBoxParam = urlParams.get('selfBox');
   //const tempParams = urlParams.get('type');
   console.log(selfBoxParam);
   //console.log(tempParams);
   
   
   if (selfBoxParam) {
     selfBox();
     
   } else {
     mailBox();
     
   }


   // 받는사람, 제목, 내용 미 입력 시 메세지 
   $(document).ready(function() {
       $('#mailForm').submit(function(event) {
    	   var recipientInput = $('#recipient-input').val();
           var mailSubject = $('#mailSubject').val();
           var composeTextarea = $('#compose-textarea').val();
           var mailCard2 = document.querySelector('.mailCard2');
           var isHidden2 = mailCard2.classList.contains('hidden');
           if (isHidden2) {
        	   if (recipientInput == "" || mailSubject == "" || composeTextarea == "") {
                   var Message = "받는사람, 제목, 내용을 모두 입력해주세요.";
                   $('#mailMessage').html('<p class="error">' + Message + '</p>');
                   event.preventDefault();
               } else {
                   $('#mailMessage').empty(); // 문구 삭제
               }
           } else{
        	   if( mailSubject == "" || composeTextarea.trim() == ""){
    			   var Message = "제목, 내용을 모두 입력해주세요.";
                   $('#mailMessage').html('<p class="error">' + Message + '</p>');
                   event.preventDefault();
               } else {
                   $('#mailMessage').empty(); // 문구 삭제
               }
           }
    	   })
       });


   $(function () {
      $('.checkbox-toggle').click(function () {
         var clicks = $(this).data('clicks')
         if (clicks) {
            $('.mailbox-messages input[type=\'checkbox\']').prop('checked', false)
            $('.checkbox-toggle .far.fa-check-square').removeClass('fa-check-square').addClass('fa-square')
         } else {
            $('.mailbox-messages input[type=\'checkbox\']').prop('checked', true)
            $('.checkbox-toggle .far.fa-square').removeClass('fa-square').addClass('fa-check-square')
            }
      $(this).data('clicks', !clicks)
      })
   
      $('.mailbox-star').click(function (e) {
         e.preventDefault()
         var $this = $(this).find('a > i')
         var fa    = $this.hasClass('fa')
   
         if (fa) {
            $this.toggleClass('fa-star')
            $this.toggleClass('fa-star-o')
         }
      })
   })


   
   $(document).ready(function () {
     function initializeEditor() {
       $('#compose-textarea').summernote();
     }
   
     initializeEditor();
   });
   
   // 
   $('.note-editor .note-frame .card').summernote({
      maximumFileSize: 1048576, // 1MB (1MB = 1024 * 1024 bytes)
   });
   
   
   
   // 메일쓰기 파일명+확장자 표시
    document.getElementById('attachment-input').addEventListener('change', function(e) {
      // 선택된 파일 가져오기
      var files = e.target.files;
      
      // 파일 정보 표시
      var attachmentInfo = document.getElementById('attachment-info');
      attachmentInfo.innerHTML = ''; // 기존 내용 지우기
      
      for (var i = 0; i < files.length; i++) {
         var file = files[i];
         
         // 파일 정보 생성
         var fileInfo = document.createElement('p');
         fileInfo.textContent = file.name + ' (' + formatFileSize(file.size) + ')';
         
         // 파일 정보 추가
         attachmentInfo.appendChild(fileInfo);
      }
   });

   // 파일 크기 포맷팅 함수 
   function formatFileSize(bytes) {
      if (bytes === 0) return '0 Bytes';
      var k = 1024,
      sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'],
      i = Math.floor(Math.log(bytes) / Math.log(k));
      return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
   } 
   
   
   $(document).ready(function() {
      $('#submitButton').click(function() {
         console.log('버튼이 클릭되었습니다.'); // 버튼 클릭 시 메시지 출력
         var selectedOptions = $('#approvers').val();
         var referrerselectedOptions = $('#referrer').val();
         console.log(selectedOptions,referrerselectedOptions); // 선택된 옵션 값 출력
      });      
   });

   // 받는사람, 참조자 선택 함수
   $(document).ready(function() {
      $('#submitButton').click(function() {
           var selectedApprovers = $('#approvers option:selected').map(function() {
               return $(this).text();
           }).get().join(', ');
           var selectedReferrers = $('#referrer option:selected').map(function() {
               return $(this).text();
           }).get().join(', ');

           $('#recipient-input').val(selectedApprovers);
           $('#cc-input').val(selectedReferrers);
           $('#modal-lg2').modal('hide');
       });
   });
   
   
   // 받는사람, 참조자 option 값 가져오기
   $(document).ready(function() {
        $.ajax({
          url: 'mail/getOption.ajax', 
          type: 'get',
          data: {},
          dataType:'json',
          success: function(data) {
             console.log(data);
             optionPrint(data.option);
          },error: function(e){
             console.log(e);
          }
        })
        
        function optionPrint(option){
           var content;
           if(option.length>0){
              
              option.forEach(function(item,member_id){
                 content += '<option value="'+item.member_id+'">'+item.dept_name+'팀&nbsp;&nbsp;'+item.position_name +'&nbsp;&nbsp;'
                    +item.name+'</option>';
              })
           }else{
              content += '<option>선택값이 없습니다.</option>';
           }
           $('.duallistbox').empty();
           $('.duallistbox').append(content);
           //Bootstrap Duallistbox
           $('.duallistbox').bootstrapDualListbox();
        }
   })
   
   // 받는사람, 참조자 value 값 보내기
   function sendList() {
      var approvers = $('#approvers option:selected').map(function() {
          return this.value;
        }).get();
      
       $('#mailForm input[name="approvers"]').remove();
       $('#mailForm input[name="referrer"]').remove();
      var content ='';
      if(approvers.length>0){
         approvers.forEach(function(item){
            content += '<input type="hidden" class="approvers" name="approvers" value="'+item+'">';
         })
         
      }
      
      var referrer = $('#referrer option:selected').map(function() {
          return this.value;
        }).get();
      var message ='';
      if(referrer.length>0){
         referrer.forEach(function(item){
            message += '<input type="hidden" class="referrer" name="referrer" value="'+item+'">';
         })
         
      }
      $('#mailForm').append(content);
      $('#mailForm').append(message);
   };
   
   
   // 미리보기 버튼 클릭 시 이벤트 핸들러
   document.getElementById('preview-button').addEventListener('click', function() {
       // 받는사람, 참조, 제목, 내용 입력된 값 가져오기
       var recipient = document.getElementById('recipient-input').value;
       var cc = document.getElementById('cc-input').value;
       var subject = document.getElementById('mailSubject').value;
       var content = $('#compose-textarea').summernote('code'); // Summernote의 내용을 가져옴
       var attachment = document.getElementById('attachment-info').textContent;

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
      
   // 보내기
   function send(){
      $('#mailForm').append('<input type="hidden" name="type" value="send">');
      $('#mailForm').submit();
   }
   
   // 저장
   function save(){
      $('#mailForm').append('<input type="hidden" name="type" value="save">');
      $('#mailForm').submit();
   }
   
   // 임시저장
   function temp(){
      var mailId=$('#mail_id').val();
      console.log(mailId);
       
      var formData = new FormData();
      
      formData.append('mail_id',mailId);
      formData.append('mailSubject',$('#mailSubject').val());
      formData.append('mailContent',$('#compose-textarea').val());
      formData.append('type', 'temp');
      
      var attachmentFiles = $('#attachment-input')[0].files; // 파일 input 요소의 파일들 가져오기
      var attachment = attachmentFiles.length > 0 ? attachmentFiles : []; // 파일이 없을 때는 빈 리스트로 초기화
      for (var i = 0; i < attachmentFiles.length; i++) {
        formData.append('attachment', attachmentFiles[i]); // 파일을 FormData에 추가
      }
      
		// 빈 리스트인 경우 빈 값을 추가
      if (attachment.length === 0) {
        formData.append('attachment', ''); // 빈 값을 추가
      }
      $.ajax({
        type:'post'
		,url:'mail/temp.ajax'
		,data: formData
		,contentType: false // 필수: false로 설정하여 content-type 헤더 자동 설정 방지
		,processData: false // 필수: false로 설정하여 데이터 처리 방지
		,dataType:'json'
		,success:function(data){
          console.log(data);
          tempList(data.mail_id);
          tempMessage();
         
       },error:function(e){
          console.log(e);
       }
      });
       
   }
   
   // 임시저장 두번째부터
   function tempList(mail_id) {
      var content;
      content = '<input type="hidden" id="mail_id" name="mail_id" value="' + mail_id + '">';
      
      $('#tempList').append(content);
   }
   
   function tempMessage() {
		  var message = document.getElementById('tempMessage');
		  message.classList.add('notice'); // 메시지를 보여주기 위해 'show' 클래스 추가

		  // 3초 후에 메시지를 숨기기 위해 setTimeout 사용
		  setTimeout(function() {
		    message.classList.remove('notice'); // 'show' 클래스 제거하여 메시지를 숨김
		  }, 1000); // 3초 (3000ms) 후에 메시지를 숨김
		} 
   
   
</script>
</body>
</html>