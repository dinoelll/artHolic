<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>ArtHolic</title>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!--  Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">

<!-- Font Awesome-->
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">

<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">

<!--  iCheck -->
<link rel="stylesheet"
	href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">

<!-- JQVMap
  <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
  -->
<!-- Theme style-->
<link rel="stylesheet" href="dist/css/adminlte.min.css">
<!-- overlayScrollbars-->
<link rel="stylesheet"
	href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">

<link rel="stylesheet" href="plugins/fullcalendar/main.css">
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
		margin-left: 0px;
	}
	
	label.file-input-label {
		background-color: #91bdce;
		color: white;
		padding: 5px 10px;
		border: 1px solid #91bdce;
		cursor: pointer;
		align-items: center;
		width: 120px;
		text-align: center;
		border-radius: 5px;	
		margin-left: 250px;
		margin-bottom: 0px;
		margin-top: 10px;	
	}
	
	input[type="file"] {
		display: none;
	}
	
	.list li {
		border: 1px solid #ccc; 
		border-radius: 5px; 
		padding: 5px; 
		background-color: white;
		padding-top: 10px;
		padding-bottom: 10px;
		margin: 15px;
	}
	
	input[type="submit"] {
		border: 1px solid #91bdce;
		border-radius: 5px; 
		padding: 5px 10px; 
		background-color: #91bdce;
		padding-top: 10px;
		padding-bottom: 10px;
		margin: 15px;
		width: 100px;
		color: white;
	}
	
	#chkNotice {
        display: inline-block;
        font-size: 12px;
        width: 200px;
        height: 5px;
        margin-left: 20px;
        margin-bottom: 5px;
    }
    
	#back {
		border: 1px solid #91bdce;
		border-radius: 5px; 
		padding: 5px 10px; 
		background-color: #91bdce;
		padding-top: 10px;
		padding-bottom: 10px;
		margin: 15px;
		width: 100px;
		color: white;
	}
	
	.checkId{
        border: 1px solid #f82a2aa3;
        border-radius: 5px; 
        background-color: #f82a2aa3;
        margin-left: 330px;
        width: 100px;
        color: white;
    }
    
    #msg{
        color: #f82a2aa3;
        font-size: 12px;
        margin-left: 20px;
    }
	
</style>
<script>
        function previewProfileImage(event) {
            var input = event.target;
            var preview = document.getElementById('profile-preview');
            var defaultImage = 'img/user.png';

            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function(e) {
                    preview.src = e.target.result;
                };

                reader.readAsDataURL(input.files[0]);
            } else {
                preview.src = defaultImage;
            }
        }
        
        
    </script>
</head>
<body class="hold-transition sidebar-mini layout-fixed">		
		
	<div class="wrapper">
	<jsp:include page="header.jsp"/>
	
	<!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper" style= "height: 1200px;">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">사원정보 입력</h1>
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
   
	<div class="employeeWrite">
		<div class="emplyeeInput">
			<form action="join.do" method="post" enctype="multipart/form-data"  onsubmit="return validateForm()">
				<hr>
					<ul class="list" style="list-style: none; width: 700px; margin-left: 500px;">
						<li>
				                <div style="flex-grow: 1; text-align: center;">
							        <img id="profile-preview" src="img/user.png" alt="" width="200" height="200">
							    </div>
							    <div style="flex-grow: 0;">
							        <input type="file" name="profile" id="file-input" onchange="previewProfileImage(event)" style="border: none;">
							        <label for="file-input" class="file-input-label">파일 선택</label>
							    </div>		
					            
					            <li style="display:inline;">
								&nbsp;&nbsp;&nbsp;&nbsp;<p style="display:inline;">생년월일</p>&nbsp;&nbsp;
							    <select name="year">
							        <option value="">-- 연도 --</option>
							        <!-- 1960년부터 2023년까지의 연도 옵션 생성 -->
							        <c:forEach var="year" begin="1960" end="2023">
							            <option value="${year}">${year}</option>
							        </c:forEach>
							    </select>
							    <select name="month">
							        <option value="">-- 월 --</option>
							        <!-- 1월부터 12월까지의 월 옵션 생성 -->
							        <c:forEach var="month" begin="1" end="12">
							            <option value="${month}">${month}</option>
							        </c:forEach>
							    </select>
							    <select name="day">
							        <option value="">-- 일 --</option>
							        <!-- 1일부터 31일까지의 일 옵션 생성 -->
							        <c:forEach var="day" begin="1" end="31">
							            <option value="${day}">${day}</option>
							        </c:forEach>
							    </select>&nbsp;&nbsp;&nbsp;&nbsp;	
							    
						<li style="display:inline; padding-right: 31px">
						    &nbsp;&nbsp;&nbsp;&nbsp;<p style="display:inline;">부서</p>&nbsp;&nbsp;
						    <select id="dept-dropdown" name="dept_code" style="display:inline;">
						    	<option value="default">부서</option>
						        <option value="dept_hr">인사</option>
						        <option value="dept_ct">시공</option>
						        <option value="dept_dg">설계</option>
						    </select>	
						    &nbsp;&nbsp;&nbsp;&nbsp;<p style="display:inline;">직급</p>&nbsp;&nbsp;
						    <select id="position-dropdown" name="position_code" style="display:inline;">
						    	<option value="default">직급</option>
						        <option value="art_06">사원</option>
						        <option value="art_05">주임</option>
						        <option value="art_04">대리</option>
						        <option value="art_03">과장</option>
						        <option value="art_02">차장</option>
						        <option value="art_01">부장</option>
						    </select> 	
						</li>
						
						<li>
                            <input type="text" name="member_id" id="member_id" placeholder="사번" style="border: none;">
                            <button type="button" class="checkId" onclick="checkDuplicate()">중복 확인</button>                            
                        </li>
                        
                        <div id="msg"></div>
                        
					    <li><input type="password" id="pw" name="pw" placeholder="비밀번호" style="border: none;"></li>
					    <li><input type="password" id="pwChk" name="pwChk" placeholder="비밀번호 확인" style="border: none;"></li>
					   
					   	<font id="chkNotice" size="2"></font>
					   
					    <li><input type="text" name="name" placeholder="이름" style="border: none;"></li>
						
						<li>
									&nbsp;&nbsp;<input type="radio" name="gender" value="남자"/>남자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="gender" value="여자"/>여자		
						</li>
						<li>
							<input type="text" id="phone" name="phone" oninput="formatPhoneNumber()" placeholder="휴대폰번호" style="border: none;">	
						</li>
						<li>
							<input type="text" id="tel" name="tel" oninput="formatTelNumber()" placeholder="내선번호" style="border: none;">   	
						</li>
						<li>
						        <div style="display: inline-block; border: none; background-color: white;">
						            <input type="text" id="emailPrefix" name="emailPrefix" placeholder="이메일" style="border: none;">
						            <span>@</span>
						            <span id="direct_email" style="display: inline-block; margin-top: 3px;">
						                <input type="text" name="email3" id="email3" class="MS_input_txt MS_input_email" value="" size="15" maxlength="25" style="border: none;">
						            </span>
						            <select id="emailDomain" name="emailDomain" style="border: 1px solid #ccc;">
						                <option value="custom">직접 입력</option>
						                <option value="gmail.com">gmail.com</option>
						                <option value="daum.net">daum.net</option>
						                <option value="naver.com">naver.com</option>
						            </select>
						        </div>
						</li>
						
					</ul>	
				
				<div style="display: flex; justify-content: center; margin-left: 120px">
				  <input type="button" value="뒤로가기" id="back" onclick="location.href ='/employeeList.go'" style="margin-right: 30px;">
				  <input type="submit" value="등록하기">
				</div>
			</form>
   		</div>
   </div>

    </section>
    <!-- /.content -->

    <jsp:include page="footer.jsp"/>
	</div>
	
</div>

	


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

</body>
<script>

function checkDuplicate() {
    var member_id = document.getElementById("member_id").value;
    console.log("member_id");
    $.ajax({
        url: "/checkDuplicate.ajax",
        method: "POST",
        data: { member_id: member_id },
        success: function(response) {
            var msgElement = document.getElementById("msg");
            if (response.duplicate) {
                msgElement.innerText = "중복된 사번입니다. 다른 사번을 입력해주세요.";
            } else {
                msgElement.innerText = "사용 가능한 사번입니다.";
            }
        },
        error: function() {
            alert("중복 확인 중 오류가 발생했습니다.");
        }
    });
}

function validateForm() {

	  var fileInput = document.getElementById("file-input");
	  if (fileInput.files.length === 0) {
	    alert("프로필 사진을 등록해 주세요.");
	    return false; 
	  }

	  var yearSelect = document.getElementsByName("year")[0];
	  var monthSelect = document.getElementsByName("month")[0];
	  var daySelect = document.getElementsByName("day")[0];
	  if (yearSelect.value === "" || monthSelect.value === "" || daySelect.value === "") {
	    alert("생년월일을 입력해 주세요.");
	    return false; 
	  }

	  var deptDropdown = document.getElementById("dept-dropdown");
	  var positionDropdown = document.getElementById("position-dropdown");
      if (deptDropdown.value === "default" || positionDropdown.value === "default") {
	    alert("직급과 부서를 선택해 주세요.");
	    return false; 
	  }

	  var memberIDInput = document.getElementsByName("member_id")[0];
	  if (memberIDInput.value === "") {
	    alert("사번을 입력해 주세요.");
	    return false; 
	  }

	  var passwordInput = document.getElementById("pw");
	  var confirmPasswordInput = document.getElementById("pwChk");
	  if (passwordInput.value === "" || confirmPasswordInput.value === "") {
	    alert("비밀번호를 입력해 주세요.");
	    return false; 
	  }

	  if (passwordInput.value !== confirmPasswordInput.value) {
	    alert("비밀번호가 맞지 않습니다. 비밀번호를 확인해 주세요.");
	    return false; 
	  }

	  var nameInput = document.getElementsByName("name")[0];
	  if (nameInput.value === "") {
	    alert("이름을 입력해 주세요.");
	    return false; 
	  }

	  var genderInputs = document.getElementsByName("gender");
	  var genderChecked = false;
	  for (var i = 0; i < genderInputs.length; i++) {
	    if (genderInputs[i].checked) {
	      genderChecked = true;
	      break;
	    }
	  }
	  if (!genderChecked) {
	    alert("성별을 선택해 주세요");
	    return false;
	  }
	  
	  var phoneInput = document.getElementById("phone");
	  var telInput = document.getElementById("tel");
	  if (phoneInput.value === "" && telInput.value === "") {
	    alert("핸드폰번호와 내선번호를 입력해 주세요.");
	    return false;
	  }

	  var emailPrefixInput = document.getElementById("emailPrefix");
	  var email3Input = document.getElementById("email3");
	  var emailDomainSelect = document.getElementById("emailDomain");
	  if (emailPrefixInput.value === "" || email3Input.value === "") {
	    alert("이메일을 입력해 주세요.");
	    return false;
	  }

	  if (emailDomainSelect.value === "custom" && email3Input.value === "") {
	    alert("이메일 도메인을 입력해 주세요");
	    return false; 
	  }

	  return true;
	}

var msg = "${msg}";
if (msg !== "") {
    alert(msg);
}

	$(document).ready(function() {
		$('#chkNotice').html('초기 설정 비밀번호는 1111 입니다.');
		$('#chkNotice').css('color', '#199894b3');
		  $('#pw').keyup(function() {
		    $('#chkNotice').html('');
		  });
	
		  $('#pwChk').keyup(function() {
		    if ($('#pw').val() != $('#pwChk').val()) {
		      $('#chkNotice').html('비밀번호가 일치하지 않습니다.<br><br>');
		      $('#chkNotice').css('color', '#f82a2aa3');
		    } else {
		      $('#chkNotice').html('비밀번호가 일치합니다.<br><br>');
		      $('#chkNotice').css('color', '#199894b3');
		    }
		  });
	});

	document.getElementById("emailDomain").addEventListener("change", function() {
	    var emailDomain = document.getElementById("emailDomain");
	    var directEmail = document.getElementById("email3");
		console.log('email chane');
	    if (emailDomain.value === "custom") {
	        directEmail.value = ""; // 직접 입력 선택 시 입력 값 초기화
	        directEmail.style.display = "inline-block";
	    } else {
	        directEmail.value = emailDomain.value; // 선택된 도메인을 입력 칸에 자동으로 설정
	        directEmail.style.display = "inline-block";
	    }
	});

	//선택된 성별 값 가져오기
	var genderDropdown = document.getElementById("gender-dropdown");
	var selectedGender = genderDropdown.value;
	
	// 선택된 성별 값 출력하기 (예시)
	console.log("선택된 성별: " + selectedGender);
	
	
	function formatPhoneNumber() {
		  var phoneInput = document.getElementById("phone");
		  var phoneNumber = phoneInput.value;

		  phoneNumber = phoneNumber.replace(/-/g, "");

		  if (phoneNumber.length > 3 && phoneNumber.length <= 7) {
		    phoneNumber = phoneNumber.replace(/(\d{3})(\d+)/, "$1-$2");
		  } else if (phoneNumber.length > 7) {
		    phoneNumber = phoneNumber.replace(/(\d{3})(\d{4})(\d+)/, "$1-$2-$3");
		  }

		  phoneInput.value = phoneNumber;
		}
	
	function formatTelNumber() {
		  var telInput = document.getElementById("tel");
		  var telNumber = telInput.value;

		  telNumber = telNumber.replace(/-/g, "");

		  if (telNumber.length > 4 && telNumber.length <= 6) {
		    telNumber = telNumber.replace(/(\d{3})(\d+)/, "$1-$2");
		  } else if (telNumber.length > 6) {
		    telNumber = telNumber.replace(/(\d{3})(\d{3})(\d+)/, "$1-$2-$3");
		  }

		  telInput.value = telNumber;
		}
	
	
	
</script>

</html>