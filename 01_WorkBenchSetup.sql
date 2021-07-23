-- (CRUD) create, read, update, delete
USE twitter;
SELECT * FROM users;

INSERT INTO users (first_name, last_name, handle, birthday, created_at, updated_at)
VALUES
('Ruben','Miranda','thompson','1984-05-03',NOW(),NOW()),
('Ruben','Miranda','thompson','1984-05-03',NOW(),NOW());

SELECT * FROM users;

DROP TEMPORARY TABLE IF EXISTS temp_table;
CREATE TEMPORARY TABLE temp_table
SELECT  min(id) as id FROM users where first_name='Ruben' and last_name='Miranda';

UPDATE users SET handle='Rubenzo' where id = (select id from temp_table);
SELECT * from users;

DELETE from users where id >= (select id from temp_table);
SELECT * from users;
