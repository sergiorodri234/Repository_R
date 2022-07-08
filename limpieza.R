library(readr)
library(tidyverse)

df <- read_delim("Pdfs R/2020_ANONIMIZADA_FINAL.csv", 
                                      delim = ";", escape_double = FALSE, trim_ws = TRUE,show_col_types = F)

colnames(df)


df %>%
  select("V1","BRUTA","PERSONOM","VENTA","GASTOPNOP","INVPRO","AGREGA","TOTMUJ","TOTHOM")
df1 <- mutate_at(df, c("TOTMUJ"), ~replace(., is.na(.), 0))




df2 <- df1 %>%
  group_by("V1")






x<- df %>% select(TOTMUJ)  



