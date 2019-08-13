package com.diplomski.bioskop.DTO;

public class FilmDTO {

private int idFilm;
	
	private String naziv;
	
	//private Float ocena;
	private String opis;
	private String reditelj;
	//private byte[] slika;
	private String trailer;
	private String zanr;
	private String glumci;
	
	public FilmDTO(int idFilm, String naziv, String glumci, String opis, String reditelj, String trailer,
			String zanr) {
		super();
		this.idFilm = idFilm;
		this.naziv = naziv;
		this.glumci = glumci;
		//this.ocena = ocena;
		this.opis = opis;
		this.reditelj = reditelj;
		this.trailer = trailer;
		this.zanr = zanr;
	}
	public int getIdFilm() {
		return idFilm;
	}
	public void setIdFilm(int idFilm) {
		this.idFilm = idFilm;
	}
	public String getNaziv() {
		return naziv;
	}
	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}
	public String getGlumci() {
		return glumci;
	}
	public void setGlumci(String glumci) {
		this.glumci = glumci;
	}
	/*public Float getOcena() {
		return ocena;
	}
	public void setOcena(Float ocena) {
		this.ocena = ocena;
	}*/
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
	
	
}
