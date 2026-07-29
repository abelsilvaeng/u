-- Celestial Bodies Database (freeCodeCamp lab)

CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(60) UNIQUE NOT NULL,
  galaxy_type TEXT NOT NULL,
  age_in_millions_of_years INT,
  distance_from_earth_in_ly NUMERIC(14,2),
  has_black_hole BOOLEAN
);

CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(60) UNIQUE NOT NULL,
  galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
  star_type TEXT,
  age_in_millions_of_years INT,
  distance_from_earth_in_ly NUMERIC(14,2),
  is_spherical BOOLEAN
);

CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(60) UNIQUE NOT NULL,
  star_id INT NOT NULL REFERENCES star(star_id),
  planet_type TEXT,
  age_in_millions_of_years INT,
  radius_in_km NUMERIC(12,2),
  has_life BOOLEAN,
  is_spherical BOOLEAN
);

CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(60) UNIQUE NOT NULL,
  planet_id INT NOT NULL REFERENCES planet(planet_id),
  description TEXT,
  discovery_year INT,
  radius_in_km NUMERIC(12,2),
  is_spherical BOOLEAN
);

CREATE TABLE astronomer (
  astronomer_id SERIAL PRIMARY KEY,
  name VARCHAR(60) UNIQUE NOT NULL,
  nationality VARCHAR(60) NOT NULL,
  birth_year INT,
  is_nobel_laureate BOOLEAN
);

-- galaxy: 6 rows
INSERT INTO galaxy (name, galaxy_type, age_in_millions_of_years, distance_from_earth_in_ly, has_black_hole) VALUES
  ('Milky Way', 'Barred spiral', 13600, 0.00, true),
  ('Andromeda', 'Barred spiral', 10010, 2537000.00, true),
  ('Triangulum', 'Spiral', 13000, 2723000.00, false),
  ('Sombrero', 'Elliptical', 13250, 29350000.00, true),
  ('Whirlpool', 'Spiral', 400, 23160000.00, true),
  ('Pinwheel', 'Spiral', 10600, 20870000.00, false);

-- star: 6 rows
INSERT INTO star (name, galaxy_id, star_type, age_in_millions_of_years, distance_from_earth_in_ly, is_spherical) VALUES
  ('Sun', 1, 'Yellow dwarf', 4600, 0.00, true),
  ('Proxima Centauri', 1, 'Red dwarf', 4850, 4.24, true),
  ('Sirius', 1, 'Main sequence', 242, 8.60, true),
  ('Betelgeuse', 1, 'Red supergiant', 10, 642.50, false),
  ('Rigel', 1, 'Blue supergiant', 8, 863.00, true),
  ('Vega', 1, 'Main sequence', 455, 25.04, false);

-- planet: 12 rows
INSERT INTO planet (name, star_id, planet_type, age_in_millions_of_years, radius_in_km, has_life, is_spherical) VALUES
  ('Mercury', 1, 'Terrestrial', 4503, 2439.70, false, true),
  ('Venus', 1, 'Terrestrial', 4503, 6051.80, false, true),
  ('Earth', 1, 'Terrestrial', 4543, 6371.00, true, true),
  ('Mars', 1, 'Terrestrial', 4603, 3389.50, false, true),
  ('Jupiter', 1, 'Gas giant', 4603, 69911.00, false, true),
  ('Saturn', 1, 'Gas giant', 4503, 58232.00, false, true),
  ('Uranus', 1, 'Ice giant', 4503, 25362.00, false, true),
  ('Neptune', 1, 'Ice giant', 4503, 24622.00, false, true),
  ('Proxima Centauri b', 2, 'Terrestrial', 4850, 7160.00, false, true),
  ('Proxima Centauri d', 2, 'Terrestrial', 4850, 5100.00, false, true),
  ('Sirius Bb', 3, 'Gas giant', 242, 48000.00, false, true),
  ('Vega b', 6, 'Gas giant', 455, 71000.00, false, true);

-- moon: 21 rows
INSERT INTO moon (name, planet_id, description, discovery_year, radius_in_km, is_spherical) VALUES
  ('Moon', 3, 'The only natural satellite of Earth', NULL, 1737.40, true),
  ('Phobos', 4, 'Larger and closer moon of Mars', 1877, 11.27, false),
  ('Deimos', 4, 'Smaller and outer moon of Mars', 1877, 6.20, false),
  ('Io', 5, 'The most volcanically active body in the solar system', 1610, 1821.60, true),
  ('Europa', 5, 'Icy crust believed to cover a subsurface ocean', 1610, 1560.80, true),
  ('Ganymede', 5, 'The largest moon in the solar system', 1610, 2634.10, true),
  ('Callisto', 5, 'One of the most heavily cratered bodies known', 1610, 2410.30, true),
  ('Titan', 6, 'The only moon with a dense atmosphere', 1655, 2574.70, true),
  ('Rhea', 6, 'Second largest moon of Saturn', 1672, 763.80, true),
  ('Iapetus', 6, 'Famous for its two-tone coloration', 1671, 734.50, true),
  ('Dione', 6, 'Icy moon with bright ice cliffs', 1684, 561.40, true),
  ('Tethys', 6, 'Composed almost entirely of water ice', 1684, 531.10, true),
  ('Enceladus', 6, 'Ejects plumes of water vapor from its south pole', 1789, 252.10, true),
  ('Mimas', 6, 'Dominated by the giant Herschel crater', 1789, 198.20, true),
  ('Titania', 7, 'The largest moon of Uranus', 1787, 788.40, true),
  ('Oberon', 7, 'The outermost major moon of Uranus', 1787, 761.40, true),
  ('Umbriel', 7, 'The darkest of the major Uranian moons', 1851, 584.70, true),
  ('Ariel', 7, 'The brightest of the major Uranian moons', 1851, 578.90, true),
  ('Miranda', 7, 'Has the tallest known cliff in the solar system', 1948, 235.80, true),
  ('Triton', 8, 'Orbits Neptune in a retrograde direction', 1846, 1353.40, true),
  ('Nereid', 8, 'Has one of the most eccentric orbits known', 1949, 170.00, false);

-- astronomer: 5 rows
INSERT INTO astronomer (name, nationality, birth_year, is_nobel_laureate) VALUES
  ('Galileo Galilei', 'Italian', 1564, false),
  ('Edwin Hubble', 'American', 1889, false),
  ('Christiaan Huygens', 'Dutch', 1629, false),
  ('Vera Rubin', 'American', 1928, false),
  ('Andrea Ghez', 'American', 1965, true);
