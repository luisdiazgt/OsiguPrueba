CREATE DATABASE peliculas;
USE peliculas;

--CREATE USER 'app'@'localhost' IDENTIFIED BY 'B123';
--GRANT ALL PRIVILEGES ON peliculas TO 'app'@'localhost';
--SET PASSWORD FOR root@localhost=PASSWORD('root');

CREATE TABLE categoria(
	categoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	descripcion VARCHAR(200)
);

CREATE TABLE director (
	director INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(200)
);

CREATE TABLE estudio_grabacion (
	estudio_grabacion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(200)
);

CREATE TABLE pelicula (
	pelicula INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	titulo VARCHAR(100),
	año INT,
	estudio_grabacion INT NOT NULL,
	director INT NOT NULL,
	categoria INT NOT NULL,
	imagen VARCHAR(200),
	FOREIGN KEY (categoria) REFERENCES categoria(categoria),
	FOREIGN KEY (estudio_grabacion) REFERENCES estudio_grabacion(estudio_grabacion),
	FOREIGN KEY (director) REFERENCES director(director)
);

CREATE TABLE rating(
	rating INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	pelicula INT NOT NULL,
	calificacion DOUBLE(2, 1) NOT NULL,
	ip VARCHAR(20),
	navegador VARCHAR(50),
	fecha DATETIME,
	FOREIGN KEY (pelicula) REFERENCES pelicula(pelicula)
);





INSERT INTO categoria (Descripcion) VALUES ('Comedia');
INSERT INTO categoria (Descripcion) VALUES ('Accion');
INSERT INTO categoria (Descripcion) VALUES ('Suspenso');
INSERT INTO categoria (Descripcion) VALUES ('Terror');
INSERT INTO categoria (Descripcion) VALUES ('Drama');

INSERT INTO estudio_grabacion (Nombre) VALUES ('Fox');
INSERT INTO estudio_grabacion (Nombre) VALUES ('Warner Movies');

INSERT INTO director (Nombre) VALUES ('Don Ramon');
INSERT INTO director (Nombre) VALUES ('El chapulin Colorado');
INSERT INTO director (Nombre) VALUES ('Kiko');
INSERT INTO director (Nombre) VALUES ('La chilindrina');

INSERT INTO pelicula (titulo,año,estudio_grabacion,director,categoria,imagen) values('X-MAN',2001,1,1,1,'movie1.jpg');
INSERT INTO pelicula (titulo,año,estudio_grabacion,director,categoria,imagen) values('SPIDER MAN 2',2002,2,2,2,'movie2.jpg');
INSERT INTO pelicula (titulo,año,estudio_grabacion,director,categoria,imagen) values('SPIDER MAN 3',2003,1,3,3,'movie3.jpg');
INSERT INTO pelicula (titulo,año,estudio_grabacion,director,categoria,imagen) values('VALKYRIE',2004,2,4,4,'movie4.jpg');
INSERT INTO pelicula (titulo,año,estudio_grabacion,director,categoria,imagen) values('GLADIATOR',2005,2,1,5,'movie5.jpg');
INSERT INTO pelicula (titulo,año,estudio_grabacion,director,categoria,imagen) values('ICE AGE',2006,2,1,1,'movie6.jpg');
INSERT INTO pelicula (titulo,año,estudio_grabacion,director,categoria,imagen) values('TRANSFORMERS',2007,2,2,2,'movie7.jpg');
INSERT INTO pelicula (titulo,año,estudio_grabacion,director,categoria,imagen) values('MAGNETO',2008,1,3,3,'movie8.jpg');
INSERT INTO pelicula (titulo,año,estudio_grabacion,director,categoria,imagen) values('KUNG FU PANDA',2009,1,4,4,'movie9.jpg');
INSERT INTO pelicula (titulo,año,estudio_grabacion,director,categoria,imagen) values('EAGLE EYE',2010,1,1,5,'movie10.jpg');

INSERT INTO pelicula (titulo,año,estudio_grabacion,director,categoria,imagen) values('NARNIA',2001,1,1,1,'movie11.jpg');
INSERT INTO pelicula (titulo,año,estudio_grabacion,director,categoria,imagen) values('ANGELS & DEMON',2002,2,2,2,'movie12.jpg');
INSERT INTO pelicula (titulo,año,estudio_grabacion,director,categoria,imagen) values('HOUSE',2003,1,3,3,'movie13.jpg');
INSERT INTO pelicula (titulo,año,estudio_grabacion,director,categoria,imagen) values('VACANCY',2004,2,4,4,'movie14.jpg');
INSERT INTO pelicula (titulo,año,estudio_grabacion,director,categoria,imagen) values('MIRRORS',2005,2,1,5,'movie15.jpg');
INSERT INTO pelicula (titulo,año,estudio_grabacion,director,categoria,imagen) values('THE KINGDOM',2006,2,1,1,'movie16.jpg');
INSERT INTO pelicula (titulo,año,estudio_grabacion,director,categoria,imagen) values('MOTIVES',2007,2,2,2,'movie17.jpg');
INSERT INTO pelicula (titulo,año,estudio_grabacion,director,categoria,imagen) values('THE PRESTIGE',2008,1,3,3,'movie18.jpg');