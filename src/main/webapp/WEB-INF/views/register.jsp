<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>Register</title>
  <link rel="stylesheet" href="css/style.css" />
</head>
<body>

<jsp:include page="header.jsp"/>

<section class="login-page" id="register">
  <h2>Załóż konto</h2>
  <form:form method="post" modelAttribute="user">
    <div class="form-group">
      <input type="text" name="username" placeholder="Username" />
    </div>
    <div class="form-group">
      <input type="email" name="email" placeholder="Email" />
    </div>
    <div class="form-group">
      <input type="password" name="password" placeholder="Hasło" />
    </div>


    <div class="form-group form-group--buttons">
      <a href="/login#login" class="btn btn--without-border">Zaloguj się</a>
      <button class="btn" type="submit">Załóż konto</button>
    </div>
  </form:form>
</section>

<jsp:include page="footer.jsp"/>

</body>
</html>

