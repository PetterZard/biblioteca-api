--
-- PostgreSQL database dump
--

\restrict syW62XVoHG1RGpuvFiSO7sRR64WuWTVAYhHybTxpIPZhpnt6Xnr3IWSQSQEuvgn

-- Dumped from database version 16.11 (Ubuntu 16.11-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.11 (Ubuntu 16.11-0ubuntu0.24.04.1)

-- Started on 2025-12-11 13:03:00 CST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 16403)
-- Name: autores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autores (
    id integer NOT NULL,
    nombre character varying(260) NOT NULL,
    bio text
);


ALTER TABLE public.autores OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16402)
-- Name: autores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.autores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.autores_id_seq OWNER TO postgres;

--
-- TOC entry 3573 (class 0 OID 0)
-- Dependencies: 217
-- Name: autores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.autores_id_seq OWNED BY public.autores.id;


--
-- TOC entry 220 (class 1259 OID 16412)
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16411)
-- Name: categorias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categorias_id_seq OWNER TO postgres;

--
-- TOC entry 3574 (class 0 OID 0)
-- Dependencies: 219
-- Name: categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorias_id_seq OWNED BY public.categorias.id;


--
-- TOC entry 230 (class 1259 OID 16503)
-- Name: devoluciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.devoluciones (
    id integer NOT NULL,
    prestamo_id integer NOT NULL,
    fecha_devolucion timestamp without time zone DEFAULT now(),
    condicion_retorno character varying(50) NOT NULL,
    observaciones text
);


ALTER TABLE public.devoluciones OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16502)
-- Name: devoluciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.devoluciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.devoluciones_id_seq OWNER TO postgres;

--
-- TOC entry 3575 (class 0 OID 0)
-- Dependencies: 229
-- Name: devoluciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.devoluciones_id_seq OWNED BY public.devoluciones.id;


--
-- TOC entry 226 (class 1259 OID 16472)
-- Name: ejemplares; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ejemplares (
    id integer NOT NULL,
    libro_id integer NOT NULL,
    estado character varying(50) NOT NULL,
    ubicacion character varying(100)
);


ALTER TABLE public.ejemplares OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16471)
-- Name: ejemplares_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ejemplares_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ejemplares_id_seq OWNER TO postgres;

--
-- TOC entry 3576 (class 0 OID 0)
-- Dependencies: 225
-- Name: ejemplares_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ejemplares_id_seq OWNED BY public.ejemplares.id;


--
-- TOC entry 221 (class 1259 OID 16422)
-- Name: libro_autores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libro_autores (
    libro_id integer NOT NULL,
    autor_id integer NOT NULL
);


ALTER TABLE public.libro_autores OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16447)
-- Name: libro_categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libro_categorias (
    libro_id integer NOT NULL,
    categoria_id integer NOT NULL
);


ALTER TABLE public.libro_categorias OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16392)
-- Name: libros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libros (
    id integer NOT NULL,
    titulo character varying(220) NOT NULL,
    isbn character varying(32),
    editorial character varying(160),
    anio integer,
    edicion character varying(60),
    sinopsis text
);


ALTER TABLE public.libros OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16391)
-- Name: libros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.libros_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.libros_id_seq OWNER TO postgres;

--
-- TOC entry 3577 (class 0 OID 0)
-- Dependencies: 215
-- Name: libros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.libros_id_seq OWNED BY public.libros.id;


--
-- TOC entry 234 (class 1259 OID 16536)
-- Name: multas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.multas (
    id integer NOT NULL,
    prestamo_id integer NOT NULL,
    usuario_id integer NOT NULL,
    motivo character varying(50) NOT NULL,
    monto numeric(10,2) NOT NULL,
    estado character varying(50) NOT NULL
);


ALTER TABLE public.multas OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16535)
-- Name: multas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.multas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.multas_id_seq OWNER TO postgres;

--
-- TOC entry 3578 (class 0 OID 0)
-- Dependencies: 233
-- Name: multas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.multas_id_seq OWNED BY public.multas.id;


--
-- TOC entry 228 (class 1259 OID 16484)
-- Name: prestamos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prestamos (
    id integer NOT NULL,
    ejemplar_id integer NOT NULL,
    usuario_id integer NOT NULL,
    fecha_prestamo timestamp without time zone DEFAULT now(),
    fecha_vencimiento timestamp without time zone NOT NULL,
    estado character varying(50) NOT NULL,
    renovaciones integer DEFAULT 0
);


ALTER TABLE public.prestamos OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16483)
-- Name: prestamos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prestamos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prestamos_id_seq OWNER TO postgres;

--
-- TOC entry 3579 (class 0 OID 0)
-- Dependencies: 227
-- Name: prestamos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prestamos_id_seq OWNED BY public.prestamos.id;


--
-- TOC entry 236 (class 1259 OID 16553)
-- Name: resenas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resenas (
    id integer NOT NULL,
    usuario_id integer NOT NULL,
    libro_id integer NOT NULL,
    rating integer NOT NULL,
    comentario text,
    fecha timestamp without time zone DEFAULT now()
);


ALTER TABLE public.resenas OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16552)
-- Name: resenas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resenas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.resenas_id_seq OWNER TO postgres;

--
-- TOC entry 3580 (class 0 OID 0)
-- Dependencies: 235
-- Name: resenas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resenas_id_seq OWNED BY public.resenas.id;


--
-- TOC entry 232 (class 1259 OID 16518)
-- Name: reservas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservas (
    id integer NOT NULL,
    libro_id integer NOT NULL,
    usuario_id integer NOT NULL,
    fecha_reserva timestamp without time zone DEFAULT now(),
    estado character varying(50) NOT NULL,
    expira_el timestamp without time zone
);


ALTER TABLE public.reservas OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16517)
-- Name: reservas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reservas_id_seq OWNER TO postgres;

--
-- TOC entry 3581 (class 0 OID 0)
-- Dependencies: 231
-- Name: reservas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservas_id_seq OWNED BY public.reservas.id;


--
-- TOC entry 224 (class 1259 OID 16463)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre character varying(120) NOT NULL,
    email character varying(160) NOT NULL,
    rol character varying(50) NOT NULL,
    estado character varying(50) NOT NULL
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16462)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 3582 (class 0 OID 0)
-- Dependencies: 223
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- TOC entry 3343 (class 2604 OID 16406)
-- Name: autores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autores ALTER COLUMN id SET DEFAULT nextval('public.autores_id_seq'::regclass);


--
-- TOC entry 3344 (class 2604 OID 16415)
-- Name: categorias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias ALTER COLUMN id SET DEFAULT nextval('public.categorias_id_seq'::regclass);


--
-- TOC entry 3350 (class 2604 OID 16506)
-- Name: devoluciones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devoluciones ALTER COLUMN id SET DEFAULT nextval('public.devoluciones_id_seq'::regclass);


--
-- TOC entry 3346 (class 2604 OID 16475)
-- Name: ejemplares id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ejemplares ALTER COLUMN id SET DEFAULT nextval('public.ejemplares_id_seq'::regclass);


--
-- TOC entry 3342 (class 2604 OID 16395)
-- Name: libros id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros ALTER COLUMN id SET DEFAULT nextval('public.libros_id_seq'::regclass);


--
-- TOC entry 3354 (class 2604 OID 16539)
-- Name: multas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.multas ALTER COLUMN id SET DEFAULT nextval('public.multas_id_seq'::regclass);


--
-- TOC entry 3347 (class 2604 OID 16487)
-- Name: prestamos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos ALTER COLUMN id SET DEFAULT nextval('public.prestamos_id_seq'::regclass);


--
-- TOC entry 3355 (class 2604 OID 16556)
-- Name: resenas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resenas ALTER COLUMN id SET DEFAULT nextval('public.resenas_id_seq'::regclass);


--
-- TOC entry 3352 (class 2604 OID 16521)
-- Name: reservas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas ALTER COLUMN id SET DEFAULT nextval('public.reservas_id_seq'::regclass);


--
-- TOC entry 3345 (class 2604 OID 16466)
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- TOC entry 3549 (class 0 OID 16403)
-- Dependencies: 218
-- Data for Name: autores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autores (id, nombre, bio) FROM stdin;
1	Gabriel García Márquez	Autor colombiano, Nobel de Literatura.
2	Julio Cortázar	Escritor argentino, maestro del cuento.
3	J. K. Rowling	Autora de la saga Harry Potter.
4	George R. R. Martin	Autor de Canción de hielo y fuego.
5	Isabel Allende	Escritora chilena de realismo mágico.
6	Haruki Murakami	Novelista japonés contemporáneo.
7	Stephen King	Autor de novelas de terror y suspenso.
8	Yuval Noah Harari	Historiador y escritor israelí.
9	Brandon Sanderson	Autor de fantasía épica.
10	J. R. R. Tolkien	Creador de El Señor de los Anillos.
11	Neil Gaiman	Escritor británico, fantasía y cómic.
12	Carlos Ruiz Zafón	Autor de La sombra del viento.
\.


--
-- TOC entry 3551 (class 0 OID 16412)
-- Dependencies: 220
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorias (id, nombre, descripcion) FROM stdin;
1	Novela	Narrativa de ficción en prosa.
2	Fantasía	Mundos imaginarios, magia, etc.
3	Ciencia ficción	Ficción especulativa basada en ciencia.
4	Histórica	Contexto histórico real.
5	Juvenil	Orientada a público joven.
6	No ficción	Obras basadas en hechos reales.
7	Ensayo	Textos analíticos y reflexivos.
8	Terror	Obras de horror y suspenso.
9	Misterio	Tramas de investigación y enigmas.
10	Filosofía	Reflexiones filosóficas y pensamiento.
\.


--
-- TOC entry 3561 (class 0 OID 16503)
-- Dependencies: 230
-- Data for Name: devoluciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.devoluciones (id, prestamo_id, fecha_devolucion, condicion_retorno, observaciones) FROM stdin;
1	1	2025-11-16 10:05:00	ok	Devuelto un día tarde
2	2	2025-11-22 12:10:00	ok	Devuelto con leve retraso
3	3	2025-11-24 09:00:00	ok	Devuelto a tiempo
4	4	2025-11-28 16:30:00	ok	
5	5	2025-12-03 14:10:00	ok	Devuelto dos días tarde
6	15	2025-12-09 08:40:00	ok	
7	16	2025-12-10 13:30:00	ok	Devuelto un día tarde
8	17	2025-12-06 15:05:00	ok	A tiempo
9	18	2025-12-05 10:15:00	danado	Cubierta dañada
10	3	2025-11-25 10:00:00	ok	Registro duplicado de prueba
\.


--
-- TOC entry 3557 (class 0 OID 16472)
-- Dependencies: 226
-- Data for Name: ejemplares; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ejemplares (id, libro_id, estado, ubicacion) FROM stdin;
1	1	disponible	Estante A1
2	1	prestado	Estante A1
3	1	disponible	Estante A1
4	2	disponible	Estante A2
5	2	prestado	Estante A2
6	3	disponible	Estante B1
7	3	prestado	Estante B1
8	3	disponible	Estante B1
9	4	disponible	Estante B2
10	4	disponible	Estante B2
11	5	prestado	Estante C1
12	5	disponible	Estante C1
13	6	disponible	Estante C2
14	7	disponible	Estante D1
15	8	disponible	Estante D2
16	9	disponible	Estante E1
17	10	disponible	Estante E2
18	11	disponible	Estante F1
19	12	disponible	Estante F2
20	13	disponible	Estante G1
23	5	prestado	Estante C1
24	2	prestado	Estante A2
21	14	prestado	Estante G2
22	15	prestado	Estante H1
\.


--
-- TOC entry 3552 (class 0 OID 16422)
-- Dependencies: 221
-- Data for Name: libro_autores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libro_autores (libro_id, autor_id) FROM stdin;
1	1
2	2
3	3
4	10
5	4
6	5
7	6
8	7
9	8
10	9
11	10
12	11
13	12
14	7
15	8
\.


--
-- TOC entry 3553 (class 0 OID 16447)
-- Dependencies: 222
-- Data for Name: libro_categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libro_categorias (libro_id, categoria_id) FROM stdin;
1	1
1	4
2	1
3	1
3	5
4	2
5	2
6	1
7	1
7	3
8	8
9	6
9	7
10	2
11	2
12	2
13	1
13	9
14	8
15	6
\.


--
-- TOC entry 3547 (class 0 OID 16392)
-- Dependencies: 216
-- Data for Name: libros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libros (id, titulo, isbn, editorial, anio, edicion, sinopsis) FROM stdin;
1	Cien años de soledad	978000000001	Sudamericana	1967	1a	Saga de la familia Buendía en Macondo.
2	Rayuela	978000000002	Sudamericana	1963	1a	Novela experimental de Cortázar.
3	Harry Potter y la piedra filosofal	978000000003	Bloomsbury	1997	1a	El inicio de la saga de Harry Potter.
4	El Señor de los Anillos: La Comunidad del Anillo	978000000004	Allen & Unwin	1954	1a	Fantasía épica en la Tierra Media.
5	Juego de Tronos	978000000005	Bantam Spectra	1996	1a	Primer libro de Canción de hielo y fuego.
6	La casa de los espíritus	978000000006	Plaza & Janés	1982	1a	Historia de la familia Trueba.
7	Kafka en la orilla	978000000007	Shinchosha	2002	1a	Novela surrealista de Murakami.
8	It	978000000008	Viking	1986	1a	Terror psicológico en el pueblo de Derry.
9	Sapiens: De animales a dioses	978000000009	Harvill Secker	2011	1a	Historia breve de la humanidad.
10	Mistborn: El Imperio Final	978000000010	Tor Books	2006	1a	Fantasía épica con magia basada en metales.
11	El Hobbit	978000000011	Allen & Unwin	1937	1a	Aventura de Bilbo Bolsón.
12	American Gods	978000000012	HarperCollins	2001	1a	Choque entre dioses antiguos y nuevos.
13	La sombra del viento	978000000013	Planeta	2001	1a	Misterio en el Cementerio de los Libros Olvidados.
14	El resplandor	978000000014	Doubleday	1977	1a	Terror en el hotel Overlook.
15	Homo Deus	978000000015	Harvill Secker	2015	1a	Reflexiones sobre el futuro de la humanidad.
\.


--
-- TOC entry 3565 (class 0 OID 16536)
-- Dependencies: 234
-- Data for Name: multas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.multas (id, prestamo_id, usuario_id, motivo, monto, estado) FROM stdin;
1	1	1	Devolución tardía	20.00	pendiente
2	2	2	Devolución tardía	15.00	pendiente
3	5	5	Devolución tardía	30.00	pendiente
4	16	6	Devolución tardía	10.00	pendiente
5	18	8	Libro dañado	150.00	pendiente
6	3	3	Devolución tardía	5.00	pagada
7	4	4	Devolución tardía	5.00	pagada
8	15	5	Devolución tardía	5.00	pagada
\.


--
-- TOC entry 3559 (class 0 OID 16484)
-- Dependencies: 228
-- Data for Name: prestamos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prestamos (id, ejemplar_id, usuario_id, fecha_prestamo, fecha_vencimiento, estado, renovaciones) FROM stdin;
1	2	1	2025-11-01 10:00:00	2025-11-15 10:00:00	devuelto	0
2	5	2	2025-11-05 12:00:00	2025-11-20 12:00:00	devuelto	1
3	7	3	2025-11-10 09:30:00	2025-11-25 09:30:00	devuelto	0
4	11	4	2025-11-12 16:00:00	2025-11-27 16:00:00	devuelto	0
5	23	5	2025-11-20 14:00:00	2025-12-01 14:00:00	devuelto	2
6	2	6	2025-12-01 10:00:00	2025-12-15 10:00:00	activo	0
7	5	7	2025-12-02 11:00:00	2025-12-16 11:00:00	activo	0
8	7	8	2025-11-25 09:00:00	2025-12-05 09:00:00	activo	1
9	11	9	2025-11-28 17:00:00	2025-12-08 17:00:00	activo	0
10	23	10	2025-12-05 13:00:00	2025-12-19 13:00:00	activo	0
11	24	11	2025-12-06 09:15:00	2025-12-20 09:15:00	activo	0
12	1	2	2025-12-07 10:00:00	2025-12-21 10:00:00	activo	0
13	4	3	2025-12-08 11:00:00	2025-12-22 11:00:00	activo	0
14	6	4	2025-12-08 16:30:00	2025-12-22 16:30:00	activo	0
15	3	5	2025-11-30 08:45:00	2025-12-10 08:45:00	devuelto	0
16	9	6	2025-11-29 13:20:00	2025-12-09 13:20:00	devuelto	0
17	10	7	2025-11-27 15:00:00	2025-12-07 15:00:00	devuelto	1
18	12	8	2025-11-26 10:10:00	2025-12-06 10:10:00	devuelto	0
19	21	10	2025-12-11 12:10:00	2025-12-25 12:10:00	activo	0
20	22	13	2025-12-11 12:13:00	2025-12-25 12:13:00	activo	0
\.


--
-- TOC entry 3567 (class 0 OID 16553)
-- Dependencies: 236
-- Data for Name: resenas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resenas (id, usuario_id, libro_id, rating, comentario, fecha) FROM stdin;
1	1	1	5	Obra maestra del realismo mágico.	2025-11-20 10:00:00
2	2	2	4	Muy interesante pero algo complejo.	2025-11-21 11:00:00
3	3	3	5	Infancia resumida en este libro.	2025-11-22 12:00:00
4	4	4	5	Fantasía épica imprescindible.	2025-11-23 13:00:00
5	5	5	4	Intrigas y personajes increíbles.	2025-11-24 14:00:00
6	6	6	4	Bonita historia familiar.	2025-11-25 15:00:00
7	7	7	5	Murakami nunca decepciona.	2025-11-26 16:00:00
8	8	8	3	Demasiado largo pero entretenido.	2025-11-27 17:00:00
9	9	9	5	Muy recomendable para entender la historia.	2025-11-28 18:00:00
10	10	10	5	Sistema de magia buenísimo.	2025-11-29 19:00:00
11	11	11	4	Aventura muy divertida.	2025-11-30 20:00:00
12	12	12	4	Concepto muy original.	2025-12-01 21:00:00
13	1	13	5	Misterio perfecto.	2025-12-02 22:00:00
14	2	14	4	Da miedo de verdad.	2025-12-03 23:00:00
15	3	15	4	Te hace pensar en el futuro.	2025-12-04 09:00:00
\.


--
-- TOC entry 3563 (class 0 OID 16518)
-- Dependencies: 232
-- Data for Name: reservas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservas (id, libro_id, usuario_id, fecha_reserva, estado, expira_el) FROM stdin;
1	5	2	2025-12-07 18:22:52	en_cola	2025-12-09 18:22:52
2	3	1	2025-12-07 18:22:52	en_cola	2025-12-10 18:22:52
3	1	2	2025-12-09 20:50:30	en_cola	2025-12-20 00:00:00
4	4	6	2025-12-08 09:00:00	en_cola	2025-12-10 09:00:00
5	8	7	2025-12-08 10:30:00	en_cola	2025-12-11 10:30:00
6	9	8	2025-12-08 11:15:00	en_cola	2025-12-11 11:15:00
7	10	9	2025-12-08 12:00:00	en_cola	2025-12-11 12:00:00
8	11	10	2025-12-08 13:00:00	en_cola	2025-12-11 13:00:00
9	12	11	2025-12-08 14:00:00	en_cola	2025-12-11 14:00:00
10	13	12	2025-12-08 15:00:00	en_cola	2025-12-11 15:00:00
\.


--
-- TOC entry 3555 (class 0 OID 16463)
-- Dependencies: 224
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, nombre, email, rol, estado) FROM stdin;
1	Ana López	ana@example.com	lector	activo
2	Juan Pérez	juan@example.com	lector	activo
3	María García	maria@example.com	lector	activo
4	Carlos Sánchez	carlos@example.com	lector	activo
5	Lucía Torres	lucia@example.com	lector	activo
6	Raúl Hernández	raul@example.com	lector	bloqueado
7	Sofía Díaz	sofia@example.com	lector	activo
8	Pedro Romero	pedro@example.com	lector	activo
9	Laura Jiménez	laura@example.com	bibliotecario	activo
10	Miguel Castillo	miguel@example.com	lector	activo
11	Daniela Ortiz	daniela@example.com	lector	activo
12	Andrea Flores	andrea@example.com	lector	activo
13	prueba1	bibliotecadbpsql03@gmail.com	lector	activo
\.


--
-- TOC entry 3583 (class 0 OID 0)
-- Dependencies: 217
-- Name: autores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.autores_id_seq', 12, true);


--
-- TOC entry 3584 (class 0 OID 0)
-- Dependencies: 219
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorias_id_seq', 10, true);


--
-- TOC entry 3585 (class 0 OID 0)
-- Dependencies: 229
-- Name: devoluciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.devoluciones_id_seq', 10, true);


--
-- TOC entry 3586 (class 0 OID 0)
-- Dependencies: 225
-- Name: ejemplares_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ejemplares_id_seq', 24, true);


--
-- TOC entry 3587 (class 0 OID 0)
-- Dependencies: 215
-- Name: libros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.libros_id_seq', 15, true);


--
-- TOC entry 3588 (class 0 OID 0)
-- Dependencies: 233
-- Name: multas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.multas_id_seq', 8, true);


--
-- TOC entry 3589 (class 0 OID 0)
-- Dependencies: 227
-- Name: prestamos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prestamos_id_seq', 20, true);


--
-- TOC entry 3590 (class 0 OID 0)
-- Dependencies: 235
-- Name: resenas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.resenas_id_seq', 15, true);


--
-- TOC entry 3591 (class 0 OID 0)
-- Dependencies: 231
-- Name: reservas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservas_id_seq', 10, true);


--
-- TOC entry 3592 (class 0 OID 0)
-- Dependencies: 223
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 13, true);


--
-- TOC entry 3362 (class 2606 OID 16410)
-- Name: autores autores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autores
    ADD CONSTRAINT autores_pkey PRIMARY KEY (id);


--
-- TOC entry 3364 (class 2606 OID 16421)
-- Name: categorias categorias_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_nombre_key UNIQUE (nombre);


--
-- TOC entry 3366 (class 2606 OID 16419)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);


--
-- TOC entry 3380 (class 2606 OID 16511)
-- Name: devoluciones devoluciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devoluciones
    ADD CONSTRAINT devoluciones_pkey PRIMARY KEY (id);


--
-- TOC entry 3376 (class 2606 OID 16477)
-- Name: ejemplares ejemplares_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ejemplares
    ADD CONSTRAINT ejemplares_pkey PRIMARY KEY (id);


--
-- TOC entry 3368 (class 2606 OID 16426)
-- Name: libro_autores libro_autores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_autores
    ADD CONSTRAINT libro_autores_pkey PRIMARY KEY (libro_id, autor_id);


--
-- TOC entry 3370 (class 2606 OID 16451)
-- Name: libro_categorias libro_categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_categorias
    ADD CONSTRAINT libro_categorias_pkey PRIMARY KEY (libro_id, categoria_id);


--
-- TOC entry 3358 (class 2606 OID 16401)
-- Name: libros libros_isbn_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_isbn_key UNIQUE (isbn);


--
-- TOC entry 3360 (class 2606 OID 16399)
-- Name: libros libros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_pkey PRIMARY KEY (id);


--
-- TOC entry 3384 (class 2606 OID 16541)
-- Name: multas multas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.multas
    ADD CONSTRAINT multas_pkey PRIMARY KEY (id);


--
-- TOC entry 3378 (class 2606 OID 16491)
-- Name: prestamos prestamos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_pkey PRIMARY KEY (id);


--
-- TOC entry 3386 (class 2606 OID 16561)
-- Name: resenas resenas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resenas
    ADD CONSTRAINT resenas_pkey PRIMARY KEY (id);


--
-- TOC entry 3388 (class 2606 OID 16563)
-- Name: resenas resenas_usuario_id_libro_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resenas
    ADD CONSTRAINT resenas_usuario_id_libro_id_key UNIQUE (usuario_id, libro_id);


--
-- TOC entry 3382 (class 2606 OID 16524)
-- Name: reservas reservas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_pkey PRIMARY KEY (id);


--
-- TOC entry 3372 (class 2606 OID 16470)
-- Name: usuarios usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);


--
-- TOC entry 3374 (class 2606 OID 16468)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3396 (class 2606 OID 16512)
-- Name: devoluciones devoluciones_prestamo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devoluciones
    ADD CONSTRAINT devoluciones_prestamo_id_fkey FOREIGN KEY (prestamo_id) REFERENCES public.prestamos(id);


--
-- TOC entry 3393 (class 2606 OID 16478)
-- Name: ejemplares ejemplares_libro_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ejemplares
    ADD CONSTRAINT ejemplares_libro_id_fkey FOREIGN KEY (libro_id) REFERENCES public.libros(id);


--
-- TOC entry 3389 (class 2606 OID 16432)
-- Name: libro_autores libro_autores_autor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_autores
    ADD CONSTRAINT libro_autores_autor_id_fkey FOREIGN KEY (autor_id) REFERENCES public.autores(id);


--
-- TOC entry 3390 (class 2606 OID 16427)
-- Name: libro_autores libro_autores_libro_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_autores
    ADD CONSTRAINT libro_autores_libro_id_fkey FOREIGN KEY (libro_id) REFERENCES public.libros(id);


--
-- TOC entry 3391 (class 2606 OID 16457)
-- Name: libro_categorias libro_categorias_categoria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_categorias
    ADD CONSTRAINT libro_categorias_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES public.categorias(id);


--
-- TOC entry 3392 (class 2606 OID 16452)
-- Name: libro_categorias libro_categorias_libro_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_categorias
    ADD CONSTRAINT libro_categorias_libro_id_fkey FOREIGN KEY (libro_id) REFERENCES public.libros(id);


--
-- TOC entry 3399 (class 2606 OID 16542)
-- Name: multas multas_prestamo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.multas
    ADD CONSTRAINT multas_prestamo_id_fkey FOREIGN KEY (prestamo_id) REFERENCES public.prestamos(id);


--
-- TOC entry 3400 (class 2606 OID 16547)
-- Name: multas multas_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.multas
    ADD CONSTRAINT multas_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 3394 (class 2606 OID 16492)
-- Name: prestamos prestamos_ejemplar_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_ejemplar_id_fkey FOREIGN KEY (ejemplar_id) REFERENCES public.ejemplares(id);


--
-- TOC entry 3395 (class 2606 OID 16497)
-- Name: prestamos prestamos_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 3401 (class 2606 OID 16569)
-- Name: resenas resenas_libro_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resenas
    ADD CONSTRAINT resenas_libro_id_fkey FOREIGN KEY (libro_id) REFERENCES public.libros(id);


--
-- TOC entry 3402 (class 2606 OID 16564)
-- Name: resenas resenas_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resenas
    ADD CONSTRAINT resenas_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- TOC entry 3397 (class 2606 OID 16525)
-- Name: reservas reservas_libro_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_libro_id_fkey FOREIGN KEY (libro_id) REFERENCES public.libros(id);


--
-- TOC entry 3398 (class 2606 OID 16530)
-- Name: reservas reservas_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


-- Completed on 2025-12-11 13:03:00 CST

--
-- PostgreSQL database dump complete
--

\unrestrict syW62XVoHG1RGpuvFiSO7sRR64WuWTVAYhHybTxpIPZhpnt6Xnr3IWSQSQEuvgn

