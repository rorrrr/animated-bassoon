DROP TABLE students;
DROP TABLE houses;


CREATE TABLE students (
  id serial4 primary key,
  first_name varchar(255),
  last_name varchar(255),
  house_id INT2 references houses(id),
  age INT2
);

CREATE TABLE houses (
  id serial4 primary key,
  name varchar(255),
  logo varchar(255)
)