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