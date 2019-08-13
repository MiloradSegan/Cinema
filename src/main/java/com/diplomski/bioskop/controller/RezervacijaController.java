package com.diplomski.bioskop.controller;



import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.diplomski.bioskop.model.Film;
import com.diplomski.bioskop.model.Karta;
import com.diplomski.bioskop.model.Korisnik;
import com.diplomski.bioskop.model.Projekcija;
import com.diplomski.bioskop.model.Rezervacija;
import com.diplomski.bioskop.service.KartaService;
import com.diplomski.bioskop.service.KorisnikService;
import com.diplomski.bioskop.service.ProjekcijaService;
import com.diplomski.bioskop.service.RezervacijaService;


@Controller
@SessionAttributes("name")
public class RezervacijaController {
	
		@Autowired
		private RezervacijaService rs;
		@Autowired
		private KorisnikService ks;
		@Autowired
		private ProjekcijaService ps;
		@Autowired
		private KartaService kartaService;
		
		
		@GetMapping(value="/projekcijeUser")
		public String listaProjekcijaUser(ModelMap model) {
			
			model.put("projekcije", ps.sveProjekcije());
			model.put("rezervacija", new Rezervacija());
			return "proUser";
			//return "projekcijeUser";
		}
	
		@GetMapping(value="/sveRezervacije")
		public String listaRezervacija(ModelMap model) {
			model.put("karta", new Karta());
			model.put("rezervacija", rs.sveRezervacije());
			return "sveRezervacije";
			
		}
		
		@PostMapping(value="/sveRezervacije")
		public String prodajRezervaciju(ModelMap model, Karta karta, @RequestParam int rez) {
			String s = (String) model.get("name");
			Korisnik k = ks.korisinikUser(s);
			karta.setKorisnik(k);
			karta.setSuma(karta.getCenaKarte()*karta.getBrojKarata());
			karta.setDatumProdaje(new Date());
			kartaService.saveKarta(karta);
			
			Rezervacija r = rs.findById(rez);
			rs.delete(r);
			return "redirect:/sveRezervacije";
	
			
		}
		
	
		@GetMapping(value="/deleteRez")
		public String delete(ModelMap model,RedirectAttributes ra,@RequestParam int id1) {
			String s = (String) model.get("name");
			Korisnik k = ks.korisinikUser(s);
			Rezervacija r = rs.findByKorisnik(k);
			if(r==null) {
				ra.addAttribute("id", id1);
				return "redirect:/detaljiFilma";
			}
			Projekcija p = ps.prondadjiPoId(r.getProjekcija().getIdPro());
			p.setBrMesta(p.getBrMesta()+r.getBrMestaRez());
			ps.saveProjekcija(p);
			rs.delete(r);
			
			ra.addAttribute("id", id1);
			return "redirect:/detaljiFilma";
		}

		@GetMapping(value="/deleteRezProjekcije")
		public String deleteRez(ModelMap model) {
			String s = (String) model.get("name");
			Korisnik k = ks.korisinikUser(s);
			Rezervacija r = rs.findByKorisnik(k);
			if(r==null) {
				
				return "redirect:/userProjekcije";
			}
			Projekcija p = ps.prondadjiPoId(r.getProjekcija().getIdPro());
			p.setBrMesta(p.getBrMesta()+r.getBrMestaRez());
			ps.saveProjekcija(p);
			rs.delete(r);
		
			
			return "redirect:/userProjekcije";
		}

		
		
		
		
		@PostMapping(value="/projekcijeUser")
		//@ModelAttribute("rezervacija")
		public String rezervisi(ModelMap model,@Valid  Rezervacija rezervacija,BindingResult bindingResult,RedirectAttributes rAtt) {
			if(bindingResult.hasErrors()) {
				model.put("projekcije", ps.sveProjekcije());
				return "proUser";
			}
			
			String s = (String) model.get("name");
			Rezervacija rez = rs.findByKorisnik(ks.korisinikUser(s));
			if(rez!=null) {
				model.put("errorMessage", "Vec imate rezervaciju!!");
				model.put("projekcije", ps.sveProjekcije());
				return "proUser";
			}else {
			rezervacija.setKorisnik(ks.korisinikUser(s));
			rs.saveRez(rezervacija);
			Projekcija p = ps.prondadjiPoId(rezervacija.getProjekcija().getIdPro());
			p.setBrMesta(p.getBrMesta()-rezervacija.getBrMestaRez());
			ps.saveProjekcija(p);
			return "redirect:/projekcijeUser";
			}
		}
		
		@GetMapping(value="/evidencijaProdaje")
		public String prodaja(ModelMap model) {
			model.put("karte", kartaService.sveKarte());
			return "evidencijaProdaje";
		}
		
}
