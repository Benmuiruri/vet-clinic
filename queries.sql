/*Queries that provide answers to the questions from all projects.*/
SELECT *
FROM animals
WHERE name LIKE '%mon%';
SELECT name
FROM animals
WHERE date_of_birth >= '2016-01-01'
    AND date_of_birth <= '2019-12-31';
SELECT name
FROM animals
WHERE neutered = 't'
    AND escape_attempts < 3;
SELECT date_of_birth
FROM animals
WHERE name = 'Agumon'
    OR name = 'Pikachu';
SELECT name,
    escape_attempts
from animals
WHERE weight_kg > 10.5;
SELECT *
from animals
WHERE neutered = 't';
SELECT *
from animals
WHERE name != 'Gabumon';
SELECT *
from animals
WHERE weight_kg >= 10.4
    AND weight_kg <= 17.3;
BEGIN;
UPDATE animals
set species = 'unspecified';
ROLLBACK BEGIN;
UPDATE animals
set species = 'digimon'
WHERE name LIKE '%mon%';
UPDATE animals
set species = 'pokemon'
WHERE species is NULL;
COMMIT;
BEGIN;
DELETE FROM animals;
ROLLBACK;
BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2020-01-01';
SAVEPOINT savepoint_one;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT savepoint_one;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;
SELECT COUNT(*)
FROM animals;
SELECT COUNT(*)
FROM animals
WHERE escape_attempts = 0;
SELECT AVG(weight_kg)
FROM animals;
SELECT neutered,
    Max(escape_attempts)
FROM animals
GROUP BY neutered;
SELECT species,
    MIN(weight_kg),
    MAX(weight_kg)
FROM animals
GROUP BY species;
SELECT species,
    AVG(escape_attempts)
FROM animals
GROUP BY species,
    date_of_birth
HAVING date_of_birth >= '1990-01-01'
    AND date_of_birth <= '2000-12-31';
/* JOIN queries */
/* What animals belong to Melody Pond ? */
SELECT *
FROM owners
    INNER JOIN animals ON owners.id = owner_id
WHERE full_name = 'Melody Pond';

/* List of all animals that are pokemon (their type is Pokemon) */
SELECT *
FROM animals
    INNER JOIN species ON species_id = species.id
WHERE species.id = 1;

/*List all owners and their animals */
SELECT *
FROM owners
    JOIN animals ON owners.id = owner_id;

/* How many animals are there per species ? */

SELECT species.name, COUNT (species_id)
FROM animals
    JOIN species ON species_id = species.id WHERE species.name = 'Pokemon' OR species.name = 'Digimon' group by species.name;

/* List all Digimon owned by Jennifer Orwell. */
SELECT *
FROM owners
    JOIN animals ON owners.id = owner_id
WHERE full_name = 'Jennifer Orwell' AND species_id = 2;

/* List all animals owned by Dean Winchester that haven 't tried to escape */

SELECT owners.full_name,
animals.name
FROM owners
    JOIN animals ON owners.id = owner_id
WHERE full_name = 'Dean Winchester'
    AND escape_attempts = NULL;

/* Who owns the most animals ? */

SELECT full_name,
    COUNT(animals) as animals_owned
FROM animals
    JOIN owners ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY animals_owned DESC
LIMIT 1;

/* Query specialties and visits tables */

/* Who was the last animal seen by William Tatcher */

select animal_name from visits where vet_id = 1 order by visit_date DESC LIMIT 1;

/* How many different animals did Stephanie Mendez see ? */

select MAX(specialties.vet_name), count(species_name) as species_seen from specialties WHERE specialties.vet_id = 3;

/* List all vets and their specialties, including vets with no specialties */
select vets.name,
    specialties.species_name
from vets
    full OUTER join specialties on vets.id = specialties.vet_id;

/* List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020. */

select visits.animal_name as animals_visited, visits.visit_date from visits where visits.vet_id = 3 AND (visits.visit_date  >= '2020-04-01'
    AND visits.visit_date <= '2020-08-30');

/* What animal has the most visits to vets ? */

SELECT visits.animal_name AS most_visited_animal,COUNT(visits.animal_name)
FROM visits
GROUP BY visits.animal_name
ORDER BY COUNT DESC LIMIT 1;

/* Who was Maisy Smith 's first visit? */

select visits.animal_name as first_animal_visited,
    visits.visit_date
from visits
where visits.vet_id= 2 ORDER BY visits.visit_date ASC
LIMIT 1;

/* Details for most recent visit: animal information, vet information, and date of visit. */

select * from visits order by visits.visit_date desc limit 1;

/* How many visits were with a vet that did not specialize in that animal's species? */

select COUNT(visits.visit_date) from visits full
OUTER join specialties on visits.vet_id = specialties.vet_id where specialties.vet_id is null ORDER BY COUNT DESC
LIMIT 1;

/* What specialty should Maisy Smith consider getting ? Look for the species she gets the most. */

SELECT species.name,
    COUNT(species.name)
FROM animals
    full JOIN species ON animals.species_id = species.id
    JOIN visits ON animals.name = visits.animal_name
WHERE visits.vet_name = 'Maisy Smith'
GROUP BY species.name
ORDER BY COUNT DESC
LIMIT 1;

/* Explain Analyze */

explain analyze SELECT COUNT(*) FROM visits where animal_id = 4; 

explain analyze SELECT * FROM visits where vet_id = 2;

explain analyze SELECT * FROM owners where email = 'owner_18327@mail.com';

explain analyze SELECT * FROM visits where vet_id = 2 ORDER BY id DESC;
