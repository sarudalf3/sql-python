use friends;

DROP view IF EXISTS v_friends;
CREATE VIEW v_friends AS
SELECT user1.first_name as first_name, user1.last_name as last_name, 
user2.first_name as friend_first_name, user2.last_name as friend_last_name 
FROM users user1
LEFT JOIN friendships a ON user1.id=a.user_id 
LEFT JOIN users user2 ON a.friend_id = user2.id;

-- 1 Devuelva a todos los usuarios que son amigos de Kermit.
SELECT * FROM v_friends WHERE first_name = 'Kermit'; 

-- 2 - Devuelve el recuento de todas las amistades.
SELECT count(*)
FROM friendships;

-- 3 - Descubre quién tiene más amigos y devuelve el recuento de sus amigos.
SELECT first_name, last_name, COUNT(*)
FROM v_friends
GROUP BY first_name, last_name
LIMIT 1;

-- 4 - Crea un nuevo usuario y hazlos amigos de Eli Byers, Kermit The Frog y 
-- Marky Mark.
INSERT INTO users (first_name, last_name, created_at)
VALUES
('Ruben','Miranda',NOW());

INSERT INTO friendships (user_id, friend_id, created_at)
VALUES
(6,2, NOW()),
(6,4, NOW()),
(6,5, NOW());

-- 5 - Devuelve a los amigos de Eli en orden alfabético.
SELECT friend_first_name, friend_last_name 
FROM v_friends WHERE first_name = 'Eli'
ORDER BY friend_first_name, friend_last_name;

-- 6 - Eliminar a Marky Mark de los amigos de Eli.
DELETE FROM friendships WHERE user_id = 2 and friend_id=5;

-- 7 Devuelve todas las amistades, mostrando solo el nombre y 
-- apellido de ambos amigos
SELECT * FROM v_friends

