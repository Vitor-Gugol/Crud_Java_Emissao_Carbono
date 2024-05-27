<%@page language="java" contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="Style.css">
<title>Edição do usuário</title>
</head>
<body>
    <%@page import="com.crudjspjava.dao.consumoDao, com.crudjspjava.bean.Usuario" %>
    <%
        String id = request.getParameter("id");
        Usuario usuario = consumoDao.getRegistroById(Integer.parseInt(id));
    %>
    <h1>Edição do Usuário</h1>
    <form action="editusuario.jsp" method="post">
        <table>
            <tr>
                <td class="titleInput">Tipo de energia:</td>
                <td>
                    <select name="tipoEnergia">
                        <option value="Carvão" <%= usuario.getTipoEnergia().equals("Carvão") ? "selected" : "" %>>Carvão</option>
                        <option value="Energia Hidrelétrica"  <%= usuario.getTipoEnergia().equals("Energia Hidrelétrica") ? "selected" : "" %>>Energia Hidrelétrica</option>
                        <option value="Eólica" selected <%= usuario.getTipoEnergia().equals("Eólica") ? "selected" : "" %>>Eólica</option>
                        <option value="Gás Natural" <%= usuario.getTipoEnergia().equals("Gás Natural") ? "selected" : "" %>>Gás Natural</option>
                        <option value="Óleo" <%= usuario.getTipoEnergia().equals("Óleo") ? "selected" : "" %>>Óleo</option>
                        <option value="Solar" <%= usuario.getTipoEnergia().equals("Solar") ? "selected" : "" %>>Solar</option>
                        <option value="Petróleo" <%= usuario.getTipoEnergia().equals("Petróleo") ? "selected" : "" %>>Petróleo</option>
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
