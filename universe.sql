--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO postgres;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    type text,
    mass numeric,
    number_of_stars integer
);


ALTER TABLE public.galaxy OWNER TO postgres;

--
-- Name: galaxy_cluster; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy_cluster (
    galaxy_cluster_id integer NOT NULL,
    name character varying(50) NOT NULL,
    type text,
    number_of_galaxies integer,
    distance_from_earth numeric
);


ALTER TABLE public.galaxy_cluster OWNER TO postgres;

--
-- Name: galaxy_cluster_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_cluster_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_cluster_cluster_id_seq OWNER TO postgres;

--
-- Name: galaxy_cluster_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_cluster_cluster_id_seq OWNED BY public.galaxy_cluster.galaxy_cluster_id;


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    type text,
    mass numeric(10,2),
    diameter numeric(10,2),
    is_dead boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    type text,
    mass numeric(10,2),
    diameter numeric(10,2),
    is_dead boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    type text,
    mass numeric(10,2),
    diameter numeric(10,2),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_cluster galaxy_cluster_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy_cluster ALTER COLUMN galaxy_cluster_id SET DEFAULT nextval('public.galaxy_cluster_cluster_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 150000, 200);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 120000, 300);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 50000, 100);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 80000, 150);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 90000, 120);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Ring', 40000, 80);


--
-- Data for Name: galaxy_cluster; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.galaxy_cluster VALUES (1, 'Local Group', 'Group', 54, 0);
INSERT INTO public.galaxy_cluster VALUES (2, 'Virgo Cluster', 'Cluster', 1300, 54000000);
INSERT INTO public.galaxy_cluster VALUES (3, 'Coma Cluster', 'Cluster', 1000, 320000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.moon VALUES (41, 'Moon', 'Natural', 0.07, 3474.00, false, 15);
INSERT INTO public.moon VALUES (42, 'Phobos', 'Natural', 0.01, 22.00, false, 16);
INSERT INTO public.moon VALUES (43, 'Deimos', 'Natural', 0.01, 12.00, false, 16);
INSERT INTO public.moon VALUES (44, 'Io', 'Volcanic', 0.08, 3643.00, false, 17);
INSERT INTO public.moon VALUES (45, 'Europa', 'Ice', 0.04, 3121.00, false, 17);
INSERT INTO public.moon VALUES (46, 'Ganymede', 'Ice', 0.14, 5268.00, false, 17);
INSERT INTO public.moon VALUES (47, 'Callisto', 'Ice', 0.10, 4820.00, false, 17);
INSERT INTO public.moon VALUES (48, 'Titan', 'Methane-rich', 0.13, 5150.00, false, 18);
INSERT INTO public.moon VALUES (49, 'Rhea', 'Ice', 0.02, 1528.00, false, 18);
INSERT INTO public.moon VALUES (50, 'Iapetus', 'Ice', 0.01, 1469.00, false, 18);
INSERT INTO public.moon VALUES (51, 'Dione', 'Ice', 0.01, 1123.00, false, 18);
INSERT INTO public.moon VALUES (52, 'Triton', 'Ice', 0.21, 2706.00, false, 20);
INSERT INTO public.moon VALUES (53, 'Charon', 'Rocky', 0.01, 1212.00, false, 22);
INSERT INTO public.moon VALUES (54, 'Nereid', 'Rocky', 0.01, 340.00, false, 20);
INSERT INTO public.moon VALUES (55, 'Oberon', 'Ice', 0.03, 1523.00, false, 19);
INSERT INTO public.moon VALUES (56, 'Titania', 'Ice', 0.03, 1578.00, false, 19);
INSERT INTO public.moon VALUES (57, 'Umbriel', 'Ice', 0.01, 1169.00, false, 19);
INSERT INTO public.moon VALUES (58, 'Ariel', 'Ice', 0.01, 1157.00, false, 19);
INSERT INTO public.moon VALUES (59, 'Miranda', 'Ice', 0.01, 471.00, false, 19);
INSERT INTO public.moon VALUES (60, 'Enceladus', 'Ice', 0.01, 504.00, false, 18);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planet VALUES (13, 'Mercury', 'Rocky', 0.33, 4879.00, false, 1);
INSERT INTO public.planet VALUES (14, 'Venus', 'Rocky', 4.87, 12104.00, false, 1);
INSERT INTO public.planet VALUES (15, 'Earth', 'Rocky', 5.97, 12742.00, false, 1);
INSERT INTO public.planet VALUES (16, 'Mars', 'Rocky', 0.64, 6779.00, false, 1);
INSERT INTO public.planet VALUES (17, 'Jupiter', 'Gas Giant', 189.80, 139820.00, false, 1);
INSERT INTO public.planet VALUES (18, 'Saturn', 'Gas Giant', 56.80, 116460.00, false, 1);
INSERT INTO public.planet VALUES (19, 'Uranus', 'Ice Giant', 8.68, 50724.00, false, 1);
INSERT INTO public.planet VALUES (20, 'Neptune', 'Ice Giant', 10.20, 49244.00, false, 1);
INSERT INTO public.planet VALUES (21, 'Kepler-22b', 'Exoplanet', 3.60, 30000.00, false, 2);
INSERT INTO public.planet VALUES (22, 'Proxima b', 'Exoplanet', 1.30, 12000.00, false, 5);
INSERT INTO public.planet VALUES (23, 'HD 209458 b', 'Hot Jupiter', 22.00, 143000.00, false, 6);
INSERT INTO public.planet VALUES (24, 'TRAPPIST-1e', 'Rocky', 0.62, 11600.00, false, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type', 1.00, 1392.00, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'A-type', 2.00, 2360.00, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red Supergiant', 11.00, 6170.00, 1);
INSERT INTO public.star VALUES (4, 'Rigel', 'Blue Supergiant', 21.00, 7800.00, 2);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'Red Dwarf', 0.12, 200.00, 2);
INSERT INTO public.star VALUES (6, 'Vega', 'A-type', 2.10, 2360.00, 3);


--
-- Name: galaxy_cluster_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_cluster_cluster_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 60, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy_cluster galaxy_cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy_cluster
    ADD CONSTRAINT galaxy_cluster_name_key UNIQUE (name);


--
-- Name: galaxy_cluster galaxy_cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy_cluster
    ADD CONSTRAINT galaxy_cluster_pkey PRIMARY KEY (galaxy_cluster_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

