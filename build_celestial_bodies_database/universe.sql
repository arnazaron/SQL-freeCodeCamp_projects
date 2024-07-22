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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(100),
    is_spherical boolean,
    age_in_millions_of_years numeric,
    galaxy_type character varying(30) NOT NULL
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
    name character varying(30) NOT NULL,
    description character varying(100),
    has_life boolean,
    modern_discovery boolean,
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
-- Name: object; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.object (
    object_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.object OWNER TO freecodecamp;

--
-- Name: object_object_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.object_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.object_object_id_seq OWNER TO freecodecamp;

--
-- Name: object_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.object_object_id_seq OWNED BY public.object.object_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(100),
    distance_from_its_star_in_au numeric,
    planet_type character varying(30) NOT NULL,
    number_of_moons integer,
    has_life boolean,
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
    name character varying(30) NOT NULL,
    description character varying(100),
    distance_from_earth_in_light_years numeric,
    number_of_planets integer,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: object object_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.object ALTER COLUMN object_id SET DEFAULT nextval('public.object_object_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy.', false, 13610, 'spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Our neighbour galaxy.', false, 10010, 'spiral');
INSERT INTO public.galaxy VALUES (3, 'Virgo A', 'One of the greatest galaxies in mass and size.', true, 13240, 'spherical');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'A sattelite galaxy to Milky Way.', false, 1101, 'dwarf');
INSERT INTO public.galaxy VALUES (5, 'Cygnus A', 'One of the strongest radio sources in the sky.', true, 3, 'spherical');
INSERT INTO public.galaxy VALUES (6, 'Canis Major Overdensity', 'Closest neighboring galaxy to Earth.', false, 7000, 'dwarf irregular');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The only natural satellite of Earth.', false, false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'First moon of Mars.', false, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Second moon of Mars.', false, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'First Galilean moon of Jupiter.', false, false, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Second Galilean moon of Jupiter.', true, false, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Third Galilean moon of Jupiter.', true, false, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Fourth Galilean moon of Jupiter.', false, false, 5);
INSERT INTO public.moon VALUES (8, 'Dione', 'One of the moons of Saturn captured by Cassini spacecraft.', false, true, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'One of the moons of Saturn captured by Cassini spacecraft.', true, true, 6);
INSERT INTO public.moon VALUES (10, 'Epimetheus', 'One of the moons of Saturn captured by Cassini spacecraft.', false, true, 6);
INSERT INTO public.moon VALUES (11, 'Prometheus', 'One of the moons of Saturn captured by Cassini spacecraft.', false, true, 6);
INSERT INTO public.moon VALUES (12, 'Mimas', 'One of the moons of Saturn captured by Cassini spacecraft.', false, true, 6);
INSERT INTO public.moon VALUES (13, 'Rhea', 'One of the moons of Saturn captured by Cassini spacecraft.', false, true, 6);
INSERT INTO public.moon VALUES (14, 'Janus', 'One of the moons of Saturn captured by Cassini spacecraft.', false, true, 6);
INSERT INTO public.moon VALUES (15, 'Tethys', 'One of the moons of Saturn captured by Cassini spacecraft.', false, true, 6);
INSERT INTO public.moon VALUES (16, 'Titan', 'One of the moons of Saturn captured by Cassini spacecraft.', false, true, 6);
INSERT INTO public.moon VALUES (17, 'Titania', 'Named after Shakespearean king of Elves.', false, true, 7);
INSERT INTO public.moon VALUES (18, 'Oberon', 'Named after Shakespearean queen of Elves.', false, true, 7);
INSERT INTO public.moon VALUES (19, 'Miranda', 'Named after Shakespearean leading character in The Tempest.', false, true, 7);
INSERT INTO public.moon VALUES (20, 'Ariel', 'Named after a sky spirit in a poem The Rape of the Lock by Alexander Pope.', false, true, 7);
INSERT INTO public.moon VALUES (21, 'Umbriel', 'Named after a sky spirit in a poem The Rape of the Lock by Alexander Pope.', false, true, 7);
INSERT INTO public.moon VALUES (22, 'Naiad', 'Named after mermaid creatures in Greek mythology.', false, true, 8);
INSERT INTO public.moon VALUES (23, 'Thalassa', 'Named after the Greek goddess of sea.', false, true, 8);
INSERT INTO public.moon VALUES (24, 'Despina', 'Named after a daughter of Poseidon and Demeter.', false, true, 8);
INSERT INTO public.moon VALUES (25, 'Galatea', 'Named after a nereid in Greek mythology.', false, true, 8);
INSERT INTO public.moon VALUES (26, 'Proteus', 'Named after the shape-changing sea god of Greek mythology.', false, true, 8);


--
-- Data for Name: object; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.object VALUES (1, 'Oumuamua', 'The first interstellar object detected passing through the Solar System.');
INSERT INTO public.object VALUES (2, 'Halley Comet', 'One of the most recognized periodic comet in history.');
INSERT INTO public.object VALUES (3, 'UFO', 'Unindenfied flying object. Martians. Annunaki. Eridians. Zergs. Protoss. Klingons. Xenomorphs. Ewoks.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Closest planet to the Sun.', 0.387, 'terrestrial', 0, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'descr', 0.723, 'terrestrial.', 0, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Our home planet.', 1, 'type', 1, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Is there life on Mars? Future destination for cyborgs of Ilon Mask.', 1.523, 'terrestrial', 2, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The biggest planet in the Solar system.', 5.203, 'gas giant', 95, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Has the most beautiful rings.', 9.582, 'gas giant', 146, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Named after the sky.', 19.191, 'ice giant', 28, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Named after the god of Seas', 30.07, 'ice giant', 16, false, 1);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 'First known planet orbiting Proxima Centauri. It is in the habitable zone.', 0.05, 'terrestrial', 0, true, 2);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', 'Second known planet orbiting Proxima Centauri.', 1.5, 'gas dwarf', 0, false, 2);
INSERT INTO public.planet VALUES (11, 'Aremis : Vega II', 'A lush, verdant world orbited by a set of planetary rings.', 1, 'terrestrial', 2, true, 6);
INSERT INTO public.planet VALUES (12, 'Selene : Vega III', 'An industrial world in the middle of economic downturn.', 1.5, 'terrestrial', 2, true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our home beautiful star.', 0.0000152104, 8, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Closest star to the Sun.', 4.2465, 2, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'One of the brightest stars in the sky for a naked eye.', 500, 0, 1);
INSERT INTO public.star VALUES (4, 'Aldebaran', 'A star located in the zodiac constellation of Taurus.', 55.55, 1, 1);
INSERT INTO public.star VALUES (5, 'Sirius', 'The brightest star in the night sky.', 8.6, 0, 1);
INSERT INTO public.star VALUES (6, 'Vega', 'The brightest star in the northern constellation of Lyra.', 25, 4, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: object_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.object_object_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: object object_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.object
    ADD CONSTRAINT object_name_key UNIQUE (name);


--
-- Name: object object_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.object
    ADD CONSTRAINT object_pkey PRIMARY KEY (object_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


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

