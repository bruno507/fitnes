<%@ page contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page import="si.am.fitnes2.Entitete.Exercise"%>
<%@ page import="si.am.fitnes2.Entitete.User"%>
<%@ page import="si.am.fitnes2.DBase.PackageHelper" %>
<%@ page import="si.am.fitnes2.DBase.ExerciseHelper" %>
<%@ page import="si.am.fitnes2.DBase.UserHelper" %>
<%@ page import="si.am.fitnes2.Entitete.PackageSold" %>
<%@ page import="java.util.List" %>
<%@ page import="org.joda.time.DateTime" %>
<%@ page import="si.am.fitnes2.Entitete.Exercise" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="CSS/assets/css/main.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Fitnes Hit me up</title>
</head>
<body>
<% User user = UserHelper.getUser(Integer.parseInt(request.getRemoteUser()));
    assert user != null;
	List<PackageSold> allPac = PackageHelper.getPackageSold(user.getId());
	String pname;
	String pstart;
	String pendstr;
	long now = new DateTime().getMillis();
    if(!allPac.isEmpty() && allPac.getFirst().getEnd().getTime() > now) {
		pname = allPac.getFirst().getTitle();
		pstart = allPac.getFirst().getStartString();
		pendstr = allPac.getFirst().getKonecString();
        allPac.removeFirst();
	}
	else {
		pname = "/";
		pstart = "/";
		pendstr = "/";
    }
%>
	<section id="sidebar">
		<div class="inner">
			<nav>
				<ul>
					<li><a href="#intro">Dobrodošli</a></li>
					<li><a href="#packages">Moji paketi</a></li>
					<li><a href="#exercise">Vaje</a></li>
					<li><a href="#favExercise">Moje vaje</a></li>
					<li><a href="#changePass">Spremeni geslo</a></li>
					<li><a href="logout">Odjava</a></li>
					
				</ul>
			</nav>
		</div>
	</section>
	<div id="wrapper">

		<!-- Dobrodošli -->
		<section id="intro" class="wrapper style1 fullscreen fade-up"> 
		<h1 class="major">Fitnes Hit me up</h1>
					<div class="inner">
					<h2>Dobrodošli
				<%= user.getName() %>
				<%= user.getLastN()%>
				</h2>
				<h4>Šifra: </h4><%=user.getId()%><br />
				<h4>E-mail: </h4><%=user.getEmail()%><br>
			</div>
		</section>
		
		<!-- Moji paketi -->
		<section id="packages" class="wrapper style1 fullscreen fade-up">
			<div class="inner">
				<h1>Moji paketi</h1>
				
				<h2 class="line">Trenutni paket</h2>
				<a href="visitList.jsp" > <button class="special line">Seznam obiskov</button> </a>
				<table class="medium">
					<tr>
						<td><strong>Naziv paketa</strong></td>
						<td><strong>Začetek veljavnosti</strong></td>
						<td><strong>Konec veljavnosti</strong></td>
						<td><strong>Zakupljeno obiskov</strong></td>
					</tr>
					<tr>
						<td><%=pname%></td>
						<td><%=pstart%></td>
						<td><%=pendstr%></td>
						<td><%=user.getVisit()%></td>
					</tr>
				</table>
			 	
				<h2>Pretekli paketi</h2>
					<table class="medium">
					<tr>
						<td><strong>Naziv paketa</strong></td>
						<td><strong>Začetek veljavnosti</strong></td>
						<td><strong>Konec veljavnosti</strong></td>
					</tr>
					<tr>
							<%	for(PackageSold pac : allPac) { %>
							<%="<td>" + pac.getTitle() + "</td>"%>
							<%="<td>" + pac.getStartString() + "</td>"%>
							<%="<td>" + pac.getKonecString() + "</td>" + "</tr>"%>
							<% } %>
				</table>
			</div>
		</section>
				
		<!-- Vaje -->
		<section id="exercise" class="wrapper style1 fullscreen fade-up">
			<div class="inner">
				<h1>Vaje</h1>
				<%
					List<Exercise> userFav = ExerciseHelper.getUserFavExercise(user.getId());
					int add;
					String submit;
					String sp;
					for(Exercise vl : ExerciseHelper.allExercise()){
						if(userFav.contains(vl)){
							add = 0;
							submit = "odstrani priljubljeno";
							sp = null;
						}
						else {
							add = 1;
							submit = "dodaj priljubljeno";
							sp = "special";
						}

				%>
				<div id="notranjiDiv" >
				    <h3> <%=vl.getTitle() %></h3>
				
					<iframe src="https://www.youtube.com/embed/<%=vl.getLink1() %>"></iframe>
	    		 	<br/>

					<form method="post" action="favExercise" >
						<input type="hidden" name="idExe" value="<%=vl.getId() %>"/>
						<input type="hidden" name="add" value="<%=add%>">
						<input class="small <%=sp%>" type="submit" value="<%=submit%>" />
					<a class="button small right special" href="exerciseInfo.jsp?idExercise=<%=vl.getId() %>"> Podrobnosti</a>
					</form>
				</div>
				<%		}	%>
			</div>
		</section>
				
		<!-- Moje vaje -->
		<section id="favExercise" class="wrapper style1 fullscreen fade-up">
			<div class="inner">
				<h1>Moje vaje</h1>
				<%	for(Exercise vl : userFav){		%>
				
				<div id="notranjiDiv">
				    <h3><%=vl.getTitle() %></h3>

						<iframe src="https://www.youtube.com/embed/<%=vl.getLink1() %>"></iframe>
		    		 	<br/>
					<form method="post" action="favExercise" >
						<input type="hidden" name="idExe" value="<%=vl.getId() %>"/>
						<input type="hidden" name="add" value="0">
						<input class="small" type="submit" value="odstrani priljubljeno" />
						<a class="button small right special" href="exerciseInfo.jsp?idExercise=<%=vl.getId() %>"> Podrobnosti</a>
					</form>
					</div>
				<%	}	%>
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