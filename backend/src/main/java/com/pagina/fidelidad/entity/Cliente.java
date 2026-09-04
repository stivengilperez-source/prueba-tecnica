package com.pagina.fidelidad.entity;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Past;
import jakarta.validation.constraints.Pattern;

@Entity
@Table(name = "clientes")
public class Cliente {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "El tipo de identificación es obligatorio")
    @Column(name = "tipo_identificacion", nullable = false, length = 100)
    private String tipoIdentificacion;

    @NotBlank(message = "El número de identificación no puede estar vacío")
    @Pattern(regexp = "\\d+", message = "El número de identificación solo debe contener números")
    @Column(name = "numero_identificacion", nullable = false, unique = true)
    private String numeroIdentificacion;

    @NotBlank(message = "El nombre es obligatorio")
    @Pattern(regexp = "^[^0-9]+$", message = "El nombre no puede contener números")
    private String nombres;

    @NotBlank(message = "El apellido es obligatorio")
    @Pattern(regexp = "^[^0-9]+$", message = "El apellido no puede contener números")
    private String apellidos;

    @NotNull(message = "La fecha de nacimiento es obligatoria")
    @Past(message = "La fecha de nacimiento debe ser en el pasado")
    private LocalDate fechaNacimiento;

    @NotBlank(message = "La dirección es obligatoria")
    private String direccion;

    @NotBlank(message = "La ciudad es obligatoria")
    @Column(name = "ciudad", nullable = false, length = 100)
    private String ciudad;

    @NotBlank(message = "El departamento es obligatorio")
    @Column(name = "departamento", nullable = false, length = 100)
    private String departamento;

    @NotBlank(message = "El país es obligatorio")
    @Column(name = "pais", nullable = false, length = 100)
    private String pais;

    @NotBlank(message = "La marca es obligatoria")
    @Column(name = "marca", nullable = false, length = 100)
    private String marca;

    public Cliente() {}

    // Getters y Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getTipoIdentificacion() { return tipoIdentificacion; }
    public void setTipoIdentificacion(String tipoIdentificacion) { this.tipoIdentificacion = tipoIdentificacion; }

    public String getNumeroIdentificacion() { return numeroIdentificacion; }
    public void setNumeroIdentificacion(String numeroIdentificacion) { this.numeroIdentificacion = numeroIdentificacion; }

    public String getNombres() { return nombres; }
    public void setNombres(String nombres) { this.nombres = nombres; }

    public String getApellidos() { return apellidos; }
    public void setApellidos(String apellidos) { this.apellidos = apellidos; }

    public LocalDate getFechaNacimiento() { return fechaNacimiento; }
    public void setFechaNacimiento(LocalDate fechaNacimiento) { this.fechaNacimiento = fechaNacimiento; }

    public String getDireccion() { return direccion; }
    public void setDireccion(String direccion) { this.direccion = direccion; }

    public String getCiudad() { return ciudad; }
    public void setCiudad(String ciudad) { this.ciudad = ciudad; }

    public String getDepartamento() { return departamento; }
    public void setDepartamento(String departamento) { this.departamento = departamento; }

    public String getPais() { return pais; }
    public void setPais(String pais) { this.pais = pais; }

    public String getMarca() { return marca; }
    public void setMarca(String marca) { this.marca = marca; }
}
