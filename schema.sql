Server [localhost]:
Database [postgres]:
Port [5432]:
Username [postgres]:
Password for user postgres:
psql (14.5)
WARNING: Console code page (437) differs from Windows code page (1252)
  8-bit characters might not work correctly. See psql reference
  page "Notes for Windows users" for details.
Type "help" for help.

postgres=# create database vet_clinic;
CREATE DATABASE
postgres=# \c vet_clinic
You are now connected to database "vet_clinic" as user "postgres".

vet_clinic=# CREATE TABLE animals (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name varchar(255),
  date_of_birth date,
  escape_attempts integer,
  neutered boolean,
  weight_kg decimal
);
CREATE TABLE
vet_clinic=#

ALTER TABLE animals
ADD species varchar(255);

CREATE TABLE owners (
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
full_name varchar(100),
age INT,
);

CREATE TABLE species (
id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
name varchar(100)
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals 
ADD COLUMN species_id INT REFERENCES species(id)
ON DELETE CASCADE;

ALTER TABLE animals
ADD COLUMN owners_id INT REFERENCES owners(id)
ON DELETE CASCADE;

CREATE TABLE vets (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name varchar(100),
  age INT,
  date_of_graduation DATE,
);

CREATE TABLE specialization (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  species_id INT REFERENCES species(id) ON DELETE CASCADE,
  vets_id INT REFERENCES vets(id) ON DELETE CASCADE,
);

CREATE TABLE visits (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  animals_id INT REFERENCES animals(id) ON DELETE CASCADE,
  vets_id INT REFERENCES vets(id) ON DELETE CASCADE,
  date_of_visit DATE,
);
