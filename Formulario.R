

library(DBI)
library(dplyr)
library(RSQLite)

portaldb <- dbConnect(SQLite(),"C:/Users/gabri/Downloads/database.sqlite")


dbListTables(portaldb)

Pregunta1 <-dbGetQuery(portaldb,"SELECT count(reviewid), artist FROM reviews GROUP by (artist) ORDER by (count(reviewid)) desc limit 1;")

Pregunta2 <-dbGetQuery(portaldb,"SELECT avg(score) , reviewid, pub_year FROM reviews GROUP by reviewid  HAVING pub_year BETWEEN 2010 and 2014 ORDER by avg(score) DESC ;")

Pregunta3 <-dbGetQuery(portaldb,"SELECT label, count(reviewid) FROM labels GROUP by label ORDER by count(reviewid) desc limit 5;")

Pregunta4 <-dbGetQuery(portaldb,"SELECT count(title), title from reviews group by title HAVING  best_new_music=1 and pub_year=2016 ;  ")
"Esta pregunta tiene la particularidad de que para ver el resultado no se ve los datos del dataframe si no la cantidad de datos del dataframe, eneste caso 90 albumes recibieron el reconociemiento"
