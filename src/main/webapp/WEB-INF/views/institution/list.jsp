<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Instytucje</title>
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
           <h4><table>
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Nazwa</th>
                    <th>Opis</th>
                    <th>Akcje</th>
                </tr>
                </thead>
                <c:forEach items="${institution}" var="institution">
                <tbody>
                <tr>
                    <td>${institution.id}</td>
                    <td>${institution.name}</td>
                    <td>${institution.description}</td>

                    <td>
                        <a href="<c:url value="/institution/delete/${institution.id}"/>">Usuń</a>
                        <a href="<c:url value="/institution/edit/${institution.id}"/>">Edytuj</a>
                        <a href="<c:url value="/institution/details/${institution.id}"/>">Szczegóły</a>
                    </td>
                </tr>
                </c:forEach>
                </tbody>
           </h4>
            </table>
        </div>
    </div>
</header>



<jsp:include page="../footer.jsp"/>

</body>
</html>
