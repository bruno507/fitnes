<%@ page contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page import="si.am.fitnes2.DBase.DropByHelper" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="CSS/assets/css/main.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Seznam obiskov</title>
</head>
<body>
<header class="inv noPrint" id="header">
	<a href="userlog" class="title">Fitnes Hit me up</a>
</header>
	<div id="wrapper">
		<%
			int cl;
			String link;
			if(request.isUserInRole("1")) {
				cl = Integer.parseInt(request.getRemoteUser());
				link = "user.jsp"; }
			else {cl = Integer.parseInt(request.getParameter("id"));
			link = "usercheck"; }
			List<String> allvisit = DropByHelper.allDropBy(cl);
		%>
		<section id="intro" class="wrapper style1 fullscreen fade-up">
			<h1>Seznam obiskov</h1>
			<%if(request.getAttribute("status")!=null) {%>
			<h2 class="red center noPrint"><%=request.getAttribute("status") %></h2> <%} %>
			<div class="inner">
				<h2 class="line">Prihod</h2> <h4><i onclick="window.print()" class="fa fa-print noPrint"></i></h4> <input type="submit" id="potrdigumb" class="special line noPrint"
					form="nazaj" value="Nazaj" />
				<table class="medium">
					
					<tr> <%
						for (String visit : allvisit) { %>
						<%="<td>" + visit + "</td>" + "</tr>"%>
						<% ;} %>
					
				</table>

				<form action="<%=link %>" method="get" id="nazaj">
					<input type="hidden" name="id" value="<%=cl%>">
					<input class="special noPrint" type="submit" value="Nazaj" />
				</form>
			</div>
		</section>
	</div>

</body>
</html>