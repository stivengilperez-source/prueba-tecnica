package com.pagina.fidelidad.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pagina.fidelidad.entity.Cliente;

public interface ClienteRepository extends JpaRepository<Cliente, Long> {}
