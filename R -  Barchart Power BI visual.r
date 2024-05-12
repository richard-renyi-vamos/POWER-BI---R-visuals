# Load necessary libraries
library(ggplot2)

# Create sample data frame (replace this with your actual data)
data <- data.frame(
  Category = c("A", "B", "C", "D"),
  Value = c(20, 35, 40, 25)
)

# Create bar chart
ggplot(data, aes(x = Category, y = Value, fill = Category)) +
  geom_bar(stat = "identity") +
  labs(title = "Bar Chart", x = "Category", y = "Value") +
  theme_minimal()
