package com.diplomski.bioskop.DTO;


import com.diplomski.bioskop.model.Role;

public class KorisnikDTO {
	private int idKorisnika;
	private String ime;
	private String prezime;
	private String username;
	private String password;
	private Role role;
	
	
	public KorisnikDTO() {
		
	}
	
	public KorisnikDTO(int idKorisnika, String ime, String prezime, String username, String password, Role role) {
		super();
		this.idKorisnika = idKorisnika;
		this.ime = ime;
		this.prezime = prezime;
		this.username = username;
		this.password = password;
		this.role = role;
	}
	public int getIdKorisnika() {
		return idKorisnika;
	}
	public void setIdKorisnika(int idKorisnika) {
		this.idKorisnika = idKorisnika;
	}
	public String getIme() {
		return ime;
	}
	public void setIme(String ime) {
		this.ime = ime;
	}
	public String getPrezime() {
		return prezime;
	}
	public void setPrezime(String prezime) {
		this.prezime = prezime;
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
	
	
	
	
}
