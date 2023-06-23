<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	body{
		background-color: #e9ddc6;
	}
	
	.main-container{
		display: flex;
	    justify-content: center;
	    align-items: center;
	}
	input[type="text"],
  	input[type="password"] {
    	width: 330px;
		height: 40px;
    	background: #C8DEE7;    	  	
		box-shadow: inset 0px 4px 4px rgba(0, 0, 0, 0.25);
		border-radius: 10px;
		border: none;
	}
	button{
		width: 330px;
		height: 33px;
		background: #91BDCE;
		box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
		border-radius: 10px;
		font-weight: 600px;
		font-size: 15px;
		color: #ffffff;
		border: none;
	}	
	

</style>
</head>
<body>

<div class="main-container">
	<img src="resources/img/Artholic.png" alt="">
</div>
	
<div class="main-container">     
	<table>
	  <tr>
	    <td><input type="text" id="id" placeholder="ID"></td>
	  </tr>
	  <tr>
	    <td><input type="password" id="pw" placeholder="Password"></td>
	  </tr>
	  <tr>
	    <th colspan="2">
	      <button onclick="login()" id="login">Login</button>
	    </th>
	  </tr>
	</table>
</div>


</body>
<script>

function login() {
    var $id = $('#id');
    var $pw = $('#pw');

    if ($id.val() == '') {
        alert('아이디를 입력해 주세요.');
    } else if ($pw.val() == '') {
        alert('비밀번호를 입력해 주세요.');
    } else {
        $.ajax({
            type: 'post',
            url: 'login.ajax',
            data: {
                id: $id.val(),
                pw: $pw.val()
            },
            dataType: 'json',
            success: function(data) {
                alert('로그인에 성공하였습니다.');
                location.href = './list.do';
            },
            error: function(e) {
                console.log(e);
                alert('회원가입에 실패 했습니다.\r\n 다시 시도해 주세요!');
            }
        });
    }
}

</script>
</html>