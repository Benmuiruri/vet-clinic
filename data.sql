/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', 'Feb 3, 1991', 0, TRUE, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', 'Nov 15, 2018', 2, TRUE, 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', 'Jan 7, 2021', 1, False, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', 'May 12, 2017', 5, True, 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', 'Feb 8, 2020', 0, False, -11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Platmon', 'Nov 15, 2021', 2, True, -5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', 'Apr 2, 1993', 3, False, -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', 'Jun 12, 2005', 1, True, -45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', 'Jun 7, 2005', 7, True, 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', 'Oct 13, 1998', 3, True, 17);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', 'May 14, 2022', 4, True, 22);

/* Populate owners table with data */
INSERT INTO owners(full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners(full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners(full_name, age) VALUES ('Bob', 45);
INSERT INTO owners(full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners(full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners(full_name, age) VALUES ('Jodie Whittaker', 34);

/* Populate species table with data */
INSERT INTO species(name) VALUES('Pokemon');
INSERT INTO species(name) VALUES('Digimon');

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', 'Feb 3, 1991', 0, TRUE, 10.23);

/* Update species_id in animals table with value from species table */
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon%';
UPDATE animals SET species_id = 1 WHERE species_id is NULL;

/* Update owner_id in animals table with value from owners table */
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon';
UPDATE animals SET owner_id = 3 WHERE name = 'Plantmon';
UPDATE animals SET owner_id = 4 WHERE name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';

/* Insert data for vets */
INSERT INTO vets(name, age, date_of_graduation) VALUES('William Tatcher', 45, 'Apr 23, 2000');
INSERT INTO vets(name, age, date_of_graduation) VALUES('Maisy Smith', 26, 'Jan 17, 2019');
INSERT INTO vets(name, age, date_of_graduation) VALUES('Stephanie Mendez', 64, 'May 4, 1981');
INSERT INTO vets(name, age, date_of_graduation) VALUES('Jack Harkness', 38, 'Jun 8, 2008');

/* Insert data for specialties */
INSERT INTO specialties(vet_name, species_name) VALUES('William Tatcher', 'Pokemon');
INSERT INTO specialties(vet_name, species_name) VALUES('Stephanie Mendez', 'Digimon');
INSERT INTO specialties(vet_name, species_name) VALUES('Stephanie Mendez', 'Pokemon');
INSERT INTO specialties(vet_name, species_name) VALUES('Jack Harkness', 'Digimon');


/* Insert data for visits */
INSERT INTO visits(animal_species, vet_name, visit_date) VALUES('Agumon', 'William Tatcher', 'May 24, 2020');
INSERT INTO visits(animal_species, vet_name, visit_date) VALUES('Agumon', 'Stephanie Mendez', 'Jul 22, 2020');
INSERT INTO visits(animal_species, vet_name, visit_date) VALUES('Gabumon', 'Jack Harkness', 'Feb 2, 2021');
INSERT INTO visits(animal_species, vet_name, visit_date) VALUES('Pikachu', 'Maisy Smith', 'Jan 5, 2020');
INSERT INTO visits(animal_species, vet_name, visit_date) VALUES('Pikachu', 'Maisy Smith', 'Mar 8, 2020');
INSERT INTO visits(animal_species, vet_name, visit_date) VALUES('Pikachu', 'Maisy Smith', 'May 14, 2020');
INSERT INTO visits(animal_species, vet_name, visit_date) VALUES('Deimon', 'Stephanie Mendez', 'May 4, 2021');
INSERT INTO visits(animal_species, vet_name, visit_date) VALUES('Charmander', 'Jack Harkness', 'Feb 24, 2021');
INSERT INTO visits(animal_species, vet_name, visit_date) VALUES('Plantmon', 'Maisy Smith', 'Dec 21, 2019');
INSERT INTO visits(animal_species, vet_name, visit_date) VALUES('Plantmon', 'William Tatcher', 'Aug 10, 2020');
INSERT INTO visits(animal_species, vet_name, visit_date) VALUES('Plantmon', 'Maisy Smith', 'Apr 7, 2021');
INSERT INTO visits(animal_species, vet_name, visit_date) VALUES('Squirtle', 'Stephanie Mendez', 'Sep 29, 2019');
INSERT INTO visits(animal_species, vet_name, visit_date) VALUES('Angemon', 'Jack Harkness', 'Oct 3, 2020');
INSERT INTO visits(animal_species, vet_name, visit_date) VALUES('Angemon', 'Jack Harkness', 'Nov 4, 2020');
INSERT INTO visits(animal_species, vet_name, visit_date) VALUES('Boarmon', 'Maisy Smith', 'Jan 24, 2019');
INSERT INTO visits(animal_species, vet_name, visit_date) VALUES('Boarmon', 'Maisy Smith', 'May 15, 2019');
INSERT INTO visits(animal_species, vet_name, visit_date) VALUES('Boarmon', 'Maisy Smith', 'Feb 27, 2020');
INSERT INTO visits(animal_species, vet_name, visit_date) VALUES('Boarmon', 'Maisy Smith', 'Aug 3, 2020');
INSERT INTO visits(animal_species, vet_name, visit_date) VALUES('Blossom', 'Stephanie Mendez', 'May 24, 2020');
INSERT INTO visits(animal_species, vet_name, visit_date) VALUES('Blossom', 'William Tatcher', 'Jan 11, 2021');















