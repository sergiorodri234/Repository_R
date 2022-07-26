library(tidyverse)
library(readr)
library(naniar)
library(extrafont)


##LIZETH VILLAMIL Y SERGIO RODRIGUEZ

##1)

# importacion de base ----- 
all <- read_csv("https://raw.githubusercontent.com/sergiorodri234/raws/main/all_csv%20sorted.csv", 
                col_types = cols(Average_price_2021 = col_double(), 
                                 Average_price__2020 = col_double()))

colnames(all) ## se usa para ver los nombres de las columnas para cambiar sus nombre 

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
# se utiliza glimpse el metodo de dplyr para acceder a la estructura de las bases este es similar al metodo de r base str() se concatena con pipe para utilizar select
# y establecerle la condicion que acceda para las columnas del 1 al 10

# DataFrame con los missing values ----- 
df_miss <- data.frame(miss_var_summary(all))

df_miss # se usa para ver el resultado en la consola

# Nueva columna con el  Cambio porcentual entre el año 2020 y 2021 ----
all_ <- all %>% 
  select(avg_2020,avg_2021,country) %>% 
  mutate(cambio_pc = ((avg_2021 - avg_2020) / (avg_2020)*100)) %>% 
  arrange(desc(cambio_pc))

##3)

all_   # se usa para ver el resultado en la consola
# A continuacion se ven los 10 paises en los que mas se incremento el precio del internet para el periodo entre el 2020 y 2021 y la variacion correspondiente. 
# 1.Saint Helena, Ascension and Tristan da Cunha con una variacion del 769%.
# 2. Malawi con una variacion del 664%.
# 3.São Tomé and Príncipe con una variacion del 430%.
# 4. Mauritius con una variacion del 386%.
# 5. Spain con una variacion del 223%.     
# 6. French Polynesia con una variacion del 211%.
# 7. Eswatini con una variacion del 154%.
# 8. Greece con una variacion del 146%.
# 9. Gibraltar con una variacion del 138%.
# 10. Trinidad and Tobago con una variacion del 120%.
# Velocidad promedio  de internet en megabits respecto a los continentes de la base -----

all %>% 
  select(continental,avg) %>% 
  group_by(continental)  %>% 
  arrange((avg))

##4)

# la region con el internet promedio mas lento corresponde a las cercanas al este ("Near East")

paises_region_internet_promedio_mas_lento <- all %>%  
  filter(continental== "NEAR EAST" ) %>% 
  select(continental,country) 

# Lo anterior corresponde a un tibble donde se filtran los paises pertenecientes para esta region.


##5)


#  grafico de dispersion  con las variables de velocidad promedio y porcentaje de usuarios de internet-----

all<-all%>%
  mutate(all, porcentaje_usuarios = users/popula)
##Lo que hicimos fue crear una función con mutate código el cual nos facilitó
#realizar la operación entre dos variables en este caso fueron users y popula,
#con el fin de encontrar el porcentaje de usuarios de internet.


ggplot(all, aes(x=porcentaje_usuarios , y=avg))+
  geom_point(alpha=0.3,colour='orange', lwd=3)+
  geom_smooth(formula = y~ x ,method = loess, se = F)+
  theme_bw()+
  scale_y_continuous(limits= c(0,135), breaks = seq(0,140,15))+
  scale_x_continuous(seq(1,100,1))+
  labs(
    title = 'Gráfico De Dispersión',
    x='Porcentaje de usuarios de internet',
    y='Velocidad promedio'
  )
## En este gráfico de dispersión podemos observar una relación positiva entre ambas 
#variables, tambien podriamos decir que muestra una correlación moderada positiva.
#Adicionalmente, nos quisimos apoyar una función que apoyara al gráfico así,
#confirmamos que la correlación al dar 0,60 es positiva.


cor(all$porcentaje_usuarios,all$avg,use = "na.or.complete",method = "pearson")



