package com.crudjspjava.bean;

import java.util.Date;

public class Usuario {
	private int id;
	private String tipoEnergia;
	private int quantidade;
	private Date data;
	
	
	
	//id
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	//TipoEnergia
	public String getTipoEnergia() {
		return tipoEnergia;
	}
	public void setTipoEnergia(String tipoEnergia) {
		this.tipoEnergia = tipoEnergia;
	}
	
	//Quantidade
	public int getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	
	
	//Data
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	
}
