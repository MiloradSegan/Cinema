package com.diplomski.bioskop.repository;

import java.sql.Time;
import java.util.Date;
import java.util.List;
import java.util.OptionalDouble;
import java.util.OptionalInt;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.diplomski.bioskop.model.Film;
import com.diplomski.bioskop.model.Projekcija;
@Repository
public interface ProjekcijaRepository extends JpaRepository<Projekcija, Long> {
	
	public List<Projekcija> findAllByDatum(Date date);
	
	public Projekcija findByVreme(Time time);
	
	public Projekcija findByIdPro(int id);
	
	public List<Projekcija> findByFilm(Film f);
	
	@Transactional
	public void deleteAllByFilm(Film f);

	
	//public Projekcija findByCenaOrDatumOrBrMestaOrSalaOrTipProjekcijeOrVreme();
	
	public Projekcija findByCenaOrBrMesta(OptionalDouble cena, OptionalInt br);
	
	public List<Projekcija> findAllByOrderByDatum();
	
	public List<Projekcija> findAllByOrderByFilm();
	
	
}
