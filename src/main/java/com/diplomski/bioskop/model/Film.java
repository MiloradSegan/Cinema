package com.diplomski.bioskop.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name = "filmovi")
public class Film {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Size(min = 3, message = "Enter at least 3 Characters...")
	private String naziv;

	private ArrayList<String> glumci;

	private String opis;
	private String reditelj;
	@Lob
	private byte[] slika;
	private String trailer;
	private String zanr;

	@OneToMany(mappedBy = "film", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private List<Komentar> komentari1;

	@OneToMany(mappedBy = "film", cascade = CascadeType.ALL)
	private List<Projekcija> projekcija;

	@OneToMany(mappedBy = "film", cascade = CascadeType.ALL)
	private List<Ocena> ocene;

	private Double prosek;

	private boolean izasao;

	public Film(int id, String naziv) {
		super();
		this.id = id;
		this.naziv = naziv;
	}
	public Film() {

	}
	public int getId() {
		return id;
	}
	public void setId(int idFilm) {
		this.id = idFilm;
	}

	public String getNaziv() {
		return naziv;
	}

	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}

	public List<Ocena> getOcene() {
		return ocene;
	}

	public void setOcene(List<Ocena> ocene) {
		this.ocene = ocene;
	}

	public String getOpis() {
		return opis;
	}

	public void setOpis(String opis) {
		this.opis = opis;
	}

	public String getReditelj() {
		return reditelj;
	}

	public void setReditelj(String reditelj) {
		this.reditelj = reditelj;
	}

	public byte[] getSlika() {
		return slika;
	}

	public void setSlika(byte[] slika) {
		this.slika = slika;
	}

	public String getTrailer() {
		return trailer;
	}

	public void setTrailer(String trailer) {
		this.trailer = trailer;
	}

	public String getZanr() {
		return zanr;
	}

	public void setZanr(String zanr) {
		this.zanr = zanr;
	}

	public List<Komentar> getKomentari() {
		return komentari1;
	}

	public void setKomentari(List<Komentar> komentari) {
		this.komentari1 = komentari;
	}

	public List<Projekcija> getProjekcija() {
		return projekcija;
	}

	public void setProjekcija(List<Projekcija> projekcija) {
		this.projekcija = projekcija;
	}

	public ArrayList<String> getGlumci() {
		return glumci;
	}

	public void setGlumci(ArrayList<String> glumci) {
		this.glumci = glumci;
	}

	public Double getProsek() {
		return prosek;
	}

	public void setProsek(Double prosek) {
		this.prosek = prosek;
	}

	public boolean isIzasao() {
		return izasao;
	}

	public void setIzasao(boolean izasao) {
		this.izasao = izasao;
	}

	@Override
	public String toString() {
		return "Film [id=" + id + ", naziv=" + naziv + "]";
	}

}
