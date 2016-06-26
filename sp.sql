DELIMITER //
CREATE PROCEDURE categorias
()
BEGIN
  SELECT categoria, descripcion 
  FROM categoria;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE estudio_grabacion
()
BEGIN
  SELECT estudio_grabacion, nombre 
  FROM estudio_grabacion;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE director
()
BEGIN
  SELECT director, nombre 
  FROM director;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE setRating
(IN p_pelicula INT,
IN p_calificacion INT,
IN p_ip VARCHAR(20),
IN p_navegador VARCHAR(50))
BEGIN
	INSERT INTO rating (pelicula, calificacion, ip, navegador, fecha)
	VALUES (p_pelicula, p_calificacion, p_ip, p_navegador, NOW());
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE getPeliculas
(IN p_pelicula INT,
IN p_titulo VARCHAR(100))
BEGIN
	SELECT p.pelicula, p.titulo, p.imagen, IFNULL(AVG(r.calificacion),0) AS calificacion, COUNT(r.calificacion) AS cantidad 
    FROM pelicula p 
	LEFT JOIN rating r ON p.pelicula = r.pelicula 
	WHERE p.pelicula = COALESCE(p_pelicula, p.pelicula)
	AND (p.titulo LIKE CONCAT('%', p_titulo, '%') OR p_titulo IS NULL)
    GROUP BY p.pelicula 
    ORDER BY calificacion DESC;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE getPeliculas_Nombre
(IN p_pelicula INT,
IN p_titulo VARCHAR(100))
BEGIN
	SELECT p.pelicula, p.titulo, p.imagen, IFNULL(AVG(r.calificacion),0) AS calificacion, COUNT(r.calificacion) AS cantidad 
    FROM pelicula p 
	LEFT JOIN rating r ON p.pelicula = r.pelicula 
	WHERE p.pelicula = COALESCE(p_pelicula, p.pelicula)
	AND (p.titulo LIKE CONCAT('%', p_titulo, '%') OR p_titulo IS NULL)
    GROUP BY p.pelicula 
    ORDER BY p.titulo DESC;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE eliminarPelicula
(IN p_pelicula INT)
BEGIN
	DELETE 
	FROM rating
	WHERE pelicula = p_pelicula;
	
	DELETE 
    FROM pelicula 
	WHERE pelicula = p_pelicula;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE modificarPelicula
(IN p_pelicula INT,
IN p_titulo VARCHAR(100),
IN p_anio INT,
IN p_estudio_grabacion INT,
IN p_director INT,
IN p_categoria INT,
IN p_imagen VARCHAR(200)
)
BEGIN
	UPDATE pelicula 
	SET titulo = COALESCE(p_titulo, titulo),
	titulo = COALESCE(p_titulo, titulo),
	año = COALESCE(p_anio, año),
	estudio_grabacion = COALESCE(p_estudio_grabacion, estudio_grabacion),
	director = COALESCE(p_director, director),
	categoria = COALESCE(p_categoria, categoria),
	imagen = COALESCE(p_imagen, imagen)
	WHERE pelicula = p_pelicula;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE insertarPelicula
(IN p_titulo VARCHAR(100),
IN p_anio INT,
IN p_estudio_grabacion INT,
IN p_director INT,
IN p_categoria INT,
IN p_imagen VARCHAR(200)
)
BEGIN
	INSERT INTO pelicula 
	(titulo, año, estudio_grabacion, director, categoria, imagen)
	VALUES (p_titulo, p_anio, p_estudio_grabacion, p_director, p_categoria, p_imagen);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE getPeliculasGrid
()
BEGIN
	SELECT p.pelicula, p.titulo, p.año, c.descripcion, d.nombre, e.nombre,  p.imagen
    FROM pelicula p
	INNER JOIN categoria c ON c.categoria = p.categoria
	INNER JOIN director d ON d.director = p.director
	INNER JOIN estudio_grabacion e ON e.estudio_grabacion = p.estudio_grabacion;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE getPeliculasModificar
(IN p_pelicula INT)
BEGIN
	select pelicula,titulo,año,estudio_grabacion,director,categoria,imagen 
    FROM pelicula  
	WHERE pelicula = COALESCE(p_pelicula, pelicula);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE getRatingGrid
(IN p_pelicula INT)
BEGIN
	SELECT p.pelicula, p.titulo, r.calificacion, COALESCE(r.ip, ''), COALESCE(r.navegador, ''), r.fecha
    FROM rating r
	INNER JOIN pelicula p ON p.pelicula = r.pelicula
	WHERE p.pelicula = COALESCE(p_pelicula, p.pelicula)
	ORDER BY r.fecha DESC;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE getPeliculaDetalle
(IN p_pelicula INT)
BEGIN
	SELECT p.pelicula, p.titulo,p.año, e.nombre as Estudio, d.nombre as Director, c.descripcion as Categoria
    FROM pelicula p
	INNER JOIN estudio_grabacion e on p.estudio_grabacion=e.estudio_grabacion
	INNER JOIN director d on p.director=d.director
	INNER JOIN categoria c on c.categoria=p.categoria
	WHERE p.pelicula = COALESCE(p_pelicula, p.pelicula);
END //
DELIMITER ;