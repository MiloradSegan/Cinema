package com.diplomski.bioskop.model;

import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name="karte")
public class Karta {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idKarta;
	private Integer brojKarata;
	private float cenaKarte;
	private Date datumProdaje;
	private float suma;
	
	@ManyToOne
	@JoinColumn(name="id_projekcije")
	private Projekcija projekcija;
	
	@ManyToOne
	@JoinColumn(name="id_korisnika")
	private Korisnik korisnik;
	
	public Karta() {
		
	}
	
	public Projekcija getProjekcija() {
		return projekcija;
	}

	public void setProjekcija(Projekcija projekcija) {
		this.projekcija = projekcija;
	}

	public Korisnik getKorisnik() {
		return korisnik;
	}

	public void setKorisnik(Korisnik korisnik) {
		this.korisnik = korisnik;
	}

	public int getIdKarta() {
		return idKarta;
	}
	public void setIdKarta(int idKarta) {
		this.idKarta = idKarta;
	}
	
	public Integer getBrojKarata() {
		return brojKarata;
	}

	public void setBrojKarata(Integer brojKarata) {
		this.brojKarata = brojKarata;
	}

	public float getCenaKarte() {
		return cenaKarte;
	}
	public void setCenaKarte(float cenaKarte) {
		this.cenaKarte = cenaKarte;
	}
	public Date getDatumProdaje() {
		return datumProdaje;
	}
	public void setDatumProdaje(Date datumProdaje) {
		this.datumProdaje = datumProdaje;
	}
	public float getSuma() {
		return suma;
	}
	public void setSuma(float suma) {
		this.suma = suma;
	}
	
	

}
