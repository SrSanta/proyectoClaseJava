<%--
  Created by IntelliJ IDEA.
  User: Andrés
  Date: 28/11/2024
  Time: 12:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="login-container">
  <h2>Iniciar sesión</h2>

  <form action="${pageContext.request.contextPath}/tienda/usuarios/login/" method="post">
    <input type="hidden" name="__method__" value="login" />
    <div style="margin-top: 6px;" class="clearfix">
      <div style="float: left;width: 50%">
        Usuario:
      </div>
      <div style="float: none;width: auto;overflow: hidden;">
        <input name="usuario" />
      </div>
      <div style="float: left;width: 50%">
        password:
      </div>
      <div style="float: none;width: auto;overflow: hidden;">
        <input name="password" />
      </div>
    </div>
    <div style="float: none;width: auto;overflow: hidden;min-height: 80px;position: relative;">

      <div style="position: absolute; left: 39%; top : 39%;">
        <input type="submit" value="login"/>
      </div>

    </div>
  </form>

</div>
</body>
</html>
