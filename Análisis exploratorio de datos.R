# Instalación y puesta en funcionanmiento de los paquetes
pacman::p_load(tidyverse, pacman, DescTools, moments, forcats, scales, DBI, 
               RSQLite, dbplyr, odbc, flextable, ftExtra, svglite)

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

#Juntar Géneros y demás variables importantes
tb_new <- dbGetQuery(dbdb, "SELECT reviews.reviewid, reviews.best_new_music,
reviews.score, genres.genre
                     FROM reviews INNER JOIN genres
                     ON reviews.reviewid = genres.reviewid;")

#Limpiar NA's
tb_1 <- tb_new[complete.cases(tb_new),]

# Preparar dataframe para cálculos necesarios
tb_2 <- tb_1 %>% mutate (n = 1) %>% group_by(genre) %>% mutate(N = sum(n)) %>%
  mutate(avg = mean(score)/N)



