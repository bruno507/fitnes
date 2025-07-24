<%@ page contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page import="si.am.fitnes2.DBase.PackageHelper" %>
<%@ page import="si.am.fitnes2.Entitete.User" %>
<%@ page import="java.util.List" %>
<%@ page import="si.am.fitnes2.Entitete.PackageSold" %>
<%@ page import="org.joda.time.DateTime" %>
<%@ page import="si.am.fitnes2.Entitete.Package" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="CSS/assets/css/main.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Seznam obiskov</title>
</head>
<body>
	<header class="inv" id="header">
		<a href="home" class="title">Fitnes Hit me up</a>
	</header>
	<div id="wrapper">
		<section id="intro" class="wrapper style1 fullscreen fade-up">
			<div class="inner">
				<%
					User user = (User) request.getAttribute("user");
					int id = user.getId();
					int obiski = user.getVisit();
					List<Package> pacDef = PackageHelper.getPackageDef();
					List<PackageSold> allPac = PackageHelper.getPackageSold(id);
					String pname;
					String pstart;
					String pendstr;
					long now = new DateTime().getMillis();
					long end;
                    if(!allPac.isEmpty() && allPac.getFirst().getEnd().getTime() > now) {
						pname = allPac.getFirst().getTitle();
						pstart = allPac.getFirst().getStartString();
						pendstr = allPac.getFirst().getKonecString();
						end = allPac.getFirst().getEnd().getTime();
						allPac.removeFirst();
					}
					else {
						pname = "/";
						pstart = "/";
						pendstr = "/";
						end = 0;
					}
				%>
				<h1>
					Paketi člana
					<%=user%>
					</h1>
				<h3>Email: <%=user.getEmail()%></h3>
				<br />
				<form action="confirmVisit" id="potrdi" method="post" class="line">
						<input type="hidden" name="id" value="<%=id%>">
						<input type="hidden" name="package" value="<%=end %>">
						<input type="hidden" name="visit" value="<%=obiski %>">
						<input class="special" type="submit" value="Potrdi prihod" />
				</form>
				
				<form action="visitList.jsp" class="line" method="get">
					<input type="hidden" name="id" value="<%=id%>">
					<input type="submit" value="Seznam obiskov" />
				</form>
				<form action="resetPass" class="line" method="post"
					onsubmit="return confirm('Želite resetirati geslo za tega uporabnika?')">
					<input type="hidden" name="id" value="<%=id%>">
					<input type="submit" value="Resetiraj geslo" />
				</form>
				<a href="staff.jsp">
					<button>Nazaj</button>
				</a>
				<br />
				<%if(request.getAttribute("status")!=null) {%>
				<h4 class="red"><%=request.getAttribute("status") %></h4> <%} %>
				<h2>Trenutni paket</h2>
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
						<td><%=obiski%></td>

				</table>
				<div class="line">
				<h2>Dodaj paket</h2>
				<form method="post" action="addPackage">
					<input type="hidden" name="id" value="<%=id%>"/>
					<input type="hidden" name="tip" value="1"/>
					<select class="line" name="idPac" id="demo-category" required>
						<option value="">- Izberi paket -</option>
						<%
                            for (Package s : pacDef) { %>
						<option value="<%=s.getId()%>"><%=s%></option>
						<% } %>
					</select>

					<input class="line" type="submit" value="Dodaj"/>
				</form>
					</div>
				<div class="line">
				<h2>Dodaj obiske</h2>
				<form method="post" action="addPackage">
					<input type="hidden" name="id" value="<%=id%>"/>
					<input type="hidden" name="tip" value="0"/>
					<input class="line medium" type="number" min="0" name="obiski"
						   step="1" placeholder="št. obiskov" required>
					<input class="line" type="submit" value="Dodaj"/>
				</form>
				</div>
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
				<a href="staff.jsp">
					<button>Nazaj</button>
				</a>
			</div>
		</section>
	</div>
</body>