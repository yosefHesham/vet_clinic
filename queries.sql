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
