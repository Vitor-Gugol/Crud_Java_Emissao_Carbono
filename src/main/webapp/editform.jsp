<%@page language="java" contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="Style.css">
<title>Edi��o do usu�rio</title>
</head>
<body>
    <%@page import="com.crudjspjava.dao.consumoDao, com.crudjspjava.bean.Usuario" %>
    <%
        String id = request.getParameter("id");
        Usuario usuario = consumoDao.getRegistroById(Integer.parseInt(id));
    %>
    <h1>Edi��o do Usu�rio</h1>
    <form action="editusuario.jsp" method="post">
        <table>
            <tr>
                <td class="titleInput">Tipo de energia:</td>
                <td>
                    <select name="tipoEnergia">
                        <option value="Carv�o" <%= usuario.getTipoEnergia().equals("Carv�o") ? "selected" : "" %>>Carv�o</option>
                        <option value="Energia Hidrel�trica"  <%= usuario.getTipoEnergia().equals("Energia Hidrel�trica") ? "selected" : "" %>>Energia Hidrel�trica</option>
                        <option value="E�lica" selected <%= usuario.getTipoEnergia().equals("E�lica") ? "selected" : "" %>>E�lica</option>
                        <option value="G�s Natural" <%= usuario.getTipoEnergia().equals("G�s Natural") ? "selected" : "" %>>G�s Natural</option>
                        <option value="�leo" <%= usuario.getTipoEnergia().equals("�leo") ? "selected" : "" %>>�leo</option>
                        <option value="Solar" <%= usuario.getTipoEnergia().equals("Solar") ? "selected" : "" %>>Solar</option>
                        <option value="Petr�leo" <%= usuario.getTipoEnergia().equals("Petr�leo") ? "selected" : "" %>>Petr�leo</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="titleInput">Quantidade:</td>
                <td><input type="number" name="quantidade" value="<%=usuario.getQuantidade()%>"/> </td>
            </tr>
            <tr>
                <td class="titleInput">Data: </td>
                <td><input type="date" name="data" value="<%=usuario.getData()%>"/> </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="hidden" name="id" value="<%=usuario.getId()%>"/>
                    <input type="submit" value="Editar">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
