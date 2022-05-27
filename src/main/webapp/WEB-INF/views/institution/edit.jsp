<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Edytuj</title>
    <link rel="stylesheet" href="/resources/css/style.css" />
</head>
<body>

<header class="header--main-page">
    <nav class="container container--70">
        <ul class="nav--actions">
            <sec:authorize access="isAuthenticated()">
                <li class="logged-user">
                    <p>Witaj <sec:authentication property="principal.username"/></p>
                    <ul class="dropdown">
                        <li><a href="#">Profil</a></li>
                        <li><a href="#">Moje zbiórki</a></li>
                        <li><a href="/logout">Wyloguj</a></li>
                        <li><a href="/institution/list">Instytucje</a></li>
                    </ul>
                </li>
            </sec:authorize>
            <sec:authorize access="!isAuthenticated()">
                <li><a href="/login#login" class="btn btn--small btn--without-border">Zaloguj</a></li>
                <li><a href="/register#register" class="btn btn--small btn--highlighted">Załóż konto</a></li>
            </sec:authorize>
        </ul>

        <ul>
            <li><a href="/" class="btn btn--without-border active">Start</a></li>
            <li><a href="/#steps" class="btn btn--without-border">O co chodzi?</a></li>
            <sec:authorize access="isAuthenticated()">
                <li><a href="/add#form" class="btn btn--without-border">Przekaż dary</a></li>
            </sec:authorize>
            <li><a href="/#about-us" class="btn btn--without-border">O nas</a></li>
            <li><a href="/#help" class="btn btn--without-border">Fundacje i organizacje</a></li>
            <li><a href="/#contact" class="btn btn--without-border">Kontakt</a></li>

        </ul>
    </nav>

    <div class="slogan container container--90">
        <div class="slogan--item">
            <div>
            <h4>
                <form:form method="post" modelAttribute="institution" action="/institution/update">
                    <form:hidden path="id"/><br>
                    Nazwa instytucji <form:input path="name"/><br>
                    <form:errors path="name"/><br>
                    Opis instytucji <form:input path="description"/><br>
                    <form:errors path="description"/><br>

                    <input type="submit">

                    <br>
                    <a href="/institution/list">Powrót</a>
                </form:form>

            </h4>
            </div>
        </div>
    </div>
</header>



<jsp:include page="../footer.jsp"/>

</body>
</html>
