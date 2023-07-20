<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
 -->
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
<!-- Daterange picker
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  -->
<!-- summernote 
  <link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
  -->
<!-- fullCalendar (캘린더) -->
<link rel="stylesheet" href="plugins/fullcalendar/main.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<link rel="stylesheet" type="text/css" href="dist/css/calendar.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="dist/js/calendar.js"></script>
<script>
	
</script>


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

.meetingRoom-time {
	margin-left: 24px;
	background-color: #91bdce;
	color: white;
	border-color: #91BDCE;
	width: 90px;
	height: 50px;
}

.title {
	font-size: 20px;
}

.meetingRoom-people {
	font-size: 27px;
	margin-left: 70px;
	margin-right: 70px;
}

.mettingRoom-time1 {
	margin-top: 30px;
}

.mettingRoom-time2 {
	margin-top: 30px;
	display: inline-block;
}

.mettingRoom-Photo {
	height: 160px;
	width: 260px;
}

.meetingRoom-Photo, .meetingRoom-people, .mettingRoom-time3 {
	display: inline-block;
}

.mettingRoom-time3 {
	margin-top: 10px;
	margin-bottom: 50px;
}

.meetingRoomContainer {
	display: flex;
	align-items: center;
}

.meetingRoomContainer .mettingRoom-time3 {
	display: flex;
	align-items: center;
	flex-direction: column;
}

.calendar.month {
	font-size: 50px; /* 원하는 폰트 사이즈로 변경하세요 */
	text-align: center;
}

.calendar-header {
	font-size: 50px; /* 원하는 폰트 사이즈로 변경하세요 */
}

.calendar-yearmonth {
	font-size: 24px; /* 원하는 폰트 사이즈로 변경하세요 */
}

#calendar {
	text-aline: center;
}

.modal-overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5); /* 반투명한 검은색 배경 */
	z-index: 999; /* 모달 창보다 낮은 z-index 값 */
	display: none; /* 기본적으로 숨겨진 상태 */
}

/* 모달 창 스타일 */
#modal {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	display: flex;
	justify-content: center;
	align-items: center;
	position: absolute;
	top: 50%; /* 모달을 수직 중앙에 위치시키기 위해 상위 요소의 중앙으로 이동 */
	left: 50%; /* 모달을 수평 중앙에 위치시키기 위해 상위 요소의 중앙으로 이동 */
	transform: translate(-50%, -50%); /* 모달의 중심을 기준으로 위치 조정 */
	z-index: 9999; /* 다른 요소들보다 위로 표시하기 위해 z-index 값 설정 */
	width: 100%;
	text-align-last: center;
}

/* 모달 폼 스타일 */
#modal-form {
	background-color: #f4f6f9;
	padding: 20px;
	border-radius: 5px;
	max-width: 400px;
	text-align: center;
	width: 500px;
}

#modal-title {
	margin-bottom: 10px;
	width: 100%;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

#modal-form button {
	margin: 10px;
	padding: 5px 10px;
	border-radius: 5px;
	background-color: #3c8dbc;
	color: #fff;
	border: none;
	cursor: pointer;
}

#modal-form button:hover {
	background-color: #357ca5;
}

.time.available {
	/* 예약 가능한 버튼의 스타일 */
	background-color: #91bdce;
	color: white;
	border: 3px solid #91bdce;
}

.time.reserved {
	/* 예약된 버튼의 스타일 */
	background-color: gray;
	color: white;
	cursor: not-allowed;
	border: 3px solid gray;
}

.btnBlueGreen.btnPush {
	box-shadow: 0px 5px 0px 0px #007144;
}

.btnLightBlue.btnPush {
	box-shadow: 0px 5px 0px 0px #1E8185;
}

.btnOrange.btnPush {
	box-shadow: 0px 5px 0px 0px #A66615;
}

.btnPurple.btnPush {
	box-shadow: 0px 5px 0px 0px #6D184B;
}

.btnPush:hover {
	margin-top: 15px;
	margin-bottom: 5px;
}

.btnBlueGreen.btnPush:hover {
	box-shadow: 0px 0px 0px 0px #007144;
}

.btnLightBlue.btnPush:hover {
	box-shadow: 0px 0px 0px 0px #1E8185;
}

.btnOrange.btnPush:hover {
	box-shadow: 0px 0px 0px 0px #A66615;
}

.btnPurple.btnPush:hover {
	box-shadow: 0px 0px 0px 0px #6D184B;
}

.meeting-rooms-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: flex-start;
}

.room {
	flex: 0 0 calc(33.33% - 20px); /* 가로 정렬을 위한 너비 조정 */
	background-color: #f4f6f9;
	border: 2px solid #ccc;
	border-radius: 8px;
	padding: 10px;
	margin-bottom: 10px;
	cursor: pointer;
	display: flex;
	align-items: center;
	margin-bottom: 20px;
	/* 추가적인 스타일을 여기에 적용하세요 */
}

.room img {
	width: 234.031px;
	height: auto;
	border-radius: 8px;
	height: 120px;
}

/* .room p {
	color: #333; 
	font-size: 16px; 
	margin-top: 8px; 
	
}  */
.selected-room {
	background-color: #e9ddc6; /* 선택된 회의실 배경색 */
	border-radius: 10px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
	/* 선택된 회의실에 대한 추가적인 스타일을 여기에 적용하세요 */
}

.room .room-info {
	display: flex;
	flex-direction: column;
}

.room .time-buttons {
	display: flex;
	flex-wrap: wrap;
	margin-left: 90px;
}

.room .time-buttons button {
	margin-right: 10px;
	margin-bottom: 10px;
	/* border: 3px solid #91bdce; */
	/* background-color: #91bdce; */
}

.room-info {
	display: flex;
	flex-direction: column;
}

#real-body {
	margin: 0;
	font-family: "Source Sans Pro", -apple-system, BlinkMacSystemFont,
		"Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif,
		"Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #212529;
	text-align: center;
	background-color: #f4f6f9;
}

div.room-info {
	margin-left: 90px;
}

button.date {
	font-size: 20px;
	background-color: #91bdce;
	border: 3px solid #91bdce;
	color: white;
	border-radius: 20px;
	margin: 10px;
}

div#calendar-ym {
	font-size: 3rem;
	font-weight: bolder;
}

table {
	border-collapse: collapse;
	width: 100%;
}

tr {
	margin-bottom: 10px;
}

td {
	padding: 8px;
	border: 1px solid #91bdce;
	text-align: left;
	
}
th{
	float:left;
	font-size: 12px;
	padding: 8px;
}

.reserved {
	background-color: gray;
}

#meetingName, #meetionMember {
	border: none; /* 테두리 없애기 */
	outline: none; /* 포커스 효과 없애기 */
	background-color: #f4f6f9;
}

#submitButton {
	float: right;
	width: 60px;
	height: 40px;
}

#closeButton {
	float: left;
	width: 60px;
	height: 40px;
}
/* #modal-title{
	background-color: #e9ddc6;
} */
</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed"
	onload="showCalendar()">
	<div class="wrapper">
		<jsp:include page="header.jsp" />
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">회의실 예약</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Dashboard v1</li>
							</ol>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->


			<hr>

			<div id="real-body">
				<div id="calendar-ym"></div>
				<div id="calendar-container">
					<!-- JavaScript 코드로 동적으로 추가될 버튼들 -->
				</div>


				<hr>
				<!-- <h3>회의실 선택</h3> -->
				<div id="meeting-rooms-container">
					<!-- <button onclick="showMeetingRooms()">날짜를 선택해주세요.</button> -->
					<p>날짜를 선택해주세요.</p>
				</div>
				<hr>
				<!-- 	<h2>시간 선택</h2> -->
				<div id="time-slots-container">
					<!-- <button onclick="showTimeSlots()">회의실을 선택해주세요.</button>
				<p>회의실을 선택해주세요.</p> -->
				</div>
			</div>

		</div>

	</div>

	<div id="modal" style="display: none;">
		<!-- 모달 내부의 입력 폼 -->
		<form id="modal-form">
		
			<label for="modal-title">회의실 예약</label>
			
			<hr>
			<table style="border-collapse: separate; border-spacing: 10px;">
				<tr>
					<th>회의명</th>
				</tr>
				<tr>
					<td><input type="text" id="meetingName" name="meetingName"></td>
				</tr>
				<tr>
					<th>참가자</th>
				</tr>
				<tr>
					<td><input type="text" id="meetionMember" name="meetionMember"></td>
				</tr>
				<tr>
					<th>예약정보</th>
				</tr>
				<tr>
					<td>
						<p id="reservationInfo"></p>
					</td>
				</tr>
			</table>
			<hr>
			<br>
			<button type="button" onclick="closeModal()" id="closeButton">취소</button>
			<button type="submit" id="submitButton">예약</button>
		</form>
	</div>

	<!-- jQuery -->
	<script src="plugins/jquery/jquery.min.js"></script>
	<!-- jQuery UI -->
	<script src="plugins/jquery-ui/jquery-ui.min.js"></script>

	<!-- Bootstrap 4 -->
	<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- overlayScrollbars -->
	<script
		src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script src="dist/js/adminlte.js"></script>

	<!-- AdminLTE for demo purposes 
   <script src="dist/js/demo.js"></script>
   -->
	<jsp:include page="footer.jsp" />
</body>


<script>
	function reservation() {
		console.log('저장');
		if ($('#meetingName').val().trim() == "") {
			alert("회의명을 등록해주세요");
		} else if ($('#meetionMember').val().trim() == "") {
			alert("참여팀을 등록해주세요");
		} else {
			$('#modal-form').submit();
		}
	}

	/* --------------------------날짜, 회의실, 시간대 버튼 클릭 로직------------------------------------ */
	function showCalendar() {
		var calendarContainer = document.getElementById("calendar-container");
		var today = new Date();
		var date = new Date();

		$("#calendar-ym").html(
				date.getFullYear() + "년 " + (date.getMonth() + 1) + "월");

		for (var i = 0; i < 10; i++) {
			var date = new Date(today.getTime() + i * 24 * 60 * 60 * 1000);
			var year = date.getFullYear();
			var month = ("0" + (date.getMonth() + 1)).slice(-2); // 월을 두 자리 숫자로 표시
			var day = ("0" + date.getDate()).slice(-2); // 일을 두 자리 숫자로 표시
			var dayOfWeek = [ "일", "월", "화", "수", "목", "금", "토" ][date.getDay()];

			var dateString = year + "-" + month + "-" + day; // 날짜 정보를 "년-월-일" 형식으로 설정
			var dateButton = document.createElement("button");
			dateButton.textContent = day + " (" + dayOfWeek + ")";
			dateButton.classList.add("date");
			dateButton.addEventListener("click", function(selectedDate) {
				return function() {
					console.log(selectedDate);
					var buttons = document.getElementsByClassName("date");
					for (var j = 0; j < buttons.length; j++) {
						buttons[j].removeAttribute("id");
						buttons[j].style.backgroundColor = "";
					}
					this.id = "selected-date";
					this.style.backgroundColor = "#c2c7d0";
					var selectedDateElement = document
							.getElementById("selected-date");
					showMeetingRooms(selectedDate);
				};
			}(dateString));

			calendarContainer.appendChild(dateButton);
		}
	}

	function showMeetingRooms(selectedDate) {
		console.log("미팅룸 진입");

		var timeSlotsContainer = document
				.getElementById("time-slots-container");
		/*  timeSlotsContainer.innerHTML = "<p>회의실을 선택해주세요.</p>"; */

		$.ajax({
			url : '/mrList.ajax',
			type : 'GET',
			success : function(data) {
				var meetingRoomsContainer = document
						.getElementById("meeting-rooms-container");
				meetingRoomsContainer.innerHTML = "";

				var meetingRooms = data;

				for (var i = 0; i < meetingRooms.length; i++) {
					var roomName = meetingRooms[i].room_name;
					var roomId = meetingRooms[i].room_id;
					var new_file_name = meetingRooms[i].new_file_name;
					var capacity = meetingRooms[i].capacity;
					var location = meetingRooms[i].location;
					console.log("수용인원" + capacity);

					// div 요소 생성
					var roomDiv = document.createElement("div");
					roomDiv.classList.add("room");
					meetingRoomsContainer.appendChild(roomDiv);

					// 회의실 이미지 추가 (예시로 이미지 경로를 'image_path'로 가정)
					var roomImage = document.createElement("img");
					roomImage.src = "/photo/" + new_file_name;
					roomDiv.appendChild(roomImage);

					// 회의실 정보 추가
					var roomInfo = document.createElement("div");
					roomInfo.classList.add("room-info");

					var roomNameDiv = document.createElement("div");
					var roomNameElement = document.createElement("p");
					roomNameElement.textContent = roomName;
					roomNameDiv.appendChild(roomNameElement);
					roomInfo.appendChild(roomNameDiv);

					var roomCapacityDiv = document.createElement("div");
					var roomCapacityElement = document.createElement("p");
					roomCapacityElement.textContent = "수용인원: " + capacity;
					roomCapacityDiv.appendChild(roomCapacityElement);
					roomInfo.appendChild(roomCapacityDiv);

					var roomLocationDiv = document.createElement("div");
					var roomLocationElement = document.createElement("p");
					roomLocationElement.textContent = "위치: " + location;
					roomLocationDiv.appendChild(roomLocationElement);
					roomInfo.appendChild(roomLocationDiv);

					roomDiv.appendChild(roomInfo);

					roomDiv.addEventListener("click", (function(selectedRoom,
							roomId, selectedDate) {
						return function() {
							console.log(selectedDate + '-' + selectedRoom);
							this.id = "selected-room";

							// 선택된 회의실 표시
							var divs = document.getElementsByClassName("room");
							for (var j = 0; j < divs.length; j++) {
								divs[j].classList.remove("selected-room");
							}
							this.classList.add("selected-room");

							// 기존 버튼 제거
							var timeButtonsContainer = document
									.querySelector(".time-buttons");
							if (timeButtonsContainer) {
								timeButtonsContainer.remove();
							}

							// 버튼 추가
							timeButtonsContainer = document
									.createElement("div");
							timeButtonsContainer.classList.add("time-buttons");
							this.appendChild(timeButtonsContainer);

							// 선택된 회의실의 자식 요소 중에서 <p> 태그를 찾아서 id 값을 roomName으로 설정
							var roomNameElement = this.querySelector("p");
							roomNameElement.id = "roomName";

							showTimeSlots(selectedRoom, selectedDate, roomId,
									timeButtonsContainer);
						};
					})(roomName, roomId, selectedDate));
				}
			},
			error : function(xhr, status, error) {
				console.error('이벤트 데이터 조회 중 에러가 발생하였습니다:', error);
			}
		});
	}

	function showTimeSlots(selectedRoom, selectedDate, roomId,
			timeButtonsContainer) {
		console.log("시간대 진입, 룸 아이디:" + roomId);
		console.log("날짜:" + selectedDate);

		timeButtonsContainer.innerHTML = "";

		var startTimeToday = 9; // 시작 시간
		var endTimeToday = 18; // 종료 시간

		// 예약된 시간대 정보 가져오기
		$.ajax({
			url : '/reservationList.ajax',
			type : 'GET',
			data : {
				date : selectedDate,
				room_id : roomId
			},
			success : function(data) {
				var reservedTimeSlots = data;
				console.log("가져온 예약리스트" + data);
				for (var i = startTimeToday; i <= endTimeToday; i++) {
					var startTime = (i < 10 ? "0" + i : i) + ":00";
					var endTime = (i + 1) + ":00";
					var timeButton = document.createElement("button");
					timeButton.id = startTime;
					timeButton.textContent = startTime + "-" + endTime;
					timeButton.classList.add("time", "time-button");
					timeButtonsContainer.appendChild(timeButton);

					// 이미 예약된 시간대인 경우 버튼을 비활성화하고 스타일 변경
					if (isTimeSlotReserved(startTime, reservedTimeSlots)) {
						timeButton.disabled = true;
						timeButton.classList.add("reserved");
					} else {
						timeButton.classList.add("available");
						timeButton.addEventListener("click", function(
								selectedTime) {
							return function() {
								console.log(selectedDate + '-' + selectedRoom
										+ '-' + selectedTime);
								var buttons = document
										.getElementsByClassName("time");
								for (var j = 0; j < buttons.length; j++) {
									buttons[j].removeAttribute("id");
									buttons[j].style.backgroundColor = "";
								}
								this.id = "selected-time";
								this.style.backgroundColor = "#c2c7d0";

								var selectedTimeElement = document
										.getElementById("selected-time");
								/* selectedTimeElement.textContent = selectedTime; */
								reserveMeeting(roomId, selectedDate,
										selectedRoom);
							};
						}(startTime));
					}
				}
			},
			error : function(xhr, status, error) {
				console.error('예약 데이터 조회 중 에러가 발생하였습니다:', error);
			}
		});
	}

	// 주어진 startTime이 이미 예약된 시간대에 포함되는지 확인하는 함수
	function isTimeSlotReserved(startTime, reservedTimeSlots) {
		for (var i = 0; i < reservedTimeSlots.length; i++) {
			var startTimeReserved = reservedTimeSlots[i].startTime;
			var endTimeReserved = reservedTimeSlots[i].endTime;
			console.log("가져온 시작시간" + startTimeReserved);

			// 시작 시간이 예약된 시간과 일치하면 예약된 것으로 간주
			if (startTime === startTimeReserved.slice(0, 5)) {
				return true;
			}
		}

		return false;
	}

	/* --------------------------날짜, 회의실, 시간대 버튼 클릭 로직/------------------------------------ */

	/* --------------------------예약 데이터 전송------------------------------------ */
	function reserveMeeting(roomId, selectedDate, selectedRoom) {
		console.log("색상이 바뀌어야한다!!!!!!!!!");

		// 예약 버튼 클릭 시 예약 처리
		var selectedDate = selectedDate
		var selectedRoom = selectedRoom
		var selectedTime = document.getElementById("selected-time").textContent;
		var timeArray = selectedTime.split("-"); // ":"을 기준으로 문자열 분할
		var startTime = timeArray[0].trim(); // 시작 시간
		var endTime = timeArray[1].trim(); // 종료 시간

		console.log(selectedRoom);

		console.log(roomId);
		// 예약 처리를 위한 로직 작성
		console.log("예약 정보:");
		console.log("날짜: " + selectedDate);
		console.log("회의실: " + selectedRoom);
		console.log("시간: " + selectedTime);
		console.log("시작시간: " + startTime);
		console.log("종료시간: " + endTime);

		showModal(selectedDate, selectedRoom, selectedTime);

		function showModal(event) {
			// 모달 창 띄우기 및 이벤트 정보를 모달 폼에 채우기
			console.log("모달창 등장!");
			$('#modal').show();
			$('#reservationInfo').html(
					"<b>회의날짜: " + selectedDate + "<br>회의실명: " + selectedRoom
							+ "<br>회의시간: " + selectedTime+"</b>");

			var selectedButton = document.getElementById("selected-time");
			selectedButton.style.backgroundColor = "#c2c7d0";

		}

		// 모달 폼 전송 이벤트 리스너 등록
		$('#modal-form').off('submit').on(
				'submit',
				function(e) {
					e.preventDefault();
					var meetingName = $('#meetingName').val(); // 모달 폼에서 입력한 내용 가져오기
					var meetionMember = $('#meetionMember').val();

					console.log(meetingName, meetionMember, selectedDate,
							selectedRoom, selectedTime, startTime, endTime,
							roomId);

					// 서버로 데이터 전송 (업데이트 또는 삭제)
					if ($('#meetingName').val().trim() == "") {
						alert("회의명을 등록해주세요");
					} else if ($('#meetionMember').val().trim() == "") {
						alert("참여팀을 등록해주세요");
					} else {
						sendMeetingData(meetingName, meetionMember,
								selectedDate, selectedRoom, selectedTime,
								startTime, endTime, roomId);

						closeModal();
					}

					// 모달 닫기

				});

		function sendMeetingData(meetingName, meetionMember, selectedDate,
				selectedRoom, selectedTime, startTime, endTime, roomId) {

			// AJAX 요청 전송
			$.ajax({
				url : '/reservationMeetingRoom.ajax',
				type : 'POST',
				data : {
					meeting_id : meetingName,
					team_id : meetionMember,
					date : selectedDate,
					room_id : roomId,
					startTime : startTime,
					endTime : endTime
				},
				dataType : 'json',
				success : function(response) {
					// 요청 성공 시 처리할 코드 작성
					console.log('예약 등록 성공');
					console.log(response.success);
					/* alert('예약이 완료되었습니다\n' + '<예약정보>\n' + '회의명 - ' + meetingName
							+ '\n' + '참가자 - ' + meetionMember + '\n' + '회의실 - '
							+ selectedRoom + '\n' + '날짜 - ' + selectedDate
							+ '\n' + '시간 - ' + startTime + '-' + endTime); */

					location.href = '/reservationComplete.go?meetingName='
							+ meetingName + '&meetionMember=' + meetionMember
							+ '&selectedRoom=' + selectedRoom
							+ '&selectedDate=' + selectedDate + '&startTime='
							+ startTime + '&endTime=' + endTime;

				},
				error : function() {
					// 요청 실패 시 처리할 코드 작성
					console.log('예약 실패');
				}
			});
		}
	}

	/* --------------------------예약 데이터 전송/------------------------------------ */
	function closeModal() {
		// 모달 창 닫기 및 모달 폼 초기화
		$('#modal').hide();
		$('#modal-form')[0].reset();
	}
	/* ---------------------------------------------------------------------------------------------------------- */
	// 날짜 버튼 클릭 시 해당 날짜를 선택한 날짜로 표시
	var dateButtons = document.querySelectorAll("#calendar-container button");
	dateButtons.forEach(function(button) {
		button.addEventListener("click", function() {
			var selectedDate = this.textContent;
			var selectedDateElement = document.getElementById("selected-date");
			selectedDateElement.textContent = selectedDate;

			// 회의실 선택 초기화
			var meetingRoomsContainer = document
					.getElementById("meeting-rooms-container");
			meetingRoomsContainer.innerHTML = "";

			// 시간 선택 초기화
			var timeSlotsContainer = document
					.getElementById("time-slots-container");
			timeSlotsContainer.innerHTML = "";
		});
	});

	// 회의실 버튼 클릭 시 해당 회의실을 선택한 회의실로 표시
	var roomButtons = document
			.querySelectorAll("#meeting-rooms-container button");
	roomButtons.forEach(function(button) {
		button.addEventListener("click", function() {
			var selectedRoom = this.textContent;
			var selectedRoomElement = document.getElementById("selected-room");
			selectedRoomElement.textContent = selectedRoom;

			// 시간 선택 초기화
			var timeSlotsContainer = document
					.getElementById("time-slots-container");
			timeSlotsContainer.innerHTML = "";
		});
	});

	// 시간 버튼 클릭 시 해당 시간을 선택한 시간으로 표시
	var timeButtons = document.querySelectorAll("#time-slots-container button");
	timeButtons.forEach(function(button) {
		button.addEventListener("click", function() {
			var selectedTime = this.textContent;
			var selectedTimeElement = document.getElementById("selected-time");
			selectedTimeElement.textContent = selectedTime;
		});
	});
</script>
</html>