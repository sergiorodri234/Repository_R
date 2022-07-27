library(tidyverse)
library(readr)
library(patchwork)
##LIZETH VILLAMIL Y SERGIO RODRIGUEZ


base <- read_csv('https://raw.githubusercontent.com/sergiorodri234/raws/main/songs_normalize.csv')


## 1. Gráfico de Dispersión -----

p1 <- ggplot(base, aes(x = danceability, y = valence)) +
  geom_point(alpha=0.3,color = 'blue') + labs(
    title = "Scatterplot"
    
  )
## 2. Boxplot -----

p2 <-  ggplot(base, aes(x= mode, y = energy, colour = factor(mode))) +
  geom_boxplot(show.legend = F) + labs(
    title = "Boxplot"
    
  )


## 3. Composición con Patchwork ------


 p3 <- p1 + p2 



#Quisimos hacer un leve acercamiento para realizar un análisis de los gráficos boxplot, 
#podemos observar que el boxplot con mode en 0 tiene el dato medio (el 50%) en 0,73, 
#adicionalmente observamos que para ambos boxplot se  encuentran 6 datos atípicos.
#Por el contrario para el boxplot con mode en 1.0 los cuartiles son levemente menores
#a los del boxplot anterior.

