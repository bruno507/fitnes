<%@ page contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page import="si.am.fitnes2.Entitete.User" %>
<%@ page import="si.am.fitnes2.DBase.UserHelper" %>
<%@ page import="java.util.Optional" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="CSS/assets/css/main.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Receptor</title>
</head>
<body>
<% User user = UserHelper.getUser(Integer.parseInt(request.getRemoteUser()));
    assert user != null;%>
	<section id="sidebar">
		<div class="inner">
			<nav>
				<ul>
					<li><a href="#intro">Domov</a></li>
					<li><a href="#members">Pregled članov</a></li>
					<li><a href="#regUser">Registracija uporabnika</a></li>
					<li><a href="#changePass">Spremeni geslo</a></li>
					<li><a href="logout">Odjava</a></li>
				</ul>
			</nav>
		</div>
	</section>
	<div id="wrapper">
		<section id="intro" class="wrapper style1 fullscreen fade-up nicebg">
			<h1 class="major">Fitnes Hit me up</h1>
			<div class="inner">				
				<h2>Dobrodošli <%=user.getName()%> <%=user.getLastN()%></h2>
				<h4>ID:</h4> <%=user.getId()%> <br>
				<h4>E-mail:</h4> <%=user.getEmail()%>
			</div>
		</section>
		<!-- pregled -->
		<section id="members" class="wrapper style1 fullscreen fade-up nicebg">
			<h1>Pregled članov</h1>
			<div class="inner">
				<h2 class="splitr"> Vsi člani</h2>
				<div class="split">
					<section>
						<form method="get" action="usercheck" >
							<div class="field">
								<input type="number" name="id" placeholder="ID člana" required/>
							</div>
							<input type="submit" value="Poišči" />
						</form>
						<%if(request.getAttribute("eror")!=null) {%>
						<h4 class="red"><%=request.getAttribute("eror") %></h4> <%} %>
					</section>
					<iframe src="allUsers.jsp"></iframe>
				</div>
			</div>
		</section>
		
		<!-- registracija -->
		<section id="regUser"
			class="wrapper style1 fullscreen fade-up nicebg">
			<div class="inner">
				<h2>Registracija Uporabnika</h2>

				<div class="split style1">
					<section>
					<form method="post" action="addUser"
							accept-charset="UTF-8">
						<div class="field half first">
								<label for="name">Ime</label> <input type="text" id="name" name="name" required autocomplete="off"/>
							</div>
							<div class="field half first">
								<label for="name2">Priimek</label> <input type="text" id="name2"
									name="name2" required autocomplete="off"/>
							</div>
							<div class="field half first">
								<label for="email">E-mail uporabnika</label> <input type="email" id="email"
									name="email" required autocomplete="off"/>
							</div>
							<div class="field half first">
								<label for="selectRole">Izberi vrsto uporabnika</label>
							<select name="role" id="selectRole" required>
								<option value="">- Izberi -</option>
								<option value="1">Član</option>
								<option value="2">Trener</option>
								<option value="3">Receptor</option>
							</select> </div>

								<input class="special center" type="submit" value="Registracija" />
						</form>

					</section>
					<section>
							<b>Zadnji registriran član</b>
						<ul>
							<% Optional <User> member = UserHelper.getAllUsers(1).stream().findFirst();
								if(member.isPresent()) {
							%>
							<li><%=member.get()%></li>
							<% }%>

						</ul>
							<b>Zadnji registriran trener</b>
							<ul>
							<% Optional <User> coach = UserHelper.getAllUsers(2).stream().findFirst();
							if (coach.isPresent()) {
							%>
							
							<li><%=coach.get()%></li>
							<% } %>
							</ul>
							<b>Zadnji registriran receptor</b>
							<ul>
							<% Optional <User> staff = UserHelper.getAllUsers(3).stream().findFirst();
							if (staff.isPresent()) {
							%>
							
							<li><%=staff.get()%></li>
							<% } %>
				</ul>
			</section>
				</div>
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