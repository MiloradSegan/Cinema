package com.diplomski.bioskop.DTO;

import java.sql.Time;
import java.util.Calendar;
import java.util.Date;

import com.diplomski.bioskop.model.Film;

public class ProjekcijaDTO {
	private int idPro;
	private double cena;
	private String danPrikazivanja;
	private int brMesta;
	private String sala;
	private String tipProjekcije;
	private String vreme;
	private Film film;
	 
	public ProjekcijaDTO(int idPro, double cena, int brMesta, String sala,
			String tipProjekcije, Film film) {
		super();
		this.idPro = idPro;
		this.cena = cena;
		this.brMesta = brMesta;
		this.sala = sala;
		this.tipProjekcije = tipProjekcije;
		this.film = film;
	}
	public ProjekcijaDTO(int idPro, double cena,String danPrikazivanja, int brMesta, String sala,
			String tipProjekcije, String vreme, Film film) {
		super();
		this.idPro = idPro;
		this.cena = cena;
		this.danPrikazivanja = danPrikazivanja;
		this.brMesta = brMesta;
		this.sala = sala;
		this.tipProjekcije = tipProjekcije;
		this.vreme = vreme;
		this.film = film;
	}
	public Film getFilm() {
		return film;
	}
	public void setFilm(Film film) {
		this.film = film;
	}
	public int getIdPro() {
		return idPro;
	}
	public void setIdPro(int idPro) {
		this.idPro = idPro;
	}
	public double getCena() {
		return cena;
	}
	public void setCena(double cena) {
		this.cena = cena;
	}
	public String getDanPrikazivanja() {
		return danPrikazivanja;
	}
	public void setDanPrikazivanja(String danPrikazivanja) {
		this.danPrikazivanja = danPrikazivanja;
	}
	public int getBrMesta() {
		return brMesta;
	}
	public void setBrMesta(int brMesta) {
		this.brMesta = brMesta;
	}
	public String getSala() {
		return sala;
	}
	public void setSala(String sala) {
		this.sala = sala;
	}
	public String getTipProjekcije() {
		return tipProjekcije;
	}
	public void setTipProjekcije(String tipProjekcije) {
		this.tipProjekcije = tipProjekcije;
	}
	public String getVreme() {
		return vreme;
	}
	public void setVreme(String vreme) {
		this.vreme = vreme;
	}
}
