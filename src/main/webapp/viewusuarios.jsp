<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="Style.css">
<title>Visualização de Usuários</title>
</head>
<body>
	<%@ page import ="com.crudjspjava.dao.consumoDao,com.crudjspjava.bean.*,java.util.*" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c"%>
	<%@page contentType="text/html; charset=UTF-8" %>
	
	
	
	<h1>Energias</h1>
	
	<br>
	<a href="addusuarioform.jsp" class="add">Adicionar novo usuário </a>
	<br>
	
	
	<%
		List<Usuario> list = consumoDao.getAllUsuarios();
		request.setAttribute("list", list);
		%>
	
	<table class="table">
		<tr class="tableHeader"> 
		<th>Tipo de energia</th>
		<th>Quantidade</th>
		<th>Data</th>
		<th>Editar</th>
		<th>Apagar</th>
		</tr>
		<c:forEach items="${list}" var="usuario">
            <tr>
            <td>${usuario.getTipoEnergia()}</td>
            <td>${usuario.getQuantidade()}</td>
            <td>${usuario.getData()}</td>
            
            <td><a href="editform.jsp?id=${usuario.getId()}"> Editar </a></td>
            <td><a href="deleteusuario.jsp?id=${usuario.getId()}"> Excluir </a></td>
            </tr>
        </c:forEach>
	</table>
	
	
	
</body>
</html>