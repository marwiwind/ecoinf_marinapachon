################ DATAFRAME A PARTIR DE UNA LISTA ################ 

# Autor: Marina Pachón Mena
# Propósito: Ser capaces de generar un dataframe homogéneo a partir de la lista generada anteriormente.

# Carga de paquetes necesarios
library(tidyverse)

# Ejecutamos el script anterior para cargar la lista de datos
source("scripts/bucle_guardado.R")

# Unimos todos los dataframes de la lista en uno solo con esta función
df_clima <- bind_rows(lista_datos_clima)

# Separamos la columna sp_elev en dos nuevas columnas: sp y altitud:

# Podría hacer este paso usando filtros con la función case_when y str_detect
# pero la función separate me parece más limpia y rápida en este caso.

df_clima <- df_clima %>%
  separate(col = sp_elev, into = c("sp", "elevation"), sep = "_", remove = FALSE)

# Guardamos el dataframe final en un archivo .csv.
write_csv(df_clima, "data/df_clima.csv")
