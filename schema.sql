/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name varchar(100),
    date_of_birth date not null,
    escape_attemps int not null,
    neutrued boolean not null,
    weight_kg decimal not null
);
ALTER TABLE animals ADD species varchar(30);

Create table owners(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name varchar(100),
    age int
);

Create table species (
     id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
     name varchar(100)
);

ALTER table animals drop column species;
ALTER TABLE animals ADD species_id INT REFERENCES species(id);
ALTER TABLE animals ADD owner_id INT REFERENCES owners(id);
