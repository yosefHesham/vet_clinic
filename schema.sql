/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth date not null,
    escape_attemps int not null,
    neutrued boolean not null,
    weight_kg decimal not null
);
ALTER TABLE animals ADD species varchar(30);


