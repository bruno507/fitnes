<%@ page contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page import="si.am.fitnes2.Entitete.User" %>
<%@ page import="si.am.fitnes2.DBase.UserHelper" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="CSS/assets/css/main.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>clani</title>
</head>
<body>
		<section id="vsi_clani" class="wrapper style1">
			<div class="inner">
					<ul>
					<% for (User up : UserHelper.getAllUsers(1)) { %>

					<li><%=up%></li>
					<% 	} %>
				</ul>
			</div>
		</section>
</body>
</html>