<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<style>
	#chat_list {
		height : 700px;
	}
	
	#chat_room {
		border : 1px solid blue;
		width : 300px;
		height : 100%;
		float : left;
	}
	
	#chat_history {
		border : 2px solid red;
		width : 700px;
		height : 100%;
		float : left;
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
    				
    				 
    				<input type="text" id="name"/>
					<button onclick="send_name()">이름저장</button>
					<input type="text" id="content"/>
					<button onclick="sendMessage()">전송</button>
					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#chatModal" onclick="create()">채팅방 생성하기</button>
					<button onclick="invite()">회원 초대하기</button>
	
					<div id="chat_list">
						<div id="chat_room"></div>
						
						
						<div id="chat_history">
				

					<!-- Message to the right -->
                  <div class="direct-chat-msg right">
                    <div class="direct-chat-infos clearfix">
                      <span class="direct-chat-name float-right">Sarah Bullock</span>
                      <span class="direct-chat-timestamp float-left">23 Jan 2:05 pm</span>
                    </div>
                    <!-- /.direct-chat-infos -->
                    <img class="direct-chat-img" src="dist/img/user3-128x128.jpg" alt="message user image">
                    <!-- /.direct-chat-img -->
                    <div class="direct-chat-text">
                      You better believe it!
                    </div>
                    <!-- /.direct-chat-text -->
                  </div>
                  <!-- /.direct-chat-msg -->
						</div>
						
					</div> 
  					
				</div>
      			<!-- /.container-fluid -->
			</section>
    		<!-- /.content -->
    		
    		
    		<div class="modal fade" id="chatModal" data-bs-backdrop="static" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		    	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		        	<div class="modal-content">
		
						<div class="user-container modal-header">
		                	<label class="modal-title" id="staticBackdropLabel" for="nickname">대화명</label>
		                	<span type="text" id="nickname" ></span>
		                	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		            	</div>
		
		
		            	<div class="display-container modal-body" style="height: 1000px">
		                	<div class="chatting-list">
								
							</div>
		            	</div>
		
		
		            	<div class="input-container modal-footer">
							<span>
							    <textarea type="text" id="msg" class="chatting-input form-control" aria-label="Recipient's username" aria-describedby="button-addon2"></textarea>
							    <button type="button" id="send-button" class="send-button">추가하기</button>
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
</body>

<!--  
<script src="https://cdn.jsdelivr.net/sockjs/1.5.2/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/stomp.js/2.3.3/stomp.min.js"></script>
-->

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<script>
	
	var chat_room_id;
	var name='';
	var socket;
	var stompClient;
	
	
	
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
				
				data.forEach(function(item) {
					var content = '';
    				if(name == item.send_id) {
    					console.log('일치요' + item.send_id);
    					content+='<div class="direct-chat-msg">';
        				content+='<div class="direct-chat-infos clearfix">';
    					content+='<span class="direct-chat-name float-left">'+item.send_id+'</span>';
    					content+='<span class="direct-chat-timestamp float-right">'+item.send_time+'</span>';
    				}else {
    					console.log('불일치요' + item.send_id);
    					content+='<div class="direct-chat-msg right">';
        				content+='<div class="direct-chat-infos clearfix">';
    					content+='<span class="direct-chat-name float-right">'+item.send_id+'</span>';
    					content+='<span class="direct-chat-timestamp float-left">'+item.send_time+'</span>';
    				}
    				
    				content+='</div>';
    				content+='<img class="direct-chat-img" src="dist/img/user1-128x128.jpg" alt="message user image">';
    				content+='<div class="direct-chat-text">'+item.content+'</div></div>';

    				$('#chat_history').append(content);
    			});
			},
			error:function(e){
				
			}
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
	            console.log('Received message: ' + JSON.parse(message.body));
	            var body = JSON.parse(message.body);
	            var content='<div>'+body.send_id+' : '+body.content+'</div>';
	            //$('#chat_history').append(content);
	            $.ajax({
	        		url:'chatStored.ajax',
	        		type:'post',
	        		data:id,
	        		dataType:'json',
	        		contentType: 'application/json; charset=utf-8',
	        		/**/
	        		success:function(data){
	        			console.log(data);
	        			$('#chat_history').html('');
	        			data.forEach(function(item) {
	        				var content = '';
	        				if(name == item.send_id) {
	        					console.log('일치요' + item.send_id);
	        					content+='<div class="direct-chat-msg">';
		        				content+='<div class="direct-chat-infos clearfix">';
	        					content+='<span class="direct-chat-name float-left">'+item.send_id+'</span>';
	        					content+='<span class="direct-chat-timestamp float-right">'+item.send_time+'</span>';
	        				}else {
	        					console.log('불일치요' + item.send_id);
	        					content+='<div class="direct-chat-msg right">';
		        				content+='<div class="direct-chat-infos clearfix">';
	        					content+='<span class="direct-chat-name float-right">'+item.send_id+'</span>';
	        					content+='<span class="direct-chat-timestamp float-left">'+item.send_time+'</span>';
	        				}
	        				
	        				content+='</div>';
	        				content+='<img class="direct-chat-img" src="dist/img/user1-128x128.jpg" alt="message user image">';
	        				content+='<div class="direct-chat-text">'+item.content+'</div></div>';
	   
	        				$('#chat_history').append(content);
	        			});
	        			
	        			
	        		},
	        		error:function(e){
	        			console.log(e);
	        		}
	        	});
	            // 메시지 처리 로직 추가
	        });
	    });
	}
	
	/*
	function send() {
		console.log($('#content').val());
		// 메시지 전송때는 JSON 형식을 메시지를 전달한다.
		function sendMessage(event) {
		    var messageContent = $('#content').val();

		    if (messageContent && stompClient) {
		    	console.log('if문 시작');
		        var chatMessage = {
		            chat_room_id: chat_room_id,
		            send_id: name,
		            content: $('#content').val()
		            
		        };

		        stompClient.send("/pub/chat/sendMessage", {}, JSON.stringify(chatMessage));
		        $('#content').val('');
		    }
		    event.preventDefault();
		}
	}
	*/
	
	function sendMessage(event) {
	    var messageContent = $('#content').val();

	    if (messageContent && stompClient) {
	    	console.log('if문 시작');
	        var chatMessage = {
	            chat_room_id: chat_room_id,
	            send_id: name,
	            content: $('#content').val()
	            
	        };

	        stompClient.send("/pub/chat/sendMessage", {}, JSON.stringify(chatMessage));
	        $('#content').val('');
	    }
	    //event.preventDefault();
	}
	
	function send_name() {
		name= $('#name').val();
		console.log(name);
		
		$.ajax({
			url:'chatList.ajax',
			type:'post',
			data:{'name': name},
			dataType:'json',
			success:function(data){
				console.log(data);
				data.forEach(function(item) {
					var content = '<div onclick="chatOpen(\''+item.chat_room_id+'\')">'+item.name+'</div>';
					$('#chat_room').append(content);
				});
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
	function create() {
		console.log('create() 호출');
		$.ajax({
			url:'memberList.ajax',
			type:'post',
			data:{},
			dataType:'json',
			success:function(data){
				console.log(data);
				var content =  '<table><tr><th><input type="checkbox"></th><th>이름</th><th>부서</th></tr>';
				data.forEach(function(item) {
					/*
					<table>
						<tr>
							<th><input type="checkbox"></th>
							<th>이름</th>
							<th>부서</th>
						</tr>
						<tr>
							<th><input type="checkbox"></th>
							<th>강경석</th>
							<th>인사</th>
						</tr>
						<tr></tr>
						<tr></tr>
					</table>
				*/
					content+='<tr><th><input type="checkbox" value="'+item.member_id+'"></th><th>'+item.member_id+'</th><th>'+item.dept_code+'</th></tr>';
				});
				content += '</table>';
				$('.chatting-list').append(content);
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
	function invite() {
		console.log('invite() 호출');
	}
</script>
</html>