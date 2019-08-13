package com.diplomski.bioskop.model;

import java.sql.Time;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;


@Entity
@Table(name="projekcije")
public class Projekcija  {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idPro;
	@Min(value=100, message="minimalna cena je 100 ")
	private Double cena;
	@Temporal(TemporalType.DATE)
	//@JsonFormat(pattern="dd-MM-yyyy")
	private Date datum;
	@Min(value=100, message="asdsadasdas")
	private Integer brMesta;
	private String sala;
	private String tipProjekcije;
	private Time vreme;
	
	
	@ManyToOne
	@JoinColumn(name="idf")
	private Film film;
	
	@OneToMany(mappedBy="projekcija", cascade=CascadeType.ALL)
	private List<Karta> karte;
	
	@OneToMany(mappedBy="projekcija",cascade=CascadeType.ALL)
	private List<Rezervacija> rezervacije;
	
	public Projekcija() {
		
	}

	public Film getFilm() {
		return film;
	}

	public void setFilm(Film film) {
		this.film = film;
	}

	public List<Karta> getKarte() {
		return karte;
	}

	public void setKarte(List<Karta> karte) {
		this.karte = karte;
	}

	public List<Rezervacija> getRezervacije() {
		return rezervacije;
	}

	public void setRezervacije(List<Rezervacija> rezervacije) {
		this.rezervacije = rezervacije;
	}	
	public int getIdPro() {
		return idPro;
	}
	public void setIdPro(int idPro) {
		this.idPro = idPro;
	}
	public Double getCena() {
		return cena;
	}
	public void setCena(Double cena) {
		this.cena = cena;
	}
	public Date getDatum() {
		return datum;
	}
	public void setDatum(Date danPrikazivanja) {
		this.datum = danPrikazivanja;
	}
	public Integer getBrMesta() {
		return brMesta;
	}
	public void setBrMesta(Integer brMesta) {
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
	public Time getVreme() {
		return vreme;
	}
	public void setVreme(Time l) {
		this.vreme = l;
	}

	@Override
	public String toString() {
		return "Projekcija [idPro=" + idPro + ", cena=" + cena + ", danPrikazivanja=" + datum + ", brMesta="
				+ brMesta + ", sala=" + sala + ", tipProjekcije=" + tipProjekcije + ", vreme=" + vreme + "]";
	}

	
	
	
	
	
	

}
