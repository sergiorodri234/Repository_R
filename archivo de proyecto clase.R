## SERGIO RODRIGUEZ Y LIZETH VILLAMIL
## ANALISIS DE DATOS CON R


##PUNTO 1
# VECTORES Y LISTAS
## A)
# La principal diferencia existente entre un vector c() y una lista dentro de R 
# es que un vector los elementos deben ser del mismo tipo, a diferencia de la lista 
# que si permite distintos tipos de datos dentro de estas, 
# en otras palabras la listas serian una correlación ordenada de cualquier objeto,
# además de almacenar distintas estructuras.

## B)

lista_1 <- list(
  1:3,
  "a",
  c(TRUE,FALSE,TRUE),
  c(2.3,5.9)
)
# Se hace una asignacion  para ambos casos con el fin de visualizar el  type en el entorno de trabajo  
lista_1_corcherte_normal <- lista_1[2]
lista_1[2]
lista_1_corcherte_normal


lista_1_corchetes_dobles<- lista_1[[2]]
lista_1[[2]]
lista_1_corchetes_dobles

# Con la asignacion anteorior, observamos que con  un solo corchete  se extrae un elemento tipo lista para la  posicion 
# especificada ,que en y con corchetes dobles  se accede a los elementos de la posicion dada con el tipo de dato original
# como un value.

##PUNTO DOS 

matriz <- matrix(rep(1:7, 4), ncol = 4, nrow = 7, byrow = TRUE)

# Solución:

## Literal a.
matriz[,2]  # Acceder a columna 2
## Literal b.
matriz[3,] # Acceder a la tercera fila únicamente.
## Literal c.
matriz[3:7,] # Acceder de la fila 3 a la fila 7.
## Literal d.
matriz[1:2,2:4] # Acceder las columnas 2 a 4 de las filas 1 y 2.

## PUNTO 3
#Estructura
numero <- 5

# Solución:
if (numero %% 2==0) {
  print(paste(numero,"Es par"))
} else if (numero %% 2!=0) {
  print(paste(numero,"Es impar"))
}

## PUNTO 4

nombres <- c("Andrea", "Carlos", "Juan", "Carolina", "Fernando", "Laura")

# Solución:
for (nombre in nombres) {
  print(paste("Bienvenido",nombre))
}

## PUNTO 5. FUNCIONES

# SOLUCION
mi_funcion <<- function(a,b=1){
 return(a^b) 
}
mi_funcion(5)
respuesta <- mi_funcion(2,3)
respuesta
