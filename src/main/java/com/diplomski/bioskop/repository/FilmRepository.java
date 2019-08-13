package com.diplomski.bioskop.repository;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.diplomski.bioskop.model.Film;


@Repository
public interface FilmRepository extends JpaRepository<Film, Long> {
	
	
	public List<Film> findByIzasaoOrderByProsek(boolean izasao);
	
	public List<Film> findAll(Sort sort);
	
	public List<Film> findByNazivContaining(String naziv);
	
	public Film findById(int id);
	
	public Film findByRediteljContaining(String reditelj);
	
	public Film findByZanrContaining(String zanr);
	
	public Film findByOcene(float ocena);
	
	public List<Film> findByNazivOrZanrOrReditelj(String naziv, String zanr,String reditelj);
	
	public List<Film> findByGlumci(String glumac);
	
	public List<Film> findAllByIzasao(boolean izasao,Sort sort);

	
	
	
	
	
}
