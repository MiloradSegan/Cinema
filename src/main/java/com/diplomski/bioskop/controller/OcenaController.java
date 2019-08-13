package com.diplomski.bioskop.controller;

import java.sql.Time;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.diplomski.bioskop.DTO.FilmDTO;
import com.diplomski.bioskop.DTO.OcenaDTO;
import com.diplomski.bioskop.model.Film;
import com.diplomski.bioskop.model.Korisnik;
import com.diplomski.bioskop.model.Ocena;
import com.diplomski.bioskop.service.FilmService;
import com.diplomski.bioskop.service.KorisnikService;
import com.diplomski.bioskop.service.OcenaService;

@Controller
@SessionAttributes("name")
public class OcenaController {

		@Autowired
		private OcenaService ocenaService;
		
		@Autowired
		private FilmService fs;
		
		@Autowired
		private KorisnikService ks;
		
		
		
		@PostMapping(value="/ocena")
		public String oceniFilm(ModelMap model,@RequestParam int id1,@RequestParam String ocena,RedirectAttributes rs){
			String s = (String)model.get("name");
			Korisnik korisnik = ks.korisinikUser(s);
			if(korisnik == null) {
				rs.addFlashAttribute("poruka", "Samo registrovani korisnici mogu vote");
				rs.addAttribute("id", id1);
				return "redirect:/detaljiFilma";
			}
			List<Ocena> ocene = ocenaService.oceneKorisnika(korisnik);
			Film f = fs.IdFilm(id1);
			for(Ocena o : ocene) {
				if(o.getFilm() == f) {
					rs.addFlashAttribute("poruka", "Vec ste ocenili ovaj film");
					rs.addAttribute("id", id1);
					return "redirect:/detaljiFilma";
				}
			}
			
			double oc = Double.parseDouble(ocena);
			
			Ocena o = new Ocena();
		
			o.setOcena(oc);
			o.setFilm(f);
			o.setKorisnik(korisnik);;
			ocenaService.oceni(o);
			ocenaService.updateFilm(f.getId());
			rs.addAttribute("id", id1);
			return "redirect:/detaljiFilma"; 
		}
		
		
	
		/*@PostMapping(value="/ocena")
		public ResponseEntity<Void> ocenaFima(@PathVariable("id") int id, @RequestBody OcenaDTO ocenaDTO){
			Film f = fs.IdFilm(id);
			ocenaDTO.setFilm(f);
			Ocena o = new Ocena();
			o.setOcena(ocenaDTO.getOcena());
			o.setFilm(ocenaDTO.getFilm());
			ocenaService.oceni(o);
			ocenaService.updateFilm(f.getId());
			return new ResponseEntity<>(HttpStatus.OK); 
		}
		*/
		/*@PostMapping(value="/ocena")
		public ResponseEntity<Void> oceniFilm(){
			
			return new ResponseEntity<>(HttpStatus.OK); 
		}*/
		
		/*// OCENE
		@GetMapping(value="/film12/{id}")
		public ResponseEntity<List> findById(@PathVariable("id") int id) {
			List<Ocena> ocene = ocenaService.poFilmu(id);
			ArrayList<OcenaDTO> filmovi = new ArrayList<>();
			List n = new ArrayList<>();
			double sum = 0.0;
			if (ocene != null) {
				for(Ocena f:ocene) {
					String glumci = String.join(", ", f.getFilm().getGlumci());
				filmovi.add(new OcenaDTO(f.getId(), f.getOcena(),new FilmDTO(f.getFilm().getId(), f.getFilm().getNaziv(), glumci, f.getFilm().getOpis(), f.getFilm().getReditelj(), f.getFilm().getTrailer(), f.getFilm().getZanr())));
					n.add(f.getOcena());
					sum = sum + f.getOcena();
				}
				double avg = sum/n.size();
				System.out.println(avg);
				return new ResponseEntity<>(filmovi, HttpStatus.OK);
			} else {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
		}
		*/
		// OCENE
				@GetMapping(value="/film12/{id}")
				public double findById(@PathVariable("id") int id) {
					List<Ocena> ocene = ocenaService.poFilmu(id);
					List filmovi = new ArrayList<>();
				
					
					List n = new ArrayList<>();
					double sum = 0.0;
					if (ocene != null) 
						for(Ocena f:ocene) {
							
						
							n.add(f.getOcena());
							sum = sum + f.getOcena();
						}
						double avg = sum/n.size();
						System.out.println(avg);
						return avg;
					
					
				}
			/*	@GetMapping(value="/film12")
				public List sveOcene() {
					List<Film> filmovi = fs.sviFilmovi();
					List ocene = new ArrayList<>();
					for(Film f:filmovi) {
						double ocena = findById(f.getId());
						ocene.add(ocena);
					}
					return ocene;
					
					
				}*/
}
