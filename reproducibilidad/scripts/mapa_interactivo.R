################ MAPA INTERACTIVO ################ 

# Autor: Marina Pachón Mena
# Propósito: Descarga de datos de GIB de las observaciones de Tetrax tetrax.

# Cargamos los paquetes necesarios
library(tidyverse)
library(leaflet)
library(lubridate)

tetrax <- read_tsv("data/gbif/tetrax_gbif.csv")

# Filtramos solo las observaciones de iNaturalist que son las que nos vamos a quedar
tetrax_inat <- tetrax %>%
  filter(
    institutionCode == "iNaturalist",  # Filtra solo las observaciones de iNaturalist
    !is.na(decimalLatitude) & !is.na(decimalLongitude),  # Eliminamos NA (que los hay)
  )

# Convertimos esto a formato fecha
as_date(tetrax_inat$eventDate)

# Crear el mapa interactivo
mapa <- leaflet(tetrax_inat) %>%
  addTiles() %>%
  addCircleMarkers(
    lng = ~decimalLongitude,
    lat = ~decimalLatitude,
    radius = 4,
    color = "red", 
    fill = TRUE, 
    fillColor = "yellow", 
    fillOpacity = 0.5,
    popup = ~paste("Fecha:", eventDate)
  )



