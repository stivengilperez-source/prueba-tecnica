package com.pagina.fidelidad.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pagina.fidelidad.entity.Departamento;

public interface DepartamentoRepository extends JpaRepository<Departamento, Long> {
    
    List<Departamento> findByPaisId(Long paisId);
}
