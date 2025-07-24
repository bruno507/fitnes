
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="CSS/assets/css/main.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Prijava</title>
</head>
<body>
<header class="inv" id="header">
    <a href="home" class="title">Fitnes Hit me up</a>
</header>

<section id="login" class="wrapper style1 fullscreen fade-up nicebg">
    <div class="inner">
        <h1>Prijava uporabnika</h1>
        <form method="post" action="j_security_check">
            <input class="small" type="text" name="j_username" placeholder="Id uporabnika" required /><br />
            <input class="small" type="password" name="j_password" placeholder="Geslo" required /><br />
            <input class="center special" type = "submit" value="Vpis"/>
        </form>
        <a href="license.jsp">Splošni pogoji</a>
    </div>
</section>

<!-- Scripts -->
<script src="CSS/assets/js/jquery.min.js"></script>
<script src="CSS/assets/js/jquery.scrollex.min.js"></script>
<script src="CSS/assets/js/jquery.scrolly.min.js"></script>
<script src="CSS/assets/js/skel.min.js"></script>
<script src="CSS/assets/js/util.js"></script>
<script src="CSS/assets/js/main.js"></script>
</body>
</html>
