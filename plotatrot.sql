CREATE DATABASE plotatrot;

CREATE TABLE trips (
  id SERIAL PRIMARY KEY,
  city VARCHAR(300),
  country VARCHAR(300)
);

CREATE TABLE trots (
  id SERIAL PRIMARY KEY,
  trip_id INTEGER,
  name VARCHAR(300),
  category VARCHAR(20),
  image_url VARCHAR(400),
  description VARCHAR(2000)
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  trot_id INTEGER,
  name VARCHAR(20) NOT NULL,
  body VARCHAR(400) NOT NULL
);

INSERT INTO trips(city, country) 
  VALUES ('bali', 'indonesia');

INSERT INTO trots(trip_id,name,category,image_url,description)
  VALUES (1,'Uluwatu','go','https://goo.gl/4G5qm8','Uluwatu Temple is a Balinese sea temple in Uluwatu. The temple is regarded as one of the sad kahyangan and is dedicated to Sang Hyang Widhi Wasa in his manifestation as Rudra.');

INSERT INTO comments(trot_id,name,body)
  VALUES (1,'Melly','Melly like like');