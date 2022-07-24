library(tidyverse)
library(readr)
library(naniar)

# importacion de base ----- 
all <- read_csv("https://raw.githubusercontent.com/sergiorodri234/raws/main/all_csv%20sorted.csv", 
                col_types = cols(Average_price_2021 = col_double(), 
                                  Average_price__2020 = col_double()))
View(columnas) 

colnames(all)
# Cambio de nombres para facilitar acceso a las columnas/variables a utilizar -----

all <- all %>% rename(ind = "...1" ,
                      country_c = "Country code",
                      country = "Country", 
                      continental ="Continental region",
                      internet_p = "NO. OF Internet Plans",
                      average_pgb = "Average price_of_GB",
                      cheapest  = "CheapestGB_for_days" ,
                      most_expen= "Most_expensive_1GB",
                      avg_2021 = "Average_price_2021" ,
                      avg_2020 =  "Average_price__2020" ,
                      users = "Internet users",
                      popula= "Population",
                      avg = "Avg" )


# Estructura de la base ------
all %>% 
  glimpse() %>% 
  select(1:10)

# DataFrame con los missing values ----- 
df_miss <- data.frame(miss_var_summary(all))

df_miss
# Nueva columna con el  Cambio porcentual entre el año 2020 y 2021 ----
all_ <- all %>% 
  select(avg_2020,avg_2021,country) %>% 
  mutate(cambio_pc = ((avg_2021 - avg_2020) / (avg_2020)*100)) %>% 
  arrange(desc(cambio_pc))



all_
# Velocidad promedio  de internet en megabits respecto a los continentes de la base -----
all %>% 
  select(continental,avg) %>% 
  group_by(continental)  %>% 
  arrange((avg))


#  grafico de dispersion  con las variables de velocidad promedio y porcentaje de usuarios de internet



