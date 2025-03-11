git config--global

library(DBI)
library(dplyr)
library(RSQLite)

portaldb <- dbConnect(SQLite(),"C:/Users/gabri/Downloads/database.sqlite")


dbListTables(portaldb)

Pregunta1 <-dbGetQuery(portaldb,"SELECT count(reviewid), artist FROM reviews GROUP by (artist) ORDER by (count(reviewid)) desc limit 1;")

