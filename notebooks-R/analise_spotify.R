library(readr)
library(dplyr)

setwd("C:/Users/bianc/OneDrive/Documentos")

file.exists("top_spotify_tracks_2017.csv")

df <- read_csv("top_spotify_tracks_2017.csv")

# Verificar a dimensão do dataset
dim(df)

# Verificar os nomes das colunas
colnames(df)

# Verificar as primeiras linhas do dataset
head(df)

## Contar o número de artistas distintos
artists <- df %>% 
  summarise(n_artistas = n_distinct(artists))

artists

## Contar quantas músicas cada artista tem e ordenar por quantidade
artistas_mais_musicas <- df %>%
  count(artists, sort = TRUE) %>%
  head(10)

artistas_mais_musicas

## Média de duração (convertendo de ms para minutos)
# Média de duração
media_duracao <- mean(df$duration_ms) / 60000  
# Convertendo de ms para minutos
print(paste("Duração média das músicas: ", round(media_duracao, 2), "minutos"))

