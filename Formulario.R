

library(DBI)
library(dplyr)
library(RSQLite)

portaldb <- dbConnect(SQLite(),"C:/Users/gabri/Downloads/database.sqlite")


dbListTables(portaldb)
"1.	¿Cuál es el artista con más reseñas en la base de datos?"
Pregunta1 <-dbGetQuery(portaldb,"SELECT count(reviewid) AS cant_reseñas, artist AS artista FROM reviews GROUP by (artist) ORDER by (count(reviewid)) desc limit 2;")

"2.	¿Cuál fue el puntaje promedio (score) de las reseñas publicadas entre los años 2010 y 2014?"
Pregunta2 <-dbGetQuery(portaldb,"SELECT avg(score) AS puntaje_promedio FROM reviews GROUP by pub_year BETWEEN 2010 and 2014  HAVING pub_year BETWEEN 2010 and 2014 ;")

"3.	Lista los 5 sellos discográficos (label) con mayor cantidad de reseñas publicadas."
Pregunta3 <-dbGetQuery(portaldb,"SELECT label AS sello_discografico, count(reviewid) AS reseñas FROM labels GROUP by label ORDER by count(reviewid) desc limit 5;")

"4.	¿Cuántos álbumes recibieron la distinción de Best New Music en 2016?"
Pregunta4 <-dbGetQuery(portaldb,"SELECT count(title) Cant_albumes, title AS Albumes from reviews group by title HAVING  best_new_music=1 and pub_year=2016 ;  ")
"Esta pregunta tiene la particularidad de que para ver el resultado no se ve los datos del dataframe si no la cantidad de datos del dataframe, eneste caso 90 albumes recibieron el reconociemiento"

"5.	¿Cuáles son los 3 géneros (genre) con la calificación promedio más alta?"
Pregunta5 <-dbGetQuery(portaldb," SELECT genre AS género, AVG(reviews.score) AS puntaje_promedio FROM genres JOIN reviews ON reviews.reviewid = genres.reviewid group by genre ORDER BY puntaje_promedio DESC LIMIT 3; ")

