--
-- PostgreSQL database dump para YugabyteDB Cloud
-- Base de datos: biblioteca_db
--

-- Configuración inicial
SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

-- =====================================================
-- TABLAS
-- =====================================================

-- Tabla: libros
CREATE TABLE IF NOT EXISTS libros (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(220) NOT NULL,
    isbn VARCHAR(32) UNIQUE,
    editorial VARCHAR(160),
    anio INTEGER,
    edicion VARCHAR(60),
    sinopsis TEXT
);

-- Tabla: autores
CREATE TABLE IF NOT EXISTS autores (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(260) NOT NULL,
    bio TEXT
);

-- Tabla: categorias
CREATE TABLE IF NOT EXISTS categorias (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT
);

-- Tabla: libro_autores (relación N:M)
CREATE TABLE IF NOT EXISTS libro_autores (
    libro_id INTEGER NOT NULL REFERENCES libros(id),
    autor_id INTEGER NOT NULL REFERENCES autores(id),
    PRIMARY KEY (libro_id, autor_id)
);

-- Tabla: libro_categorias (relación N:M)
CREATE TABLE IF NOT EXISTS libro_categorias (
    libro_id INTEGER NOT NULL REFERENCES libros(id),
    categoria_id INTEGER NOT NULL REFERENCES categorias(id),
    PRIMARY KEY (libro_id, categoria_id)
);

-- Tabla: usuarios
CREATE TABLE IF NOT EXISTS usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    email VARCHAR(160) NOT NULL UNIQUE,
    rol VARCHAR(50) NOT NULL,
    estado VARCHAR(50) NOT NULL
);

-- Tabla: ejemplares
CREATE TABLE IF NOT EXISTS ejemplares (
    id SERIAL PRIMARY KEY,
    libro_id INTEGER NOT NULL REFERENCES libros(id),
    estado VARCHAR(50) NOT NULL,
    ubicacion VARCHAR(100)
);

-- Tabla: prestamos
CREATE TABLE IF NOT EXISTS prestamos (
    id SERIAL PRIMARY KEY,
    ejemplar_id INTEGER NOT NULL REFERENCES ejemplares(id),
    usuario_id INTEGER NOT NULL REFERENCES usuarios(id),
    fecha_prestamo TIMESTAMP DEFAULT NOW(),
    fecha_vencimiento TIMESTAMP NOT NULL,
    estado VARCHAR(50) NOT NULL,
    renovaciones INTEGER DEFAULT 0
);

-- Tabla: devoluciones
CREATE TABLE IF NOT EXISTS devoluciones (
    id SERIAL PRIMARY KEY,
    prestamo_id INTEGER NOT NULL REFERENCES prestamos(id),
    fecha_devolucion TIMESTAMP DEFAULT NOW(),
    condicion_retorno VARCHAR(50) NOT NULL,
    observaciones TEXT
);

-- Tabla: reservas
CREATE TABLE IF NOT EXISTS reservas (
    id SERIAL PRIMARY KEY,
    libro_id INTEGER NOT NULL REFERENCES libros(id),
    usuario_id INTEGER NOT NULL REFERENCES usuarios(id),
    fecha_reserva TIMESTAMP DEFAULT NOW(),
    estado VARCHAR(50) NOT NULL,
    expira_el TIMESTAMP
);

-- Tabla: multas
CREATE TABLE IF NOT EXISTS multas (
    id SERIAL PRIMARY KEY,
    prestamo_id INTEGER NOT NULL REFERENCES prestamos(id),
    usuario_id INTEGER NOT NULL REFERENCES usuarios(id),
    motivo VARCHAR(50) NOT NULL,
    monto NUMERIC(10,2) NOT NULL,
    estado VARCHAR(50) NOT NULL
);

-- Tabla: resenas
CREATE TABLE IF NOT EXISTS resenas (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER NOT NULL REFERENCES usuarios(id),
    libro_id INTEGER NOT NULL REFERENCES libros(id),
    rating INTEGER NOT NULL,
    comentario TEXT,
    fecha TIMESTAMP DEFAULT NOW(),
    UNIQUE (usuario_id, libro_id)
);

-- =====================================================
-- DATOS DE PRUEBA
-- =====================================================

-- Insertar autores
INSERT INTO autores (id, nombre, bio) VALUES
(1, 'Gabriel García Márquez', 'Autor colombiano, Nobel de Literatura.'),
(2, 'Julio Cortázar', 'Escritor argentino, maestro del cuento.'),
(3, 'J. K. Rowling', 'Autora de la saga Harry Potter.'),
(4, 'George R. R. Martin', 'Autor de Canción de hielo y fuego.'),
(5, 'Isabel Allende', 'Escritora chilena de realismo mágico.'),
(6, 'Haruki Murakami', 'Novelista japonés contemporáneo.'),
(7, 'Stephen King', 'Autor de novelas de terror y suspenso.'),
(8, 'Yuval Noah Harari', 'Historiador y escritor israelí.'),
(9, 'Brandon Sanderson', 'Autor de fantasía épica.'),
(10, 'J. R. R. Tolkien', 'Creador de El Señor de los Anillos.'),
(11, 'Neil Gaiman', 'Escritor británico, fantasía y cómic.'),
(12, 'Carlos Ruiz Zafón', 'Autor de La sombra del viento.')
ON CONFLICT (id) DO NOTHING;

-- Insertar categorías
INSERT INTO categorias (id, nombre, descripcion) VALUES
(1, 'Novela', 'Narrativa de ficción en prosa.'),
(2, 'Fantasía', 'Mundos imaginarios, magia, etc.'),
(3, 'Ciencia ficción', 'Ficción especulativa basada en ciencia.'),
(4, 'Histórica', 'Contexto histórico real.'),
(5, 'Juvenil', 'Orientada a público joven.'),
(6, 'No ficción', 'Obras basadas en hechos reales.'),
(7, 'Ensayo', 'Textos analíticos y reflexivos.'),
(8, 'Terror', 'Obras de horror y suspenso.'),
(9, 'Misterio', 'Tramas de investigación y enigmas.'),
(10, 'Filosofía', 'Reflexiones filosóficas y pensamiento.')
ON CONFLICT (id) DO NOTHING;

-- Insertar libros
INSERT INTO libros (id, titulo, isbn, editorial, anio, edicion, sinopsis) VALUES
(1, 'Cien años de soledad', '978000000001', 'Sudamericana', 1967, '1a', 'Saga de la familia Buendía en Macondo.'),
(2, 'Rayuela', '978000000002', 'Sudamericana', 1963, '1a', 'Novela experimental de Cortázar.'),
(3, 'Harry Potter y la piedra filosofal', '978000000003', 'Bloomsbury', 1997, '1a', 'El inicio de la saga de Harry Potter.'),
(4, 'El Señor de los Anillos: La Comunidad del Anillo', '978000000004', 'Allen & Unwin', 1954, '1a', 'Fantasía épica en la Tierra Media.'),
(5, 'Juego de Tronos', '978000000005', 'Bantam Spectra', 1996, '1a', 'Primer libro de Canción de hielo y fuego.'),
(6, 'La casa de los espíritus', '978000000006', 'Plaza & Janés', 1982, '1a', 'Historia de la familia Trueba.'),
(7, 'Kafka en la orilla', '978000000007', 'Shinchosha', 2002, '1a', 'Novela surrealista de Murakami.'),
(8, 'It', '978000000008', 'Viking', 1986, '1a', 'Terror psicológico en el pueblo de Derry.'),
(9, 'Sapiens: De animales a dioses', '978000000009', 'Harvill Secker', 2011, '1a', 'Historia breve de la humanidad.'),
(10, 'Mistborn: El Imperio Final', '978000000010', 'Tor Books', 2006, '1a', 'Fantasía épica con magia basada en metales.'),
(11, 'El Hobbit', '978000000011', 'Allen & Unwin', 1937, '1a', 'Aventura de Bilbo Bolsón.'),
(12, 'American Gods', '978000000012', 'HarperCollins', 2001, '1a', 'Choque entre dioses antiguos y nuevos.'),
(13, 'La sombra del viento', '978000000013', 'Planeta', 2001, '1a', 'Misterio en el Cementerio de los Libros Olvidados.'),
(14, 'El resplandor', '978000000014', 'Doubleday', 1977, '1a', 'Terror en el hotel Overlook.'),
(15, 'Homo Deus', '978000000015', 'Harvill Secker', 2015, '1a', 'Reflexiones sobre el futuro de la humanidad.')
ON CONFLICT (id) DO NOTHING;

-- Insertar relaciones libro-autor
INSERT INTO libro_autores (libro_id, autor_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 10), (5, 4), (6, 5), (7, 6), (8, 7), (9, 8), (10, 9), (11, 10), (12, 11), (13, 12), (14, 7), (15, 8)
ON CONFLICT DO NOTHING;

-- Insertar relaciones libro-categoría
INSERT INTO libro_categorias (libro_id, categoria_id) VALUES
(1, 1), (1, 4), (2, 1), (3, 1), (3, 5), (4, 2), (5, 2), (6, 1), (7, 1), (7, 3), (8, 8), (9, 6), (9, 7), (10, 2), (11, 2), (12, 2), (13, 1), (13, 9), (14, 8), (15, 6)
ON CONFLICT DO NOTHING;

-- Insertar usuarios
INSERT INTO usuarios (id, nombre, email, rol, estado) VALUES
(1, 'Ana López', 'ana@example.com', 'lector', 'activo'),
(2, 'Juan Pérez', 'juan@example.com', 'lector', 'activo'),
(3, 'María García', 'maria@example.com', 'lector', 'activo'),
(4, 'Carlos Sánchez', 'carlos@example.com', 'lector', 'activo'),
(5, 'Lucía Torres', 'lucia@example.com', 'lector', 'activo'),
(6, 'Raúl Hernández', 'raul@example.com', 'lector', 'bloqueado'),
(7, 'Sofía Díaz', 'sofia@example.com', 'lector', 'activo'),
(8, 'Pedro Romero', 'pedro@example.com', 'lector', 'activo'),
(9, 'Laura Jiménez', 'laura@example.com', 'bibliotecario', 'activo'),
(10, 'Miguel Castillo', 'miguel@example.com', 'lector', 'activo'),
(11, 'Daniela Ortiz', 'daniela@example.com', 'lector', 'activo'),
(12, 'Andrea Flores', 'andrea@example.com', 'lector', 'activo'),
(13, 'prueba1', 'bibliotecadbpsql03@gmail.com', 'lector', 'activo')
ON CONFLICT (id) DO NOTHING;

-- Insertar ejemplares
INSERT INTO ejemplares (id, libro_id, estado, ubicacion) VALUES
(1, 1, 'disponible', 'Estante A1'),
(2, 1, 'prestado', 'Estante A1'),
(3, 1, 'disponible', 'Estante A1'),
(4, 2, 'disponible', 'Estante A2'),
(5, 2, 'prestado', 'Estante A2'),
(6, 3, 'disponible', 'Estante B1'),
(7, 3, 'prestado', 'Estante B1'),
(8, 3, 'disponible', 'Estante B1'),
(9, 4, 'disponible', 'Estante B2'),
(10, 4, 'disponible', 'Estante B2'),
(11, 5, 'prestado', 'Estante C1'),
(12, 5, 'disponible', 'Estante C1'),
(13, 6, 'disponible', 'Estante C2'),
(14, 7, 'disponible', 'Estante D1'),
(15, 8, 'disponible', 'Estante D2'),
(16, 9, 'disponible', 'Estante E1'),
(17, 10, 'disponible', 'Estante E2'),
(18, 11, 'disponible', 'Estante F1'),
(19, 12, 'disponible', 'Estante F2'),
(20, 13, 'disponible', 'Estante G1'),
(21, 14, 'prestado', 'Estante G2'),
(22, 15, 'prestado', 'Estante H1'),
(23, 5, 'prestado', 'Estante C1'),
(24, 2, 'prestado', 'Estante A2')
ON CONFLICT (id) DO NOTHING;

-- Insertar préstamos
INSERT INTO prestamos (id, ejemplar_id, usuario_id, fecha_prestamo, fecha_vencimiento, estado, renovaciones) VALUES
(1, 2, 1, '2025-11-01 10:00:00', '2025-11-15 10:00:00', 'devuelto', 0),
(2, 5, 2, '2025-11-05 12:00:00', '2025-11-20 12:00:00', 'devuelto', 1),
(3, 7, 3, '2025-11-10 09:30:00', '2025-11-25 09:30:00', 'devuelto', 0),
(4, 11, 4, '2025-11-12 16:00:00', '2025-11-27 16:00:00', 'devuelto', 0),
(5, 23, 5, '2025-11-20 14:00:00', '2025-12-01 14:00:00', 'devuelto', 2),
(6, 2, 6, '2025-12-01 10:00:00', '2025-12-15 10:00:00', 'activo', 0),
(7, 5, 7, '2025-12-02 11:00:00', '2025-12-16 11:00:00', 'activo', 0),
(8, 7, 8, '2025-11-25 09:00:00', '2025-12-05 09:00:00', 'activo', 1),
(9, 11, 9, '2025-11-28 17:00:00', '2025-12-08 17:00:00', 'activo', 0),
(10, 23, 10, '2025-12-05 13:00:00', '2025-12-19 13:00:00', 'activo', 0),
(11, 24, 11, '2025-12-06 09:15:00', '2025-12-20 09:15:00', 'activo', 0),
(12, 1, 2, '2025-12-07 10:00:00', '2025-12-21 10:00:00', 'activo', 0),
(13, 4, 3, '2025-12-08 11:00:00', '2025-12-22 11:00:00', 'activo', 0),
(14, 6, 4, '2025-12-08 16:30:00', '2025-12-22 16:30:00', 'activo', 0),
(15, 3, 5, '2025-11-30 08:45:00', '2025-12-10 08:45:00', 'devuelto', 0),
(16, 9, 6, '2025-11-29 13:20:00', '2025-12-09 13:20:00', 'devuelto', 0),
(17, 10, 7, '2025-11-27 15:00:00', '2025-12-07 15:00:00', 'devuelto', 1),
(18, 12, 8, '2025-11-26 10:10:00', '2025-12-06 10:10:00', 'devuelto', 0),
(19, 21, 10, '2025-12-11 12:10:00', '2025-12-25 12:10:00', 'activo', 0),
(20, 22, 13, '2025-12-11 12:13:00', '2025-12-25 12:13:00', 'activo', 0)
ON CONFLICT (id) DO NOTHING;

-- Insertar devoluciones
INSERT INTO devoluciones (id, prestamo_id, fecha_devolucion, condicion_retorno, observaciones) VALUES
(1, 1, '2025-11-16 10:05:00', 'ok', 'Devuelto un día tarde'),
(2, 2, '2025-11-22 12:10:00', 'ok', 'Devuelto con leve retraso'),
(3, 3, '2025-11-24 09:00:00', 'ok', 'Devuelto a tiempo'),
(4, 4, '2025-11-28 16:30:00', 'ok', NULL),
(5, 5, '2025-12-03 14:10:00', 'ok', 'Devuelto dos días tarde'),
(6, 15, '2025-12-09 08:40:00', 'ok', NULL),
(7, 16, '2025-12-10 13:30:00', 'ok', 'Devuelto un día tarde'),
(8, 17, '2025-12-06 15:05:00', 'ok', 'A tiempo'),
(9, 18, '2025-12-05 10:15:00', 'danado', 'Cubierta dañada'),
(10, 3, '2025-11-25 10:00:00', 'ok', 'Registro duplicado de prueba')
ON CONFLICT (id) DO NOTHING;

-- Insertar reservas
INSERT INTO reservas (id, libro_id, usuario_id, fecha_reserva, estado, expira_el) VALUES
(1, 5, 2, '2025-12-07 18:22:52', 'en_cola', '2025-12-09 18:22:52'),
(2, 3, 1, '2025-12-07 18:22:52', 'en_cola', '2025-12-10 18:22:52'),
(3, 1, 2, '2025-12-09 20:50:30', 'en_cola', '2025-12-20 00:00:00'),
(4, 4, 6, '2025-12-08 09:00:00', 'en_cola', '2025-12-10 09:00:00'),
(5, 8, 7, '2025-12-08 10:30:00', 'en_cola', '2025-12-11 10:30:00'),
(6, 9, 8, '2025-12-08 11:15:00', 'en_cola', '2025-12-11 11:15:00'),
(7, 10, 9, '2025-12-08 12:00:00', 'en_cola', '2025-12-11 12:00:00'),
(8, 11, 10, '2025-12-08 13:00:00', 'en_cola', '2025-12-11 13:00:00'),
(9, 12, 11, '2025-12-08 14:00:00', 'en_cola', '2025-12-11 14:00:00'),
(10, 13, 12, '2025-12-08 15:00:00', 'en_cola', '2025-12-11 15:00:00')
ON CONFLICT (id) DO NOTHING;

-- Insertar multas
INSERT INTO multas (id, prestamo_id, usuario_id, motivo, monto, estado) VALUES
(1, 1, 1, 'Devolución tardía', 20.00, 'pendiente'),
(2, 2, 2, 'Devolución tardía', 15.00, 'pendiente'),
(3, 5, 5, 'Devolución tardía', 30.00, 'pendiente'),
(4, 16, 6, 'Devolución tardía', 10.00, 'pendiente'),
(5, 18, 8, 'Libro dañado', 150.00, 'pendiente'),
(6, 3, 3, 'Devolución tardía', 5.00, 'pagada'),
(7, 4, 4, 'Devolución tardía', 5.00, 'pagada'),
(8, 15, 5, 'Devolución tardía', 5.00, 'pagada')
ON CONFLICT (id) DO NOTHING;

-- Insertar reseñas
INSERT INTO resenas (id, usuario_id, libro_id, rating, comentario, fecha) VALUES
(1, 1, 1, 5, 'Obra maestra del realismo mágico.', '2025-11-20 10:00:00'),
(2, 2, 2, 4, 'Muy interesante pero algo complejo.', '2025-11-21 11:00:00'),
(3, 3, 3, 5, 'Infancia resumida en este libro.', '2025-11-22 12:00:00'),
(4, 4, 4, 5, 'Fantasía épica imprescindible.', '2025-11-23 13:00:00'),
(5, 5, 5, 4, 'Intrigas y personajes increíbles.', '2025-11-24 14:00:00'),
(6, 6, 6, 4, 'Bonita historia familiar.', '2025-11-25 15:00:00'),
(7, 7, 7, 5, 'Murakami nunca decepciona.', '2025-11-26 16:00:00'),
(8, 8, 8, 3, 'Demasiado largo pero entretenido.', '2025-11-27 17:00:00'),
(9, 9, 9, 5, 'Muy recomendable para entender la historia.', '2025-11-28 18:00:00'),
(10, 10, 10, 5, 'Sistema de magia buenísimo.', '2025-11-29 19:00:00'),
(11, 11, 11, 4, 'Aventura muy divertida.', '2025-11-30 20:00:00'),
(12, 12, 12, 4, 'Concepto muy original.', '2025-12-01 21:00:00'),
(13, 1, 13, 5, 'Misterio perfecto.', '2025-12-02 22:00:00'),
(14, 2, 14, 4, 'Da miedo de verdad.', '2025-12-03 23:00:00'),
(15, 3, 15, 4, 'Te hace pensar en el futuro.', '2025-12-04 09:00:00')
ON CONFLICT (usuario_id, libro_id) DO NOTHING;

-- Actualizar secuencias para que los próximos INSERTs funcionen correctamente
SELECT setval('autores_id_seq', (SELECT MAX(id) FROM autores));
SELECT setval('categorias_id_seq', (SELECT MAX(id) FROM categorias));
SELECT setval('libros_id_seq', (SELECT MAX(id) FROM libros));
SELECT setval('usuarios_id_seq', (SELECT MAX(id) FROM usuarios));
SELECT setval('ejemplares_id_seq', (SELECT MAX(id) FROM ejemplares));
SELECT setval('prestamos_id_seq', (SELECT MAX(id) FROM prestamos));
SELECT setval('devoluciones_id_seq', (SELECT MAX(id) FROM devoluciones));
SELECT setval('reservas_id_seq', (SELECT MAX(id) FROM reservas));
SELECT setval('multas_id_seq', (SELECT MAX(id) FROM multas));
SELECT setval('resenas_id_seq', (SELECT MAX(id) FROM resenas));

-- FIN DEL SCRIPT
