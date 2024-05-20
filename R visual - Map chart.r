# Load required packages
library(ggplot2)
library(dplyr)
library(sf)
library(rnaturalearth)
library(rnaturalearthdata)

# Load world map data
world <- ne_countries(scale = "medium", returnclass = "sf")

# Sample data
set.seed(123)
sample_data <- data.frame(
  country = c("Hungary", "Germany", "France", "Italy", "Spain"),
  value = c(10, 20, 30, 40, 50)
)

sample_data <- left_join(sample_data, world, by = c("country" = "name_long"))

# Create map chart
map_chart <- ggplot(data = world) +
  geom_sf() +
  geom_point(data = sample_data, aes(x = long, y = lat, size = value, color = value), alpha = 0.7) +
  scale_size_continuous(range = c(3, 10)) +
  labs(title = "Sample Map Chart", x = "Longitude", y = "Latitude", size = "Value", color = "Value") +
  theme_minimal()

# Print the map chart
print(map_chart)
