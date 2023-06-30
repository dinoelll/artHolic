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
	background-color: 91BDCE;
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
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	max-width: 400px;
	text-align: center;
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

			<h1>회의실 예약 시스템</h1>

			<h2>날짜 선택</h2>
			<div id="calendar-container">
				<!-- JavaScript 코드로 동적으로 추가될 버튼들 -->
			</div>

			<h2>회의실 선택</h2>
			<div id="meeting-rooms-container">
				<button onclick="showMeetingRooms()">날짜를 선택해주세요.</button>
			</div>

			<h2>시간 선택</h2>
			<div id="time-slots-container">
				<button onclick="showTimeSlots()">회의실을 선택해주세요.</button>
			</div>

			<div>
				<button onclick="reserveMeeting()">예약</button>
			</div>
		</div>
	</div>

	<div id="modal" style="display: none;">
		<!-- 모달 내부의 입력 폼 -->
		<form id="modal-form">
			<label for="modal-title">회의실 예약</label>
			<table>
				<tr>
					<th>회의명</th>
					<td><input type="text" id="meetingName" name="meetingName">
					</td>
				</tr>
				<tr>
					<th>참가자</th>
					<td><input type="text" id="meetionMember" name="meetionMember">
					</td>
				</tr>
				<tr>
					<th>예약정보</th>
					<td>
						<p id="reservationInfo"></p>
					</td>
				</tr>
			</table>

			<!-- <input type="text" id="modal-title" name="title">  -->

			<br>
			<button type="submit">변경</button>
			<button type="button" id="delete">삭제</button>
			<button type="button" onclick="closeModal()">취소</button>
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
	/* --------------------------날짜, 회의실, 시간대 버튼 클릭 로직------------------------------------ */
	function showCalendar() {
		var calendarContainer = document.getElementById("calendar-container");
		var today = new Date();

		for (var i = 0; i < 14; i++) {
			var date = new Date(today.getTime() + i * 24 * 60 * 60 * 1000);
			var dateString = date.toLocaleDateString();
			var dateButton = document.createElement("button");
			dateButton.textContent = dateString;
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
					this.style.backgroundColor = "yellow";
					var selectedDateElement = document
							.getElementById("selected-date");
					/* selectedDateElement.textContent = selectedDate; */
					showMeetingRooms(selectedDate);
				};
			}(dateString));

			calendarContainer.appendChild(dateButton);
		}
	}

	function showMeetingRooms(selectedDate) {
		console.log("미팅룸 진입");

		$.ajax({
			url : '/mrList.ajax', 
			type : 'GET',
			success : function(data) {
				var meetingRoomsContainer = document.getElementById("meeting-rooms-container");
				meetingRoomsContainer.innerHTML = "";

				var meetingRooms = data; 
				
				for (var i = 0; i < meetingRooms.length; i++) {
					var roomName = meetingRooms[i].room_name;
					console.log(roomName);
					var roomButton = document.createElement("button");
					roomButton.textContent = roomName;
					meetingRoomsContainer.appendChild(roomButton);
					roomButton.classList.add("room");
					roomButton.addEventListener("click", function(selectedRoom) {
						return function() {
							console.log(selectedDate + '-' + selectedRoom);
							var buttons = document.getElementsByClassName("room");
							for (var j = 0; j < buttons.length; j++) {
								buttons[j].removeAttribute("id");
								buttons[j].style.backgroundColor = "";
							}
							this.id = "selected-room";
							this.style.backgroundColor = "yellow";
							var selectedRoomElement = document
									.getElementById("selected-room");
							/* selectedRoomElement.textContent = selectedRoom; */
							showTimeSlots(selectedRoom, selectedDate);
						};
					}(roomName));
				}
				
				
			},
			error : function(xhr, status, error) {
				console.error('이벤트 데이터 조회 중 에러가 발생하였습니다:', error);
			}
		});

		

		
	}

	function showTimeSlots(selectedRoom, selectedDate) {
		console.log("시간대 진입");
		var timeSlotsContainer = document
				.getElementById("time-slots-container");
		timeSlotsContainer.innerHTML = "";

		var startTimeToday = 9; // 시작 시간
		var endTimeToday = 18; // 종료 시간

		for (var i = startTimeToday; i <= endTimeToday; i++) {
			var startTime = i + ":00";
			var endTime = (i + 1) + ":00";
			var timeButton = document.createElement("button");
			timeButton.id = startTime;
			timeButton.textContent = startTime + "-" + endTime;
			timeSlotsContainer.appendChild(timeButton);
			timeButton.classList.add("time");
			timeButton.addEventListener("click", function(selectedTime) {
				return function() {
					console.log(selectedDate + '-' + selectedRoom + '-'
							+ selectedTime);
					var buttons = document.getElementsByClassName("time");
					for (var j = 0; j < buttons.length; j++) {
						buttons[j].removeAttribute("id");
						buttons[j].style.backgroundColor = "";
					}
					this.id = "selected-time";
					this.style.backgroundColor = "yellow";

					var selectedTimeElement = document
							.getElementById("selected-time");
					/* selectedTimeElement.textContent = selectedTime; */
				};
			}(startTime));
		}
	}

	/* --------------------------날짜, 회의실, 시간대 버튼 클릭 로직/------------------------------------ */

	/* --------------------------예약 데이터 전송------------------------------------ */
	function reserveMeeting() {

		// 예약 버튼 클릭 시 예약 처리
		var selectedDate = document.getElementById("selected-date").textContent;
		var selectedRoom = document.getElementById("selected-room").textContent;
		var selectedTime = document.getElementById("selected-time").textContent;
		var timeArray = selectedTime.split("-"); // ":"을 기준으로 문자열 분할
		var startTime = timeArray[0].trim(); // 시작 시간
		var endTime = timeArray[1].trim(); // 종료 시간

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
					"회의날짜: " + selectedDate + "<br>회의실명: " + selectedRoom
							+ "<br>회의시간: " + selectedTime);

		}

		// 모달 폼 전송 이벤트 리스너 등록
		$('#modal-form').on(
				'submit',
				function(e) {
					e.preventDefault();
					var meetingName = $('#meetingName').val(); // 모달 폼에서 입력한 내용 가져오기
					var meetionMember = $('#meetionMember').val();

					console.log(meetingName, meetionMember, selectedDate,
							selectedRoom, selectedTime, startTime, endTime);

					// 서버로 데이터 전송 (업데이트 또는 삭제)
					sendMeetingData(meetingName, meetionMember, selectedDate,
							selectedRoom, selectedTime, startTime, endTime);

					// 모달 닫기
					closeModal();
				});

		function sendMeetingData(meetingName, meetionMember, selectedDate,
				selectedRoom, selectedTime, startTime, endTime) {
			// 서버로 데이터 전송 (업데이트 또는 삭제)
			/* 	var reservationData = {
				meeting_id : meetingName,
				team_id : meetionMember,
				date : selectedDate,
				room_id : selectedRoom,
				startTime : startTime,
				endTime : endTime				
			};  */

			// AJAX 요청 전송
			$.ajax({
				url : '/reservationMeetingRoom.ajax',
				type : 'POST',
				data : {
					meeting_id : meetingName,
					team_id : meetionMember,
					date : selectedDate,
					room_id : selectedRoom,
					startTime : startTime,
					endTime : endTime
				},
				dataType : 'json',
				success : function(response) {
					// 요청 성공 시 처리할 코드 작성
					console.log('예약 등록 성공');
					console.log(response.success);
					alert('예약이 완료되었습니다!');
					location.href = '/metingRoom.go';

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
	/* 	// 날짜 버튼 클릭 시 해당 날짜를 선택한 날짜로 표시
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
	 }); */
</script>
</html>