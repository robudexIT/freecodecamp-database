--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: asteriod; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteriod (
    asteriod_id integer NOT NULL,
    name character varying(60) NOT NULL,
    distance_from_sun integer NOT NULL,
    diameter numeric NOT NULL,
    discription text,
    within_solar_system boolean NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.asteriod OWNER TO freecodecamp;

--
-- Name: asteriod_asteriod_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteriod_asteriod_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteriod_asteriod_id_seq OWNER TO freecodecamp;

--
-- Name: asteriod_asteriod_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteriod_asteriod_id_seq OWNED BY public.asteriod.asteriod_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric NOT NULL,
    description text,
    is_local_group boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

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
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric NOT NULL,
    description text,
    has_water boolean NOT NULL,
    planet_id integer NOT NULL
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
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric NOT NULL,
    description text,
    has_life boolean NOT NULL,
    star_id integer NOT NULL
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
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric NOT NULL,
    description text,
    has_planets boolean NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: asteriod asteriod_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteriod ALTER COLUMN asteriod_id SET DEFAULT nextval('public.asteriod_asteriod_id_seq'::regclass);


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
-- Data for Name: asteriod; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteriod VALUES (1, 'ceres', 1234567, 1234, 'ceres roids', true, 13);
INSERT INTO public.asteriod VALUES (2, 'vesta', 1234567, 1234, 'vesta roids', true, 13);
INSERT INTO public.asteriod VALUES (3, 'pallas', 1234567, 1234, 'pallas roids', true, 13);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'MilkyWay', 123456789, 0, 'Our Home galaxy', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 233456789, 30, 'Andromeda  galaxy', true);
INSERT INTO public.galaxy VALUES (3, 'Antennea', 453456789, 45, 'Antennea  galaxy', true);
INSERT INTO public.galaxy VALUES (4, 'Backward', 563456789, 65, 'Backward  galaxy', true);
INSERT INTO public.galaxy VALUES (5, 'Blackeye', 763456789, 75, 'Black Eye  galaxy', true);
INSERT INTO public.galaxy VALUES (6, 'Butterfly', 843456789, 75, 'Butterfly  galaxy', true);
INSERT INTO public.galaxy VALUES (7, 'Comet', 953456789, 95, 'Comet  galaxy', true);
INSERT INTO public.galaxy VALUES (8, 'Cigar', 993456789, 958, 'Cigar  galaxy', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'ourmoon', 2000, 1, 'our own moon', false, 3);
INSERT INTO public.moon VALUES (3, 'jup01', 2000, 6, 'jupiter  moon', false, 5);
INSERT INTO public.moon VALUES (4, 'jup02', 2000, 6, 'jupiter  moon', false, 5);
INSERT INTO public.moon VALUES (5, 'jup3', 2000, 6, 'jupiter  moon', false, 5);
INSERT INTO public.moon VALUES (6, 'jup4', 2000, 6, 'jupiter  moon', false, 5);
INSERT INTO public.moon VALUES (7, 'jup5', 2000, 6, 'jupiter  moon', false, 5);
INSERT INTO public.moon VALUES (8, 'jup6', 2000, 6, 'jupiter  moon', false, 5);
INSERT INTO public.moon VALUES (9, 'jup07', 2000, 6, 'jupiter  moon', false, 5);
INSERT INTO public.moon VALUES (10, 'jup08', 2000, 6, 'jupiter  moon', false, 5);
INSERT INTO public.moon VALUES (11, 'sat01', 2000, 6, 'saturn  moon', false, 6);
INSERT INTO public.moon VALUES (12, 'sat02', 2000, 6, 'saturn  moon', false, 6);
INSERT INTO public.moon VALUES (13, 'sat03', 2000, 6, 'saturn  moon', false, 6);
INSERT INTO public.moon VALUES (14, 'sat04', 2000, 6, 'saturn  moon', false, 6);
INSERT INTO public.moon VALUES (15, 'sat05', 2000, 6, 'saturn  moon', false, 6);
INSERT INTO public.moon VALUES (16, 'sat06', 2000, 6, 'saturn  moon', false, 6);
INSERT INTO public.moon VALUES (17, 'sat07', 2000, 6, 'saturn  moon', false, 6);
INSERT INTO public.moon VALUES (18, 'sat08', 2000, 6, 'saturn  moon', false, 6);
INSERT INTO public.moon VALUES (19, 'mars01', 2000, 6, 'mars  moon', false, 4);
INSERT INTO public.moon VALUES (20, 'mars02', 2000, 6, 'mars  moon', false, 4);
INSERT INTO public.moon VALUES (21, 'mars03', 2000, 6, 'mars  moon', false, 4);
INSERT INTO public.moon VALUES (22, 'mars04', 2000, 6, 'mars  moon', false, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'mercury', 2000, 2, 'Mercury', false, 13);
INSERT INTO public.planet VALUES (2, 'venus', 2000, 2, 'Venus', false, 13);
INSERT INTO public.planet VALUES (3, 'earth', 2000, 0, 'Earth', false, 13);
INSERT INTO public.planet VALUES (4, 'mars', 2000, 1, 'Mars', false, 13);
INSERT INTO public.planet VALUES (5, 'jupiter', 2000, 2, 'jupiter', false, 13);
INSERT INTO public.planet VALUES (6, 'saturn', 2000, 3, 'saturn', false, 13);
INSERT INTO public.planet VALUES (7, 'uranus', 2000, 4, 'uranus', false, 13);
INSERT INTO public.planet VALUES (8, 'neptune', 2000, 5, 'neptune', false, 13);
INSERT INTO public.planet VALUES (9, 'pluto', 2000, 6, 'pluto', false, 13);
INSERT INTO public.planet VALUES (10, 'extra01', 2000, 10, 'extra01', false, 13);
INSERT INTO public.planet VALUES (11, 'extra02', 2000, 11, 'extra02', false, 13);
INSERT INTO public.planet VALUES (12, 'extra03', 2000, 13, 'extra03', false, 13);
INSERT INTO public.planet VALUES (13, 'extra04', 2000, 14, 'extra04', false, 13);
INSERT INTO public.planet VALUES (14, 'antplanet01', 2000, 2000, 'antplanet01', false, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'uy scuti', 123456789, 12345, 'star in milkyway', true, 1);
INSERT INTO public.star VALUES (2, 'antares', 223456789, 23456, 'star in milkyway', true, 1);
INSERT INTO public.star VALUES (3, 'and01', 333456789, 33456, 'star in andromeda', true, 2);
INSERT INTO public.star VALUES (4, 'and02', 443456789, 44456, 'star in andromeda', true, 2);
INSERT INTO public.star VALUES (5, 'ant01', 553456789, 55456, 'star in antennea', true, 3);
INSERT INTO public.star VALUES (6, 'ant02', 663456789, 66456, 'star in antennea', true, 3);
INSERT INTO public.star VALUES (7, 'black01', 773456789, 77456, 'blackeye in antennea', true, 4);
INSERT INTO public.star VALUES (8, 'black02', 883456789, 88456, 'blackeye in antennea', true, 4);
INSERT INTO public.star VALUES (9, 'bty01', 993456789, 99456, 'star in butterfly', true, 5);
INSERT INTO public.star VALUES (11, 'cigar01', 994456789, 99556, 'star in cigar', true, 7);
INSERT INTO public.star VALUES (12, 'comet01', 994456789, 99556, 'star in cigar', true, 8);
INSERT INTO public.star VALUES (13, 'sun', 223456789, 23456, 'our sun', true, 1);


--
-- Name: asteriod_asteriod_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteriod_asteriod_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 13, true);


--
-- Name: asteriod asteriod_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteriod
    ADD CONSTRAINT asteriod_name_key UNIQUE (name);


--
-- Name: asteriod asteriod_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteriod
    ADD CONSTRAINT asteriod_pkey PRIMARY KEY (asteriod_id);


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
-- Name: asteriod asteriod_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteriod
    ADD CONSTRAINT asteriod_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

