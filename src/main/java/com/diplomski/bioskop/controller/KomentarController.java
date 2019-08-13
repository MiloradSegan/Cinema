package com.diplomski.bioskop.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import java.util.*;
import com.diplomski.bioskop.DTO.KomentarDTO;
import com.diplomski.bioskop.model.Film;
import com.diplomski.bioskop.model.Komentar;
import com.diplomski.bioskop.model.Korisnik;
import com.diplomski.bioskop.service.FilmService;
import com.diplomski.bioskop.service.KomentarService;
import com.diplomski.bioskop.service.KorisnikService;

@Controller
@SessionAttributes("name")
public class KomentarController {

	@Autowired
	KomentarService ks;

	@Autowired
	FilmService fs;

	@Autowired
	KorisnikService korS;

	@RequestMapping(value = "/ostaviKomentar", method = RequestMethod.GET)
	public String komentarGet(@RequestParam int id, ModelMap model) {
		Film f = fs.IdFilm(id);
		Komentar k = new Komentar();
		model.addAttribute("film", f);
		model.addAttribute("komentar", k);
		return "ostaviKomentar";
	}

	@RequestMapping(value = "/ostaviKomentar", method = RequestMethod.POST)
	public String komentarPost(ModelMap model,Film film, @Valid Komentar komentar,
			BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return "ostaviKomentar";
		}
		
		String s = (String) model.get("name");
		Korisnik kor = korS.korisinikUser(s);
		if(kor == null) {
			model.put("korisnik", new Korisnik());
			model.put("filmovi", fs.izasli());
			
			return "userIzasliFilmovi";
		}
		Komentar k = new Komentar();
		k.setFilm(film);
		k.setDatumKom(new Date());
		k.setKorinsik(kor);
		k.setTekst(komentar.getTekst());
		ks.saveKomentar(k);
		return "redirect:/filmoviProjekcije";
	}

	/*
	 * @PostMapping(value="/ostaviKomentar") public ResponseEntity<Void>
	 * ostaviKomentar(@RequestBody KomentarDTO komentarDTO, int korisnikID, int
	 * filmId){ Film f = fs.IdFilm(filmId); Korisnik k =
	 * korS.korisnikId(korisnikID); Komentar kom = new Komentar();
	 * 
	 * kom.setTekst(komentarDTO.getTekst()); kom.setKorinsik(k); kom.setFilm(f);
	 * ks.saveKomentar(kom); return new ResponseEntity<>(HttpStatus.OK); }
	 */
}
