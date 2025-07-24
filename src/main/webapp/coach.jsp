<%@ page contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page import="si.am.fitnes2.Entitete.Exercise" %>
<%@ page import="si.am.fitnes2.DBase.ExerciseHelper" %>
<%@ page import="si.am.fitnes2.Entitete.User" %>
<%@ page import="si.am.fitnes2.DBase.UserHelper" %>
<%@ page import="java.util.Objects" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="CSS/assets/css/main.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Trener</title>
</head>
<body>
<% User user = UserHelper.getUser(Integer.parseInt(request.getRemoteUser()));
%>
	<section id="sidebar">
		<div class="inner">
			<nav>
				<ul>
					<li><a href="#intro">Domov</a></li>
					<li><a href="#allExercise">Pregled vaj</a></li>
					<li><a href="#addExercise">Vnesi vajo</a></li>
					<li><a href="#changePass">Spremeni geslo</a></li>
					<li><a href="logout">Odjava</a>
				</ul>
			</nav>
		</div>
	</section>
	<div id="wrapper">
		<!-- Dobrodošli -->
		<section id="intro" class="wrapper style1 fullscreen fade-up">
		<h1 class="major">Fitnes Hit me up</h1>
			<div class="inner">

				<h2>Dobrodošli <%=user.getName()%> <%=user.getLastN()%></h2>
				<h4>ID:</h4> <%=user.getId()%> <br>
				<h4>E-mail:</h4> <%=user.getEmail()%>
			</div>
		</section>
		
		<!-- Pregled vaj -->
		<section id="allExercise" class="wrapper style1 fullscreen fade-up">
			<div class="inner">
				<h1>Pregled vaj</h1>
				<%if(request.getAttribute("status")!=null) {%>
				<h3 class="red center"><%=request.getAttribute("status") %></h3> <%} %>
				<%
					for(Exercise vl : Objects.requireNonNull(ExerciseHelper.allExercise())){
				%>
				<div id="notranjiDiv">
				    <h3> <%=vl.getTitle() %></h3>

					<iframe src="https://www.youtube.com/embed/<%=vl.getLink1() %>"></iframe>
	    		 	<br/>

				    <a class="button small right" href="exerciseInfo.jsp?idExercise=<%=vl.getId() %>"> Podrobnosti</a>
				</div>
				<%	}	%>
			</div>
		</section>
	<!-- Vnesi vajo -->
		<section id="addExercise" class="wrapper style1 fullscreen fade-up">
			<div class="inner">
				<h1 class="center">Vnesi vajo</h1>
				<form name="vnos" method="post" action="addExercise" id="vnos" onsubmit="return checkLink();">
					<label for="naziv">Ime vaje</label>
					<input type="text" name="naziv" id="naziv" required autocomplete="off"/><br />
					<label for="comment">Opis vaje</label>
					<textarea id="comment" rows="4" cols="50" name="comment" ></textarea><br />
					<label for="link1">YouTube URL</label>
					<input id="link1" class="medium" type="text" name= "link1" required autocomplete="off"/><br />
					<label for="link2">YouTube URL 2 (opcijsko)</label>
					<input id="link2" class="medium" type="text" name= "link2" autocomplete="off"/>
					<br />
					<input class="special" type = "submit" value="Vnesi vajo"/><br />
				</form>
			</div>
		</section>

	<!-- Spremeni geslo -->
		<section id="changePass" class="wrapper style1 fullscreen fade-up nicebg">
			<div class="inner">
				<h1>Spremeni geslo</h1>
				<form name="spremeni" method="post" action="changePass" id="spremeni" onsubmit="return checkPass();">
					<input class="small" type="password" name="old" placeholder="Trenutno geslo" required/><br />
					<input class="small" type="password" name="new" placeholder="Novo geslo" required/><br />
					<input class="small" type="password" name="new2" placeholder="Potrdite geslo" required/><br />
					<input class="center special" type = "submit" value="Spremeni geslo"/><br />
					<%if(request.getAttribute("passStatus")!=null) {%>
					<h3 class="red center"><%=request.getAttribute("passStatus") %></h3> <%} %>
				</form>
			</div>
		</section>
	</div>
	<!-- Scripts -->
	<script>
		document.addEventListener("DOMContentLoaded", function () {
			document.getElementById("<%=request.getAttribute("scroll")%>").scrollIntoView()});
	</script>
	<script src="CSS/assets/js/jquery.min.js"></script>
	<script src="CSS/assets/js/jquery.scrollex.min.js"></script>
	<script src="CSS/assets/js/jquery.scrolly.min.js"></script>
	<script src="CSS/assets/js/skel.min.js"></script>
	<script src="CSS/assets/js/util.js"></script>
	<script src="CSS/assets/js/main.js"></script>
	<script src="CSS/assets/js/custom.js"></script>
</body>
</html>