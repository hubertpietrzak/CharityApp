<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>Zaloguj</title>
  <link rel="stylesheet" href="css/style.css" />
</head>
<body>

<jsp:include page="header.jsp"/>

<section class="login-page" id="login">
  <h2>Zaloguj się</h2>
  <form method="post">
    <div class="form-group">
      <input type="email" name="username" placeholder="Email" />
    </div>
    <div class="form-group">
      <input type="password" name="password" placeholder="Hasło" />
<%--      <a href="#" class="btn btn--small btn--without-border reset-password">Przypomnij hasło</a>--%>
    </div>

    <div class="form-group form-group--buttons">
      <a href="/register#register" class="btn btn--without-border">Załóż konto</a>
      <button class="btn" type="submit">Zaloguj się</button>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </div>
  </form>
</section>

<jsp:include page="footer.jsp"/>

</body>
</html>
