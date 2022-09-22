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

vet_clinic=# CREATE TABLE animals (id INT GENERATED ALWAYS AS IDENTITY, name varchar, date_of_birth date, escape_attempts integer, neutered boolean, weight_kg decimal);
CREATE TABLE
vet_clinic=#