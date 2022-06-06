/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
id INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(50),
date_of_birth DATE,
escape_attempts INT,
neutered BOOLEAN,
weight_kg DECIMAL,
PRIMARY KEY (id));
CREATE TABLE


ALTER TABLE animals ADD COLUMN species TEXT;

/* Create owners table */
CREATE TABLE owners(
  id SERIAL PRIMARY KEY,
  full_name TEXT,
  age INT
);

/* Create species table */
CREATE TABLE species(
  id SERIAL PRIMARY KEY,
  name TEXT
);

/* Drop Identity of id column */
ALTER TABLE animals ALTER COLUMN id DROP IDENTITY IF EXISTS;

ALTER TABLE animals ADD COLUMN id INTEGER;

/* Create and set sequence for id column */
CREATE SEQUENCE animals_id_seq OWNED BY animals.id;

ALTER TABLE animals ALTER COLUMN id SET DEFAULT nextval('animals_id_seq');

UPDATE
	animals
SET
	id = nextval('animals_id_seq');

/* Alter animals table to add foreign key references to species and owners tables */

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owner_id INT;
ALTER TABLE animals ADD CONSTRAINT fk_owner FOREIGN KEY(owner_id) REFERENCES owners(id);

/* Create vets table */
CREATE TABLE vets(
  id SERIAL PRIMARY KEY,
  name TEXT,
  age INT,
  date_of_graduation DATE
);

/* create specialties table */

CREATE TABLE specialties (
  vet_name TEXT,
  species_name TEXT,
);

CREATE TABLE visits (
  animal_species TEXT,
  vet_name TEXT,
  visit_date DATE,
);

ALTER TABLE visits DROP CONSTRAINT visits_pkey;

ALTER TABLE visits ADD COLUMN ID SERIAL PRIMARY KEY;

DROP TABLE IF EXISTS specialties;

ALTER TABLE specialties ADD COLUMN ID SERIAL PRIMARY KEY;

ALTER TABLE specialties ALTER COLUMN species_name TYPE TEXT;

ALTER TABLE visits RENAME COLUMN animal_species TO animal_name;

/* update visits table colums */

ALTER TABLE visits ADD COLUMN vet_id INT;

UPDATE visits SET vet_id = 1 WHERE vet_name = 'William Tatcher';
UPDATE visits SET vet_id = 2 WHERE vet_name = 'Maisy Smith';
UPDATE visits SET vet_id = 3 WHERE vet_name = 'Stephanie Mendez';
UPDATE visits SET vet_id = 4 WHERE vet_name = 'Jack Harkness';

ALTER TABLE visits ADD COLUMN animal_id INT;

UPDATE visits SET animal_id = 1 WHERE animal_name = 'Agumon';
UPDATE visits SET animal_id = 2 WHERE animal_name = 'Gabumon';
UPDATE visits SET animal_id = 3 WHERE animal_name = 'Devimon';
UPDATE visits SET animal_id = 4 WHERE animal_name = 'Boarmon';
UPDATE visits SET animal_id = 5 WHERE animal_name = 'Blossom';
UPDATE visits SET animal_id = 6 WHERE animal_name = 'Angemon';
UPDATE visits SET animal_id = 7 WHERE animal_name = 'Squirtle';
UPDATE visits SET animal_id = 8 WHERE animal_name = 'Charmander';
UPDATE visits SET animal_id = 9 WHERE animal_name = 'Plantmon';
UPDATE visits SET animal_id = 10 WHERE animal_name = 'Pikachu';
UPDATE visits SET animal_name = 'Devimon' WHERE animal_name = 'Deimon';

/* update specialties table colums */

ALTER TABLE specialties ADD COLUMN vet_id INT;
UPDATE specialties SET vet_id = 1 WHERE vet_name = 'William Tatcher';
UPDATE specialties SET vet_id = 2 WHERE vet_name = 'Maisy Smith';
UPDATE specialties SET vet_id = 3 WHERE vet_name = 'Stephanie Mendez';
UPDATE specialties SET vet_id = 4 WHERE vet_name = 'Jack Harkness';