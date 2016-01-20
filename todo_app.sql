DROP USER IF EXISTS michael;
CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';
DROP DATABASE IF EXISTS todo_app;
CREATE DATABASE todo_app;
\c todo_app;
DROP TABLE IF EXISTS tasks;
CREATE TABLE tasks
(id SERIAL NOT NULL PRIMARY KEY,
title character varying(255) NOT NULL,
description text NULL,
created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
updated_at TIMESTAMP WITHOUT TIME ZONE NULL,
completed boolean NOT NULL DEFAULT false);
ALTER TABLE tasks DROP COLUMN completed;
ALTER TABLE tasks ADD COLUMN completed_at TIMESTAMP DEFAULT NULL;
-- Problem 8-3 where need to edit column 'updated_at'...had to do each edit on individual line
-- here I set the the column to allow Not Null values
ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;
-- here I set the column to have DEFAULT value of now()
ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT now();

INSERT INTO tasks (title, description, created_at, updated_at, completed_at)
VALUES ('Study SQL', 'Complete this exercise', now(), now(), NULL);
-- SELECT * FROM tasks;

INSERT INTO tasks (title, description) VALUES ('Study PostgreSQL', 'Read all the documentation');

-- SELECT title FROM tasks WHERE completed_at IS NULL;

-- UPDATE tasks
-- SET completed_at = now()
-- WHERE title = 'Study SQL';


-- SELECT title, description FROM tasks WHERE completed_at IS NULL;

SELECT * FROM tasks ORDER BY created_at DESC;

-- select column_name,data_type
-- from information_schema.columns
-- where table_name = 'tasks';

INSERT INTO tasks (title, description) VALUES ('mistake 1', 'a test entry');

INSERT INTO tasks (title, description) VALUES ('mistake 2', 'another test entry');
SELECT * FROM tasks;