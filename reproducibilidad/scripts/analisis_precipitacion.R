################ CÁLCULO PRECIPITACION ################ 

# Autor: Marina Pachón Mena
# Propósito: Calcular los valores promedio y desviación estándar de la precitación acumulada anual por sitio; y por especie.

# Carga de paquetes necesarios
library(tidyverse)

# Cargamos el dataframe generado anteriormente
df_clima <- read_csv("data/df_clima.csv")

# Calculamos la precipitación anual total por especie y elevación
precip_anual <- df_clima %>%
  group_by(sp, elevation, year) %>% 
  summarise(precip_total_anual = sum(monthly_prec, na.rm = TRUE)) %>%
  ungroup()

# Calculamos de la media y desviación estándar para cada especie
precip_media_sd_sp <- precip_anual %>%
  group_by(sp) %>%  
  summarise(
    precip_media = mean(precip_total_anual, na.rm = TRUE),
    precip_sd = sd(precip_total_anual, na.rm = TRUE)
  )

# Calculamos de la media y desviación estándar para cada sitio
precip_media_sd_elev <- precip_anual %>%
  group_by(elevation) %>%
  summarise(
    precip_media = mean(precip_total_anual, na.rm = TRUE),
    precip_sd = sd(precip_total_anual, na.rm = TRUE)
  )

# Calculamos la media y la desviación estándar de la precipitación anual a través de los años
precip_media_sd <- precip_anual %>%
  group_by(sp, elevation) %>%  
  summarise(
    precip_media = mean(precip_total_anual, na.rm = TRUE),
    precip_sd = sd(precip_total_anual, na.rm = TRUE)  
  ) %>%
  ungroup()

# guardado de dataframes con los distintos análisis
write_csv(precip_media_sd, "data/precip_media_sd.csv")
write_csv(precip_anual, "data/precip_anual.csv")
write_csv(precip_media_sd_sp, "data/precip_media_sd_sp.csv")
write_csv(precip_media_sd_elev, "data/precip_media_sd_elev.csv")
