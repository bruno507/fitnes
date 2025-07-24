<%@ page import="si.am.fitnes2.Entitete.Exercise" %>
<%@ page import="si.am.fitnes2.DBase.ExerciseHelper" %>
<%@ page contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sprememba vaj</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="CSS/assets/css/main.css" />
</head>
<%Exercise exercise = ExerciseHelper.getExercise(Integer.parseInt(request.getParameter("idExe")));
request.setAttribute("vaja", exercise);
%>
<body>
<!-- Header -->
			<header class="inv" id="header">
				<a href="home" class="title">Fitnes Hit me up</a>
			</header>
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Main -->
					<section id="main" class="wrapper style1 fullscreen fade-up">
						<div class="inner">
							<h1>Sprememba vaje</h1>
								<form name="vnos" method="post" action="updateExercise" id="vnos" onsubmit="return checkLink();">
									<input type="hidden" value="<%=exercise.getId()%>" name="id"/>
									<label for="title" >Naziv</label>
									<input type="text" id="title" name="title" value="<%=exercise.getTitle()%>"  required/><br />
									<label for="comment" >Opis</label>
									<textarea rows="4" cols="50" id="comment" name="comment" required><%=exercise.getDescription()%></textarea><br />
									<label for="link1" >YouTube URL</label>
									<input class="big" type="text" id="link1" name="link1" value="www.youtube.com/watch?v=<%=exercise.getLink1()%>" required/>
									<br />
									<label for="link2" >YouTube URL (opcijsko)</label>
									<input class="big" type="text" id="link2" name="link2" value="<%if(exercise.getLink2()!=null) {%>www.youtube.com/watch?v=<%=exercise.getLink2() %><% }%>" />
									<br />
									<input class="special" type = "submit" value="Spremeni vajo"/>
								</form>
								<a href="exerciseInfo.jsp?idVaje=<%=exercise.getId()%>"><button>Nazaj</button></a><br />
						</div>
					</section>
			</div>
		<!-- Scripts -->
			<script src="CSS/assets/js/jquery.min.js"></script>
			<script src="CSS/assets/js/jquery.scrollex.min.js"></script>
			<script src="CSS/assets/js/jquery.scrolly.min.js"></script>
			<script src="CSS/assets/js/skel.min.js"></script>
			<script src="CSS/assets/js/util.js"></script>
			<script src="CSS/assets/js/main.js"></script>
			<script src="CSS/assets/js/custom.js"></script>
</body>
</html>