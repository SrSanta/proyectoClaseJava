<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.iesbelen.model.Fabricante"%>
<%@page import="java.util.List"%>
<%@ page import="org.iesbelen.dto.FabricanteDTO" %>
<%@ page import="org.iesbelen.model.Usuario" %>
<%@ page import="java.util.Optional" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Fabricantes</title>
	<style>
		.clearfix::after {
			content: "";
			display: block;
			clear: both;
		}
	</style>
</head>
<body>
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
				<h1>Fabricantes</h1>
			</div>
			<div style="float: none;width: auto;overflow: hidden;min-height: 80px;position: relative;">
				<div style="position: absolute; left: 39%; top : 39%;">
					<%
						if (session.getAttribute("usuario-logado") != null && "administrador".equals(usu.get().getRol())){
					%>
					<form action="${pageContext.request.contextPath}/tienda/fabricantes/crear">
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
			<div style="float: left;width: 33%">Código</div>
			<div style="float: left;width: 33%">Nombre</div>
			<div style="float: none;width: auto;overflow: hidden;">Acción</div>
		</div>
		<div class="clearfix">
			<hr/>
		</div>
	<% 
        if (request.getAttribute("listaFabricantes") != null) {
            List<FabricanteDTO> listaFabricanteDTO = (List<FabricanteDTO>)request.getAttribute("listaFabricantes");
            
            for (FabricanteDTO fabricante : listaFabricanteDTO) {
    %>

		<div style="margin-top: 6px;" class="clearfix">
			<div style="float: left;width: 33%"><%= fabricante.getIdFabricante()%></div>
			<div style="float: left;width: 33%"><%= fabricante.getNombre()%></div>
			<div style="float: left;width: 10%"><%= fabricante.getCantProductos()%></div>
			<div style="float: none;width: auto;overflow: hidden;">
				<form action="${pageContext.request.contextPath}/tienda/fabricantes/<%= fabricante.getIdFabricante()%>" style="display: inline;">
    				<input type="submit" value="Ver Detalle" />
				</form>

				<%
					if (session.getAttribute("usuario-logado") != null && "administrador".equals(usu.get().getRol())){
				%>

				<form action="${pageContext.request.contextPath}/tienda/fabricantes/editar/<%= fabricante.getIdFabricante()%>" style="display: inline;">
    				<input type="submit" value="Editar" />
				</form>
				<form action="${pageContext.request.contextPath}/tienda/fabricantes/borrar/" method="post" style="display: inline;">
					<input type="hidden" name="__method__" value="delete"/>
					<input type="hidden" name="codigo" value="<%= fabricante.getIdFabricante()%>"/>
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
		No hay registros de fabricante
	<% } %>
	</div>
</body>
</body>
</html>