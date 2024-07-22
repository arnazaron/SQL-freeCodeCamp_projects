#!/bin/bash
PSQL1="psql -X --username=freecodecamp --dbname=postgres -t --no-align -c"
PSQL="psql -X --username=freecodecamp --dbname=universe -t --no-align -c"

echo $($PSQL1 "DROP DATABASE universe;")
echo $($PSQL1 "CREATE DATABASE universe;")
echo $($PSQL "CREATE TABLE galaxy(galaxy_id SERIAL PRIMARY KEY, name VARCHAR(30) UNIQUE NOT NULL, description VARCHAR(100), is_spherical BOOLEAN, age_in_millions_of_years NUMERIC, galaxy_type VARCHAR(30) NOT NULL);")
echo $($PSQL "CREATE TABLE star(star_id SERIAL PRIMARY KEY, name VARCHAR(30) UNIQUE NOT NULL, description VARCHAR(100), distance_from_earth_in_light_years NUMERIC, number_of_planets INT, galaxy_id INT NOT NULL);")
echo $($PSQL "CREATE TABLE planet(planet_id SERIAL PRIMARY KEY, name VARCHAR(30) UNIQUE NOT NULL, description VARCHAR(100), distance_from_its_star_in_au NUMERIC, planet_type VARCHAR(30) NOT NULL, number_of_moons INT, has_life BOOLEAN, star_id INT NOT NULL);")
echo $($PSQL "CREATE TABLE moon(moon_id SERIAL PRIMARY KEY, name VARCHAR(30) UNIQUE NOT NULL, description VARCHAR(100), has_life BOOLEAN, modern_discovery BOOLEAN, planet_id INT NOT NULL);")
echo $($PSQL "CREATE TABLE object(object_id SERIAL PRIMARY KEY, name VARCHAR(30) UNIQUE NOT NULL, description TEXT NOT NULL);")
echo $($PSQL "ALTER TABLE star ADD FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id);")
echo $($PSQL "ALTER TABLE planet ADD FOREIGN KEY (star_id) REFERENCES star(star_id);")
echo $($PSQL "ALTER TABLE moon ADD FOREIGN KEY (planet_id) REFERENCES planet(planet_id);")
echo $($PSQL "INSERT INTO galaxy(name, description, is_spherical, age_in_millions_of_years, galaxy_type) VALUES('Milky Way', 'Our home galaxy.', FALSE, 13610, 'spiral'), ('Andromeda Galaxy', 'Our neighbour galaxy.', FALSE, 10010, 'spiral'), ('Virgo A', 'One of the greatest galaxies in mass and size.', TRUE, 13240, 'spherical'), ('Large Magellanic Cloud', 'A sattelite galaxy to Milky Way.', FALSE, 1101, 'dwarf'), ('Cygnus A', 'One of the strongest radio sources in the sky.', TRUE, 3, 'spherical'), ('Canis Major Overdensity', 'Closest neighboring galaxy to Earth.', FALSE, 7000, 'dwarf irregular');")
echo $($PSQL "INSERT INTO star(name, description, distance_from_earth_in_light_years, number_of_planets, galaxy_id) VALUES('Sun', 'Our home beautiful star.', 0.0000152104, 8, 1), ('Proxima Centauri', 'Closest star to the Sun.', 4.2465, 2, 1), ('Betelgeuse', 'One of the brightest stars in the sky for a naked eye.', 500, 0, 1), ('Aldebaran', 'A star located in the zodiac constellation of Taurus.', 55.55, 1, 1), ('Sirius', 'The brightest star in the night sky.', 8.6, 0, 1), ('Vega', 'The brightest star in the northern constellation of Lyra.', 25, 4, 1);")
echo $($PSQL "INSERT INTO planet(name, description, distance_from_its_star_in_au, planet_type, number_of_moons, has_life, star_id) VALUES('Mercury', 'Closest planet to the Sun.', 0.387, 'terrestrial', 0, FALSE, 1), ('Venus', 'descr', 0.723, 'terrestrial.', 0, FALSE, 1), ('Earth', 'Our home planet.', 1, 'type', 1, FALSE, 1), ('Mars', 'Is there life on Mars? Future destination for cyborgs of Ilon Mask.', 1.523, 'terrestrial', 2, TRUE, 1), ('Jupiter', 'The biggest planet in the Solar system.', 5.203, 'gas giant', 95, FALSE, 1), ('Saturn', 'Has the most beautiful rings.', 9.582, 'gas giant', 146, FALSE, 1), ('Uranus', 'Named after the sky.', 19.191, 'ice giant', 28, FALSE, 1), ('Neptune', 'Named after the god of Seas', 30.07, 'ice giant', 16, FALSE, 1), ('Proxima Centauri b', 'First known planet orbiting Proxima Centauri. It is in the habitable zone.', 0.05, 'terrestrial', 0, TRUE, 2), ('Proxima Centauri c', 'Second known planet orbiting Proxima Centauri.', 1.5, 'gas dwarf', 0, FALSE, 2), ('Aremis : Vega II', 'A lush, verdant world orbited by a set of planetary rings.', 1, 'terrestrial', 2, TRUE, 6), ('Selene : Vega III', 'An industrial world in the middle of economic downturn.', 1.5, 'terrestrial', 2, TRUE, 6);")
echo $($PSQL "INSERT INTO moon(name, description, has_life, modern_discovery, planet_id)
VALUES('Moon', 'The only natural satellite of Earth.', FALSE, FALSE, 3),
('Phobos', 'First moon of Mars.', FALSE, FALSE, 4),
('Deimos', 'Second moon of Mars.', FALSE, FALSE, 4),
('Io', 'First Galilean moon of Jupiter.', FALSE, FALSE, 5),
('Europa', 'Second Galilean moon of Jupiter.', TRUE, FALSE, 5),
('Ganymede', 'Third Galilean moon of Jupiter.', TRUE, FALSE, 5),
('Callisto', 'Fourth Galilean moon of Jupiter.', FALSE, FALSE, 5),
('Dione', 'One of the moons of Saturn captured by Cassini spacecraft.', FALSE, TRUE, 6),
('Enceladus', 'One of the moons of Saturn captured by Cassini spacecraft.', TRUE, TRUE, 6),
('Epimetheus', 'One of the moons of Saturn captured by Cassini spacecraft.', FALSE, TRUE, 6),
('Prometheus', 'One of the moons of Saturn captured by Cassini spacecraft.', FALSE, TRUE, 6),
('Mimas', 'One of the moons of Saturn captured by Cassini spacecraft.', FALSE, TRUE, 6),
('Rhea', 'One of the moons of Saturn captured by Cassini spacecraft.', FALSE, TRUE, 6),
('Janus', 'One of the moons of Saturn captured by Cassini spacecraft.', FALSE, TRUE, 6),
('Tethys', 'One of the moons of Saturn captured by Cassini spacecraft.', FALSE, TRUE, 6),
('Titan', 'One of the moons of Saturn captured by Cassini spacecraft.', FALSE, TRUE, 6),
('Titania', 'Named after Shakespearean king of Elves.', FALSE, TRUE, 7),
('Oberon', 'Named after Shakespearean queen of Elves.', FALSE, TRUE, 7),
('Miranda', 'Named after Shakespearean leading character in The Tempest.', FALSE, TRUE, 7),
('Ariel', 'Named after a sky spirit in a poem The Rape of the Lock by Alexander Pope.', FALSE, TRUE, 7),
('Umbriel', 'Named after a sky spirit in a poem The Rape of the Lock by Alexander Pope.', FALSE, TRUE, 7),
('Naiad', 'Named after mermaid creatures in Greek mythology.', FALSE, TRUE, 8),
('Thalassa', 'Named after the Greek goddess of sea.', FALSE, TRUE, 8),
('Despina', 'Named after a daughter of Poseidon and Demeter.', FALSE, TRUE, 8),
('Galatea', 'Named after a nereid in Greek mythology.', FALSE, TRUE, 8),
('Proteus', 'Named after the shape-changing sea god of Greek mythology.', FALSE, TRUE, 8);")

echo $($PSQL "INSERT INTO object(name, description) VALUES('Oumuamua', 'The first interstellar object detected passing through the Solar System.'), ('Halley Comet', 'One of the most recognized periodic comet in history.'), ('UFO', 'Unindenfied flying object. Martians. Annunaki. Eridians. Zergs. Protoss. Klingons. Xenomorphs. Ewoks.');")









