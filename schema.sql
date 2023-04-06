-- Create Database
CREATE DATABASE catalog;

-- Create Genre table
CREATE TABLE genre (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(255)
);

-- Create Music Album table
CREATE TABLE music_album (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  on_spotify BOOLEAN,
  publish_date DATE,
  archived BOOLEAN
);
