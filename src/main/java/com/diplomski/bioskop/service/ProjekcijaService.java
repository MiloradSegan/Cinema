package com.diplomski.bioskop.service;



import java.sql.Time;
import java.util.Date;
import java.util.List;
import java.util.OptionalDouble;
import java.util.OptionalInt;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.diplomski.bioskop.model.Film;
import com.diplomski.bioskop.model.Projekcija;
import com.diplomski.bioskop.repository.ProjekcijaRepository;
@Service
public class ProjekcijaService {

	@Autowired
	private ProjekcijaRepository projekcijaRepository;
	
	public void saveProjekcija(Projekcija projekcija) {
		projekcijaRepository.save(projekcija);
	}
	
	public List<Projekcija> pronadjiPoDanu(Date date) {
		return projekcijaRepository.findAllByDatum(date);
		
	}
	
	public Projekcija pronadjiPoVremenu(Time time) {
		return projekcijaRepository.findByVreme(time);
		
	}
	
	public Projekcija prondadjiPoId(int id) {
		return projekcijaRepository.findByIdPro(id);
	}
	
	public void deleteProjekcija(Projekcija entity) {
		projekcijaRepository.delete(entity);
	}
	
	public List<Projekcija> sveProjekcije(){
		return projekcijaRepository.findAllByOrderByFilm();
	}
    
	public Projekcija poDva(OptionalDouble cena, OptionalInt br) {
		return projekcijaRepository.findByCenaOrBrMesta(cena, br);
	}
	
	public List<Projekcija> findByFilm(Film f) {
		return projekcijaRepository.findByFilm(f);
	}
	
	public void deleteByFilmAll(Film f) {
		projekcijaRepository.deleteAllByFilm(f);
	}
	
	public List<Projekcija> findAllByDatum(){
		return projekcijaRepository.findAllByOrderByDatum();
	}
}
