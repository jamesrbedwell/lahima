CREATE DATABASE lahima;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(400),
  password_digest VARCHAR(400),
  first_name VARCHAR(200),
  last_name VARCHAR(200),
  phone VARCHAR(200)
);

INSERT INTO users (email, password_digest, first_name, last_name, phone) VALUES ('jamesrbedwell@gmail.com', '$2a$10$eHHkR5OuN8FL6xMwUXat0.suEaSGJQ7fcIiENR39URG.yna6LTgPC', 'James', 'Bedwell', '0400123456');

CREATE TABLE workers (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(200),
  last_name VARCHAR(200),
  phone VARCHAR(200),
  email VARCHAR(400),
  worker_type VARCHAR(400),
  pay_rate NUMERIC(4,2),
  address1 VARCHAR(120),
  city VARCHAR(100),
  state VARCHAR(20),
  country VARCHAR(400),
  post_code VARCHAR(20),
  transport VARCHAR(200),
  available BOOLEAN,
  user_id INTEGER
);

CREATE TABLE clients (
  id SERIAL PRIMARY KEY,
  entity_name VARCHAR(400),
  abn VARCHAR(400),
  address1 VARCHAR(200),
  city VARCHAR(100),
  state VARCHAR(100),
  country VARCHAR(200),
  post_code VARCHAR(20),
  labour_rate NUMERIC(4,2),
  ticketed_rate NUMERIC(4,2),
  trade_rate NUMERIC(4,2),
  user_id INTEGER
);

CREATE TABLE projects (
  id SERIAL PRIMARY KEY,
  project_name VARCHAR(200),
  address1 VARCHAR(200),
  city VARCHAR(100),
  state VARCHAR(100),
  country VARCHAR(200),
  post_code VARCHAR(20),
  client_id INTEGER
);

CREATE TABLE client_contacts (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(200),
  last_name VARCHAR(200),
  phone VARCHAR(200),
  email VARCHAR(400),
  project_id INTEGER
);


CREATE TABLE jobs (
  id SERIAL PRIMARY KEY,
  client_id INTEGER,
  project_id INTEGER,
  client_contact_id INTEGER,
  worker_type VARCHAR(200),
  start_date TIMESTAMP,
  start_time TIMESTAMP,
  status VARCHAR(100),
  user_id INTEGER
);



