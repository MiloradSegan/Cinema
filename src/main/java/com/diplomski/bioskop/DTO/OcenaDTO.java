package com.diplomski.bioskop.DTO;

import com.diplomski.bioskop.model.Film;

public class OcenaDTO {
	
	private int id;
	
	private double ocena;
	
	private Film film;
	
	

	public OcenaDTO(int id, double ocena, Film film) {
		super();
		this.id = id;
		this.ocena = ocena;
		this.film = film;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getOcena() {
		return ocena;
	}

	public void setOcena(float ocena) {
		this.ocena = ocena;
	}

	public Film getFilm() {
		return film;
	}

	public void setFilm(Film film) {
		this.film = film;
	}
	
	
	
	

}
