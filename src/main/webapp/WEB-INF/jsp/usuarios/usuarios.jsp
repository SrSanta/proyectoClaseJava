<%--
  Created by IntelliJ IDEA.
  User: Julian
  Date: 22/11/2024
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.List"%>
<%@ page import="org.iesbelen.model.Usuario" %>
<%@ page import="java.util.Optional" %>

<html>
<head>
    <title>Usuarios</title>
    <style>
        .clearfix::after {
            content: "";
            display: block;
            clear: both;
        }
    </style>
</head>
<body>
<%
    Optional<Usuario> usu = Optional.ofNullable((Usuario) session.getAttribute("usuario-logado"));
    if (usu.isPresent()){
%>
<h3><%= usu.get().getUsuario()%></h3>
<div>
    <form action="<%=application.getContextPath()%>/tienda/usuarios/logout/" method="post">
        <input type="hidden" name="__method__" value="logout" />
        <div style="position: absolute; left: 39%; top : 39%;">
            <input class="btn btn-secondary btn-lg" type="submit" value="logout"/>
        </div>
    </form>
</div>
<%
} else {
%>
<div><a class="btn btn-secondary btn-lg" href="<%=application.getContextPath()%>/tienda/usuarios/login">LOGIN</a></div>
<%
    }
%>
<div id="contenedora" style="float:none; margin: 0 auto;width: 900px;" >
    <div class="clearfix">
        <div style="float: left; width: 50%">
            <h1>Usuarios</h1>
        </div>
        <div style="float: none;width: auto;overflow: hidden;min-height: 80px;position: relative;">

            <div style="position: absolute; left: 39%; top : 39%;">
                <%
                    if (session.getAttribute("usuario-logado") != null && "administrador".equals(usu.get().getRol())){
                %>
                <form action="${pageContext.request.contextPath}/tienda/usuarios/crear">
                    <input type="submit" value="Crear">
                </form>
                <%
                    }
                %>
            </div>

        </div>
    </div>
    <div class="clearfix">
        <hr/>
    </div>
    <div class="clearfix">
        <div style="float: left;width: 10%">idUsuario</div>
        <div style="float: left;width: 30%">Usuario</div>
        <%
            if (usu.isPresent()){
        %>
        <div style="float: left;width: 20%">password</div>
        <%
            }
        %>
        <div style="float: left;width: 20%;overflow: hidden;">Rol</div>
    </div>
    <div class="clearfix">
        <hr/>
    </div>
    <%
        if (request.getAttribute("listaUsuarios") != null) {
            List<Usuario> listaUsuarios= (List<Usuario>)request.getAttribute("listaUsuarios");

            for (Usuario usuario : listaUsuarios) {
    %>

    <div style="margin-top: 6px;" class="clearfix">
        <div style="float: left;width: 10%"><%= usuario.getIdUsuario()%></div>
        <div style="float: left;width: 30%"><%= usuario.getUsuario()%></div>
        <%
            if (usu.isPresent()){
        %>
        <div style="float: left;width: 20%"><%= usuario.getPassword().substring(0,4)%></div>
        <%
            }
        %>
        <div style="float: left;width: 20%"><%= usuario.getRol()%></div>
        <div style="float: none;width: auto;overflow: hidden;">
            <form action="${pageContext.request.contextPath}/tienda/usuarios/<%= usuario.getIdUsuario()%>" style="display: inline;">
                <input type="submit" value="Ver Detalle" />
            </form>
            <%
                if (session.getAttribute("usuario-logado") != null && "administrador".equals(usu.get().getRol())){
            %>
            <form action="${pageContext.request.contextPath}/tienda/usuarios/editar/<%= usuario.getIdUsuario()%>" style="display: inline;">
                <input type="submit" value="Editar" />
            </form>
            <form action="${pageContext.request.contextPath}/tienda/usuarios/borrar/" method="post" style="display: inline;">
                <input type="hidden" name="__method__" value="delete"/>
                <input type="hidden" name="codigo" value="<%= usuario.getIdUsuario()%>"/>
                <input type="submit" value="Eliminar" />
            </form>
            <%
                }
            %>
        </div>
    </div>
    <%
        }
    } else {
    %>
    No hay registros de usuarios
    <% } %>
</div>

</body>
</html>
