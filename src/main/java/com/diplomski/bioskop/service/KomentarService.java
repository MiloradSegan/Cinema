package com.diplomski.bioskop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.diplomski.bioskop.model.Komentar;
import com.diplomski.bioskop.repository.KomentarRepository;

@Service
public class KomentarService {
	@Autowired
	private KomentarRepository komentarRepository;
	
	public void saveKomentar(Komentar k) {
		komentarRepository.save(k);
	}
}
