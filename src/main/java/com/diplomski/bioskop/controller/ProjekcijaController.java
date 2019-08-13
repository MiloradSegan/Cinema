package com.diplomski.bioskop.controller;

import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.OptionalDouble;
import java.util.OptionalInt;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.diplomski.bioskop.DTO.FilmDTO;
import com.diplomski.bioskop.DTO.ProjekcijaDTO;
import com.diplomski.bioskop.model.Film;
import com.diplomski.bioskop.model.Karta;
import com.diplomski.bioskop.model.Korisnik;
import com.diplomski.bioskop.model.Projekcija;
import com.diplomski.bioskop.model.Rezervacija;
import com.diplomski.bioskop.repository.ProjekcijaRepository;
import com.diplomski.bioskop.service.FilmService;
import com.diplomski.bioskop.service.KartaService;
import com.diplomski.bioskop.service.KorisnikService;
import com.diplomski.bioskop.service.ProjekcijaService;
import com.diplomski.bioskop.service.RezervacijaService;
import com.sun.org.apache.bcel.internal.generic.SIPUSH;

@Controller
@SessionAttributes("name")
public class ProjekcijaController {
	@Autowired
	private KorisnikService ks;
	@Autowired
	private ProjekcijaService ps;
	
	@Autowired
	private KartaService kartaService;
	@Autowired
	private FilmService fs;

	@Autowired
	private RezervacijaService rs;

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}

	@InitBinder
	protected void initBinder2(WebDataBinder binder) {
		SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
		binder.registerCustomEditor(Time.class, new CustomDateEditor(timeFormat, false));
	}

	// ADMIN - dodavanje nove projekcije iz filmova

	@GetMapping(value = "/novaProjekcijaFilm")
	public String novaProjekcija(@RequestParam int id, ModelMap model) {
		Film f = fs.IdFilm(id);

		model.put("film", f);
		model.put("projekcija", new Projekcija());
		return "addJednuProjekciju";
	}

	// ADMIN dodavanje nove projekcije iz filmova post

	@PostMapping(value = "/novaProjekcijaFilm")
	public String novaProjekcija(ModelMap model, @Valid Projekcija projekcija, BindingResult bindingResult, Film film,
			RedirectAttributes rs) {
		if (bindingResult.hasErrors()) {
			model.put("filmovi", fs.sviFilmovi1());
			return "addProjekcija";
		}
		rs.addAttribute("id", film.getId());
		projekcija.setFilm(film);
		ps.saveProjekcija(projekcija);
		return "redirect:/projekcijeZaFilm";
	}

	// ADMIN vraca projekcije za film

	@GetMapping(value = "/projekcijeZaFilm")
	public String listaProjekcijaAdmin(@ModelAttribute("id") int id, ModelMap model) {
		Film f = fs.IdFilm(id);
		model.put("projekcije", ps.findByFilm(f));
		return "projekcijeZaFilm";
	}

	// ADMIN sve projekcije

	@GetMapping(value = "/adminProjekcije")
	public String listaProjekcijaZaAdmin(ModelMap model) {
		model.put("projekcije", ps.sveProjekcije());
		return "adminProjekcije";
	}
	//ZAPOSLENI PROJEKCIJE
	
	@GetMapping(value = "/zaposleniProjekcije")
	public String projekcijeZaposleni(ModelMap model) {
		String name = (String) model.get("name");
		Korisnik k = ks.korisinikUser(name);
		List<Projekcija> projekcije = ps.sveProjekcije();
		List<Date> datumi = new ArrayList<>();
		for(Projekcija p : projekcije) {
			if(!datumi.contains(p.getDatum())) {
				datumi.add(p.getDatum());
			}
		}
		model.put("datumi",datumi);
		model.put("korisnik", k);
		model.put("karta", new Karta());
		model.put("projekcije", projekcije);
		return "zaposleniProjekcije";
	}
	
	@PostMapping(value = "/zaposleniProjekcije")
	public String prodajKartu(ModelMap model,Film film,Karta karta,
			 RedirectAttributes redir) {

		String s = (String) model.get("name");
		Korisnik k = ks.korisinikUser(s);
		Projekcija p = ps.prondadjiPoId(karta.getProjekcija().getIdPro());
		if(p.getBrMesta()<karta.getBrojKarata()) {
			redir.addFlashAttribute("errorMessage", "Nema toliko slobodnih mesta!!");
			return "redirect:/zaposleniProjekcije";
		}
		p.setBrMesta(p.getBrMesta() - karta.getBrojKarata());
		ps.saveProjekcija(p);
		karta.setKorisnik(k);
		karta.setSuma(karta.getCenaKarte()*karta.getBrojKarata());
		karta.setDatumProdaje(new Date());
		kartaService.saveKarta(karta);
		return "redirect:/zaposleniProjekcije";
	}
	// USER PROJEKCIJE
	@PostMapping(value = "/userProjekcije")
	public String rezervisi(ModelMap model,Film film,Rezervacija rezervacija,
			 RedirectAttributes redir) {

		String s = (String) model.get("name");
		Korisnik k = ks.korisinikUser(s);
		Rezervacija rez = rs.findByKorisnik(k);
		if (rez != null) {
			redir.addFlashAttribute("errorMessage", "Vec imate rezervaciju!!");
			return "redirect:/userProjekcije";
		}
		if (rezervacija.getBrMestaRez() > 5) {
			redir.addFlashAttribute("errorMessage", "Max broj je 5 rezervacija!!");
			return "redirect:/userProjekcije";
		}
		rezervacija.setKorisnik(ks.korisinikUser(s));
		rs.saveRez(rezervacija);
		Projekcija p = ps.prondadjiPoId(rezervacija.getProjekcija().getIdPro());
		p.setBrMesta(p.getBrMesta() - rezervacija.getBrMestaRez());
		ps.saveProjekcija(p);
		int idf = p.getFilm().getId();
		redir.addAttribute("id", idf);
		return "redirect:/userProjekcije";
	}

	@GetMapping(value = "/userProjekcije")
	public String listaProjekcijaUser(ModelMap model) {
		String name = (String) model.get("name");
		Korisnik k = ks.korisinikUser(name);
		List<Projekcija> projekcije = ps.sveProjekcije();
		List<Date> datumi = new ArrayList<>();
		for(Projekcija p : projekcije) {
			if(!datumi.contains(p.getDatum())) {
				datumi.add(p.getDatum());
			}
		}
		model.put("datumi",datumi);
		model.put("korisnik", k);
		model.put("rezervacija", new Rezervacija());
		model.put("projekcije", projekcije);
		return "userProjekcije";
	}

	
	@GetMapping(value = "/projekcije")
	public String listaProjekcijaAdmin(ModelMap model) {
		model.put("projekcije", ps.sveProjekcije());
		return "projekcije";
	}

	@GetMapping(value = "/novaProjekcija")
	public String novaProjekcijaGet(ModelMap model) {
		List<Film> f = fs.sviFilmovi1();
		model.put("filmovi", f);
		model.put("projekcija", new Projekcija());
		return "addProjekcija";
	}

	@PostMapping(value = "/novaProjekcija")
	public String novaProjekcijaPost(ModelMap model, @Valid Projekcija projekcija, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			model.put("filmovi", fs.sviFilmovi1());
			return "addProjekcija";
		}

		ps.saveProjekcija(projekcija);
		return "redirect:/adminProjekcije";
	}

	@GetMapping(value = "/deleteProjekcija")
	public String dleteFilm(@RequestParam int id) {

		ps.deleteProjekcija(ps.prondadjiPoId(id));
		return "redirect:/adminProjekcije";
	}

	@GetMapping(value = "/updateProjekcija")
	public String updateProjekcija(@RequestParam int id, ModelMap model) {
		Projekcija p = ps.prondadjiPoId(id);
		List<Film> f = fs.izasli();
		model.put("filmovi", f);
		model.put("projekcija", p);
		return "updateProjekcija";
	}

	@PostMapping(value = "/updateProjekcija")
	public String updateProjekcija(ModelMap model, @Valid @ModelAttribute("projekcija") Projekcija projekcija,
			BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			model.put("filmovi", fs.sviFilmovi1());
			return "updateProjekcija";
		}
		ps.saveProjekcija(projekcija);
		return "redirect:/adminProjekcije";
	}

	@GetMapping(value="/projekcijeDatum")
	public String projekcijeDatum(ModelMap model,@RequestParam String datum, RedirectAttributes ra ) 
			throws ParseException {
		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
		Date datum1= sdf.parse(datum);
		ra.addFlashAttribute("projekcije1",  ps.pronadjiPoDanu(datum1));
		return "redirect:/userProjekcije";
	}
	/*
	 * //pretraga po jednom od parametara
	 * 
	 * @GetMapping(value="/projekcije1") public ResponseEntity<ProjekcijaDTO>
	 * pro(OptionalDouble cena, OptionalInt br){ Projekcija p =
	 * pr.findByCenaOrBrMesta(cena, br); ProjekcijaDTO pr = new
	 * ProjekcijaDTO(p.getIdPro(),p.getCena());
	 * 
	 * return new ResponseEntity<>(pr,HttpStatus.OK); }
	 * 
	 * //Nova projekcija
	 * 
	 * @PutMapping(value="/film/{id}") public ResponseEntity<Void>
	 * saveProjekcija(@PathVariable("id") int id, @RequestBody ProjekcijaDTO
	 * projekcijaDTO ) throws ParseException{ Projekcija pro = new Projekcija();
	 * SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy"); SimpleDateFormat
	 * format = new SimpleDateFormat("HH:mm"); Date d1
	 * =(Date)format.parse(projekcijaDTO.getVreme()); Time time = new
	 * Time(d1.getTime()); Date date =
	 * sdf.parse(projekcijaDTO.getDanPrikazivanja());
	 * 
	 * Film f = fs.IdFilm(id); projekcijaDTO.setFilm(f);
	 * pro.setFilm(projekcijaDTO.getFilm()); pro.setDatum(date); pro.setVreme(time);
	 * pro.setCena(projekcijaDTO.getCena());
	 * pro.setBrMesta(projekcijaDTO.getBrMesta());
	 * pro.setSala(projekcijaDTO.getSala());
	 * pro.setTipProjekcije(projekcijaDTO.getTipProjekcije());
	 * ps.saveProjekcija(pro);
	 * 
	 * return new ResponseEntity<>(HttpStatus.OK); }
	 * 
	 * 
	 * 
	 * //pretraga po vremenu
	 * 
	 * @GetMapping(value="/projekcijaVreme/{date}") public
	 * ResponseEntity<ProjekcijaDTO> getProjekcijaVreme(@PathVariable("date") String
	 * date) throws ParseException{ SimpleDateFormat s1 = new
	 * SimpleDateFormat("HH:mm"); Date d3 = (Date)s1.parse(date); Time vreme = new
	 * Time(d3.getTime()); final Projekcija pro = ps.pronadjiPoVremenu(vreme);
	 * System.out.println(pro); if(pro != null) { SimpleDateFormat sdf = new
	 * SimpleDateFormat("dd-MM-yyyy"); Date d1 = pro.getDatum(); String dan =
	 * sdf.format(d1); Time t1 = pro.getVreme(); String time = t1.toString(); return
	 * new ResponseEntity<> (new
	 * ProjekcijaDTO(pro.getIdPro(),pro.getCena(),dan,pro.getBrMesta(),pro.getSala()
	 * ,pro.getTipProjekcije(),time,new
	 * Film(pro.getFilm().getId(),pro.getFilm().getNaziv())), HttpStatus.OK); }else
	 * { return new ResponseEntity<>(HttpStatus.BAD_REQUEST); }
	 * 
	 * }
	 * 
	 * 
	 * 
	 * 
	 * //po datumu prikazianja
	 * 
	 * @GetMapping(value="/projekcijaDan/{date}") public
	 * ResponseEntity<ProjekcijaDTO> getProjekcijaDatum(@PathVariable("date") String
	 * date) throws ParseException{ SimpleDateFormat s1 = new
	 * SimpleDateFormat("dd-MM-yyyy"); Date d3 = (Date)s1.parse(date);
	 * 
	 * final Projekcija pro = ps.pronadjiPoDanu(d3); System.out.println(pro); if(pro
	 * != null) { SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy"); Date d1
	 * = pro.getDatum(); String dan = sdf.format(d1); Time t1 = pro.getVreme();
	 * String time = t1.toString(); return new ResponseEntity<> (new
	 * ProjekcijaDTO(pro.getIdPro(),pro.getCena(),dan,pro.getBrMesta(),pro.getSala()
	 * ,pro.getTipProjekcije(),time,new
	 * Film(pro.getFilm().getId(),pro.getFilm().getNaziv())), HttpStatus.OK); }else
	 * { return new ResponseEntity<>(HttpStatus.BAD_REQUEST); }
	 * 
	 * }
	 * 
	 * //delete projekcija
	 * 
	 * @GetMapping(value="/projekcijaDelete/{id}") public ResponseEntity<Void>
	 * deleteProjekcija(@PathVariable("id") int id){ Projekcija p =
	 * ps.prondadjiPoId(id); ps.deleteProjekcija(p); return new
	 * ResponseEntity<>(HttpStatus.OK);
	 * 
	 * 
	 * } //izlistati sve projekcije
	 * 
	 * @GetMapping(value="/projekcije2") public ResponseEntity<List<ProjekcijaDTO>>
	 * sveProjekcije(){ List<Projekcija> projekcije = ps.sveProjekcije();
	 * List<ProjekcijaDTO> pr = new ArrayList<>(); for(Projekcija pro:projekcije) {
	 * SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy"); Date d1 =
	 * pro.getDatum(); String dan = sdf.format(d1); Time t1 = pro.getVreme(); String
	 * time = t1.toString(); pr.add(new
	 * ProjekcijaDTO(pro.getIdPro(),pro.getCena(),dan,pro.getBrMesta(),pro.getSala()
	 * ,pro.getTipProjekcije(),time,new
	 * Film(pro.getFilm().getId(),pro.getFilm().getNaziv()))); } return new
	 * ResponseEntity<>(pr,HttpStatus.OK); }
	 */

}
