library(sf)
library(tigris)
library(tidyverse)
library(broom)
library(purrr)
library(ggthemes)
library(scales)
library(maps)

st_layers("data/nps_boundary/")

us_states <- states(cb = TRUE) %>% 
  filter(STUSPS %in% c(state.abb, "DC"))

us_shifted <- tigris::shift_geometry(us_states)

us_shifted <- st_transform(us_shifted, 4326)

park_boundaries <- read_sf("data/nps_boundary/",
                           layer = "nps_boundary")

parks_shifted <- tigris::shift_geometry(park_boundaries)

parks_shifted <- st_transform(parks_shifted, 4326)


head(park_boundaries)

deaths <- read_csv("data/mortality_clean.csv")

ggplot() + 
  geom_sf(data = us_shifted, color = "white",
          fill = "darkgrey", alpha = 0.5) +
  geom_sf(data = parks_shifted, color = "red",
          alpha = 0.8) +
  xlim(c(-130, -65)) + ylim(c(20, 50))










