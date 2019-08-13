package com.diplomski.bioskop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.diplomski.bioskop.model.Korisnik;
import com.diplomski.bioskop.model.Rezervacija;
@Repository
public interface RezervacijaRepository extends JpaRepository<Rezervacija, Integer>{

	public void deleteByKorisnik(Korisnik k);
	
	public Rezervacija findByKorisnik(Korisnik k);
	
	public Rezervacija findById(int id);
}
