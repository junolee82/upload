<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MyPage</title>
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<style type="text/css">
/* 네비게이션 바 */
/* #header {width: 1000px; padding:0px;} */
.navbar-default {background-color: white;}
#top { background-color: #f2f2f2; height: 150px; border-bottom: 4px solid #0054FF;}
#topTextBox { width: 1000px; margin:0 auto; padding-top: 110px; font-size: 1.2em; font-weight: bold; color: #0054FF;}
/* 회원페이지 */
#myPage { width: 1000px; padding: 0px; padding-top: 50px; margin: 0 auto; height: 1000px;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script type="text/javascript">
	$(function(){
		var template = Handlebars.compile($("#template").html());		
		
		$(".container").on("dragenter dragover", function(event){
			event.preventDefault();
		});
		
		$(".container").on("drop", function(event){
			event.preventDefault();
			
			var files = event.originalEvent.dataTransfer.files;
			var file = files[0];
			var formData = new FormData();
			formData.append("file", file);
			
			$.ajax({
				url : "/uploadAjax",
				data : formData,
				dataType : "text",
				processData : false,
				contentType : false,
				type : "POST",
				success : function(data) {
					var fileInfo = getFileInfo(data);
					var html = template(fileInfo);
					$(".uploadedList").append(html);
				}
			});
		});
		
	}); //end ready
	
</script>
<script type="text/x-handlebars-template" id="template">
	<div class="col-sm-6 col-md-3">
		<div class="thumbnail">
			<img src="{{imgsrc}}" alt="Attachment" />
			<div class="caption">
				<p>
					<a href="{{getLink}}">{{fileName}}</a>
					<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</a>
				</p>
			</div>
		</div>
	</div>
</script>
</head>
<body>
	<div class="container-fluid" id="top">
	
		<!-- 네비게이션 바 -->
		<nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="navbar-scroll">
			<div class="container" id="header">
				<ul class="nav navbar-nav" id="menu">
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>					
				</ul>
			</div>		
		</nav>
		
		<div id="topTextBox">
			<p>upload</p>
		</div>	
			
	</div>
	
	<div class="container" id="myPage">
		<div class="row">
			<div class="col-md-12" id="titleBox">

				<div class="row uploadedList">
										  	
				</div>				
					
			</div>
		</div>
	</div>

</body>
</html>