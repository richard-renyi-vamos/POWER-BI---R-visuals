# Ensure ggplot2 package is installed
if (!require('ggplot2')) install.packages('ggplot2', repos='http://cran.rstudio.com/')

# Load ggplot2 package
library(ggplot2)

# Replace 'dataset' with the actual name of your dataset in Power BI
# Ensure your dataset has columns named 'category' and 'value'
dataset <- data.frame(category = c('Start', 'Sales', 'Returns', 'Purchases', 'End'),
                      value = c(1000, 300, -150, 200, 0))

# Calculate cumulative values
dataset$cumulative <- cumsum(c(0, dataset$value[1:(nrow(dataset)-1)]))

# Calculate end positions for segments
dataset$end <- dataset$cumulative + dataset$value

# Define colors for positive and negative values
dataset$color <- ifelse(dataset$value > 0, 'green', 'red')

# Create waterfall plot
ggplot(dataset, aes(x = category)) +
  geom_rect(aes(xmin = as.numeric(factor(category)) - 0.4, xmax = as.numeric(factor(category)) + 0.4,
                ymin = cumulative, ymax = end, fill = color)) +
  scale_fill_identity() +
  theme_minimal() +
  labs(title = 'Waterfall Chart', x = 'Category', y = 'Value') +
  geom_text(aes(label = value, y = end), vjust = ifelse(dataset$value >= 0, -0.5, 1.5)) +
  geom_hline(yintercept = 0, linetype = 'dashed', color = 'black')
