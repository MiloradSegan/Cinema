package com.diplomski.bioskop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.diplomski.bioskop.model.Film;
import com.diplomski.bioskop.model.Korisnik;
import com.diplomski.bioskop.model.Ocena;
import com.diplomski.bioskop.repository.OcenaRepository;

@Service
public class OcenaService {
	
	@Autowired
	private OcenaRepository ocenaRepository;
	
	public void oceni(Ocena o) {
		ocenaRepository.save(o);
	}
	
	public List<Ocena> poFilmu(int id){
		return ocenaRepository.findByFilmId(id);
	}
    
	public void updateFilm(int id) {
		ocenaRepository.updateOcena(id);
	}
	
	public List<Ocena> sveOcene(){
		return ocenaRepository.findAll();
	}
	
	public List<Ocena> oceneKorisnika(Korisnik korisnik){
		
		return ocenaRepository.findByKorisnik(korisnik);
	}
	
	public List<Film> sviFilmovi(Korisnik k){
		return ocenaRepository.sviFilmoviKorisnika(k);
	}
}
