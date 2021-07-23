USE twitter;
SELECT * FROM users;
SELECT * FROM faves;
SELECT * FROM follows;
SELECT * FROM tweets;
SELECT * FROM users;
SELECT first_name FROM users;
SELECT first_name, last_name FROM users;
SELECT first_name FROM users WHERE id = 2;
SELECT last_name FROM users WHERE id = 2 OR id = 3;
SELECT * FROM users WHERE id > 2;
SELECT * FROM users WHERE id <= 3;
SELECT * FROM users WHERE first_name LIKE "%e"; -- End_with_e 
SELECT * FROM users WHERE first_name LIKE "K%"; -- Start_with_K
SELECT * FROM users ORDER BY birthday DESC;
SELECT * FROM users ORDER BY birthday ASC;
SELECT * FROM users WHERE first_name LIKE "%e" ORDER BY birthday DESC;
SELECT first_name FROM users ORDER BY first_name;







