# Instalación y puesta en funcionanmiento de los paquetes
pacman::p_load(tidyverse, pacman, DescTools, moments, forcats, scales, DBI, 
               RSQLite, dbplyr,odbc)

# Conectarse a la base de datos SQL por medio de R.
# Importante tener el archivo en la carpeta usuario.
# Importante usar la función dbDisconnect(dbdb) antes de cerrar la sesión de R.
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



