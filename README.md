# Visualización de Áreas Protegidas de Ecuador (WDPA)

Este proyecto utiliza R y `mapdeck` (visualización con Mapbox + deck.gl) para visualizar interactivamente las áreas protegidas de Ecuador, clasificadas por su categoría de manejo de la IUCN.

## Descripción
El script procesa los shapefiles globales de la **World Database on Protected Areas (WDPA)** correspondientes a Noviembre 2025, filtra los datos geográficos pertenecientes a Ecuador (ISO3: ECU) y genera un mapa web interactivo.

## Características
- **Filtrado Geográfico:** Extracción automática de polígonos correspondientes a Ecuador.
- **Interactividad:** Popups con información detallada (Nombre, Designación, Año, Área).
- **Simbología:** Colores dinámicos basados en la categoría `IUCN_CAT`.
- **Renderizado:** Uso de WebGL para alto rendimiento con grandes volúmenes de datos.

## Datos utilizados

**Cita:**

UNEP-WCMC and IUCN (2025), Protected Planet: The World Database on Protected Areas (WDPA) [Online], November 2025, Cambridge, UK: UNEP-WCMC and IUCN. Available at: www.protectedplanet.net.


- WDPA Nov 2025
- Filtrado para Ecuador


## Requisitos del Sistema
- R (versión 4.0 o superior)
- RStudio (recomendado)
- Conexión a internet (para renderizar el mapa base de Mapbox)

## Librerías Necesarias
```r
install.packages(c("sf", "dplyr", "mapdeck"))
