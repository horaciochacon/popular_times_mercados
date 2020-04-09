library(tidyverse)
library(jsonlite)

days <- c("Mo","Tu","We","Th","Fr","Sa","Su")
mercados <- tibble()

for (day in 1:7) {
    mercado_temp <- read_json("data/items.json",simplifyVector = TRUE) %>% 
      flatten() %>% 
      as_tibble() %>% 
      select(nombre = title, categoryName, address, location.lat, location.lng,
             starts_with(paste0("popularTimesHistogram.",days[day]))) %>% 
      unnest_wider(!!paste0("popularTimesHistogram.",days[day])) %>% 
      unnest(hour, occupancyPercent) %>% 
      filter(!is.na(hour)) %>% 
      spread(key = hour, value = occupancyPercent) %>% 
      mutate(day = days[day])
   
     mercados <-bind_rows(mercados, mercado_temp)
}

write_csv(mercados, "data/mercados.csv")






