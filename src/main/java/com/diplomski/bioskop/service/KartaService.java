package com.diplomski.bioskop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.diplomski.bioskop.model.Karta;
import com.diplomski.bioskop.repository.KartaRepository;

@Service
public class KartaService {
	
	@Autowired
	private KartaRepository kartaRepository;
	
	public void saveKarta(Karta karta) {
		kartaRepository.save(karta);
	}
	
	public List<Karta> sveKarte(){
		return kartaRepository.findAll();
	}
}
