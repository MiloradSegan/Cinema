package com.diplomski.bioskop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.diplomski.bioskop.model.Film;
import com.diplomski.bioskop.model.Korisnik;
import com.diplomski.bioskop.model.Ocena;

@Repository
public interface OcenaRepository extends JpaRepository<Ocena, Long>  {
	
	@Transactional
	@Modifying
	@Query("UPDATE Film f SET f.prosek = FORMAT ((SELECT AVG(o.ocena)FROM Ocena o where o.film.id = ?1), 1)where f.id =?1")
	public void updateOcena(int id);
	
	public List<Ocena> findByFilmId(int id);
	
	public List<Ocena> findAll();
	
	public List<Ocena> findByKorisnik(Korisnik korisnik);
	@Transactional
	@Query("SELECT o.film FROM Ocena o where o.korisnik= ?1")
	public List<Film> sviFilmoviKorisnika(Korisnik k);
	
}
