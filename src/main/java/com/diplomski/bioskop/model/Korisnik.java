package com.diplomski.bioskop.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.validation.constraints.Size;
import javax.persistence.*;


@Entity
@Table(name = "korisnici")
public class Korisnik {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name= "id_korisnik")
	private int idKorisnik;
	@Column(name= "ime_korisnika")
	private String imeKorisnika;
	@Column(name= "prezime_korisnika")
	private String prezimeKorisnika;
	@Size(min = 4, message = "morate uneti najmanje 4 karaktera")
	@Column(name= "username")
	private String username;
	@Size(min = 6, message = "morate uneti najmanje 4 karaktera")
	@Column(name= "password")
	private String password;
	@Enumerated(EnumType.STRING)
	@Column(name= "role")
	private Role role;

	@OneToMany(mappedBy = "korisnik", cascade = CascadeType.ALL)
	private List<Ocena> ocene;

	@OneToMany(mappedBy = "korisnik", cascade = CascadeType.ALL)
	private List<Karta> karte;

	@OneToMany(mappedBy = "korisnik", cascade = CascadeType.ALL)
	private List<Komentar> komentari;

	@OneToOne(mappedBy = "korisnik")
	private Rezervacija rezervacije;

	public Korisnik() {

	}
	
	
	public List<Karta> getKarte() {
		return karte;
	}

	public void setKarte(List<Karta> karte) {
		this.karte = karte;
	}

	public List<Komentar> getKomentari() {
		return komentari;
	}

	public void setKomentari(List<Komentar> komentari) {
		this.komentari = komentari;
	}

	public Rezervacija getRezervacije() {
		return rezervacije;
	}

	public void setRezervacije(Rezervacija rezervacije) {
		this.rezervacije = rezervacije;
	}

	public int getIdKorisnik() {
		return idKorisnik;
	}

	public void setIdKorisnik(int idKorisnik) {
		this.idKorisnik = idKorisnik;
	}

	public String getImeKorisnika() {
		return imeKorisnika;
	}

	public void setImeKorisnika(String imeKorisnika) {
		this.imeKorisnika = imeKorisnika;
	}

	public String getPrezimeKorisnika() {
		return prezimeKorisnika;
	}

	public void setPrezimeKorisnika(String prezimeKorisnika) {
		this.prezimeKorisnika = prezimeKorisnika;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public List<Ocena> getOcene() {
		return ocene;
	}

	public void setOcene(List<Ocena> ocene) {
		this.ocene = ocene;
	}

}
