
library(readr)
library(tidyverse)
library(FactoMineR)
library(factoextra)
library(vcdExtra)
library(cluster)
library(corrplot)

df <- read_delim("https://raw.githubusercontent.com/srcuio/base/main/base.csv",delim = ";", escape_double = FALSE, trim_ws = TRUE,show_col_types = TRUE)



df <- select(df,"BRUTA","VENTA","GASTOS","INVPRO")

df <- df[!apply(df[,1:4]== 0, 1 , all),]

#matriz de correlaciones
round(cor(df),3)
datos_est = scale(df)


P= cor(datos_est
       )

VP =eigen(P)$values
VP_varexp= VP/sum(VP)
e = eigen(P)$vectors
coord_1 = e[,1]*sqrt(VP[1])
coord_2 = e[,1]*sqrt(VP[2])

contrib_1 = ((e[,1]*sqrt(VP[1]))^ 2 )/sum((e[,1]*sqrt(VP[1]))^2)
contrib_2 = ((e[,2]*sqrt(VP[1]))^ 2 )/sum((e[,2]*sqrt(VP[1]))^2)

plot(coord_1, coord_2, xlim= c(-1,1), ylim = c(-1,1))

res.pca = PCA(df, scale.unit= T, graph =T )


fviz_screeplot(res.pca)
res.pca$eig
res.pca$varcontrib
res.pca$var$coord


# 02. con la métrica, calcular los grupos
km.res = kmeans(scale(df), 3, iter.max = 100000)

# 03. visualización

fviz_cluster(km.res, data = df,
             ellipse.type = 'norm', # 't' - 'norm' - 'euclid'
             palette = 'jco',
             ggtheme = theme_minimal())


grupo1 = as.factor(km.res$cluster)

datos_1 = as.data.frame(cbind(df, grupo1))

head(datos_1)

## 
aggregate(datos_1[,-c(ncol(datos_1))], list(datos_1$grupo1), FUN = mean) 



### K MEDOIDS

kmed.res = pam(scale(df), 3)
fviz_cluster(kmed.res, data = df,
             ellipse.type = 'convex',
             pallete = 'jco',
             ggtheme = theme_minimal())

grupo2 = as.factor(kmed.res$clustering)

datos_2 = as.data.frame(cbind(datos_1, grupo2))

datos_2$cambio = (datos_2$grupo1 != datos_2$grupo2) * 1

datos_2[datos_2$cambio == 1, ]


