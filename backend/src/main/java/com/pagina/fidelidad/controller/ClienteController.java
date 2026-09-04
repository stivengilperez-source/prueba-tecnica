package com.pagina.fidelidad.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;

import com.pagina.fidelidad.entity.Ciudad;
import com.pagina.fidelidad.entity.Cliente;
import com.pagina.fidelidad.entity.Departamento;
import com.pagina.fidelidad.entity.Marca;
import com.pagina.fidelidad.entity.Pais;
import com.pagina.fidelidad.entity.TipoIdentificacion;
import com.pagina.fidelidad.repository.CiudadRepository;
import com.pagina.fidelidad.repository.ClienteRepository;
import com.pagina.fidelidad.repository.DepartamentoRepository;
import com.pagina.fidelidad.repository.MarcaRepository;
import com.pagina.fidelidad.repository.PaisRepository;
import com.pagina.fidelidad.repository.TipoIdentificacionRepository;

@RestController
@RequestMapping("/api")
public class ClienteController {

    private final TipoIdentificacionRepository tipoRepo;
    private final PaisRepository paisRepo;
    private final DepartamentoRepository deptoRepo;
    private final CiudadRepository ciudadRepo;
    private final MarcaRepository marcaRepo;
    private final ClienteRepository clienteRepo;

    public ClienteController(TipoIdentificacionRepository tipoRepo, PaisRepository paisRepo,
            DepartamentoRepository deptoRepo, CiudadRepository ciudadRepo,
            MarcaRepository marcaRepo, ClienteRepository clienteRepo) {
        this.tipoRepo = tipoRepo;
        this.paisRepo = paisRepo;
        this.deptoRepo = deptoRepo;
        this.ciudadRepo = ciudadRepo;
        this.marcaRepo = marcaRepo;
        this.clienteRepo = clienteRepo;
    }

    

    @GetMapping("/tipos-id")
    public List<TipoIdentificacion> obtenerTiposIdentificacion() {
        return tipoRepo.findAll();
    }

    @GetMapping("/paises")
    public List<Pais> obtenerPaises() {
        return paisRepo.findAll();
    }

    @GetMapping("/departamentos/{paisId}")
    public List<Departamento> obtenerDepartamentosPorPais(@PathVariable Long paisId) {
        return deptoRepo.findByPaisId(paisId);
    }

    @GetMapping("/ciudades/{deptoId}")
    public List<Ciudad> obtenerCiudadesPorDepartamento(@PathVariable Long deptoId) {
        return ciudadRepo.findByDepartamentoId(deptoId);
    }

    @GetMapping("/marcas")
    public List<Marca> obtenerMarcas() {
        return marcaRepo.findAll();
    }

    

    @PostMapping("/registro")
    public ResponseEntity<?> registrarCliente(@Valid @RequestBody Cliente cliente) {
        try {
            Cliente nuevoCliente = clienteRepo.save(cliente);
            return new ResponseEntity<>(nuevoCliente, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>("Error al guardar el cliente: " + e.getMessage(), HttpStatus.BAD_REQUEST);
        }
    }
}
