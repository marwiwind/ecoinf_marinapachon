################ GRÁFICO DE BARRAS ################ 

# Autor: Marina Pachón Mena
# Propósito: realizar un gráfico de barras con los promedios de la precipitación y la desviación estándar

# Carga de paquetes necesarios
library(tidyverse)

# Cargamos los dataframe generados anteriormente
precip_media_sd <- read_csv("data/precip_media_sd.csv")

# Gráfico de barras con los promedios de la precipitación y las desviaciones estándar
precip_sp_elev_sd <- ggplot(precip_media_sd, aes(x = interaction(elevation), y = precip_media, fill = sp)) +
  geom_bar(stat = "identity", position = "dodge") + 
  geom_errorbar(
    aes(ymin = precip_media - precip_sd, ymax = precip_media + precip_sd), 
    width = 0.2, 
    position = position_dodge(0.9)  
  ) +
  labs(
    title = "Precipitación acumulada anual promedio por especie y localización",
    x = "Localización",
    y = "Precipitación acumulada anual promedio (mm)",
    fill = "Especies"
  ) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) 

# Guardamos los gráficos
ggsave("graphics/grafico_precip_sp_elev_sd.png", plot = precip_sp_elev_sd, width = 8, height = 6, dpi = 300)
