package com.diplomski.bioskop.DTO;

import java.util.Date;

/*import lombok.Getter;
import lombok.Setter;
@Getter
@Setter*/
public class KomentarDTO {

	private int  idKom;
	//private String datumKom;
	private String tekst;
	public KomentarDTO(int idKom, /*String datumKom,*/ String tekst) {
		super();
		this.idKom = idKom;
		//this.datumKom = datumKom;
		this.tekst = tekst;
	}
	public int getIdKom() {
		return idKom;
	}
	public void setIdKom(int idKom) {
		this.idKom = idKom;
	}
	public String getTekst() {
		return tekst;
	}
	public void setTekst(String tekst) {
		this.tekst = tekst;
	}
	
	
	
}
