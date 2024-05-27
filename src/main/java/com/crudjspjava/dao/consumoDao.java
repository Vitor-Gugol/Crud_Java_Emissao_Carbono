package com.crudjspjava.dao;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.crudjspjava.bean.Usuario;

public class consumoDao {

	public static Connection getConnection() {
		Connection con = null;
	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projeto_esg", "root","");
		}catch(Exception e) {
			System.out.println(e);
		}
		return con;
		
		}
	
	public static int deletarUsuario(Usuario u) {
		int status = 0; 
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement)con.prepareStatement("DELETE FROM consumoenergia WHERE id=?");
			ps.setInt(1, u.getId());
			
			status =ps.executeUpdate();
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	
	
	
	
	
	public static int salvarUsuario(Usuario u) {
		int status = 0;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("INSERT INTO consumoenergia (tipo_energia, quantidade, data) VALUES (?, ?, ?)");
			ps.setString(1, u.getTipoEnergia());
			ps.setInt(2, u.getQuantidade());
			ps.setDate(3, new Date(u.getData().getTime()));
			
			status = ps.executeUpdate();
		}catch(Exception e){
			System.out.println(e);
		}
		return status;
	}
	
	public static Usuario getRegistroById(int id) {
	    Usuario usuario = null;
	    Connection con = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    
	    try {
	        con = getConnection();
	        ps = con.prepareStatement("SELECT * FROM consumoenergia WHERE id = ?");
	        ps.setInt(1, id);
	        rs = ps.executeQuery();
	        if (rs.next()) {
	            usuario = new Usuario();
	            usuario.setId(rs.getInt("id"));
	            usuario.setTipoEnergia(rs.getString("tipo_energia"));
	            usuario.setQuantidade(rs.getInt("quantidade"));
	            usuario.setData(rs.getDate("data"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (con != null) con.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return usuario;
	}


	
	public static int updateUsuario(Usuario u) {
	    int status = 0;
	    try {
	        Connection con = getConnection();
	        PreparedStatement ps = con.prepareStatement("UPDATE consumoenergia SET tipo_energia=?, quantidade=?, data=? WHERE id=?");
	        ps.setString(1, u.getTipoEnergia());
	        ps.setInt(2, u.getQuantidade());
	        ps.setDate(3, new java.sql.Date(u.getData().getTime()));
	        ps.setInt(4, u.getId());
	        status = ps.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return status;
	}


	
	
	
	public static List<Usuario> getAllUsuarios(){
		List<Usuario> list = new ArrayList<Usuario>();
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement)con.prepareStatement("SELECT * FROM  consumoenergia");
			ResultSet rs = ps.executeQuery();
			
			
			while(rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				
				usuario.setTipoEnergia(rs.getString("tipo_energia"));     
				usuario.setQuantidade(rs.getInt("quantidade"));
				usuario.setData(rs.getDate("data"));
				list.add(usuario);
			}
		}catch(Exception e){
		    e.printStackTrace(); 
		}

		return list;
	}
	}
