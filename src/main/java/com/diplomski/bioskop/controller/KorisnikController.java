package com.diplomski.bioskop.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.diplomski.bioskop.DTO.KorisnikDTO;
import com.diplomski.bioskop.model.Film;
import com.diplomski.bioskop.model.Korisnik;
import com.diplomski.bioskop.model.Role;
import com.diplomski.bioskop.service.FilmService;
import com.diplomski.bioskop.service.KorisnikService;

@Controller
@SessionAttributes("name")
public class KorisnikController {
	
	
	@Autowired
	KorisnikService ks;
	@Autowired
	FilmService fs;
	@Autowired
	BCryptPasswordEncoder encoder;
	
	
	//ADMIN evidencija
	
	@GetMapping(value="/adminEvidencija")
	public String evidencijaRadnika(ModelMap model) {
		model.put("users", ks.findAllByRole());
		model.put("usersU", ks.findAllByRoleUSER());
		return "adminEvidencija";
	}
	
	
	//ADMIN delete korisnika
	
	@GetMapping(value="/deleteKorisnik")
	public String deleteKorisnik(@RequestParam int id) {
		
		ks.deleteKorisnik(ks.korisnikId(id));
		return "redirect:/adminEvidencija";
	}
	
	
	//ADMIN registrovanje zaposlenjog
	
	@GetMapping(value="/addZaposlenog")
	public String zaposli(ModelMap model){
		
		model.put("zaposleni", new Korisnik());
		return "addZaposlenog";
	}
	
	
	//ADMIN registrovanje zaposlenog post metod
	
	@PostMapping(value="/addZaposlenog")
	public String zaposli(@Valid Korisnik zaposleni,BindingResult bs,ModelMap model) {
		if(bs.hasErrors()) {
			return "addZaposlenog";
		}
		zaposleni.setPassword(encoder.encode(zaposleni.getPassword()));
		ks.savaKorisnika(zaposleni);
		return"redirect:/adminEvidencija";
	}
	
	
	//UPDATE ZAPOSLENOG
	
	@GetMapping(value="/updateZaposlenog")
	public String updateZaposlenog(@RequestParam int id,ModelMap model) {
		Korisnik k = ks.korisnikId(id);
		model.put("zaposleni", k);
		return "updateZaposlenog";
	}
	
	
	//UPDATE zaposlenog post metod
	
	@PostMapping(value="/updateZaposlenog")
	public String updateZaposlenog(@Valid Korisnik zaposleni, BindingResult bs,ModelMap model) {
		if(bs.hasErrors()) {
			model.put("zaposleni", zaposleni);
			return "updateZaposlenog";
		}
		ks.savaKorisnika(zaposleni);
		return "redirect:/adminEvidencija";
		
	}
	//User registracija
	
	@RequestMapping(value="/registracijaUser", method=RequestMethod.GET)
	public String registracija(ModelMap model) {
		model.put("korisnik", new Korisnik());
		return "userRegistracija";
		
	}
	
	//USER registracija
	
	@RequestMapping(value="/registracijaUser", method=RequestMethod.POST)
	public String registracija(ModelMap model, @Valid Korisnik korisnik, BindingResult bindingResult,
			RedirectAttributes rs) {
		 if(bindingResult.hasErrors()) {
			 return "userRegistracija";
		 }
		 Korisnik k = ks.korisinikUser(korisnik.getUsername());
		 if(k!=null) {
			rs.addFlashAttribute("poruka",  "Vec postoji korisnik sa tim username,pokusajte ponovo");
			return "redirect:/homepage";
		 }else {
		 korisnik.setPassword(encoder.encode(korisnik.getPassword()));
		 korisnik.setRole(Role.USER);
		 ks.savaKorisnika(korisnik);
		 model.put("name", korisnik.getUsername());
		return "redirect:/homepage" ;
		 }
	}
	

	
	//ZA POSTMANA
@PostMapping(value="/users/new1")
	public ResponseEntity<Void> insert(@RequestBody KorisnikDTO korisnikDTO){
		Korisnik user = new Korisnik();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		user.setImeKorisnika(korisnikDTO.getIme());
		user.setPrezimeKorisnika(korisnikDTO.getPrezime());
		user.setUsername(korisnikDTO.getUsername());
		user.setPassword(encoder.encode(korisnikDTO.getPassword()));
		user.setRole(korisnikDTO.getRole());
		ks.savaKorisnika(user);
		return new ResponseEntity<>(HttpStatus.OK);
		
	}
	
	
	@GetMapping(value="/pretraga")
	public String Pretraga(ModelMap model) {
		return "new";
	}
	
	@PostMapping(value="/pretraga")
    public String pretragaPost(ModelMap model, @RequestParam String naziv,@RequestParam String zanr,@RequestParam String reditelj) {

        List<Film> f  = fs.nazivIZanr(naziv,zanr,reditelj);

        if (f!=null) {
            model.put("filmovi", f);
            return "listaProba";
        } else {
            
            return "welcome";
        }
    }
	
	@RequestMapping(value="/r", method=RequestMethod.GET)
	public String registracijaa(ModelMap model) {
		model.put("filmovi", fs.sviFilmovi1());
		return "homePage";
		
	}
	
	
	@GetMapping(value="/f")
	public String listaFilmovaAdmin(ModelMap model) {	
		model.put("filmovi", fs.sviFilmovi1());
		//return "lista";
		return "vezba";
	}
	
	
	
//	@PostMapping(value="/loginPage")
//    public String loginPost(ModelMap model, @RequestParam String username,@RequestParam String password) {
//
//        Korisnik k = ks.findByUserAndPass(username, password);
//
//        if (k!=null) {
//            model.put("name", username);
//            return "welcome";
//        } else {
//            model.put("errorMessage", "Invalid Credentials!!");
//            return "login";
//        }
//    }
	
	
 
}
