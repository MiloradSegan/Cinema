package com.diplomski.bioskop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.diplomski.bioskop.model.Komentar;

@Repository
public interface KomentarRepository  extends JpaRepository<Komentar, Long>{

	
}
