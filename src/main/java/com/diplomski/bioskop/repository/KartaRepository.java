package com.diplomski.bioskop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.diplomski.bioskop.model.Karta;

public interface KartaRepository extends JpaRepository<Karta, Integer> {

}
