package com.diplomski.bioskop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.diplomski.bioskop.model.Korisnik;
import com.diplomski.bioskop.model.Rezervacija;
import com.diplomski.bioskop.repository.RezervacijaRepository;

@Service
public class RezervacijaService {
	
		@Autowired
		private RezervacijaRepository rezervacijaRepository;
		
		public void saveRez(Rezervacija rez) {
			rezervacijaRepository.save(rez);
		}
		
		public void deleteRez(Korisnik k) {
			rezervacijaRepository.deleteByKorisnik(k);
		}
		public void delete(Rezervacija r) {
			rezervacijaRepository.delete(r);
		}
		public Rezervacija findById(int id) {
			return rezervacijaRepository.findById(id);
		}
		
		public Rezervacija findByKorisnik(Korisnik k) {
			return rezervacijaRepository.findByKorisnik(k);
		}
		
		public List<Rezervacija> sveRezervacije(){
			return rezervacijaRepository.findAll();
		}
}
