package com.diplomski.bioskop.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.diplomski.bioskop.model.Korisnik;
import com.diplomski.bioskop.repository.KorisnikRepository;



@Service
public class UserDetailsServiceImp implements UserDetailsService{

	@Autowired
	  private KorisnikRepository userRepository;

	  @Override	 
	  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		  Korisnik user = userRepository.findByUsername(username);
		 
		if (user == null) {
		  throw new UsernameNotFoundException("Username: " + username+ "not found");
		} else {	
			 //System.out.println(user.getPassword() + " " + user.getUsername());
			List<GrantedAuthority> grantedAuthorities = new ArrayList<GrantedAuthority>();
			grantedAuthorities.add(new SimpleGrantedAuthority(user.getRole().name()));
		
			return new org.springframework.security.core.userdetails.User(
				  user.getUsername(),
				  user.getPassword(),
				  grantedAuthorities);
		}
	  }
	}
