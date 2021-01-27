
# Postwork Sesión 5
# -------------------------------------------------------------------------
# 
# 1. A partir del conjunto de datos de soccer de la liga española de las 
# temporadas 2017/2018, 2018/2019 y 2019/2020, crea el data frame 
# `SmallData`, que contenga las columnas `date`, `home.team`, `home.score`, 
# `away.team` y `away.score`; esto lo puede hacer con ayuda de la función 
# `select` del paquete `dplyr`. Luego establece un directorio de trabajo y 
# con ayuda de la función `write.csv` guarda el data frame como un archivo 
# csv con nombre *soccer.csv*. Puedes colocar como argumento 
# `row.names = FALSE` en `write.csv`. 
# 
# 2. Con la función `create.fbRanks.dataframes` del paquete `fbRanks` 
# importe el archivo *soccer.csv* a `R` y al mismo tiempo asignelo a una 
# variable llamada `listasoccer`. Se creará una lista con los elementos 
# `scores` y `teams` que son data frames listos para la función 
# `rank.teams`. Asigna estos data frames a variables llamadas `anotaciones`
# y `equipos`.
# 
# 3. Con ayuda de la función `unique` crea un vector de fechas (`fecha`) 
# que no se repitan y que correspondan a las fechas en las que se jugaron 
# partidos. Crea una variable llamada `n` que contenga el número de fechas 
# diferentes. Posteriormente, con la función `rank.teams` y usando como 
# argumentos los data frames `anotaciones` y `equipos`, crea un ranking de 
# equipos usando únicamente datos desde la fecha inicial y hasta la 
# penúltima fecha en la que se jugaron partidos, estas fechas las deberá 
# especificar en `max.date` y `min.date`. Guarda los resultados con el 
# nombre `ranking`.
# 
# 4. Finalmente estima las probabilidades de los eventos, el equipo de casa
# gana, el equipo visitante gana o el resultado es un empate para los 
# partidos que se jugaron en la última dates del vector de fechas `fecha`. 
# Esto lo puedes hacer con ayuda de la función `predict` y usando como 
# argumentos `ranking` y `fecha[n]` que deberá especificar en `date`.
# 

# Parte 1 -------------------------------------------------------------------------------------

library(dplyr)
library(fbRanks)

datos_soccer <- read.csv("https://raw.githubusercontent.com/mnaR99/DA-BEDU/main/MOD2/data/psw02.csv")

soccer_temp <- tempfile("soccer", fileext = ".csv")

datos_soccer %>% 
  select(date = 1, home.team = 2, home.score = 4, away.team = 3, away.score = 5, -FTR) %>% 
  write.csv(soccer_temp, row.names = F)

# Parte 2 -------------------------------------------------------------------------------------

listasoccer <- create.fbRanks.dataframes(soccer_temp)
anotaciones <- listasoccer$scores
equipos <- listasoccer$teams

# Parte 3 -------------------------------------------------------------------------------------

fecha <- unique(anotaciones$date)
n <- length(fecha)

ranking <- rank.teams(anotaciones, equipos, min.date = fecha[1], max.date = fecha[n-1], silent = T)

# Parte 4 -------------------------------------------------------------------------------------

predict(ranking, date = fecha[n])

#> Predicted Match Results for 1900-05-01 to 2100-06-01
#> Model based on data from 2017-08-18 to 2020-12-22
#> ---------------------------------------------
#> 2020-12-23 Leganes vs Sevilla, HW 22%, AW 50%, T 27%, pred score 0.8-1.4  actual: T (1-1)
#> 2020-12-23 Valencia vs Huesca, HW 57%, AW 20%, T 22%, pred score 1.8-1  actual: HW (2-1)
#> 2020-12-23 Vallecano vs Levante, HW 26%, AW 51%, T 22%, pred score 1.3-1.9  actual: HW (2-1)
