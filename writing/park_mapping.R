library(sf)
library(tigris)
library(tidyverse)
library(broom)
library(purrr)
library(ggthemes)
library(scales)
library(maps)

st_layers("data/nps_boundary/")

us_states <- map("state", plot = FALSE, fill = TRUE) %>% 
  st_as_sf()

park_boundaries <- read_sf("data/nps_boundary/",
                           layer = "nps_boundary")

head(park_boundaries)

deaths <- read_csv("data/mortality_clean.csv")

ggplot() + 
  geom_sf(data = us_states, color = "white",
          fill = "darkgrey", alpha = 0.5) +
  geom_sf(park_boundaries, color = "red",
          alpha = 0.8)










