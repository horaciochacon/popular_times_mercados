library(tidyverse)
library(jsonlite)

mercados_sun <- read_json("data/items.json",simplifyVector = TRUE) %>% 
  flatten() %>% 
  as_tibble() %>% 
  select(nombre = title, categoryName, address, location.lat, location.lng,
         starts_with("popularTimesHistogram.Su")) %>% 
  unnest_wider(popularTimesHistogram.Su) %>% 
  unnest(hour, occupancyPercent) %>% 
  filter(!is.na(hour)) %>% 
  spread(key = hour, value = occupancyPercent) %>% 
  mutate(day = "sun")

mercados_mon <- read_json("data/items.json",simplifyVector = TRUE) %>% 
  flatten() %>% 
  as_tibble() %>% 
  select(nombre = title, categoryName, address, location.lat, location.lng,
         starts_with("popularTimesHistogram.Mo")) %>% 
  unnest_wider(popularTimesHistogram.Mo) %>% 
  unnest(hour, occupancyPercent) %>% 
  filter(!is.na(hour)) %>% 
  spread(key = hour, value = occupancyPercent) %>% 
  mutate(day = "mon")

mercados_tue <- read_json("data/items.json",simplifyVector = TRUE) %>% 
  flatten() %>% 
  as_tibble() %>% 
  select(nombre = title, categoryName, address, location.lat, location.lng,
         starts_with("popularTimesHistogram.Tu")) %>% 
  unnest_wider(popularTimesHistogram.Tu) %>% 
  unnest(hour, occupancyPercent) %>% 
  filter(!is.na(hour)) %>% 
  spread(key = hour, value = occupancyPercent) %>% 
  mutate(day = "tue")

mercados_wed <- read_json("data/items.json",simplifyVector = TRUE) %>% 
  flatten() %>% 
  as_tibble() %>% 
  select(nombre = title, categoryName, address, location.lat, location.lng,
         starts_with("popularTimesHistogram.We")) %>% 
  unnest_wider(popularTimesHistogram.We) %>% 
  unnest(hour, occupancyPercent) %>% 
  filter(!is.na(hour)) %>% 
  spread(key = hour, value = occupancyPercent) %>% 
  mutate(day = "wed")

mercados_thu <- read_json("data/items.json",simplifyVector = TRUE) %>% 
  flatten() %>% 
  as_tibble() %>% 
  select(nombre = title, categoryName, address, location.lat, location.lng,
         starts_with("popularTimesHistogram.Th")) %>% 
  unnest_wider(popularTimesHistogram.Th) %>% 
  unnest(hour, occupancyPercent) %>% 
  filter(!is.na(hour)) %>% 
  spread(key = hour, value = occupancyPercent) %>% 
  mutate(day = "thu")

mercados_fri <- read_json("data/items.json",simplifyVector = TRUE) %>% 
  flatten() %>% 
  as_tibble() %>% 
  select(nombre = title, categoryName, address, location.lat, location.lng,
         starts_with("popularTimesHistogram.Fr")) %>% 
  unnest_wider(popularTimesHistogram.Fr) %>% 
  unnest(hour, occupancyPercent) %>% 
  filter(!is.na(hour)) %>% 
  spread(key = hour, value = occupancyPercent) %>% 
  mutate(day = "fri")

mercados_sat <- read_json("data/items.json",simplifyVector = TRUE) %>% 
  flatten() %>% 
  as_tibble() %>% 
  select(nombre = title, categoryName, address, location.lat, location.lng,
         starts_with("popularTimesHistogram.Sa")) %>% 
  unnest_wider(popularTimesHistogram.Sa) %>% 
  unnest(hour, occupancyPercent) %>% 
  filter(!is.na(hour)) %>% 
  spread(key = hour, value = occupancyPercent) %>% 
  mutate(day = "sat")


mercados <- mercados_mon %>% 
  bind_rows(mercados_tue, 
            mercados_wed, 
            mercados_thu, 
            mercados_fri, 
            mercados_sat, 
            mercados_sun)








