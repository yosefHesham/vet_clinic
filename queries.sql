/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals;
SELECT * from animals WHERE name = 'Luna';
SELECT name from animals where name LIKE '%mon';
SELECT name from animals where date_of_birth between '2016-01-01' and '2019-12-31';
SELECT name from animals where neutrued and escape_attemps < 3;
SELECT date_of_birth from animals where name = 'Agumon' or name = 'Pikachu';
SELECT name, escape_attemps from animals where weight_kg > 10.5;
SELECT * from animals where neutrued;
SELECT * from animals where name != 'Gabumon';
SELECT * from animals where weight_kg between 10.4 and 17.3;


BEGIN;

Update animals SET species='unspecified'

SELECT species from animals;


BEGIN;
Update animals set species='pokemon';
Update animals set species='digimon' where name like '%mon';
COMMIT;

SELECT name, species from animals;

BEGIN;
DELETE from animals;
ROLLBACK;
SELECT * from animals;


BEGIN;
Delete from animals where date_of_birth > '2022-01-01';
SAVEPOINT deleteBasedOnDate;

Update animals set weight_kg = weight_kg * -1;

ROLLBACK To SAVEPOINT deleteBasedOnDate;

Update animals set weight_kg = weight_kg * -1 where weight_kg < 0;
COMMIT;

SELECT name, weight_kg from animals;

Select count (*) from animals where escape_attemps = 0;


SELECT COUNT(escape_attemps) AS escape_times, neutrued 
FROM animals 
GROUP BY neutrued;

SELECT MIN(weight_kg) as MIN_KG, MAX(weight_kg) as MAX_KG from animals;


SELECT AVG(escape_attemps) as avg_escapes, species 
FROM animals 
WHERE date_of_birth BETWEEN '01-01-1990' AND '12-31-2000' 
GROUP BY species;



SELECT name 
FROM animals 
JOIN owners ON owners.full_name = 'Melody Pond' AND owners.id = animals.owner_id;


SELECT * 
FROM animals 
JOIN species ON species.name = 'Pokemon' AND species.id = animals.species_id;


SELECT name, full_name 
FROM animals 
RIGHT OUTER JOIN owners ON animals.owner_id = owners.id;

SELECT COUNT(*), species.name from animals join species on  animals.species_id = species.id GROUP by species.name;


SELECT animals.name, animals.species_id, owners.full_name AS owner 
FROM animals 
JOIN owners ON owners.full_name = 'Jennifer Orwell' AND animals.species_id = (SELECT id FROM species WHERE name = 'Digimon') AND owners.id = animals.owner_id;


SELECT animals.name, animals.escape_attemps, owners.full_name AS owner 
FROM animals 
JOIN owners ON owners.full_name = 'Dean Winchester' AND animals.escape_attemps = 0 AND owners.id = animals.owner_id;

SELECT COUNT(*), owners.full_name AS owner FROM animals 
JOIN owners ON animals.owner_id = owners.id 
GROUP BY owners.full_name 
ORDER BY COUNT(*) DESC 
LIMIT 1;