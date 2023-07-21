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

.content {
	display: flex;
	/* justify-content: center;
      align-items: center;
      height: 700px;
      text-align: center; */
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
	width: 400px;
}

#modal-title {
	margin-bottom: 10px;
	width: 100%;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

/* #modal-form button {
	margin: 10px;
	padding: 5px 10px;
	border-radius: 5px;
	background-color: #3c8dbc;
	color: #fff;
	border: none;
	cursor: pointer;
} */

#change:hover {
	background-color: #357ca5;
}
#delete:hover {
	background-color: #357ca5;
}

.calendar-container {
	width: 50%; /* Adjust the width as desired */
}

.btn-primary {
	background-color: #91bdce;
	border-color: #91bdce;;
	box-shadow: none;
}

.btn-primary.disabled, .btn-primary:disabled {
	color: #fff;
	background-color: #91bdce;
	border-color: #91bdce;
}

#save {
	float: center;
	background-color: #91bdce;
	border-color: #91bdce;
	color: #fff;
}

.btn-primary:not(:disabled):not(.disabled).active, .btn-primary:not(:disabled):not(.disabled):active,
	.show>.btn-primary.dropdown-toggle {
	color: #fff;
	background-color: #4d798a;
	border-color: #4d798a;
}

.bg-success {
	background-color: #05b6fa !important;
}

.bg-warning {
	background-color: #36d1f7 !important;
}

.bg-info {
	background-color: #4d798a !important;
}

.bg-primary {
	background-color: #11515e !important;
}

.bg-danger {
	background-color: #4f7178 !important;
}




.text-primary {
	color: #05b6fa !important;
}

.text-warning {
	color: #36d1f7 !important;
}

.text-success {
	color: #4d798a !important;
}

.text-danger {
	color: #11515e !important;
}

 .subject {
	color: black;
	text-decoration: none;
	background-color: transparent;
}  

#project {
	color: #91bdce;
	text-align-last: center;
}

#change{
	background-color: #3c8dbc;
	margin: 10px;
	padding: 5px 10px;
	border-radius: 5px;
	color: #fff;
	border: none;
	cursor: pointer;
	float:left;
}
#delete {
	background-color: #3c8dbc;
	margin: 10px;
	padding: 5px 10px;
	border-radius: 5px;
	color: #fff;
	border: none;
	cursor: pointer;
	float:right;
}

#x {
	background-color: white;
	color: black;
	border: none;
	border-radius: 5px;
	padding: 5px 5px;
	margin: 10px;
	float: right;

	position: absolute;
    top: 410px;
    right: 745px;
    cursor: pointer;
}
</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<jsp:include page="header.jsp" />
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">
								<a
									href="/projectCalendar.go?project_id=${project_id}&project_name=${project_name}"
									class="subject"><b>캘린더</b></a>|<a
									href="/projectDetail.go?type=jsp&project_id=${project_id}&project_name=${project_name}"
									class="subject">피드</a>
							</h1>

						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
	<!-- 							<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Dashboard v1</li> -->
							</ol>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->
			<h1 id="project">&lt; team ${project_name} &gt;</h1>

			<input type="hidden" id="project_id" value="${project_id }">
			<input type="hidden" id="project_name" value="${project_name }">

			<div id="modal" style="display: none;">
				<!-- 모달 내부의 입력 폼 -->

				<form id="modal-form">
					<div>
						<button type="button" onclick="closeModal()" id="x">x</button>
					</div>
					<div >
						<label for="modal-title">내용</label>

					</div>
					<input type="text" id="modal-title" name="title"> <br>
					<button type="submit" id="change">변경</button>
					<button type="button" id="delete">삭제</button>

				</form>
			</div>



			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-3">
							<div class="sticky-top mb-3">
								<div class="card">
									<div class="card-header">
										<!-- <h4 class="card-title">일정 </h4> -->
										<button onclick="sendEventsToServer()" id="save" class="btn">일정
											저장</button>
									</div>
									<!-- <button onclick="cl_ev()">이벤트 불러오기</button>  -->




									<div class="card-body">
										<!-- the events -->
										<div id="external-events">
											<div class="external-event bg-success">미팅</div>
											<div class="external-event bg-warning">회의</div>
											<div class="external-event bg-info">출장</div>
											<div class="external-event bg-primary">회식</div>
											<div class="external-event bg-danger">휴가</div>
											<div class="checkbox">
												<label for="drop-remove"> <input type="checkbox"
													id="drop-remove"> 일정 리스트에서 삭제하기
												</label>
											</div>
										</div>
									</div>
									<!-- /.card-body -->
								</div>
								<!-- /.card -->
								<div class="card">
									<div class="card-header">
										<h3 class="card-title">일정 추가하기</h3>
									</div>
									<div class="card-body">
										<div class="btn-group"
											style="width: 100%; margin-bottom: 10px;">
											<ul class="fc-color-picker" id="color-chooser">
												<li><a class="text-primary" href="#"><i
														class="fas fa-square"></i></a></li>
												<li><a class="text-warning" href="#"><i
														class="fas fa-square"></i></a></li>
												<li><a class="text-success" href="#"><i
														class="fas fa-square"></i></a></li>
												<li><a class="text-danger" href="#"><i
														class="fas fa-square"></i></a></li>
												<li><a class="text-muted" href="#"><i
														class="fas fa-square"></i></a></li>
											</ul>
										</div>
										<!-- /btn-group -->
										<div class="input-group">
											<input id="new-event" type="text" class="form-control"
												placeholder="일정 이름을 입력해 주세요.">

											<div class="input-group-append">
												<button id="add-new-event" type="button"
													class="btn btn-primary">추가</button>
											</div>
											<!-- /btn-group -->
										</div>
										<!-- /input-group -->
									</div>
								</div>
							</div>
						</div>
						<!-- /.col -->
						<div class="col-md-9 calendar-container">
							<div class="card card-primary">
								<div class="card-body p-0">
									<!-- THE CALENDAR -->
									<div id="calendar"></div>
								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
			<jsp:include page="footer.jsp" />
		</div>
		<!-- /.content-wrapper -->


	</div>


	<!-- jQuery -->
	<script src="../plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- jQuery UI -->
	<script src="../plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../dist/js/adminlte.min.js"></script>
	<!-- fullCalendar 2.2.5 -->
	<script src="../plugins/moment/moment.min.js"></script>
	<script src="../plugins/fullcalendar/main.js"></script>

	<!-- Page specific script -->
	<script>
	
   var calendar=null;
   var calendar_id = $('#project_id').val();
   console.log(calendar_id);
   
   
    $(document).ready(function callList() {
        // 페이지 로드 시 서버에서 이벤트 데이터를 가져와서 캘린더에 표시
        console.log('리스트 다시 불러오기!');
        $.ajax({
          url: '/getProjectEvent.ajax', // 이벤트 데이터를 조회하는 API 엔드포인트
          data:{
             project_id : $('#project_id').val()
          },
          type: 'GET',
          success: function(response) {
             console.log('진입!!!!!!!!!!!!!!!');
             var eventData = response.map(function(event) {
                 var start = new Date(event.start_date);
                 var end = new Date(event.end_date);
                 
                  // UTC 시간대와 로컬 시간대의 차이를 분 단위로 가져옵니다

                // var timezoneOffset = new Date().getTimezoneOffset();

                 // 서버에서 받은 UTC 시간을 로컬 시간대로 조정합니다
                 //start.setMinutes(start.getMinutes() - timezoneOffset);

                 //end.setMinutes(end.getMinutes() - timezoneOffset); 
                 
                 return {
                   title: event.content,
                   start: start,
                   end: end,
                   allDay: event.allDay,
                  backgroundColor : event.backgroundColor,
                  borderColor : event.borderColor,
                  id : event.project_calendar_id
                 };
               });
               
               eventData.forEach(function(event) {
                 calendar.addEvent(event);
               });
               
               console.log('이벤트 데이터가 성공적으로 가져와서 캘린더에 표시되었습니다.');
               calendar.render();
          },
          error: function(xhr, status, error) {
            console.error('이벤트 데이터 조회 중 에러가 발생하였습니다:', error);
          }
        });
      });
   
   
/*    var eventList = calendar.getEvents(); */
   
   $(function () {

        /* 외부 이벤트 초기화
           -----------------------------------------------------------------*/
        function ini_events(ele) {
          ele.each(function () {

            // 이벤트 객체 생성 (https://fullcalendar.io/docs/event-object)
            // 시작과 끝을 필요로하지 않습니다
            var eventObject = {
              title: $.trim($(this).text()) // 요소의 텍스트를 이벤트 제목으로 사용
            }

            // 이벤트 객체를 DOM 요소에 저장하여 나중에 접근할 수 있게 합니다
            $(this).data('eventObject', eventObject)

            // jQuery UI를 사용하여 이벤트를 드래그 가능하게 합니다
            $(this).draggable({
              zIndex        : 1070,
              revert        : true, // 드래그 후 원래 위치로 되돌아갑니다
              revertDuration: 0  // 드래그 후 복귀하는 시간
            })

          })
        }

        ini_events($('#external-events div.external-event'))

        /* 캘린더 초기화
           -----------------------------------------------------------------*/
        // 캘린더 이벤트용 날짜 (더미 데이터)
        var date = new Date()
        var d    = date.getDate(),
            m    = date.getMonth(),
            y    = date.getFullYear()

        var Calendar = FullCalendar.Calendar;
        var Draggable = FullCalendar.Draggable;

        var containerEl = document.getElementById('external-events');
        var checkbox = document.getElementById('drop-remove');
        var calendarEl = document.getElementById('calendar');

        // 외부 이벤트 초기화
        // -----------------------------------------------------------------

        new Draggable(containerEl, {
          itemSelector: '.external-event',
          eventData: function(eventEl) {
            return {
              title: eventEl.innerText,
              backgroundColor: window.getComputedStyle(eventEl, null).getPropertyValue('background-color'),
              borderColor: window.getComputedStyle(eventEl, null).getPropertyValue('background-color'),
              textColor: window.getComputedStyle(eventEl, null).getPropertyValue('color'),
            };
           
          }
        });

        calendar = new Calendar(calendarEl, {
          headerToolbar: {
            left  : 'prev,next today',
            center: 'title',
            right : 'dayGridMonth,timeGridWeek,timeGridDay'
          },
          themeSystem: 'bootstrap',
          // 임의의 기본 이벤트
      
          editable  : true,
          droppable : true, // 캘린더 위로 요소를 놓을 수 있게 합니다
          drop      : function(info) {
            // "놓은 후 삭제" 체크박스가 선택되어 있는지 확인합니다
            if (checkbox.checked) {
              // 체크박스가 선택되어 있다면 "Draggable Events" 목록에서 해당 요소를 제거합니다
              info.draggedEl.parentNode.removeChild(info.draggedEl);
            }

            console.log('이벤트 발생!');
          },
          /* ---------------------------------------------------------------------------------------------- */
          eventClick: function(info) {
             
              // 모달 창 띄우기
               showModal(info.event);


		    	  // 모달 폼 전송 이벤트 리스너 등록
		    	  $('#modal-form').on('submit', function(e) {
		    	    e.preventDefault();
		    	    var content = $('#modal-title').val(); // 모달 폼에서 입력한 내용 가져오기
		    	    var project_calendar_id = info.event.id; // 클릭한 이벤트의 id 가져오기
		    	    var start_date = info.event.start;
		    	    var end_date = info.event.end;
		    	    var allDay = info.event.allDay;
		    	    var backgroundColor = info.event.backgroundColor;
		    	    var borderColor = info.event.borderColor;
		    	    var project_id = $('#project_id').val();
		    	    var project_name = $('#project_name').val();
		    	    
		    	    console.log(content,project_calendar_id);

		    	    // 서버로 데이터 전송 (업데이트 또는 삭제)
		    	    sendEventData(project_calendar_id, content,start_date,end_date,allDay,backgroundColor,borderColor,project_id,project_name);
		    	    
		    	    // 모달 닫기
		    	    closeModal();
		    	  });
		    	  
		    	  function showModal(event) {
			    	  // 모달 창 띄우기 및 이벤트 정보를 모달 폼에 채우기
			    	  console.log("모달창 등장!");
			    	  console.log(event.id);
			    	  $('#modal').show();
			    	  $('#modal-title').val(event.title);
			    	}
		    	  
		    		function closeModal() {
				    	  // 모달 창 닫기 및 모달 폼 초기화
				    	  $('#modal').hide();
				    	  $('#modal-form')[0].reset();
				    	}
		    		
		    		
				    	function sendEventData(project_calendar_id, content,start_date,end_date,allDay,backgroundColor,borderColor,project_id,project_name) {
				    	  // 서버로 데이터 전송 (업데이트 또는 삭제)
				    	  var requestData = {
				    		project_calendar_id: project_calendar_id,
				    	    content: content,
				    	    start_date:start_date,
				    	    end_date:end_date,
				    	    allDay:allDay,
				    	    backgroundColor:backgroundColor,
				    	    borderColor:borderColor,
				    	    project_id : project_id
				    	  };
							
				    	  // AJAX 요청 전송
				    	   $.ajax({
							    url: '/ProjectcalendarUpdate2.ajax',
							    method: 'POST',
							    data: JSON.stringify(requestData),
							    contentType: 'application/json',
							    success: function(response) {
							      // 요청 성공 시 처리할 코드 작성
							      console.log('일정 업데이트 또는 삭제 성공');
							      alert('일정이 변경되었습니다!');
							      console.log($('#project_name').val());
							      location.href='/projectCalendar.go?project_id=' + $('#project_id').val()+'&project_name='+ $('#project_name').val(); 
							      
							    },
							    error: function() {
							      // 요청 실패 시 처리할 코드 작성
							      console.log('데이터 업데이트 또는 삭제 실패');
							    }
							  });    	
				      }	  
               
				
                     $('#delete').on('click', function(e) {
                          e.preventDefault();
                         console.log(info.event.id);
                          
                          var project_calendar_id = info.event.id; // 클릭한 이벤트의 id 가져오기
                          
                          
                          console.log(project_calendar_id);


                          // 서버로 데이터 전송 (업데이트 또는 삭제)
                          deleteEvent(project_calendar_id);
                          
                          // 모달 닫기
                          closeModal();
                        });
                   
			

				    	
				    	 function deleteEvent(project_calendar_id) {
				    		 console.log($('#project_name').val());
				    		console.log(project_calendar_id);
				    		   $.ajax({
								    url: '/ProjecteventDelete.ajax',
								    type: 'POST',
								    data: {project_calendar_id : project_calendar_id},
								    /* contentType: 'application/json',  */
								    dataType : 'json',
								    success: function(data) {
								      // 요청 성공 시 처리할 코드 작성
								      console.log(data.data);
								      alert('일정이 삭제되었습니다!');
								      console.log($('#project_name').val());
								      location.href='/projectCalendar.go?project_id=' + $('#project_id').val()+'&project_name='+ $('#project_name').val(); 
								      
								    },
								    error: function() {
								      // 요청 실패 시 처리할 코드 작성
								      console.log('데이터 업데이트 또는 삭제 실패');
								    }
								  });
				    		 
				    		  
				    		} 
	
				    	
		    	}		    
		    /* ---------------------------------------------------------------------------------------------- */
		  });




        calendar.render();

        /* 이벤트 추가 */
        var currColor = '#3c8dbc' // 기본적으로 빨강

        // 색상 선택 버튼
        $('#color-chooser > li > a').click(function (e) {
          e.preventDefault()
          // 색상 저장
          currColor = $(this).css('color')
          // 버튼에 색상 효과 추가
          $('#add-new-event').css({
            'background-color': currColor,
            'border-color'    : currColor
          })
        })

        $('#add-new-event').click(function (e) {
          e.preventDefault()
          // 값 가져오고 null이 아닌지 확인합니다
          var val = $('#new-event').val()
          if (val.length == 0) {
            return
          }

          // 이벤트 생성
          var event = $('<div />')
          event.css({
            'background-color': currColor,
            'border-color'    : currColor,
            'color'           : '#fff'
          }).addClass('external-event')
          event.text(val)
          $('#external-events').prepend(event)

          // 드래그 가능하도록 기능 추가
          ini_events(event)


		    // 텍스트 입력란에서 이벤트 삭제
		    $('#new-event').val('')
		  })
		})
	  function cl_ev(){
		console.log('일정목록 호출'); 
		console.log(calendar.getEvents());	  
		/* console.log(events[]); */
	  };
	  
	  /* -----------------------------------------------------------------------------------------  */
		 /*  sendEventsToServer(); */

		  function sendEventsToServer() {
			  var events = calendar.getEvents(); // 현재 캘린더의 이벤트 배열 가져오기
				
			
			  var eventData = events.map(function(event) {				 
			    return {
			    	 content: event.title,
			    	    start_date: event.start,
			    	    end_date: event.end,
			    	    allDay: event.allDay,
			    	    backgroundColor: event.backgroundColor,
			    	    borderColor: event.borderColor,
			      		project_calendar_id : event.id,
			      		project_id :  $('#project_id').val()
			    };
			    
			  });
			  
			  console.log(eventData);
			  var jsonData = JSON.stringify(eventData);
			  // AJAX 요청 전송
			  $.ajax({
				  url: '/ProjectcalendarUpdate.ajax',
				  type: 'POST',
				  data: jsonData,
				  contentType: 'application/json',
				  success: function(response) {
				    console.log(response);
				    alert('일정이 등록되었습니다!');
				    location.href='/projectCalendar.go?project_id=' + $('#project_id').val()+'&project_name='+ $('#project_name').val(); 
				    calendar.render();
				  },
				  error: function(error) {
					  console.log(error);
				  }
				});
			}
	
		  /* -----------------------------------------------------------------------------------------  */



 
        
function closeModal() {
     // 모달 창 닫기 및 모달 폼 초기화
     $('#modal').hide();
     $('#modal-form')[0].reset();
   }
   

        


</script>

</body>
<script>
</script>
</html>