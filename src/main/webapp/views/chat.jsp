<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>chat</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!--  Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome-->
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- overlayScrollbars-->
<link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Theme style-->
<link rel="stylesheet" href="dist/css/adminlte.min.css">
<!-- 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.3/css/bootstrap.min.css" integrity="sha512-Sk6wdn37z2xz5YLYf3GMldpi6fDjiB9UifzInwW6l9beav1yX2vaJQZfD8d9OVQwRxwvVvaypPioUcZGkUg7cQ==" crossorigin="anonymous" />
<!-- MDB 
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css" rel="stylesheet"/> -->

<style>
	#chat_list {
		height : 700px;
	}
	
	#chat_room {
		border : 1px solid blue;
		width : 300px;
		height : 100%;
		float : left;
		overflow : auto;
	}
	
	#chat_history {
		border : 2px solid red;
		width : 700px;
		height : 100%;
		float : left;
		overflow : auto;
	}
	
	
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
		margin-left: 0px;
	}
	table {
		width: 300px;
	}
	table, th {
		border-collapse: collapse;
		border : 1px solid black;
	}
	
	
	
	.card {
    background: #fff;
    transition: .5s;
    border: 0;
    margin-bottom: 30px;
    border-radius: .55rem;
    position: relative;
    width: 100%;
    box-shadow: 0 1px 2px 0 rgb(0 0 0 / 10%);
}
.chat-app .people-list {
    width: 280px;
    position: absolute;
    left: 0;
    top: 0;
    padding: 20px;
    z-index: 7
}

.chat-app .chat {
    margin-left: 280px;
    border-left: 1px solid #eaeaea
}

.people-list {
    -moz-transition: .5s;
    -o-transition: .5s;
    -webkit-transition: .5s;
    transition: .5s
}

.people-list .chat-list li {
    padding: 10px 15px;
    list-style: none;
    border-radius: 3px
}

.people-list .chat-list li:hover {
    background: #efefef;
    cursor: pointer
}

.people-list .chat-list li.active {
    background: #efefef
}

.people-list .chat-list li .name {
    font-size: 15px
}

.people-list .chat-list img {
    width: 45px;
    border-radius: 50%
}

.people-list img {
    float: left;
    border-radius: 50%
}

.people-list .about {
    float: left;
    padding-left: 8px
}

.people-list .status {
    color: #999;
    font-size: 13px
}

.chat .chat-header {
    padding: 15px 20px;
    border-bottom: 2px solid #f4f7f6
}

.chat .chat-header img {
    float: left;
    border-radius: 40px;
    width: 40px
}

.chat .chat-header .chat-about {
    float: left;
    padding-left: 10px
}

.chat .chat-history {
    padding: 20px;
    border-bottom: 2px solid #fff;
    height:400px;
    overflow: auto;
}

.chat .chat-history ul {
    padding: 0
}

.chat .chat-history ul li {
    list-style: none;
    margin-bottom: 30px
}

.chat .chat-history ul li:last-child {
    margin-bottom: 0px
}

.chat .chat-history .message-data {
    margin-bottom: 15px
}

.chat .chat-history .message-data img {
    border-radius: 40px;
    width: 40px
}

.chat .chat-history .message-data-time {
    color: #434651;
    padding-left: 6px
}

.chat .chat-history .message {
    color: #444;
    padding: 18px 20px;
    line-height: 26px;
    font-size: 16px;
    border-radius: 7px;
    display: inline-block;
    position: relative
}

.chat .chat-history .message:after {
    bottom: 100%;
    left: 7%;
    border: solid transparent;
    content: " ";
    height: 0;
    width: 0;
    position: absolute;
    pointer-events: none;
    border-bottom-color: #fff;
    border-width: 10px;
    margin-left: -10px
}

.chat .chat-history .my-message {
    background: #efefef
}

.chat .chat-history .my-message:after {
    bottom: 100%;
    left: 30px;
    border: solid transparent;
    content: " ";
    height: 0;
    width: 0;
    position: absolute;
    pointer-events: none;
    border-bottom-color: #efefef;
    border-width: 10px;
    margin-left: -10px
}

.chat .chat-history .other-message {
    background: #e8f1f3;
    text-align: right
}

.chat .chat-history .other-message:after {
    border-bottom-color: #e8f1f3;
    left: 93%
}

.chat .chat-message {
    padding: 20px
}

.online,
.offline,
.me {
    margin-right: 2px;
    font-size: 8px;
    vertical-align: middle
}

.online {
    color: #86c541
}

.offline {
    color: #e47297
}

.me {
    color: #1d8ecd
}

.float-right {
    float: right
}

.clearfix:after {
    visibility: hidden;
    display: block;
    font-size: 0;
    content: " ";
    clear: both;
    height: 0
}

@media only screen and (max-width: 767px) {
    .chat-app .people-list {
        height: 465px;
        width: 100%;
        overflow-x: auto;
        background: #fff;
        left: -400px;
        display: none
    }
    .chat-app .people-list.open {
        left: 0
    }
    .chat-app .chat {
        margin: 0
    }
    .chat-app .chat .chat-header {
        border-radius: 0.55rem 0.55rem 0 0
    }
    .chat-app .chat-history {
        height: 300px;
        overflow-x: auto;
        overflow: auto;
    }
}

@media only screen and (min-width: 768px) and (max-width: 992px) {
    .chat-app .chat-list {
        height: 650px;
        overflow-x: auto
    }
    .chat-app .chat-history {
        height: 600px;
        overflow-x: auto;
        overflow: auto;
    }
}

@media only screen and (min-device-width: 768px) and (max-device-width: 1024px) and (orientation: landscape) and (-webkit-min-device-pixel-ratio: 1) {
    .chat-app .chat-list {
        height: 480px;
        overflow-x: auto
    }
    .chat-app .chat-history {
        height: calc(100vh - 350px);
        overflow-x: auto;
        overflow: auto;
    }
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
            				<h1 class="m-0">채팅</h1>
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
    				<div class="container">
						<div class="row clearfix">
						    <div class="col-lg-12">
						        <div class="card chat-app">
						            <div id="plist" class="people-list">
						                <div class="input-group">
						               		 <!-- 
						                    <div class="input-group-prepend">
						                        <span class="input-group-text"><i class="fa fa-search"></i></span>
						                    </div>
						                    <input type="text" class="form-control" placeholder="Search...">
						                     -->
						                </div>
						                <ul class="list-unstyled chat-list mt-2 mb-0">
						                    
						                </ul>
						            </div>
						            <div class="chat">
						                <div class="chat-header clearfix">
						                    <div class="row">
						                        <div class="col-lg-6">
						                            <a id="myProfilePhoto" href="javascript:void(0);" data-toggle="modal" data-target="#view_info">
						                                
						                            </a>
						                            <div class="chat-about">
						                                <h6 class="m-b-0">${sessionScope.loginId}</h6>
						                                <small></small>
						                            </div>
						                        </div>
						                        <div class="col-lg-6 hidden-sm text-right">
						                       
						                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#chatCreateModal" onclick="create()">채팅방 생성하기</button>
													<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#chatInviteModal" onclick="invite()">초대하기</button>
													<button type="button" class="btn btn-primary" onclick="chat_room_exit()">채팅방 나가기</button>
						                        </div>
						                    </div>
						                </div>
						                <div class="chat-history">
						                    <ul class="m-b-0 chat_history">
						                       
						                    </ul>
						                </div>
						                <div class="chat-message clearfix">
						                    <div class="input-group mb-0">
						                        <div class="input-group-prepend">
						                            <span class="input-group-text"><i class="fa fa-send"></i></span>
						                        </div>
						                        <input id="content" type="text" class="form-control" placeholder="Enter text here...">                                    
						                    </div>
						                </div>
						            </div>
						        </div>
						    </div>
						</div>
					</div>
					<!-- /.container -->
				</div>
      			<!-- /.container-fluid -->
			</section>
    		<!-- /.content -->
    		
    		
    		<div class="modal fade" id="chatCreateModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		    	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		        	<div class="modal-content">
		
						<div class="user-container modal-header">
		                	<label class="modal-title" id="staticBackdropLabel-create" for="nickname">채팅방 생성</label>
		                	<span type="text" id="nickname-create" ></span>
		                	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		            	</div>
		
		
		            	<div class="display-container modal-body" style="height: 1000px">
		                	<div class="chatting-list-create">
								
							</div>
		            	</div>
		
		
		            	<div class="input-container modal-footer">
							<span>
							    <input type="text" placeholder="채팅방 이름을 적어주세요" id="chat-room-name">
							    <button type="button" id="send-button-create" class="send-button">추가하기</button>
							</span>
		            	</div>
		
		        	</div>
				</div>
			</div>
			
			<div class="modal fade" id="chatInviteModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		    	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		        	<div class="modal-content">
		
						<div class="user-container modal-header">
		                	<label class="modal-title" id="staticBackdropLabel-invite" for="nickname">초대하기</label>
		                	<span type="text" id="nickname-invite" ></span>
		                	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		            	</div>
		
		
		            	<div class="display-container modal-body" style="height: 1000px">
		                	<div class="chatting-list-invite" data-bs-spy="scroll" data-bs-target="#navbar-example3" data-bs-smooth-scroll="true">
								
							</div>
		            	</div>
		
		
		            	<div class="input-container modal-footer">
							<span>
							    <button type="button" id="send-button-invite" class="send-button">추가하기</button>
							</span>
		            	</div>
		
		        	</div>
				</div>
			</div>
    		
    		
    		<jsp:include page="footer.jsp"/>
		</div>
		<!-- /.content-wrapper -->
	  
		<!-- Control Sidebar -->
  		<aside class="control-sidebar control-sidebar-dark">
    	<!-- Control sidebar content goes here -->
  		
  		</aside>
  		<!-- /.control-sidebar -->
	</div>


	






	
	
	<!-- jQuery UI -->
	<script src="plugins/jquery-ui/jquery-ui.min.js"></script>

	<!-- Bootstrap 4 -->
	<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- overlayScrollbars -->
	<script
		src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/adminlte.min.js"></script>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	
	<!-- MDB 
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.3/js/bootstrap.bundle.min.js" integrity="sha512-ep8lHTLmy2ka7dS5usq2ntXXuRVYmC9wQwh3MKlgzgXv3XkAk7frn8q6SZAxK3QVmERHxE8VWbLJwZQXr56y9g==" crossorigin="anonymous"></script>-->
</body>

<!--  
<script src="https://cdn.jsdelivr.net/sockjs/1.5.2/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/stomp.js/2.3.3/stomp.min.js"></script>
-->

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<script>
	
	var chat_room_id;
	var name='${sessionScope.loginId}';
	console.log(name);
	var socket;
	var stompClient;
	var userName;
	
	$.ajax({
		url:'getMemberName.ajax',
		type:'post',
		data:{'member_id': name},
		dataType:'json',
		success:function(data){
			console.log(data);
			userName = data.name;
		},
		error:function(e){
			console.log(e);
		}
	});
	
	var scrollPosition = 0;
	chatListAjax();
	
	setInterval(function() {
	    chatListAjax();
	}, 5000);
	
	
	$.ajax({
		url:'myProfilePhoto.ajax',
		type:'post',
		data:{
			member_id : '${sessionScope.loginId}'
		},
		dataType:'json',
		success:function(data){
			console.log(data);
			content = '<img src="/photo/'+data.profile_photo+'" alt="avatar">';
			$('#myProfilePhoto').append(content);
		},
		error:function(e){
			console.log(e);
		}
	});
	

	function chatListAjax() {
	    scrollPosition = $('#chat_room').scrollTop();
	    chatListAjax();       
	    $('#chat_room').scrollTop(scrollPosition);
	}
	
	function chatOpen(id) {
		chat_room_id = id;
		console.log(chat_room_id);
		$('#chat_history').html('');
		$.ajax({
			url:'chatHistory.ajax',
			type:'post',
			data:{
				'chat_room_id' : chat_room_id
			},
			dataType:'json',
			success:function(data){
				chatHistory(data);
			},
			error:function(e){ console.log(e); }
		});
		
		
		socket= new SockJS('/ws-stomp');
		stompClient= Stomp.over(socket);
		// stompClient.debug = null
		// 콘솔에 찍히는 debug disable 시킨다
		stompClient.connect({}, function (frame) {
	        console.log('Connected: ' + frame);
	        // var connid = utils.random_string(8); 8자리 랜덤생성?
	        console.log(socket._transport.url);
	        // 구독 설정
	        stompClient.subscribe('/sub/chat/'+id, function (message) {
	        	//var message = JSON.parse(message.body);
	            //console.log('Received message: ' + message);
	            //console.log('is_notice : ' + message.is_notice);
	            //var body = JSON.parse(message.body);
	            //var content='<div>'+body.send_id+' : '+body.content+'</div>';
	            //$('#chat_history').append(content);
	            $.ajax({
	        		url:'chatLoad.ajax',
	        		type:'post',
	        		data:id,
	        		async : false,
	        		dataType:'json',
	        		contentType: 'application/json; charset=utf-8',
	        		/**/
	        		success:function(data){
	        			console.log(data);
	        			//$('#chat_history').html('');
	        			chatHistory(data);
	        			
	        			
	        		},
	        		error:function(e){
	        			console.log(e);
	        		}
	        	});
	            $('.chat-history').scrollTop($('.chat-history')[0].scrollHeight);
	            // 메시지 처리 로직 추가
	        });
	    });
	}
	
	function chatHistory(data) {
		$('.m-b-0.chat_history').html('');
		console.log(data);
		data.forEach(function(item) {
			var content = '';
			console.log(item.is_notice);
			
			var inputTime = item.send_time;

			// Date 객체를 생성하여 입력된 시간을 파싱
			var dateObj = new Date(inputTime);

			const formattedTime = new Intl.DateTimeFormat('ko-KR', {
				  year: 'numeric',
				  month: '2-digit',
				  day: '2-digit',
				  hour: '2-digit',
				  minute: '2-digit',
				  hour12: false
				}).format(dateObj);

			console.log(formattedTime); // 출력 예: "2023-07-21 15:36"
			
			if(item.is_notice != true){
				if(name == item.send_id) {
					content+='<li class="clearfix">';
					content+='<div class="message-data">';
					content+='<span class="message-data-time">'+formattedTime+'</span>';
					content+='</div>';
					content+='<div class="message my-message">'+item.content+'</div>';
				}else {
					content+='<li class="clearfix">';
					content+='<div class="message-data text-right">';
					content+='<span class="message-data-time">'+formattedTime+'</span>';
					content+='<img src="/photo/'+item.profile_photo+'" alt="avatar">';
					content+='<div>'+item.name+'</div>';
					content+='</div>';
					content+='<div class="message other-message float-right">'+item.content+'</div>';
					//content+='</li>';
				}
				
				content+='</li>';
				//content+='<img class="direct-chat-img" src="/photo/'+item.profile_photo+'" alt="message user image">';
				//content+='<div class="direct-chat-text">'+item.content+'</div></div>';
			} else {
				content += '<div>'+item.content+'</div>';
			}
			$('.m-b-0.chat_history').append(content);
			$('#chat_history').append(content);

		});
			
	}
	$('#content').on('keydown', function(event) {
		if ($(this).is(':focus') && event.key === 'Enter') {
		    event.preventDefault(); // 기본 엔터 행동 방지

		    sendMessage();
		  }
	})
	
	function sendMessage(event) {
	    var messageContent = $('#content').val();

	    if (messageContent && stompClient) {
	    	console.log('if문 시작');
	        var chatMessage = {
	            chat_room_id: chat_room_id,
	            send_id: name,
	            content: $('#content').val(),
	            is_notice : false
	        };

	        stompClient.send("/pub/chat/sendMessage", {}, JSON.stringify(chatMessage));
	        $('#content').val('');
	        console.log('스크롤 맨 아래로');
	        $('.chat-history').scrollTop($('.chat-history')[0].scrollHeight);
	    }
	    //event.preventDefault();
	}
	/*
	function send_name() {
		name= $('#name').val();
		console.log(name);
		
		chatListAjax();
	}
	*/
	function create() {
		console.log('create() 호출');
		$.ajax({
			url:'memberListAll.ajax',
			type:'post',
			data:{},
			dataType:'json',
			success:function(data){
				console.log(data);
				$('.chatting-list-create').html('');
				$('.chatting-list-invite').html('');
				var content =  '<table><tr><th><input type="checkbox" name="member_all"></th><th>이름</th><th>부서</th></tr>';
				data.forEach(function(item) {
					if(item.member_id == name) {
						content+='';
					}else {
						content+='<tr><th><input type="checkbox" name="member_id" value="'+item.member_id+'" class="create_input"></th><th>'+item.name+'</th><th>'+item.code_name+'</th></tr>';
					}
					
				});
				content += '</table>';
				
				$('.chatting-list-create').append(content);
				
				$('input:checkbox[name="member_all"]').change(function() {
					console.log('member_all 체인지 이벤트');
					if($('input:checkbox[name="member_all"]').is(':checked')) {
						console.log('체크');
						$('input:checkbox[name="member_id"]').prop('checked', true);
					}else {
						console.log('체크해제');
						$('input:checkbox[name="member_id"]').prop('checked', false);
					}
				});
				
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
	function invite() {
		console.log('invite() 호출');
		$.ajax({
			url:'memberList.ajax',
			type:'post',
			data:{chat_room_id},
			dataType:'json',
			success:function(data){
				console.log(data);
				$('.chatting-list-create').html('');
				$('.chatting-list-invite').html('');
				var content =  '<table><tr><th><input type="checkbox" name="member_all"></th><th>이름</th><th>부서</th></tr>';
				data.forEach(function(item) {
					if(item.member_id == name) {
						content+='';
					}else {
						content+='<tr><th><input type="checkbox" name="member_id" value="'+item.member_id+'" class="invite_input"></th><th>'+item.name+'</th><th>'+item.code_name+'</th></tr>';
					}
					
				});
				content += '</table>';
				
				$('.chatting-list-invite').append(content);
				
				$('input:checkbox[name="member_all"]').change(function() {
					console.log('member_all 체인지 이벤트');
					if($('input:checkbox[name="member_all"]').is(':checked')) {
						console.log('체크');
						$('input:checkbox[name="member_id"]').prop('checked', true);
					}else {
						console.log('체크해제');
						$('input:checkbox[name="member_id"]').prop('checked', false);
					}
				});
			},
			error:function(e){
				console.log(e);
			}
		});
		
	}
	
	
	
	$('#send-button-create').click(function() {
		var member_id_array = [];
		if($('input:checkbox[name="member_id"]:checked').length == 0) {
			alert('한명이상 체크해주세요');
		}else {
			var chat_room_name = $('#chat-room-name').val();
			if(chat_room_name == '') {
				alert('채팅방 이름을 적어주세요');
			}else {
				$('input:checkbox[name="member_id"]').each(function() {
					if($(this).is(":checked")==true){
				    	console.log($(this).val());
				    	member_id_array.push($(this).val());
				    }
				});
				member_id_array.push(name);
				
				$.ajax({
					url:'createChatroom.ajax',
					type:'post',
					async: false,
					data:{
						'member_id_array': member_id_array,
						'chat_room_name' : chat_room_name
					},
					dataType:'text',
					success:function(data){
						console.log(data);
						console.log('createChatroom.ajax () 성공');
					},
					error:function(e){
						console.log(e);
					}
				});
				
				
				chatListAjax();
				$('#chatCreateModal').modal('hide');
			}
		}
		console.log(member_id_array);

	});
	
	$('#send-button-invite').click(function() {
		var member_id_array = [];
		if($('input:checkbox[name="member_id"]:checked').length == 0) {
			alert('한명이상 체크해주세요');
		}else {
			$('input:checkbox[name="member_id"]').each(function() {
				if($(this).is(":checked")==true){
			    	console.log($(this).val());
			    	member_id_array.push($(this).val());
			    }
			});
			console.log(chat_room_id);
			$.ajax({
				url:'inviteChatroom.ajax',
				type:'post',
				async: false,
				data:{
					'member_id_array': member_id_array,
					'chat_room_id' : chat_room_id
				},
				dataType:'text',
				success:function(data){
					console.log(data);
					console.log('inviteChatroom.ajax () 성공');
				},
				error:function(e){
					console.log(e);
				}
			});
			
			
			chatListAjax();
			$('#chatInviteModal').modal('hide');
		}
		console.log(member_id_array);
		
	});
	
	
	
	function chatListAjax() {
		console.log('chatListAjax() 호출');
		console.log('name : ' + name);
		$.ajax({
			url:'chatList.ajax',
			type:'post',
			data:{'name': name},
			dataType:'json',
			success:function(data){
				console.log('chatList.ajax : ' + data);
				console.log('chatList.ajax 통신 성공');
				console.log(data.length);
				console.log(data);
				$('#chat_room').html('');
				$('.list-unstyled.chat-list').html('');
				if(data.length == 0) {
					var content = '<div>채팅방 없음</div>';
				}else {
					data.forEach(function(item) {
						//var content = '<div onclick="chatOpen(\''+item.chat_room_id+'\')">'+item.name+'</div>';
						var content = '<li class="clearfix" onclick="chatOpen(\''+item.chat_room_id+'\')">';
						//content += '<img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="avatar">';
						content += '<div class="about">';
						content += '<div class="name">'+item.name+'</div>';
						content += '<div class="status"> <i class="fa fa-circle online"></i> online </div>';
						content += '</div>';
						content += '</li>';
						
						$('.list-unstyled.chat-list').append(content);
						$('#chat_room').append(content);
					});
				}
			},
			error:function(e){
				console.log('chatList.ajax 통신 실패');
				console.log(e);
			}
		});
	}
	/*
	<li class="clearfix">
    <img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="avatar">
    <div class="about">
        <div class="name">Mike Thomas</div>
        <div class="status"> <i class="fa fa-circle online"></i> online </div>
    </div>
	</li>  
	
	*/
	function chat_room_exit() {
		console.log(chat_room_id);
		
		
		if (stompClient) {
	    	console.log('if문 시작');
	    	
	    	
	    	
	        var chatMessage = {
	            chat_room_id: chat_room_id,
	            send_id: name,
	            content: userName+'님이 퇴장하셨습니다.',
	            is_notice : true
	        };
			console.log('chat_room_exit');
			
			/* stompClient.send("/pub/chat/sendMessage", {}, JSON.stringify(chatMessage), function(response) {
			    console.log('입장');
			    $('#chat_history').empty();
			}, function(error) {
			    console.log('전송 에러', error);
			}); */
			
			
			stompClient.send("/pub/chat/sendMessage",{}, JSON.stringify(chatMessage));

			location.reload();
		}
	}
</script>
</html>