# Instalación y puesta en funcionanmiento de los paquetes
pacman::p_load(tidyverse, pacman, DescTools, moments, forcats, scales, DBI, 
               RSQLite, dbplyr,odbc)

# Conectarse a la base de datos SQL por medio de R.
# Importante tener el archivo en la carpeta usuario.
# Importante usar la función dbDisconnect(dbdb) antes de cerrar la sesión de R.
# "C:/users/*tu nombre de usuario*/*La carpeta de la db*/*nombre de la db*
dbdb <- dbConnect(SQLite(), 
                  "C:/Users/arman/Proyect.database/pitchforkcopy.sqlite")

#Verificar entidades
dbListTables(dbdb)

# Trasladar todas las entidades SQL a dataframes de R.
artists <- dbGetQuery(dbdb, "SELECT * FROM artists")
content <- dbGetQuery(dbdb, "SELECT * FROM content")
genres <- dbGetQuery(dbdb, "SELECT * FROM genres")
labels <- dbGetQuery(dbdb, "SELECT * FROM labels")
reviews <- dbGetQuery(dbdb, "SELECT * FROM reviews")
years <- dbGetQuery(dbdb, "SELECT * FROM years")

# Formateo de las variables en las entidades para poder ser utilizadas
genres$genre <- as.factor(genres$genre)
reviews$best_new_music <- as.factor(reviews$best_new_music)
summary(reviews)
summary(genres)

#Primeros Gráficos
plot(genres$genre)
hist(reviews$score)
plot(reviews$best_new_music, reviews$score)
plot(reviews$best_new_music)

