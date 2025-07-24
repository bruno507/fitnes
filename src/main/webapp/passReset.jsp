<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="CSS/assets/css/main.css" />
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Resetiranje gesla</title>
</head>
<body>
<!-- Header -->
<header class="inv noPrint" id="header">
  <a href="home" class="title">Fitnes Hit me up</a>
</header>
<div id="wrapper">

  <section id="intro" class="wrapper style1 fullscreen fade-up">
    <h1>Resetiranje gesla <i onclick="window.print()" class="fa fa-print noPrint"></i></h1>
    <div class="inner">
      <h2> ID člana : <%=request.getParameter("id")%></h2>
      <h2> Novo geslo je: <%=request.getAttribute("new")%> </h2>

      <form action="usercheck" method="get">
        <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
        <input class="special noPrint" type="submit" value="Nazaj" />
      </form>
    </div>
  </section>
</div>
</body>
</html>