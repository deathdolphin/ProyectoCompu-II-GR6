

library(DBI)
library(dplyr)
library(RSQLite)

portaldb <- dbConnect(SQLite(),"C:/Users/gabri/Downloads/database.sqlite")


dbListTables(portaldb)

Pregunta1 <-dbGetQuery(portaldb,"SELECT count(reviewid), artist FROM reviews GROUP by (artist) ORDER by (count(reviewid)) desc limit 1;")

Pregunta2 <-dbGetQuery(portaldb,"SELECT avg(score) , reviewid, pub_year FROM reviews GROUP by reviewid  HAVING pub_year BETWEEN 2010 and 2014 ORDER by avg(score) DESC ;")

