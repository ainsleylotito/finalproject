library(sf)
library(tigris)
library(tidyverse)
library(broom)
library(purrr)
library(ggthemes)
library(scales)

st_layers("data/nps_boundary/")

park_boundaries <- read_sf("data/nps_boundary/",
                           layer = "nps_boundary")

head(park_boundaries)








