<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>Dziękujemy</title>
  <link rel="stylesheet" href="css/style.css" />
</head>
<body>
<header class="header--form-page">
  <nav class="container container--70">
    <ul class="nav--actions">
      <li class="logged-user">
        <sec:authorize access="isAuthenticated()">
          <p>Witaj <sec:authentication property="principal.username"/></p>
        </sec:authorize>
        <ul class="dropdown">
          <li><a href="#">Profil</a></li>
          <li><a href="#">Moje zbiórki</a></li>
          <li><a href="/logout">Wyloguj</a></li>
        </ul>
      </li>
    </ul>

    <ul>
      <li><a href="/" class="btn btn--without-border active">Start</a></li>
      <li><a href="/#steps" class="btn btn--without-border">O co chodzi?</a></li>
      <sec:authorize access="isAuthenticated()">
        <li><a href="/add#form" class="btn btn--without-border">Przekaż dary</a></li>
      </sec:authorize>
      <li><a href="#/about-us" class="btn btn--without-border">O nas</a></li>
      <li><a href="#/help" class="btn btn--without-border">Fundacje i organizacje</a></li>
      <li><a href="#/contact" class="btn btn--without-border">Kontakt</a></li>
    </ul>
  </nav>

  <div class="slogan container container--90">
    <h2>
      Dziękujemy za przesłanie formularza. Na maila prześlemy wszelkie informacje o odbiorze.
    </h2>
  </div>
</header>

<jsp:include page="footer.jsp"/>

<script src="js/app.js"></script>
</body>
</html>
