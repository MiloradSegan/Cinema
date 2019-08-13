package com.diplomski.bioskop.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.diplomski.bioskop.model.Film;
import com.diplomski.bioskop.model.Komentar;
import com.diplomski.bioskop.model.Korisnik;
import com.diplomski.bioskop.model.Ocena;
import com.diplomski.bioskop.model.Projekcija;
import com.diplomski.bioskop.model.Rezervacija;
import com.diplomski.bioskop.service.FilmService;
import com.diplomski.bioskop.service.KomentarService;
import com.diplomski.bioskop.service.KorisnikService;
import com.diplomski.bioskop.service.OcenaService;
import com.diplomski.bioskop.service.ProjekcijaService;
import com.diplomski.bioskop.service.RezervacijaService;

@Controller
@SessionAttributes("name")
public class FilmController {

	@Autowired
	private FilmService fs;
	@Autowired
	private KorisnikService ks;

	@Autowired
	private KomentarService koms;

	@Autowired
	private ProjekcijaService ps;
	
	  @Autowired 
	  private OcenaService os;
	 

	@Autowired
	private RezervacijaService rs;

	
	//HOMEPAGE ZA SVE 
	
	@GetMapping(value = "/homepage")
	public String adminPocetna(ModelMap model) {
		String user = (String) model.get("name");
		Korisnik k = ks.korisinikUser(user);
		if(k==null) {
		model.put("korisnik",new Korisnik());
		model.put("filmovi1", fs.izasli());
		model.put("filmovi2", fs.nisuIzasli());
		return "homepage";
		}
		model.put("korisnik",k);
		model.put("filmovi1", fs.izasli());
		model.put("filmovi2", fs.nisuIzasli());
		return "homepage";
	}

	
	
	//ADMIN - svi filmovi, edit filmova
	
	@GetMapping(value = "/adminFilmovi")
	public String listaFilmovaAdmin(ModelMap model) {
		model.put("filmovi1", fs.izasli());
		model.put("filmovi2", fs.nisuIzasli());
		return "adminFilmovi";
	}

	
	// ADMIN - update get
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateFilm(@RequestParam int id, ModelMap model) {
		Film f = fs.IdFilm(id);
		model.put("film", f);
		return "updateFilm";
	}

	
	// ADMIN - update post
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(ModelMap model, @Valid Film film, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return "updateFilm";
		}
		fs.saveFilm(film);
		return "redirect:/adminFilmovi";
	}

	
	//ADMIN Delete
	
	@GetMapping(value = "/delete")
	public String deleteFilm(@RequestParam int id) {
		Film f = fs.IdFilm(id);
		fs.delete(f);
		return "redirect:/adminFilmovi";
	}
	
	
	//ADMIN dodaj film koji je izasao get metod	
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String addFilmGet(ModelMap model) {
		model.put("film", new Film());
		return "addFilm";
	}
	
	
	//ADMIN dodaj film koji je izasao post metod
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addFilmPost(@Valid @ModelAttribute("film") Film film, BindingResult bindingResult,
			@RequestParam MultipartFile fileUpload, ModelMap model) throws IOException {
		if (bindingResult.hasErrors()) {
			return "addFilm";
		}
		film.setIzasao(true);
		film.setSlika(fileUpload.getBytes());
		fs.saveFilm(film);
		return "redirect:/adminFilmovi";
	}
	
	
	//ADMIN dodaj film koji jos nije na repertoaru get metod
	
	@RequestMapping(value = "/add2", method = RequestMethod.GET)
	public String addFilmUpcoming(ModelMap model) {
		model.put("film1", new Film());
		return "addFilm2";

	}

	
	//ADMIN dodaj film koji jos nije na repertoaru post metod
	
	@RequestMapping(value = "/add2", method = RequestMethod.POST)
	public String addFilmUpcoming(@Valid @ModelAttribute("film1") Film film, BindingResult bindingResult,
			@RequestParam MultipartFile fileUpload, ModelMap model) throws IOException {
		if (bindingResult.hasErrors()) {
			return "addFilm";
		}

		film.setIzasao(false);
		film.setSlika(fileUpload.getBytes());
		fs.saveFilm(film);
		return "redirect:/adminFilmovi";
	}
	
	
	// VRACA SLIKU ZA ID FILMA
	
	@RequestMapping(value = "/filmovi12", method = RequestMethod.GET)
	public void showImage(ModelMap model, @RequestParam("id") int id, HttpServletResponse response,
			HttpServletRequest request) throws ServletException, IOException {
		Film f = fs.IdFilm(id);
		response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
		response.getOutputStream().write(f.getSlika());
		response.getOutputStream().close();
	}

	
	
	@GetMapping(value="/filmNaziv")
	public String listaFilmovaNaziv(@RequestParam String film, RedirectAttributes ra) {
		
		List<Film> filmovi = fs.pronadjiPoImenu(film);
		System.out.println(filmovi);
		ra.addFlashAttribute("filmoviNaziv", filmovi);
		
		return "redirect:/filmoviProjekcije";
	}
	
	// LISTA FILMOVA KOJI SU IZASLI ZA KORISNIKA

	@GetMapping(value = "/filmoviProjekcije")
	public String listaFilmovaProjekcije(ModelMap model) {
		
		String name = (String) model.get("name");
		Korisnik korisnik = ks.korisinikUser(name);
		if(korisnik==null) {
		model.put("korisnik", new Korisnik());
		model.put("filmovi", fs.izasli());
		return "userIzasliFilmovi";
		}
		List<Film> razlika = listaRazlicitihFilmova(korisnik);
		System.out.println(razlika);
		
		model.put("filmoviRazlika", razlika);
		model.put("korisnik", korisnik);
		model.put("filmovi", fs.izasli());
		
		return "userIzasliFilmovi";
		
	}

	
	// DETALJI ZA FILM
	
	@GetMapping(value = "/detaljiFilma")
	public String detaljiFilm(@ModelAttribute("id") int id, ModelMap model) {
		String user = (String) model.get("name");
		Korisnik k = ks.korisinikUser(user);
		if(k==null) {
			Film f = fs.IdFilm(id);
			model.put("korisnik", new Korisnik());
			model.put("rezervacija", new Rezervacija());
			model.put("film", f);
			return "detaljiFilm";
		}
		model.put("korisnik", k);
	
		Film f = fs.IdFilm(id);
		
		model.put("rezervacija", new Rezervacija());
		model.put("film", f);
		
		return "detaljiFilm";
		// return "projekcijeUser";
	}

	//REZERVISANJE KARTE IZ DETALJA FIMA
	
	@PostMapping(value = "/detaljiFilma")
	public String rezervisi(ModelMap model, @ModelAttribute("film") Film film, @Valid Rezervacija rezervacija,
			BindingResult bindingResult, RedirectAttributes redir) {
		if (bindingResult.hasErrors()) {
			model.put("film", fs.IdFilm(film.getId()));
			model.put("error", "Previse ste uneli");
			return "detaljiFilm";
		}

		String s = (String) model.get("name");
		Korisnik k = ks.korisinikUser(s);
		if(k==null) {
			model.put("korisnik", new Korisnik());
			model.put("film", fs.IdFilm(film.getId()));
			model.put("error", "Rezervacije su dozvoljene samo registrovanim korisnicia");
			return "detaljiFilm";
		}
		Rezervacija rez = rs.findByKorisnik(k);

		if (rez != null) {
			model.put("korisnik", k);
			model.put("errorMessage", "Vec imate rezervaciju!!");
			model.put("film", fs.IdFilm(film.getId()));
			

			return "detaljiFilm";
		}
		if (rezervacija.getBrMestaRez()>5) {
			model.put("korisnik", k);
			model.put("errorMessage", "Maksimum je 5 karata po rezervaciji!!");
			model.put("film", fs.IdFilm(film.getId()));
			

			return "detaljiFilm";
		}
		rezervacija.setKorisnik(ks.korisinikUser(s));
		rs.saveRez(rezervacija);
		Projekcija p = ps.prondadjiPoId(rezervacija.getProjekcija().getIdPro());
		p.setBrMesta(p.getBrMesta() - rezervacija.getBrMestaRez());
		ps.saveProjekcija(p);
		int idf = p.getFilm().getId();
		redir.addAttribute("id", idf);

		return "redirect:/detaljiFilma";

	}

	@GetMapping(value = "/ra")
	public String listaProjekcijaUserara(ModelMap model) {

		model.put("projekcije", ps.findAllByDatum());

		return "sveProjekcijeUser";
		// return "projekcijeUser";
	}

	@GetMapping(value = "/filmoviPodela")
	public String listaFilmovaIzasli(ModelMap model) {
		model.put("korisnik", new Korisnik());
		model.put("filmovi1", fs.izasli());
		model.put("filmovi2", fs.nisuIzasli());
		return "pocetnaBezLogin";
		// return "lista2";
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String showUploadForm(ModelMap model) {
		model.put("filmovi",fs.izasli());
		return "projekcijeUser";
		
	}

	
	


	// Metode za korisnika
	
	@GetMapping(value = "/filmoviUser")
	public String listaFilmovaUser(ModelMap model) {
		model.put("korisnik", new Korisnik());
		model.addAttribute("komentar", new Komentar());
		model.put("filmovi", fs.izasli());
		// return "userIzasliFilmovi";
		return "userIzasliFilmovi";
	}
	
	
	//METODA ZA KOMENTARISANJE
	
	@PostMapping(value = "/filmoviUser")
	public String listaFilmovaUsePostr(ModelMap model, @RequestParam int idF, @RequestParam String komentar) {
		Film f = fs.IdFilm(idF);
		String s = (String) model.get("name");
		Korisnik kor = ks.korisinikUser(s);
		if(kor == null) {
			model.put("korisnik", new Korisnik());
			model.addAttribute("komentar", new Komentar());
			model.put("filmovi", fs.izasli());
			model.put("error", "Samo registrovani korisnici mogu ostavljati komentare");
			return "userIzasliFilmovi";
		}
		//model.put("korisnik",kor);
		Komentar k = new Komentar();
		k.setFilm(f);
		k.setDatumKom(new Date());
		k.setKorinsik(kor);

		k.setTekst(komentar);
		koms.saveKomentar(k);
		return "redirect:/filmoviProjekcije";
	}

	//RAZNE METODE
	
	//WELCOME PAGE ZA SVE KOJI NISU LOGIN
	
		@GetMapping(value ="/welcome")
		public String welcome(ModelMap model) {
			model.put("korisnik", new Korisnik());
			model.put("filmovi1", fs.izasli());
			model.put("filmovi2", fs.nisuIzasli());
			return "index";
			
		}
		

		@RequestMapping(value = "/add3", method = RequestMethod.POST)
		public String addFilmSlika(@RequestParam int id, @RequestParam MultipartFile fileUpload) throws IOException {

			Film f = fs.IdFilm(id);
			f.setSlika(fileUpload.getBytes());
			fs.saveFilm(f);
			return "redirect:/filmovi";
		}
		
		@GetMapping(value = "/filmoviNoLogin")
		public String listaFilmovaNoLogin(ModelMap model) {
			model.put("korisnik", new Korisnik());
			model.put("filmovi", fs.izasli());
			//return "filmoviNeRegistrovanUser";
			return "userIzasliFilmovi";
			
		}

		@GetMapping(value = "/detaljiFilma2")
		public String detaljiFilm2(@ModelAttribute("id") int id, ModelMap model) {
			Film f = fs.IdFilm(id);
			model.put("rezervacija", new Rezervacija());
			model.put("film", f);

			return "detaljiFilmaNoLogin";
			// return "projekcijeUser";
		}
		
		@PostMapping(value = "/detaljiFilma2")
		public String rezervisi2(ModelMap model, @ModelAttribute("film") Film film, @Valid Rezervacija rezervacija,
				BindingResult bindingResult, RedirectAttributes redir) {
			
			
				model.put("film", fs.IdFilm(film.getId()));
				model.put("error", "Rezervacije su dozvoljene samo registrovanim korisnicia");
				return "detaljiFilm2";
			
			
			

		}
	
		@RequestMapping(value = "/doUpload", method = RequestMethod.POST)
		public String handleFileUpload(@RequestParam MultipartFile fileUpload) throws Exception {
			Film uploadFile = new Film();
			uploadFile.setNaziv("ime filma");
			uploadFile.setSlika(fileUpload.getBytes());
			fs.saveFilm(uploadFile);
			return "success";
		}
	
	// METODE SA DTO

	/*
	 * @GetMapping(value="/filmovi") public ResponseEntity<List<FilmDTO>>
	 * sviFilmovi(){ List<Film> film = fs.sviFilmovi1(); ArrayList<FilmDTO> filmovi
	 * = new ArrayList<>(); if (film != null) { for(Film f:film) { String glumci =
	 * String.join(", ", f.getGlumci()); filmovi.add(new FilmDTO(f.getId(),
	 * f.getNaziv(), glumci, f.getOpis(), f.getReditelj(), f.getTrailer(),
	 * f.getZanr())); } return new ResponseEntity<>(filmovi, HttpStatus.OK); } else
	 * { return new ResponseEntity<>(HttpStatus.NOT_FOUND); } }
	 * 
	 * 
	 * //UNOS FILMA
	 * 
	 * @PostMapping(value="/film/novi") public ResponseEntity<Void>
	 * snimiFilm(@RequestBody FilmDTO filmDTO){ ArrayList<String> glumci = new
	 * ArrayList<String>(Arrays.asList(filmDTO.getGlumci().split(","))); Film film =
	 * new Film(); film.setNaziv(filmDTO.getNaziv()); film.setGlumci(glumci);
	 * film.setReditelj(filmDTO.getReditelj()); film.setOpis(filmDTO.getOpis());
	 * 
	 * film.setZanr(filmDTO.getZanr()); film.setTrailer(filmDTO.getTrailer());
	 * fs.saveFilm(film); return new ResponseEntity<>(HttpStatus.OK);
	 * 
	 * }
	 * 
	 * //FILMOVi NAZIV
	 * 
	 * @GetMapping(value="/film1/{naziv1}") public
	 * ResponseEntity<ArrayList<FilmDTO>> nazivFilma(@PathVariable("naziv1") String
	 * naziv) { final List<Film> film = fs.pronadjiPoImenu(naziv);
	 * ArrayList<FilmDTO> filmovi = new ArrayList<>(); if (film != null) { for(Film
	 * f:film) { String glumci = String.join(", ", f.getGlumci()); filmovi.add(new
	 * FilmDTO(f.getId(), f.getNaziv(), glumci, f.getOpis(), f.getReditelj(),
	 * f.getTrailer(), f.getZanr())); } return new ResponseEntity<>(filmovi,
	 * HttpStatus.OK); } else { return new ResponseEntity<>(HttpStatus.NOT_FOUND); }
	 * }
	 * 
	 * // FILM ID
	 * 
	 * @GetMapping(value="/film/{id}") public ResponseEntity<FilmDTO>
	 * findById(@PathVariable("id") int id) { final Film f = fs.IdFilm(id); if (f !=
	 * null) { // os.ocena(f.getId()); String glumci = String.join(", ",
	 * f.getGlumci()); return new ResponseEntity<>(new FilmDTO(f.getId(),
	 * f.getNaziv(), glumci, f.getOpis(), f.getReditelj(), f.getTrailer(),
	 * f.getZanr()), HttpStatus.OK);
	 * 
	 * 
	 * } else { return new ResponseEntity<>(HttpStatus.NOT_FOUND); } }
	 * 
	 * 
	 * 
	 * //FILM ZANRU
	 * 
	 * @GetMapping(value="/filmZanr /{zanr}") public ResponseEntity<FilmDTO>
	 * findByZanr(@PathVariable("zanr") String zanr) { final Film f =
	 * fs.pronadjiPoZanr(zanr); if (f != null) { String glumci = String.join(", ",
	 * f.getGlumci()); return new ResponseEntity<>(new FilmDTO(f.getId(),
	 * f.getNaziv(), glumci, f.getOpis(), f.getReditelj(), f.getTrailer(),
	 * f.getZanr()), HttpStatus.OK); } else { return new
	 * ResponseEntity<>(HttpStatus.NOT_FOUND); } }
	 * 
	 * //REDITELJ
	 * 
	 * @GetMapping(value="/film2/{reditelj}") public ResponseEntity<FilmDTO>
	 * findByReditelj(@PathVariable("reditelj") String reditelj) { final Film f =
	 * fs.pronadjiPoReditelju(reditelj); if (f != null) {
	 * 
	 * String glumci = String.join(", ", f.getGlumci()); return new
	 * ResponseEntity<>(new FilmDTO(f.getId(), f.getNaziv(), glumci, f.getOpis(),
	 * f.getReditelj(), f.getTrailer(), f.getZanr()), HttpStatus.OK); } else {
	 * return new ResponseEntity<>(HttpStatus.NOT_FOUND); } }
	 * 
	 * @GetMapping(value="/filmdelete/{id}") public ResponseEntity<Void>
	 * deleteFilm(@PathVariable("id") int id){ Film f = fs.IdFilm(id); fs.delete(f);
	 * return new ResponseEntity<>(HttpStatus.OK); }
	 */

	// OVDE
	// IDU
	// NOVI
	// METODI

	/*
	 * @GetMapping("/uploadFile") public String uploadFile() { Film f =
	 * fs.storeFile(file);
	 * 
	 * String fileDownloadUri = ServletUriComponentsBuilder.fromCurrentContextPath()
	 * .path("/downloadFile/") .fromUri(f.getId()) .toUriString();
	 * 
	 * 
	 * return "jsp"; }
	 * 
	 */

	public List<Korisnik> predictReting1(Korisnik korisnik) {
		ArrayList<Korisnik> susedi = crateSusede(korisnik);
		return susedi;
	}
	
	
	private ArrayList<Korisnik> crateSusede(Korisnik activeUser) {
		ArrayList<Korisnik> susedi = new ArrayList<Korisnik>(); 
		List<Korisnik> sviUseri = ks.findAllByRoleUSER(); 
			for(Korisnik k:sviUseri ) {
				if(k.getIdKorisnik() != activeUser.getIdKorisnik()) {
					double sim = calculateSim(activeUser,k);
					if(sim<1) {
						susedi.add(k);
					}
				}
			}
		return susedi;
	}

	private double calculateSim(Korisnik active, Korisnik p) {
		int moviesInCommon =0; 
		double diferenceSum=0;
			for(Ocena o1:active.getOcene()) {
				for(Ocena o2:p.getOcene()) {
					Film f1 = o1.getFilm();
					Film f2 = o2.getFilm();
					
					if(f1.getId() == f2.getId()) {
						moviesInCommon++;
						diferenceSum+= Math.abs(o1.getOcena()-o2.getOcena()); 
					}
				}	
			}
			if(moviesInCommon>0) {
				return diferenceSum/moviesInCommon;
			}
			return Integer.MAX_VALUE; 
		}
	
		public List<Film> listaRazlicitihFilmova(Korisnik korisnik){
			List<Korisnik> susedi = predictReting1(korisnik);
			List<Film> filmovi = os.sviFilmovi(korisnik); 
			List<Film> razlika = new ArrayList<Film>();
			for(Korisnik k : susedi) {
					for(Ocena o:k.getOcene()) {
						Film f = o.getFilm();
						if(!filmovi.contains(f)) {
							if(!razlika.contains(f))	
							razlika.add(f);
						}
					}
			}
			return razlika;	
		}

}
