
package com.diplomski.bioskop.controller;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.diplomski.bioskop.model.Korisnik;
import com.diplomski.bioskop.model.Role;
import com.diplomski.bioskop.security.TokenHelper;
import com.diplomski.bioskop.service.FilmService;
import com.diplomski.bioskop.service.KorisnikService;
@Controller
@SessionAttributes("name")
public class LoginController {

	@Autowired
	private UserDetailsService userDetailsService;

	@Autowired
	private AuthenticationManager authenticationManager;

	@Autowired
	private TokenHelper tokenUtils;
	
	@Autowired
	public KorisnikService korisnikService;
	
	@Autowired
	public FilmService filmService;
	


	@RequestMapping(value = "/loginPage", method = RequestMethod.POST)
	public String loginPost (ModelMap model,@RequestParam String username, @RequestParam String password, RedirectAttributes rs) {
		  
			UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(username, password);
			model.put("name", username);
			Authentication authentication = authenticationManager.authenticate(token);
			SecurityContextHolder.getContext().setAuthentication(authentication);
			UserDetails details = userDetailsService.loadUserByUsername(username);
			
			tokenUtils.generateToken(details);	
			Korisnik k = korisnikService.korisinikUser(username);
			
			model.put("korisnik", k);
			
			//model.put("filmovi1",filmService.izasli());
			//model.put("filmovi2", filmService.nisuIzasli());
		/*	if(k.getRole() == Role.ADMIN) {
				return "redirect:/adminPocetna";
			}else if(k.getRole() == Role.ZAPOSLENI) {
				return "welcome";	
			}else {
				return "welcome";	
			}*/
			return "redirect:/homepage";
	}
	
	
	public String getLoggedInUserName() {
		Object principal = SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();

		if (principal instanceof UserDetails)
			return ((UserDetails) principal).getUsername();

		return principal.toString();
	}

}
