library(tidyverse)

mercados <- read_csv("data/mercados_07042020.csv")

mercados_narrow <- mercados %>% 
  gather(key = "hora", value = "valor", 6:29) %>% 
  mutate(hora = as.numeric(hora),
         day = factor(day, levels = c("Mo","Tu","We","Th","Fr","Sa","Su")))


# Especificación de colores
col1 = "#d8e1cf" 
col2 = "#438484"

# Heatmap horas/día
g <- ggplot(mercados_narrow, aes(hora, day)) + 
  geom_tile(aes(fill = valor), color = "white", na.rm = TRUE) +
  scale_fill_gradient(low = col1, high = col2, na.value = "white") +  
  facet_wrap(.~nombre) +
  guides(fill = guide_legend(title="Porcentaje")) +
  labs(title = "Mapa de calor de asistencia a mercados en Lima",
       x = "Hora del día", y = "Día de la semana") +
  theme_minimal() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())

ggsave("plots/heatmap1.pdf", g,dpi = 1000,scale = 5 )
