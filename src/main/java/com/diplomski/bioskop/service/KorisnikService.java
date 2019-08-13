package com.diplomski.bioskop.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.diplomski.bioskop.model.Korisnik;
import com.diplomski.bioskop.model.Role;
import com.diplomski.bioskop.repository.KorisnikRepository;

@Service
public class KorisnikService {
	
	@Autowired
	private KorisnikRepository korisnikRepository;
	
	public void savaKorisnika(Korisnik korisnik) {
		korisnikRepository.save(korisnik);
	}
	
	public Korisnik korisnikId(int id) {
		return korisnikRepository.findByIdKorisnik(id);
	}
	
	public Korisnik korisinikUser(String user) {
		return korisnikRepository.findByUsername(user);
		
	}
   public Korisnik findByUserAndPass(String user, String pass) {
	   return korisnikRepository.findByUsernameAndPassword(user, pass);
   }
   
   public void deleteKorisnik(Korisnik korisnik) {
	   korisnikRepository.delete(korisnik);
   }
   
   public List<Korisnik> findAllByRole(){
	   List<Role> roles = new ArrayList<>();
	   roles.add(Role.ADMIN);
	   roles.add(Role.ZAPOSLENI);
	   return korisnikRepository.findByRoleIn(roles);
   }
   
   public List<Korisnik> findAllByRoleUSER(){
	   List<Role> roles = new ArrayList<>();
	   roles.add(Role.USER);
	   return korisnikRepository.findByRoleIn(roles);
   }
}
