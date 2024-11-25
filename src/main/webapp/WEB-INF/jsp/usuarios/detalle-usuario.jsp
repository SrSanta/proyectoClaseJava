<%@ page import="org.iesbelen.model.Usuario" %>
<%@ page import="java.util.Optional" %><%--
  Created by IntelliJ IDEA.
  User: Julian
  Date: 22/11/2024
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detalle Usuario</title>
</head>
<body>
<div id="contenedora" style="float:none; margin: 0 auto;width: 900px;" >
    <div class="clearfix">
        <div style="float: left; width: 50%">
            <h1>Detalle Usuario</h1>
        </div>
        <div style="float: none;width: auto;overflow: hidden;min-height: 80px;position: relative;">

            <div style="position: absolute; left: 39%; top : 39%;">

                <form action="${pageContext.request.contextPath}/tienda/usuarios" >
                    <input type="submit" value="Volver" />
                </form>
            </div>

        </div>
    </div>

    <div class="clearfix">
        <hr/>
    </div>

    <% 	Optional<Usuario> optUsu = (Optional<Usuario>)request.getAttribute("usuario");
        if (optUsu.isPresent()) {
    %>

    <div style="margin-top: 6px;" class="clearfix">
        <div style="float: left;width: 50%">
            <label>idUsuario</label>
        </div>
        <div style="float: none;width: auto;overflow: hidden;">
            <input value="<%= optUsu.get().getIdUsuario() %>" readonly="readonly"/>
        </div>
    </div>
    <div style="margin-top: 6px;" class="clearfix">
        <div style="float: left;width: 50%">
            <label>Usuario</label>
        </div>
        <div style="float: none;width: auto;overflow: hidden;">
            <input value="<%= optUsu.get().getUsuario() %>" readonly="readonly"/>
        </div>
    </div>
    <div style="margin-top: 6px;" class="clearfix">
        <div style="float: left;width: 50%">
            <label>password</label>
        </div>
        <div style="float: none;width: auto;overflow: hidden;">
            <input value="<%= optUsu.get().getPassword() %>" readonly="readonly"/>
        </div>
    </div>
    <div style="margin-top: 6px;" class="clearfix">
        <div style="float: left;width: 50%">
            <label>rol</label>
        </div>
        <div style="float: none;width: auto;overflow: hidden;">
            <input value="<%= optUsu.get().getRol() %>" readonly="readonly"/>
        </div>
    </div>

    <% 	} else { %>

    request.sendRedirect("usuarios/");

    <% 	} %>

</div>
</body>
</html>
