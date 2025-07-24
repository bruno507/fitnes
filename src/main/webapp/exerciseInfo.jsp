<%@ page contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page import="si.am.fitnes2.Entitete.Exercise"%>
<%@ page import="si.am.fitnes2.Entitete.User"%>
<%@ page import="si.am.fitnes2.DBase.ExerciseHelper" %>
<%@ page import="si.am.fitnes2.DBase.UserHelper" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="CSS/assets/css/main.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Fitnes Hit me up</title>
</head>
	<body>
		<%
		Exercise exercise = ExerciseHelper.getExercise(Integer.parseInt(request.getParameter("idExercise")));
			User coach = UserHelper.getUser(exercise.getCoach());
			String back;
			if(request.isUserInRole("2")) {
				back = "coach.jsp#allExercise";
			}
			else {
				back = "user.jsp#vaje";
			}
		%>
		<section id="sidebar">
			<div class="inner">
				<nav>
					<ul>
						<li><a href="<%=back%>">Nazaj na vaje</a></li>
						<li><a href="#info">Opis</a></li>
						<li><a href="#video">YouTube</a></li>
					</ul>
				</nav>
			</div>
		</section>
		<div id="wrapper">
	
			<!-- INFO -->
			<section id="info" class="wrapper style1 fullscreen fade-up">
				<div class="inner">
					<h1>Opis vaje <%=exercise.getTitle() %></h1>
					<%if(request.getAttribute("status")!=null) {%>
					<h3 class="red center"><%=request.getAttribute("status") %></h3> <%} %>
					<%if(request.isUserInRole("2")) {%>
					<a class="button special" href="editExercise.jsp?idExe=<%=exercise.getId()%>"> Uredi vajo</a>
					<form action="deleteExercise" class="line" method="post"
						  onsubmit="return confirm('Želite izbrisati to vajo?')">
						<input type="hidden" name="idExe" value="<%=exercise.getId()%>">
						<input class="red" type="submit" value="Izbriši vajo" />
					</form>
					<% }
                        assert coach != null;%>
					<h2>Opis:</h2>
					<%=exercise.getDescription() %>
					<h2>Avtor vaje:</h2>
					<%=coach.getName() %>
					<%=coach.getLastN() %>
				</div>
			</section>

			<!-- YOUTUBE -->
			<section id="video" class="wrapper style1 fullscreen fade-up">
				<div class="inner">
					<h1>YouTube</h1>
					<div>
						<iframe src="https://www.youtube.com/embed/<%=exercise.getLink1() %>"></iframe>
		    		 	<br/>
					<% if (exercise.getLink2()!=null) { %>
						<iframe src="https://www.youtube.com/embed/<%=exercise.getLink2() %>"></iframe>
		    		 	<br/>
		    		<% } %>
					</div>
				</div>
			</section>
		</div>
	</body>
	<script src="CSS/assets/js/jquery.min.js"></script>
	<script src="CSS/assets/js/jquery.scrollex.min.js"></script>
	<script src="CSS/assets/js/jquery.scrolly.min.js"></script>
	<script src="CSS/assets/js/skel.min.js"></script>
	<script src="CSS/assets/js/util.js"></script>
	<script src="CSS/assets/js/main.js"></script>
</html>