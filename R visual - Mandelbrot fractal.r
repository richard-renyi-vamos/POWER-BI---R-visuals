library(ggplot2)
library(dplyr)
library(RColorBrewer)

# Function to calculate whether a point is in the Mandelbrot set
mandelbrot <- function(x, y, max_iter) {
  c <- complex(real = x, imaginary = y)
  z <- 0 + 0i
  iter <- 0
  while (Mod(z) <= 2 && iter < max_iter) {
    z <- z^2 + c
    iter <- iter + 1
  }
  return(iter)
}

# Generate a grid of points
x_vals <- seq(-2, 1, length.out = 1000)
y_vals <- seq(-1.5, 1.5, length.out = 1000)
grid <- expand.grid(x = x_vals, y = y_vals)

# Apply the mandelbrot function to each point in the grid
max_iter <- 100
grid$iter <- mapply(mandelbrot, grid$x, grid$y, MoreArgs = list(max_iter = max_iter))

# Create the plot
ggplot(grid, aes(x = x, y = y, fill = iter)) +
  geom_tile() +
  scale_fill_gradientn(colors = brewer.pal(9, "YlGnBu")) +
  theme_minimal() +
  theme(axis.ticks = element_blank(), 
        axis.text = element_blank(),
        axis.title = element_blank()) +
  labs(title = "Mandelbrot Set Fractal")
