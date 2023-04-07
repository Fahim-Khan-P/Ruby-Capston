CREATE TABLE item (
  id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  genre varchar(100),
  author varchar(100),
  label varchar(100),
  publish_date date,
  archived boolean,
);

-- Game class table
CREATE TABLE game (
  id SERIAL PRIMARY KEY ,
  item_id INT FOREIGN KEY REFERENCES item(id),
  multiplayer VARCHAR,
  last_played_at DATE,
  publish_date DATE,
);

-- Author class table
CREATE TABLE author (
  id SERIAL PRIMARY KEY,
  item_id INT FOREIGN KEY REFERENCES item(id),
  first_name VARCHAR,
  last_name VARCHAR
);
