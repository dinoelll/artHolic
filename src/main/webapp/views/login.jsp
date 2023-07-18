<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>ArtHolic</title>
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
	input[type="submit"]{
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
	
	#msg{
		color: #f82a2aa3;
		font-size: 12px;
		text-align: center;
	}
	
	.fade-container {
		opacity: 0;
		transition: opacity 1s ease-in-out;
	}

	.fade-container.fade-in {
	 	opacity: 1;
	}

</style>
</head>
<body>

<div class="main-container">
	<img src="img/Artholic.png" alt="">
</div>

<div class="main-container">     
	<div class="fade-container">
	<form action="login.do" method="post" onsubmit="return validateForm()">
		<table>
		  	<tr>
		    	<td><input type="text" id="id" name="id" placeholder="   ID"></td>
		  	</tr>
		  		<tr>
		    	<td><input type="password" id="pw" name="pw" placeholder="   Password"></td>
		  	</tr>
		  	<tr>
		    	<td><div id="msg"></div></td>
		  	</tr>
		  	<tr>
		    	<th colspan="2">
		      	<input type="submit" value="Login"/>
		    	</th>
		  </tr>
		</table>
	</form>
	</div>
</div>
</body>
<script>

function validateForm() {
	var id = document.getElementById("id").value;
  	var pw = document.getElementById("pw").value;
  	var msg = document.getElementById("msg");
  
 	if (id === "" && pw === "") {
    	msg.innerHTML = "아이디와 비밀번호를 입력해주세요.";
    	return false;
	}
  
  	if (id === "") {
    	msg.innerHTML = "아이디를 입력해주세요.";
    	return false;
	}
  
	if (pw === "") {
    	msg.innerHTML = "비밀번호를 입력해주세요.";
    	return false;
	}
  
  	return true; 
}

// 페이지 로드 시 페이드 효과 적용
window.addEventListener("load", function() {
  var fadeContainer = document.querySelector(".fade-container");
  fadeContainer.classList.add("fade-in");
  
  var msg = "${msg}"; 
  if (msg !== "") {
    alert(msg);
  }
  
});
</script>
</html>