# MesProduction
MES Production Database Scripts (Schema, Initial Data, some scripts)

This repo contains two folders:
  1. Schema\dbo - Contains all files to create the database, add schemas, add tables, add triggers. They are named so that they can be run in order from 01 - XX. Note that the triggers are optional. This was just something I was using to avoid having to setup change data capture in SQL. NOTE: The CREATE DATABASE script is writing to C:\ using SQL Server v17. If you want to skip this one, simply create a database called "MesProduction" and the rest should be good. There's nothing in here that wouldn't be backwards compatible.
  2. Queries - Some simple queries to load data such as a sample user.
