--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';

ALTER DATABASE universe OWNER TO freecodecamp;

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
-- Name: astronomer; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronomer (
    astronomer_id integer NOT NULL,
    name character varying(60) NOT NULL,
    country text,
    is_alive boolean,
    birth_year integer,
    notable_discovery text
);


ALTER TABLE public.astronomer OWNER TO freecodecamp;

--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronomer_astronomer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronomer_astronomer_id_seq OWNER TO freecodecamp;

--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronomer_astronomer_id_seq OWNED BY public.astronomer.astronomer_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    type text,
    distance_in_mill numeric,
    num_stars bigint,
    diameter_in_light integer,
    has_black_hole boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    planet_id integer,
    diameter_km numeric,
    has_atmosphere boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    star_id integer,
    type text,
    has_life boolean,
    habitable_zone boolean,
    orbit_distance numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer,
    type text,
    mass_solar numeric,
    age_bill_years numeric,
    has_planetary_system boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: astronomer astronomer_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer ALTER COLUMN astronomer_id SET DEFAULT nextval('public.astronomer_astronomer_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);

--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: astronomer; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronomer VALUES (1, 'Galileo Galilei', 'Italy', false, 1564, 'Moons of Jupiter, telescope improvements');
INSERT INTO public.astronomer VALUES (2, 'Johannes Kepler', 'Germany', false, 1571, 'Laws of planetary motion');
INSERT INTO public.astronomer VALUES (3, 'Nicolaus Copern', 'Poland', false, 1473, 'Heliocentric model of the solar system');
INSERT INTO public.astronomer VALUES (4, 'Isaac Newton', 'England', false, 1643, 'Law of universal gravitation');

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, 4000000000, 100000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2.5, 1000000000000, 220000, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3, 40000000000, 60000, false);
INSERT INTO public.galaxy VALUES (4, 'Large Megallanic Cloud', 'Irregular', 0.163, 10000000000, 14000, false);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Irregular', 0.2, 700000000000, 7000, false);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 53, 12000000000000000, 120000, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, false);
INSERT INTO public.moon VALUES (2, 'Io', 5, 3643, true);
INSERT INTO public.moon VALUES (3, 'Europa', 5, 3121, true);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, 5268, true);
INSERT INTO public.moon VALUES (5, 'Callisto', 5, 4821, true);
INSERT INTO public.moon VALUES (6, 'Titan', 6, 5151, true);
INSERT INTO public.moon VALUES (7, 'Enceladus', 6, 504, true);
INSERT INTO public.moon VALUES (8, 'Rhea', 6, 1528, true);
INSERT INTO public.moon VALUES (9, 'Dione', 6, 1122, true);
INSERT INTO public.moon VALUES (10, 'Tethys', 6, 1062, false);
INSERT INTO public.moon VALUES (11, 'Mimas', 6, 396, false);
INSERT INTO public.moon VALUES (12, 'Hyperion', 6, 270, false);
INSERT INTO public.moon VALUES (13, 'Iapetus', 6, 1470, false);
INSERT INTO public.moon VALUES (14, 'Miranda', 7, 471, false);
INSERT INTO public.moon VALUES (15, 'Ariel', 7, 1158, false);
INSERT INTO public.moon VALUES (16, 'Umbriel', 7, 1169, false);
INSERT INTO public.moon VALUES (17, 'Titania', 7, 1578, false);
INSERT INTO public.moon VALUES (18, 'Oberon', 7, 1523, false);
INSERT INTO public.moon VALUES (19, 'Phobos', 4, 22, false);
INSERT INTO public.moon VALUES (20, 'Deimos', 4, 12, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrsetrial', false, false, 0.39);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terresrtrial', false, false, 0.72);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', false, false, 1.52);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', false, false, 5.2);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Ice Giant', false, false, 9.58);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', false, false, 19.2);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', false, false, 30.1);
INSERT INTO public.planet VALUES (9, 'Kepler-452b', 7, 'Super-Earth', false, true, 1.05);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri', 4, 'Terrestrial', false, true, 0.05);
INSERT INTO public.planet VALUES (11, 'Kepler-22b', 9, 'Super-Earth', false, true, 0.85);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1d', 10, 'Terrestrial', false, true, 0.022);
INSERT INTO public.planet VALUES (13, 'TRAPPIST-1e', 10, 'Terrestrial', false, true, 0.029);
INSERT INTO public.planet VALUES (14, 'TRAPPIST-1f', 10, 'Terrestrial', false, true, 0.038);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 1, 4.6, true);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 'G2V', 1.1, 5.3, false);
INSERT INTO public.star VALUES (3, 'Aplha Centauri B', 1, 'K1V', 0.91, 5.3, false);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 'M5.5Ve', 0.12, 4.85, true);
INSERT INTO public.star VALUES (5, 'Sirius A', 1, 'A1V', 2.06, 0.24, false);
INSERT INTO public.star VALUES (6, 'Sirius B', 1, 'DA2', 1, 0.12, false);
INSERT INTO public.star VALUES (7, 'Kepler-452', 1, 'G2V', 1037, 6, true);
INSERT INTO public.star VALUES (8, 'Gliese 581', 1, 'M3V', 0.31, 7, true);
INSERT INTO public.star VALUES (9, 'Kepler-22', 1, 'G5V', 0.97, 4, true);
INSERT INTO public.star VALUES (10, 'TRAPPIST-1', 1, 'M8V', 0.089, 7.6, true);
INSERT INTO public.star VALUES (11, 'Gliese 667 C', 1, 'M1.55V', 0.33, 0, true);
INSERT INTO public.star VALUES (12, 'K2-18', 1, 'M2.5V', 0.41, 5, true);


--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronomer_astronomer_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: astronomer astronomer_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_name UNIQUE (name);

--
-- Name: astronomer astronomer_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_pkey PRIMARY KEY (astronomer_id);


--
-- Name: galaxy galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


