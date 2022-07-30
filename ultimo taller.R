##TALLER FINAL
#SERGIO RODRIGUEZ Y LIZETH VILLAMIL

library(tidyverse)
library(ggplot2

library(readr)

#PRIMERO PUNTO 
#1.1)


calificacion<- 30

check<-function(calificacion){
if (calificacion >=0 & calificacion <10) {
  result<-"¡Hay mucho por mejorar!"
} else if (calificacion >=10 & calificacion <20){
  result<-"¡Bien! Pero podría ser excelente."
} else if(calificacion >=20 & calificacion <=30){
  result<-"¡Excelente Servicio! Sigue así."
}
return(result)
}

check(20)


#1.2)

check2<-function(calidad=10, decoracion=5, servicio=15){
  return(calidad+decoracion+servicio)
}
check2(5,5,5)


##PUNTO 2

#2.1)


base<-read_csv('https://raw.githubusercontent.com/camartinezbu/2022-Intersemestral-R-USTA/main/Modulo_5/restaurant_locations.csv')
base2<-read_csv('https://raw.githubusercontent.com/camartinezbu/2022-Intersemestral-R-USTA/main/Modulo_5/price_ratings.csv')

##Visualizamos la base de datos y tomamos las primeras 8 lìneas.
base %>% 
  glimpse() %>% 
  head(8)
base2 %>% 
  glimpse() %>% 
  head(8)
##Como podemos observar no en todas las columnas tenemos variables es por esto que con el 
#punto que si se le realizara un cambio a la base para que quede bien organizada.

#2.2)

base2_wider <- base2 %>%
  pivot_wider(names_from = Variable, values_from = Valor)
base2_wider %>% 
  glimpse()

#2.3)

base<-base %>% 
  rename(Id="Id_restaurant")

resultado_inner <- base2_wider %>%
  inner_join(base, by = "Id")

#2.4)

resultado_inner %>% 
  select(Restaurant, Price, Food, Service) %>% 
  arrange(desc(Price)) %>% 
  slice(168)
#Con esto nos damos cuenta que el restaurante màs barato es el Lamarca con un precio de 19.
resultado_inner %>% 
  select(Restaurant, Price, Food, Service) %>% 
  arrange(desc(Price)) %>% 
  head(1)
#Con esto nos damos cuenta que el restaurante màs caro es el Harry Cipriani con un precio de 65.


#2.5)

resultado_inner %>% 
  group_by(East) %>% 
  summarise(precio_promedio_comida=mean(Price))

#Como podemos ver la comida es màs cara en el lado Este de  Manhattan con un promedio en el
#precio de la comida de 44,0, cabe resaltar que el precio promedio en el Oeste es de 40,0.

#PUNTO TRES

#3.1)

regresion = lm(Price ~
            Food +
            Decor +
            Service +
            East, data = resultado_inner)
summary(regresion)
  
##Como podemos observar gracias al summary no todas las variables son significativas
#vemmos que la variable servicio es negativa; -0.002 lo que nos indica que el servicio
#no afecta el precio.En otras palabras rechazamos la hipotesis nula de que nuestros 
#betas son iguales a 0 a excepciòn de service.

#Adicionalmente la variable que influye màs en el pre precio de la comida es Decor 

##PUNTO CUATRO

#4.1)
resultado_inner<-resultado_inner %>% 
  as.factor(East)


ggplot(resultado_inner, aes(x=Service, linetype=factor(East)))+
  geom_density(lwd=1)+
  labs(x='Servicio',
       y='Densidad',
       linetype='East'
       )+
  facet_wrap(~'Gráfico de Densidad')

## La zona de Manhattan que cuenta con mejor calificaciòn de servicio es la zona Este.

#4.2)
ggplot(resultado_inner, aes(x=Price, y=Decor, color=factor(East)))+
  geom_point()+
  labs(title='Gráfico de Dispersión',
       x='Precio',
       y='Decoración',
       color='East')+
  scale_color_manual(
    labels = c("Oeste", "Este"),
    values = c("blue", "green"))+
  theme(plot.title = element_text(size = 15, 
                              color = "grey", 
                              face = "bold", 
                              hjust = 0.5 ))

##Observando el gráfico nos damos cuenta que el restaurante más barato se encuenta en la zona
#Oeste.


  
