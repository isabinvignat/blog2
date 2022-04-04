--Requerimiento 1
CREATE DATABASE blog;
--Requerimiento 2
CREATE TABLE usuarios (id SERIAL, email VARCHAR(50), PRIMARY KEY (id));
CREATE TABLE post (id SERIAL, usuario_id INT, título VARCHAR(50), fecha DATE, PRIMARY KEY (id), FOREIGN KEY (usuario_id) REFERENCES usuarios (id));
CREATE TABLE comentarios(id SERIAL PRIMARY KEY, usuario_id INT NOT NULL REFERENCES usuarios(id), post_id INT NOT NULL REFERENCES post(id), texto VARCHAR(50) NOT NULL, fecha DATE);
--Requerimiento 3
\copy usuarios FROM 'C:\Users\ibinv\OneDrive\Desktop\blog\usuarios.csv' csv header;
\copy post FROM 'C:\Users\ibinv\OneDrive\Desktop\blog\post.csv' csv header;
\copy comentarios FROM 'C:\Users\ibinv\OneDrive\Desktop\blog\comentarios.csv' csv header;
--Requerimiento 4
SELECT usuarios.email, usuarios.id, post.título
FROM usuarios
JOIN post ON usuarios.id = post.usuario_id
WHERE usuarios.id = '5';

--Requerimiento 5
SELECT  usuarios.id, usuarios.email, comentarios.texto
FROM usuarios 
JOIN comentarios ON usuarios.id = comentarios.usuario_id
WHERE usuarios.id<>'6';

--Requerimiento 6
-- SELECT usuarios.*
-- FROM usuarios
-- LEFT JOIN post ON usuario.id =post.usuario_id
-- WHERE post.título IS NULL;
--Requerimiento 7
SELECT post.título, comentarios.texto
FROM post
FULL OUTER JOIN comentarios ON post.id = comentarios.post_id;
--Requerimiento 8
-- SELECT DISTINCT*
-- FROM usuarios
-- INNER JOIN post ON usuario.id =post.usuario_id
-- WHERE post.fecha BETWEEN '2020-06-01' and '2020-06-30';