
# Postwork Sesión 3
# -------------------------------------------------------------------------
# 
# 1. Con el último data frame obtenido en el postwork de la sesión 2, 
# elabora tablas de frecuencias relativas para estimar las siguientes 
# probabilidades:
#   
# - La probabilidad (marginal) de que el equipo que juega en casa anote x 
# goles (x=0,1,2,)
# 
# - La probabilidad (marginal) de que el equipo que juega como visitante 
# anote y goles (y=0,1,2,)
# 
# - La probabilidad (conjunta) de que el equipo que juega en casa anote x 
# goles y el equipo que juega como visitante anote y goles 
# (x=0,1,2,, y=0,1,2,)
# 
# 2. Realiza lo siguiente:
#   
# - Un gráfico de barras para las probabilidades marginales estimadas del 
# número de goles que anota el equipo de casa
# 
# - Un gráfico de barras para las probabilidades marginales estimadas del 
# número de goles que anota el equipo visitante.
#
# - Un HeatMap para las probabilidades conjuntas estimadas de los números 
# de goles que anotan el equipo de casa y el equipo visitante en un partido.
# 

data <- read.csv("https://raw.githubusercontent.com/mnaR99/DA-BEDU/main/MOD2/data/psw02.csv")

goals <- table(home = data$FTHG, away = data$FTAG)

prop.table(rowSums(goals))

prop.table(colSums(goals))

prop.table(goals)

barplot(prop.table(rowSums(goals)), 
        main = "Probability of score", sub = "Home Team"
        )

barplot(prop.table(colSums(goals)), 
        main = "Probability of score", sub = "Away Team"
        )

heatmap(prop.table(goals), 
        Rowv = NA, 
        Colv = NA,
        scale = "none", 
        main = "Probability of score", ylab = "Home", xlab = "Away"
        )

library(dplyr); library(ggplot2)

theme_set(theme_light())

data %>% 
  count(Home = FTHG) %>% 
  ggplot(aes(Home, n/sum(n))) +
    geom_col(fill = "#2A9688") +
    labs(title = "Probability of score n Goals", y = "Pr")

data %>% 
  count(Away = FTAG) %>% 
  ggplot(aes(Away, n/sum(n))) +
    geom_col(fill = "#F78D6C") +
    labs(title = "Probability of score n Goals", y = "Pr")

data %>% 
  count(Away = factor(FTAG), Home = factor(FTHG)) %>% 
  ggplot(aes(Away, Home, fill = n/sum(n))) +
    geom_tile() +
    coord_fixed() +
    labs(title = "Probability of scoreboard", fill = "Pr") +
    theme(panel.grid = element_blank())

