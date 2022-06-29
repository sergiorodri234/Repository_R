library('tidyverse')
# Punto 1. Vectores y 
### La principal diferencia existente entre un vector c() y una lista dentro de R 
### viene dada por la restriccion presente de c() el cual al recibir tipos de datos distintos da problemas al no reconocer adecuadamente las diferencias de tipos
### a diferencia de la lista que si permite distintos tipos de datos dentro de estas
lista_1 <- list(
  1:3,
  "a",
  c(TRUE,FALSE,TRUE),
  c(2.3,5.9)
)
# Se hace una asignacion  para ambos caso con el fin de visualizar el  type en el entorno de trabajo  
lista_1_corcherte_normal <- lista_1[2] 
lista_1[2]

type(lista_1[1])
lista_1_corchetes_dobles<- lista_1[[1]]
l1[[4]]


# con la asignacion anteorior, observamos que con  un solo corchete  se extrae un elemento tipo lista para la  posicion especificada ,que en 
# y con corchetes dobles  se accede a los elementos de la posicion dada con el tipo de dato original

matriz <- matrix(rep(1:7, 4), ncol = 4, nrow = 7, byrow = TRUE)
#
# Solución:
## Literal a.
matriz[,2]  # acceder a columna 2
apply(matriz,2,)
## Literal b.
matriz[3,]
## Literal c.
matriz[3:7,]
## Literal d.
matriz[1:2,2:4]


#Estructura
numero <- 5

# Solución:
if ((numero %% 2==0)) {
  print(paste(numero,"Es par"))
} else if ((numero %% 2!=0)) {
  print(paste(numero,"Es impar"))
}

nombres <- c("Andrea", "Carlos", "Juan", "Carolina", "Fernando", "Laura")

# Solución:
for (nombre in nombres) {
  print(paste("Bienvenido",nombre))
}
#punto 5. Funciones
mi_funcion <<- function(a,b=1){
 return(a^b) 
}
mi_funcion(5)
respuesta <- mi_funcion(2,3)
respuesta
