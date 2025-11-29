# -----------------------------------------------------------------------------
# Proyecto: Visualización de Áreas Protegidas (WDPA) - Ecuador
# Fecha: 27 Noviembre 2025
# Autor: ISAAC REYES
# -----------------------------------------------------------------------------

# Carga de librerías
library(sf)
library(dplyr)
library(mapdeck)

# Carga de Datos (Ajustar rutas según ubicación de archivos)
# Los datos vienen divididos en 3 shapefiles
poly1 <- st_read("C:\\Users\\Usuario\\Downloads\\WDPA_Nov2025_Public_shp\\WDPA_Nov2025_Public_shp_0\\WDPA_Nov2025_Public_shp-polygons.shp")
poly2 <- st_read("C:\\Users\\Usuario\\Downloads\\WDPA_Nov2025_Public_shp\\WDPA_Nov2025_Public_shp_1\\WDPA_Nov2025_Public_shp-polygons.shp")
poly3 <- st_read("C:\\Users\\Usuario\\Downloads\\WDPA_Nov2025_Public_shp\\WDPA_Nov2025_Public_shp_2\\WDPA_Nov2025_Public_shp-polygons.shp")

# Procesamiento de Datos
# Unir los archivos 
wdpa_polygons <- bind_rows(poly1, poly2, poly3)

# Filtrar por Ecuador
wdpa_ecu <- wdpa_polygons %>% 
  dplyr::filter(ISO3 == "ECU")

# Crear popup
wdpa_ecu$popup <- paste0(
  "<b>", wdpa_ecu$NAME, "</b><br>",
  "Categoría IUCN: ", wdpa_ecu$IUCN_CAT, "<br>",
  "Designación: ", wdpa_ecu$DESIG_ENG, "<br>",
  "Año: ", wdpa_ecu$STATUS_YR, "<br>",
  "Área (km²): ", round(wdpa_ecu$REP_AREA, 2)
)

# Visualización
mapdeck(token = "PON TU TOKEN AQUI") %>%
  add_polygon(
    data = wdpa_ecu,
    fill_colour = "IUCN_CAT", 
    stroke_colour = "black",
    stroke_opacity = 0.5,
    fill_opacity = 0.4,
    tooltip = "popup",
    legend = list(fill_colour = TRUE, stroke_colour = FALSE),
    layer_id = "wdpa_layer"
  )

