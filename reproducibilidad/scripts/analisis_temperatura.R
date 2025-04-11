################ CÁLCULO TEMPERATURA ################ 

# Autor: Marina Pachón Mena
# Propósito: Calcular los valores promedio de temperatura media anual por sitio; y por especie.

# Carga de paquetes necesarios
library(tidyverse)

# Cargamos el dataframe generado anteriormente
df_clima <- read_csv("data/df_clima.csv")

# Calculamos la temperatura media anual por sitio
temp_media_elev <- df_clima %>%
  group_by(elevation, year) %>%  
  summarise(temp_media_anual = mean(monthly_tmed, na.rm = TRUE)) %>%
  ungroup()

# Calculamos la temperatura media anual por especie
temp_media_sp <- df_clima %>%
  group_by(sp, year) %>%  
  summarise(temp_media_anual = mean(monthly_tmed, na.rm = TRUE)) %>%
  ungroup()

# Calculamos la temperatura emdia anual por especie y sitio
temp_media_sp_elev <- df_clima %>%
  group_by(sp, elevation, year) %>%  
  summarise(temp_media_anual = mean(monthly_tmed, na.rm = TRUE)) %>%
  ungroup()

# guardado de dataframes con los distintos análisis
write_csv(temp_media_elev, "data/temp_media_elev.csv")
write_csv(temp_media_sp, "data/temp_media_especie.csv")
write_csv(temp_media_sp_elev, "data/temp_media_sp_elev.csv")
