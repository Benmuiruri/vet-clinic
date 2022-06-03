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