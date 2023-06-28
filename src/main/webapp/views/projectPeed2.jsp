<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>spring boot</title>

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
<link rel="stylesheet" href="/richtexteditor/rte_theme_default.css">
<link rel="stylesheet" href="/richtexteditor/res/style.css">


<script src="/richtexteditor/rte.js"></script>
<script src="/richtexteditor/plugins/all_plugins.js"></script>



<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>


<style>
b {
	color: red;
}

table {
	width: 100%;
}

table, td, th {
	border: 1px solid;
	border-collapse: collapse;
	padding: 5px;
}

#paging {
	text-align: center;
}

#writeForm {
	float: right;
}

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

.modal {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
}

/* * {
  padding:0;
  margin:0;
  box-sizing: border-box;
} */
/* #btnWrap {
	width: 500px;
	margin: 100px auto;
} */
#popupBtn {
	width: 50px;
	height: 30px;
	padding: 4px 4px;
	float: right;
	margin-right: 34px;
}

#modalWrap {
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	display: none;
}

#modalBody {
	width: 500px;
	height: 600px;
	padding: 86px 53px;
	margin: 109px 381px;
	border: 5px solid #777;
	background-color: #fff;
	width: 72%;
}

#closeBtn {
	width: 80px;
	height: 33px;
	padding: 4px 4px;
	float: left;
	font-weight: bold;
	color: #777;
	font-size: 17px;
	cursor: pointer;
}

#delete {
	width: 80px;
	height: 33px;
	padding: 4px 4px;
	float: right;
	font-weight: bold;
	color: #777;
	font-size: 17px;
	cursor: pointer;
}

body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

#header {
	background-color: #3b5998;
	color: #fff;
	padding: 20px;
}

#content {
	margin: 20px;
}

.post {
	background-color: #f6f7f8;
	border: 1px solid #dddfe2;
	padding: 20px;
	margin-bottom: 20px;
}

.post .post-header {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 10px;
}

.post .post-content {
	font-size: 14px;
	margin-bottom: 10px;
}

.post .post-footer {
	color: #777;
	font-size: 12px;
}

#loading {
	display: none;
	text-align: center;
	margin: 20px;
}

textarea {
	overflow: auto;
	resize: vertical;
	width: 95%;
}

.post {
	background-color: #f6f7f8;
	border: 1px solid #dddfe2;
	padding: 20px;
	margin-bottom: 20px;
	width: 95%;
}
</style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<jsp:include page="header.jsp" />
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<!-- Content Wrapper. Contains page content -->
			<div class="content-wrapper">
				<!-- Content Header (Page header) -->
				<div class="content-header">
					<div class="container-fluid">
						<div class="row mb-2">
							<div class="col-sm-6">
								<h1 class="m-0"><a href="/projectCalendar.go">일정</a>|<a href="/projectPeed.go">피드</a></h1>
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

				<p>
					
					<button type="button" id="popupBtn">등록</button>
				</p>


				


				<div id="modalWrap">
					<div id="modalBody">
						<!-- <span id="closeBtn">&times;</span> -->

						<form id="bbs" action="write.do" method="post">
							<div id="div_editor"></div>
							<input id="content" type=hidden name="content">
						</form>

						<input type="button" onclick="save()" value="저장">
						<button id="closeBtn">닫기</button>
					</div>
				</div>

				<!-- <div id="content">
					<div id="timeline">
						게시물이 추가될 위치
					</div>
				</div> -->

				<!-- Post -->
				<div class="post">
					<div class="user-block">
						<img class="img-circle img-bordered-sm"
							src="../../dist/img/user1-128x128.jpg" alt="user image"> <span
							class="username"> <a href="#">Jonathan Burke Jr.</a> <a
							href="#" class="float-right btn-tool"><i class="fas fa-times"></i></a>
						</span> <span class="description">Shared publicly - 7:30 PM today</span>
					</div>
					<!-- /.user-block -->
					<p>Lorem ipsum represents a long-held tradition for designers,
						typographers and the like. Some people hate it and argue for its
						demise, but others ignore the hate as they create awesome tools to
						help create filler text for everyone from bacon lovers to Charlie
						Sheen fans.</p>

					
				</div>
				<!-- /.post -->





				<!-- /.content -->
			</div>
			<!-- /.content-wrapper -->




		</div>
	</div>


	<jsp:include page="footer.jsp" />

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

	<!-- ChartJS(차트) -->
	<script src="plugins/chart.js/Chart.min.js"></script>

	<!-- fullCalendar 2.2.5 (캘린더) -->
	<script src="plugins/moment/moment.min.js"></script>
	<script src="plugins/fullcalendar/main.js"></script>
</body>
<script>

var config={}
config.editorResizeMode = "none"; //에디터 크기조절:none

//파일 업로드
config.file_upload_handler = function(file,callback){// file정보, 이미지 경로 변경 함수
	console.log(file);// 크기, 이름, 종류 등을 알 수 있다.
	console.log(callback);
	if (file.size > (1*1024*1024)) {
		alert('1MB이상의 파일은 올릴 수 가 없습니다.');
		callback('/img/noimage.png');
	}
}

var editor = new RichTextEditor("#div_editor",config);

function save(){
	console.log('저장');
	var content = editor.getHTMLCode();
	console.log(content.length);
	if (content.length >(4*1024*1024)) {
		alert('컨텐츠의 크기가 너무 큽니다. 이미지의 크기나 갯수를 줄여주세요');
	}else{
		$('input[name="content"]').val(content);
		$('form').submit();
	}
}

const btn = document.getElementById('popupBtn');
const modal = document.getElementById('modalWrap');
const closeBtn = document.getElementById('closeBtn');

btn.onclick = function() {
	modal.style.display = 'block';
}
closeBtn.onclick = function() {
	modal.style.display = 'none';
}

window.onclick = function(event) {
	if (event.target == modal) {
		modal.style.display = "none";
	}
}

/*
//새로운 게시물 데이터 배열
 var posts = []; // 게시물 데이터 배열

        function addPost() {
            var content = document.getElementById("post-content").value;
            var date = new Date().toLocaleDateString();

            var post = {
                 header: "새 게시물", 
                content: content,
                author: "송수산",
                date: date
            };

            // 서버로 게시물 전송
            
            $.ajax({
                url: 'uploadPeed.ajax',
                type: 'POST',
                data: post,
                dataType: 'json',
                beforeSend: function() {
                    // 로딩 표시
                    $('#loading').show();
                },
                success: function(response) {
                    // 서버 응답 처리
                    console.log(response); // 예시: 서버에서 반환한 응답 데이터 출력

                    // 게시물 배열에 추가
                    posts.unshift(post);

                    // 타임라인 다시 렌더링
                    renderTimeline();

                    // 입력 필드 초기화
                    document.getElementById("post-content").value = "";

                    // 로딩 숨김
                    $('#loading').hide();
                },
                error: function(error) {
                    console.error('Error:', error);
                    // 로딩 숨김
                    $('#loading').hide();
                }
            });
        }


        function renderTimeline() {
            var timeline = document.getElementById("timeline");
            timeline.innerHTML = ""; // 기존 게시물 제거

            for (var i = 0; i < posts.length; i++) {
                var post = posts[i];

                var postElement = document.createElement("div");
                postElement.className = "post";

                var postHeader = document.createElement("div");
                postHeader.className = "post-header";
                postHeader.textContent = "작성자: " + post.author + " | 게시일: " + post.date;

                var postContent = document.createElement("div");
                postContent.className = "post-content";
                postContent.textContent = post.content;

               var postFooter = document.createElement("div");
                postFooter.className = "post-footer";
                postFooter.textContent =  

                postElement.appendChild(postHeader);
                postElement.appendChild(postContent);
                 postElement.appendChild(postFooter); 

                timeline.appendChild(postElement);
            }
        }

        renderTimeline(); // 초기 타임라인 렌더링
*/

$(function () {

    /* initialize the external events
     -----------------------------------------------------------------*/
    function ini_events(ele) {
      ele.each(function () {

        // create an Event Object (https://fullcalendar.io/docs/event-object)
        // it doesn't need to have a start or end
        var eventObject = {
          title: $.trim($(this).text()) // use the element's text as the event title
        }

        // store the Event Object in the DOM element so we can get to it later
        $(this).data('eventObject', eventObject)

        // make the event draggable using jQuery UI
        $(this).draggable({
          zIndex        : 1070,
          revert        : true, // will cause the event to go back to its
          revertDuration: 0  //  original position after the drag
        })

      })
    }

    ini_events($('#external-events div.external-event'))

    /* initialize the calendar
     -----------------------------------------------------------------*/
    //Date for the calendar events (dummy data)
    var date = new Date()
    var d    = date.getDate(),
        m    = date.getMonth(),
        y    = date.getFullYear()

    var Calendar = FullCalendar.Calendar;
    var Draggable = FullCalendar.Draggable;

    var containerEl = document.getElementById('external-events');
    var checkbox = document.getElementById('drop-remove');
    var calendarEl = document.getElementById('calendar');

    // initialize the external events
    // -----------------------------------------------------------------

    new Draggable(containerEl, {
      itemSelector: '.external-event',
      eventData: function(eventEl) {
        return {
          title: eventEl.innerText,
          backgroundColor: window.getComputedStyle( eventEl ,null).getPropertyValue('background-color'),
          borderColor: window.getComputedStyle( eventEl ,null).getPropertyValue('background-color'),
          textColor: window.getComputedStyle( eventEl ,null).getPropertyValue('color'),
        };
      }
    });

    var calendar = new Calendar(calendarEl, {
      headerToolbar: {
        left  : 'prev,next today',
        center: 'title',
        right : 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      themeSystem: 'bootstrap',
      //Random default events
      events: [
        {
          title          : 'All Day Event',
          start          : new Date(y, m, 1),
          backgroundColor: '#f56954', //red
          borderColor    : '#f56954', //red
          allDay         : true
        },
        {
          title          : 'Long Event',
          start          : new Date(y, m, d - 5),
          end            : new Date(y, m, d - 2),
          backgroundColor: '#f39c12', //yellow
          borderColor    : '#f39c12' //yellow
        },
        {
          title          : 'Meeting',
          start          : new Date(y, m, d, 10, 30),
          allDay         : false,
          backgroundColor: '#0073b7', //Blue
          borderColor    : '#0073b7' //Blue
        },
        {
          title          : 'Lunch',
          start          : new Date(y, m, d, 12, 0),
          end            : new Date(y, m, d, 14, 0),
          allDay         : false,
          backgroundColor: '#00c0ef', //Info (aqua)
          borderColor    : '#00c0ef' //Info (aqua)
        },
        {
          title          : 'Birthday Party',
          start          : new Date(y, m, d + 1, 19, 0),
          end            : new Date(y, m, d + 1, 22, 30),
          allDay         : false,
          backgroundColor: '#00a65a', //Success (green)
          borderColor    : '#00a65a' //Success (green)
        },
        {
          title          : 'Click for Google',
          start          : new Date(y, m, 28),
          end            : new Date(y, m, 29),
          url            : 'https://www.google.com/',
          backgroundColor: '#3c8dbc', //Primary (light-blue)
          borderColor    : '#3c8dbc' //Primary (light-blue)
        }
      ],
      editable  : true,
      droppable : true, // this allows things to be dropped onto the calendar !!!
      drop      : function(info) {
        // is the "remove after drop" checkbox checked?
        if (checkbox.checked) {
          // if so, remove the element from the "Draggable Events" list
          info.draggedEl.parentNode.removeChild(info.draggedEl);
        }
      }
    });

    calendar.render();
    // $('#calendar').fullCalendar()

    /* ADDING EVENTS */
    var currColor = '#3c8dbc' //Red by default
    // Color chooser button
    $('#color-chooser > li > a').click(function (e) {
      e.preventDefault()
      // Save color
      currColor = $(this).css('color')
      // Add color effect to button
      $('#add-new-event').css({
        'background-color': currColor,
        'border-color'    : currColor
      })
    })
    $('#add-new-event').click(function (e) {
      e.preventDefault()
      // Get value and make sure it is not null
      var val = $('#new-event').val()
      if (val.length == 0) {
        return
      }

      // Create events
      var event = $('<div />')
      event.css({
        'background-color': currColor,
        'border-color'    : currColor,
        'color'           : '#fff'
      }).addClass('external-event')
      event.text(val)
      $('#external-events').prepend(event)

      // Add draggable funtionality
      ini_events(event)

      // Remove event from text input
      $('#new-event').val('')
    })
  })


</script>
</html>