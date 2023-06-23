<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
	#chat_list {
		
	}
	
	#chat_room {
		border : 1px solid blue;
		width : 300px;
		height : 700px;
		float : left;
	}
	
	#chat_history {
		border : 2px solid red;
		width : 700px;
		height : 700px;
		float : left;
	}
</style>
</head>
<body>
	<input type="text" id="name"/>
	<button onclick="send_name()">이름저장</button>
	
	<div id="chat_list">
		<div id="chat_room"></div>
		<div id="chat_history"></div>
	</div>
	
	
	<input type="text" id="content"/>
	<button onclick="sendMessage()">전송</button>
	
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
	var socket; socket= new SockJS('/ws-stomp');
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
    				var content='<div>'+item.send_id+' : '+item.content+'</div>';
    				$('#chat_history').append(content);
    			});
			},
			error:function(e){
				
			}
		});
		
		
		socket= new SockJS('/ws-stomp');
		stompClient= Stomp.over(socket);
		
		stompClient.connect({}, function (frame) {
	        console.log('Connected: ' + frame);

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
	        		success:function(data){
	        			console.log(data);
	        			$('#chat_history').html('');
	        			data.forEach(function(item) {
	        				var content='<div>'+item.send_id+' : '+item.content+'</div>';
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
</script>
</html>