<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.iesbelen.model.Fabricante"%>
<%@page import="java.util.List"%>
<%@ page import="org.iesbelen.model.Producto" %>
<%@ page import="org.iesbelen.model.Usuario" %>
<%@ page import="java.util.Optional" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Productos</title>
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
				<h1>Productos</h1>
			</div>
			<div style="float: none;width: auto;overflow: hidden;min-height: 80px;position: relative;">
				
				<div style="position: absolute; left: 39%; top : 39%;">
					<%
						if (session.getAttribute("usuario-logado") != null && "administrador".equals(usu.get().getRol())){
					%>
						<form action="${pageContext.request.contextPath}/tienda/productos/crear">
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
			<div style="float: left;width: 10%">Código</div>
			<div style="float: left;width: 30%">Nombre</div>
			<div style="float: left;width: 20%">Precio</div>
			<div style="float: left;width: 20%;overflow: hidden;">Acción</div>
		</div>
		<div class="clearfix">
			<hr/>
		</div>
	<% 
        if (request.getAttribute("listaProductos") != null) {
            List<Producto> listaProducto= (List<Producto>)request.getAttribute("listaProductos");
            
            for (Producto producto : listaProducto) {
    %>

		<div style="margin-top: 6px;" class="clearfix">
			<div style="float: left;width: 10%"><%= producto.getIdProducto()%></div>
			<div style="float: left;width: 30%"><%= producto.getNombre()%></div>
			<div style="float: left;width: 20%"><%= producto.getPrecio()%></div>
			<div style="float: none;width: auto;overflow: hidden;">
				<form action="${pageContext.request.contextPath}/tienda/productos/<%= producto.getIdProducto()%>" style="display: inline;">
    				<input type="submit" value="Ver Detalle" />
				</form>
				<%
					if (session.getAttribute("usuario-logado") != null && "administrador".equals(usu.get().getRol())){
				%>
				<form action="${pageContext.request.contextPath}/tienda/productos/editar/<%= producto.getIdProducto()%>" style="display: inline;">
    				<input type="submit" value="Editar" />
				</form>
				<form action="${pageContext.request.contextPath}/tienda/productos/borrar/" method="post" style="display: inline;">
					<input type="hidden" name="__method__" value="delete"/>
					<input type="hidden" name="codigo" value="<%= producto.getIdProducto()%>"/>
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
		No hay registros de producto
	<% } %>
	</div>
</body>
</body>
</html>