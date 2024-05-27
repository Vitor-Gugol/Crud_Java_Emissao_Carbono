<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.crudjspjava.dao.consumoDao, com.crudjspjava.bean.Usuario" %>
<%
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        String tipoEnergia = request.getParameter("tipoEnergia");
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));
        java.sql.Date data = java.sql.Date.valueOf(request.getParameter("data"));

        Usuario usuario = new Usuario();
        usuario.setId(id);
        usuario.setTipoEnergia(tipoEnergia);
        usuario.setQuantidade(quantidade);
        usuario.setData(data);

        int status = consumoDao.updateUsuario(usuario);

        if (status > 0) {
            response.sendRedirect("viewusuarios.jsp");
        } else {
            response.sendRedirect("editform.jsp?id=" + id + "&error=true");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("editform.jsp?id=" + request.getParameter("id") + "&error=true");
    }
%>
