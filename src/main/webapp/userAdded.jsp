<%@ page contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@page import="si.am.fitnes2.Entitete.User"%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="CSS/assets/css/main.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />


<title>Registracija uspela</title>
</head>
<body>
<header class="inv noPrint" id="header">
	<a href="userlog" class="title">Fitnes Hit me up</a>
</header>
	<%
		User user = (User) request.getAttribute("user");

	%>

	<div id="wrapper">
		<section id="main" class="wrapper style1 fullscreen fade-up nicebg">
			<div class="inner center">

				<h1>Uporabnik registriran <i onclick="window.print()" class="fa fa-print noPrint"></i></h1>
				<h3>ID: <%=user.getId()%></h3>
				<h3>Geslo: <%=user.getPassword()%></h3>
				<h3>Ime: <%=user.getName()%></h3>
				<h3>Priimek: <%=user.getLastN()%></h3>
				<h3>Email: <%=user.getEmail()%></h3>

				<a href="staff.jsp"> <button class="special noPrint">Nazaj</button></a>
			</div>
		</section>
	</div>
</body>
</html>