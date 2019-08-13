package com.diplomski.bioskop.model;

import java.util.Date;
import javax.persistence.*;

@Entity
@Table(name="komentari")
public class Komentar  {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int  idKom;
	private Date datumKom;
	private String tekst;
	
	@ManyToOne
	@JoinColumn(name="id_filma")
	private Film film;
	
	@ManyToOne
	@JoinColumn(name = "id_korisnika")
	private Korisnik korisnik;
	
	public Komentar() {
		
	}

	
	public Film getFilm() {
		return film;
	}


	public void setFilm(Film film) {
		this.film = film;
	}


	public Korisnik getKorinsik() {
		return korisnik;
	}


	public void setKorinsik(Korisnik korinsik) {
		this.korisnik = korinsik;
	}


	public int getIdKom() {
		return idKom;
	}
	public void setIdKom(int idKom) {
		this.idKom = idKom;
	}
	public Date getDatumKom() {
		return datumKom;
	}
	public void setDatumKom(Date datumKom) {
		this.datumKom = datumKom;
	}
	public String getTekst() {
		return tekst;
	}
	public void setTekst(String tekst) {
		this.tekst = tekst;
	}


	@Override
	public String toString() {
		return "Komentar [datumKom=" + datumKom + ", tekst=" + tekst + ", korisnik=" + korisnik + "]";
	}
	
	
	

}
