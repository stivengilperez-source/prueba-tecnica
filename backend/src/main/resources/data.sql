INSERT INTO marcas (id, nombre) VALUES (1, 'Americanino');
INSERT INTO marcas (id, nombre) VALUES (2, 'American Eagle');
INSERT INTO marcas (id, nombre) VALUES (3, 'Chevignon');
INSERT INTO marcas (id, nombre) VALUES (4, 'Esprit');
INSERT INTO marcas (id, nombre) VALUES (5, 'Naf Naf');
INSERT INTO marcas (id, nombre) VALUES (6, 'Rifle');

INSERT INTO tipos_identificacion (id, nombre) VALUES (1, 'Cédula de Ciudadanía');
INSERT INTO tipos_identificacion (id, nombre) VALUES (2, 'Cédula de Extranjería');
INSERT INTO tipos_identificacion (id, nombre) VALUES (3, 'Pasaporte');

-- ==========================================
-- PAÍSES
-- ==========================================
INSERT INTO paises (id, nombre) VALUES (1, 'Colombia');
INSERT INTO paises (id, nombre) VALUES (2, 'México');
INSERT INTO paises (id, nombre) VALUES (3, 'Argentina');
INSERT INTO paises (id, nombre) VALUES (4, 'España');

-- ==========================================
-- DEPARTAMENTOS
-- ==========================================
-- Colombia
INSERT INTO departamentos (id, nombre, pais_id) VALUES (1, 'Amazonas', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (2, 'Antioquia', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (3, 'Arauca', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (4, 'Atlántico', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (5, 'Bogotá D.C.', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (6, 'Bolívar', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (7, 'Boyacá', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (8, 'Caldas', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (9, 'Caquetá', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (10, 'Casanare', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (11, 'Cauca', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (12, 'Cesar', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (13, 'Chocó', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (14, 'Córdoba', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (15, 'Cundinamarca', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (16, 'Guainía', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (17, 'Guaviare', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (18, 'Huila', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (19, 'La Guajira', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (20, 'Magdalena', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (21, 'Meta', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (22, 'Nariño', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (23, 'Norte de Santander', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (24, 'Putumayo', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (25, 'Quindío', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (26, 'Risaralda', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (27, 'San Andrés y Providencia', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (28, 'Santander', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (29, 'Sucre', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (30, 'Tolima', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (31, 'Valle del Cauca', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (32, 'Vaupés', 1);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (33, 'Vichada', 1);

-- México (Estados)
INSERT INTO departamentos (id, nombre, pais_id) VALUES (34, 'Jalisco', 2);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (35, 'Nuevo León', 2);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (36, 'Ciudad de México', 2);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (37, 'Quintana Roo', 2);

-- Argentina (Provincias)
INSERT INTO departamentos (id, nombre, pais_id) VALUES (38, 'Buenos Aires', 3);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (39, 'Córdoba', 3);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (40, 'Mendoza', 3);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (41, 'Santa Fe', 3);

-- España (Comunidades Autónomas / Provincias)
INSERT INTO departamentos (id, nombre, pais_id) VALUES (42, 'Madrid', 4);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (43, 'Cataluña', 4);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (44, 'Andalucía', 4);
INSERT INTO departamentos (id, nombre, pais_id) VALUES (45, 'Comunidad Valenciana', 4);

-- ==========================================
-- CIUDADES
-- ==========================================
--Colombia
-- Amazonas
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (1, 'Leticia', 1);
-- Antioquia
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (2, 'Medellín', 2);
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (3, 'Envigado', 2);
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (4, 'Bello', 2);
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (5, 'Itagüí', 2);
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (6, 'Rionegro', 2);
-- Arauca
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (7, 'Arauca', 3);
-- Atlántico
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (8, 'Barranquilla', 4);
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (9, 'Soledad', 4);
-- Bogotá D.C.
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (10, 'Bogotá', 5);
-- Bolívar
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (11, 'Cartagena', 6);
-- Boyacá
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (12, 'Tunja', 7);
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (13, 'Duitama', 7);
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (14, 'Sogamoso', 7);
-- Caldas
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (15, 'Manizales', 8);
-- Caquetá
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (16, 'Florencia', 9);
-- Casanare
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (17, 'Yopal', 10);
-- Cauca
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (18, 'Popayán', 11);
-- Cesar
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (19, 'Valledupar', 12);
-- Chocó
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (20, 'Quibdó', 13);
-- Córdoba
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (21, 'Montería', 14);
-- Cundinamarca
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (22, 'Soacha', 15);
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (23, 'Girardot', 15);
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (24, 'Zipaquirá', 15);
-- Guainía
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (25, 'Inírida', 16);
-- Guaviare
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (26, 'San José del Guaviare', 17);
-- Huila
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (27, 'Neiva', 18);
-- La Guajira
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (28, 'Riohacha', 19);
-- Magdalena
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (29, 'Santa Marta', 20);
-- Meta
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (30, 'Villavicencio', 21);
-- Nariño
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (31, 'Pasto', 22);
-- Norte de Santander
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (32, 'Cúcuta', 23);
-- Putumayo
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (33, 'Mocoa', 24);
-- Quindío
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (34, 'Armenia', 25);
-- Risaralda
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (35, 'Pereira', 26);
-- San Andrés
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (36, 'San Andrés', 27);
-- Santander
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (37, 'Bucaramanga', 28);
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (38, 'Floridablanca', 28);
-- Sucre
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (39, 'Sincelejo', 29);
-- Tolima
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (40, 'Ibagué', 30);
-- Valle del Cauca
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (41, 'Cali', 31);
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (42, 'Palmira', 31);
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (43, 'Buenaventura', 31);
-- Vaupés
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (44, 'Mitú', 32);
-- Vichada
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (45, 'Puerto Carreño', 33);

-- México
-- Jalisco (ID: 34)
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (46, 'Guadalajara', 34);
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (47, 'Zapopan', 34);
-- Nuevo León (ID: 35)
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (48, 'Monterrey', 35);
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (49, 'San Pedro Garza García', 35);
-- Ciudad de México (ID: 36)
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (50, 'Ciudad de México', 36);
-- Quintana Roo (ID: 37)
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (51, 'Cancún', 37);
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (52, 'Playa del Carmen', 37);

-- Argentina
-- Buenos Aires (ID: 38)
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (53, 'Buenos Aires', 38);
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (54, 'La Plata', 38);
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (55, 'Mar del Plata', 38);
-- Córdoba (ID: 39)
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (56, 'Córdoba', 39);
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (57, 'Villa Carlos Paz', 39);
-- Mendoza (ID: 40)
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (58, 'Mendoza', 40);
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (59, 'San Rafael', 40);
-- Santa Fe (ID: 41)
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (60, 'Rosario', 41);
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (61, 'Santa Fe', 41);

-- España
-- Madrid (ID: 42)
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (62, 'Madrid', 42);
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (63, 'Alcalá de Henares', 42);
-- Cataluña (ID: 43)
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (64, 'Barcelona', 43);
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (65, 'Girona', 43);
-- Andalucía (ID: 44)
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (66, 'Sevilla', 44);
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (67, 'Málaga', 44);
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (68, 'Granada', 44);
-- Comunidad Valenciana (ID: 45)
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (69, 'Valencia', 45);
INSERT INTO ciudades (id, nombre, departamento_id) VALUES (70, 'Alicante', 45);
