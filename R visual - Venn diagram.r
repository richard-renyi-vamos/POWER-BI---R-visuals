# Load necessary libraries
library(VennDiagram)

# Sample data: Replace this with your actual data fields from Power BI
set1 <- c("A", "B", "C", "D", "E")
set2 <- c("B", "C", "D", "F", "G")
set3 <- c("D", "E", "F", "G", "H")

# Create a list of the sets
venn_data <- list(Set1 = set1, Set2 = set2, Set3 = set3)

# Generate the Venn diagram
venn.plot <- venn.diagram(
  x = venn_data,
  category.names = c("Set 1", "Set 2", "Set 3"),
  filename = NULL,
  output = TRUE
)

# Plot the Venn diagram
grid.draw(venn.plot)
