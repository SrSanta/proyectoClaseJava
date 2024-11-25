<%--
  Created by IntelliJ IDEA.
  User: Julian
  Date: 22/11/2024
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Crear Usuario</title>
</head>
<body>

<div id="contenedora" style="float:none; margin: 0 auto;width: 900px;" >
    <form action="${pageContext.request.contextPath}/tienda/usuarios/crear/" method="post">
        <div class="clearfix">
            <div style="float: left; width: 50%">
                <h1>Crear Usuario</h1>
            </div>
            <div style="float: none;width: auto;overflow: hidden;min-height: 80px;position: relative;">

                <div style="position: absolute; left: 39%; top : 39%;">
                    <input type="submit" value="Crear"/>
                </div>

            </div>
        </div>

        <div class="clearfix">
            <hr/>
        </div>

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
            <div style="float: left;width: 50%">
                Rol
            </div>
            <div style="float: none;width: auto;overflow: hidden;">
                <input name="rol" />
            </div>
        </div>

    </form>
</div>
</body>
</html>
