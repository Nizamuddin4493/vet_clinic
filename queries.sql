SELECT * FROM animals WHERE name LIKE '%mon%';

SELECT * FROM animals WHERE date_of_birth BETWEEN CAST('2016-01-01' AS DATE) AND CAST('2019-12-31' AS DATE);

SELECT * FROM animals WHERE neutered = true AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = true;

SELECT * FROM animals WHERE name != 'Gabumon';

SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;

UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

UPDATE animals SET species = 'pokemon' WHERE species IS NULL;

/* Queries day 3 (joining tables) */

SELECT name FROM animals INNER JOIN owners ON animals.owners_id = owners.id WHERE owners.full_name = 'Melody Pond';

SELECT animals.name FROM animals INNER JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

SELECT owners.full_name FROM owners LEFT JOIN animals ON owners.id = animals.owners_id;

SELECT species.name, COUNT(*) FROM animals INNER JOIN species ON animals.species_id = species.id GROUP BY species.name;

SELECT animals.name FROM animals INNER JOIN owners ON owners.id = animals.owners_id WHERE species_id = 2 AND owners.full_name = 'Jennifer Orwell';

SELECT animals.name FROM animals INNER JOIN owners ON owners.id = animals.owners_id WHERE owners.full_name = 'Dean Winchester' AND escape_attempts > 0;

SELECT owners.full_name FROM owners LEFT JOIN animals ON owners.id = animals.owners_id GROUP BY owners.full_name ORDER BY COUNT(*) DESC LIMIT 1;

/* QUERIES FOR JOIN TABLE */

SELECT animals.name FROM animals INNER JOIN visits ON animals.id = visits.animals_id WHERE visits.vets_id = 1 ORDER BY visits.date_of_visit DESC LIMIT 1;

SELECT COUNT(animals.name) FROM animals INNER JOIN visits ON animals.id = visits.animals_id WHERE visits.vets_id = 3;

SELECT vets.name, specialization.species_id FROM vets LEFT JOIN specialization ON vets.id = specialization.vets_id;

SELECT animals.name FROM animals INNER JOIN visits ON animals.id = visits.animals_id WHERE visits.vets_id = 3 AND visits.date_of_visit BETWEEN date '2020-04-01' AND date '2020-08-30';

SELECT animals.name FROM animals INNER JOIN visits ON animals.id = visits.animals_id GROUP BY animals.name ORDER BY COUNT(*) DESC LIMIT 1;

SELECT animals.name FROM animals INNER JOIN visits ON animals.id = visits.animals_id WHERE visits.vets_id = 2 AND visits.date_of_visit = (SELECT MIN(date_of_visit) FROM visits WHERE visits.vets_id = 2);

SELECT animals.name, visits.vets_id, visits.date_of_visit FROM animals INNER JOIN visits ON animals.id = visits.animals_id WHERE visits.date_of_visit = (SELECT MAX(date_of_visit) FROM visits);

SELECT COUNT(visits.animals_id) FROM visits INNER JOIN vets ON visits.vets_id = vets.id INNER JOIN animals ON animals.id = visits.animals_id INNER JOIN specialization ON specialization.species_id = vets.id WHERE specialization.species_id != animals.species_id;

SELECT animals.species_id, COUNT(*) FROM animals INNER JOIN visits ON animals.id = visits.animals_id WHERE visits.vets_id = 2 GROUP BY animals.species_id ORDER BY COUNT(*) DESC LIMIT 1;

EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animalS_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits where vetS_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';