library(tidyverse)
library(readr)
library(naniar)
library(extrafont)

# importacion de base ----- 
all <- read_csv("https://raw.githubusercontent.com/sergiorodri234/raws/main/all_csv%20sorted.csv", 
                col_types = cols(Average_price_2021 = col_double(), 
                                 Average_price__2020 = col_double()))

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
# la region con el internet promedio mas lento corresponde a las cercanas al este ("Near East")
paises_region_internet_promedio_mas_lento <- all %>%  
  filter(continental== "NEAR EAST" ) %>% 
  select(continental,country) 

# Lo anterior corresponde  a un tibble donde se encuentra el listado de los paises pertenecientes a esta region

#  grafico de dispersion  con las variables de velocidad promedio y porcentaje de usuarios de internet-----

all<-all%>%
  mutate(all, porcentaje_usuarios = users/popula)
##Lo que hicimos fue crear una función con mutate códico el cual nos facilitó
#realizar la operación entre dos variables que en este caso ueron users y popula,
#con el fin d encontrar el porcentaje de usuarios de internet.


## en este gráfico de dispersión podemos observar una gran dispersón entre los dados
##pero aún asi podemos observar que la mayoría de los datos de usuarios de internet y 
#y velocidad promedio, nos indica que hay gran cantidad de usuarios con una velocidad menor 
#50 mbps.
ggplot(all, aes(x=porcentaje_usuarios, y=avg))+
  geom_point(colour='orange', lwd=3)+
  theme_bw()+
  scale_x_reverse() +
  scale_y_reverse()+
  labs(
    title = 'Gráfico De Dispersión',
    x='Porcentaje de usuarios de internet',
    y='Velocidad promedio'
  )




