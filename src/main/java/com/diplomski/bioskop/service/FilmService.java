package com.diplomski.bioskop.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.JpaSort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.diplomski.bioskop.model.Film;
import com.diplomski.bioskop.repository.FilmRepository;

@Service
public class FilmService {
	
	@Autowired
	private FilmRepository filmRepository;
	
	public List<Film> izasli(){
		return filmRepository.findAllByIzasao(true,new Sort("prosek").descending());
	}
	
	public List<Film> nisuIzasli(){
		return filmRepository.findByIzasaoOrderByProsek(false);
	}
	public void saveFilm(Film film) {
		filmRepository.save(film);
	}
	/*public List<Film> sviFilmovi(){
		return filmRepository.findAll();
	}*/
	
	public List<Film> sviFilmovi1(){
		return filmRepository.findAll(new Sort("prosek").descending());
	}
	public List<Film> pronadjiPoImenu(String ime) {
		return filmRepository.findByNazivContaining(ime);
	}
	
	public Film IdFilm(int id) {
		return filmRepository.findById(id);
	}
	
	public Film pronadjiPoZanr(String zanr) {
		return filmRepository.findByZanrContaining(zanr);
	}
	
	public Film pronadjiPoReditelju(String red) {
		return filmRepository.findByRediteljContaining(red);
	}
	
	public Film ocenaFilma(float ocena) {
		return filmRepository.findByOcene(ocena);
	}
	
	
	public List<Film> nazivIZanr(String naziv, String zanr,String reditelj) {
		return filmRepository.findByNazivOrZanrOrReditelj(naziv, zanr,reditelj);
	}
	
	
	public void delete(Film f) {
		filmRepository.delete(f);
	}
	
	@SuppressWarnings("deprecation")
	public List<Film> izasli1(){
		return filmRepository.findAllByIzasao(true,new Sort("prosek").descending());
	}
	
	
	
}
