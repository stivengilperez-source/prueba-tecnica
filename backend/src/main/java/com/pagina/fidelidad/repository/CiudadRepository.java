package com.pagina.fidelidad.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pagina.fidelidad.entity.Ciudad;

public interface CiudadRepository extends JpaRepository<Ciudad, Long> {
    
    List<Ciudad> findByDepartamentoId(Long departamentoId);
}