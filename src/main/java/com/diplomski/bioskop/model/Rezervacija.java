package com.diplomski.bioskop.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import javax.validation.constraints.*;

@Entity
@Table(name="rezervacije")

public class Rezervacija   {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idRez;
	
	
	private Integer brMestaRez;
	/*(fetch = FetchType.LAZY,
            cascade =  CascadeType.ALL,
            mappedBy = "user")*/
	@ManyToOne()
	@JoinColumn(name="id_projekcije")
	private Projekcija projekcija;
	
	@OneToOne()
	@JoinColumn(name="id_korisnika")
	private Korisnik korisnik;
	
	
	public Rezervacija() {
	
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

	public int getIdRez() {
		return idRez;
	}

	public void setIdRez(int idRez) {
		this.idRez = idRez;
	}

	public Integer getBrMestaRez() {
		return brMestaRez;
	}

	public void setBrMestaRez(Integer brMestaRez) {
		this.brMestaRez = brMestaRez;
	}

	
	
	

}
