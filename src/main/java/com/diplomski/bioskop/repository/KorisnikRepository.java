package com.diplomski.bioskop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.diplomski.bioskop.model.Korisnik;
import com.diplomski.bioskop.model.Role;

@Repository
public interface KorisnikRepository extends JpaRepository<Korisnik, Long>{

	public Korisnik findByIdKorisnik(int id);
	
	public Korisnik findByUsername(String user);
	
	public Korisnik findByUsernameAndPassword(String user, String pass);

	public List<Korisnik> findByRoleIn(List<Role> roles);
	
	
	
	
}

