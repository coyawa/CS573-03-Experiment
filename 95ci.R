library(ggplot2)
data <- data.frame(
  VisType = c("Treemap Chart", "Pie Plot", "Bar Chart"),
  LogError = c(2.3900, 2.1500, 1.3300),
  low = c(2.2066, 1.9593, 1.1858),
  high = c(2.5734, 2.3407, 1.4742))
p <- ggplot(data, aes(LogError, VisType ))
p + geom_point() + geom_errorbarh(aes(xmax = high, xmin = low, height = 0.1))

