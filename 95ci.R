a3data <- read.csv("/Users/Coyawa/Git/03-Experiment/a3_par_all.csv")
Bar <- a3data[which(a3data$VisType=='Bar Chart'),]
Pie <- a3data[which(a3data$VisType=='Pie Chart'),]
Treemap <- a3data[which(a3data$VisType=='Treemap Chart'),]

require(boot)
error <- function(data, index) {
  r <- data[index,]
  return (mean(r$LogError))
}

y_up <- c()
y_down <- c()
y <- c()

results <- boot(data=Bar, statistic=LogError, R=1000)
r <- boot.ci(results, type="bca")
y_up <- append(y_up, r$bca[5])
y_down <- append(y_down, r$bca[4])
y <- append(y, (r$bca[4] + r$bca[5]) / 2)


results <- boot(data=Pie, statistic=LogError, R=499)
r <- boot.ci(results, type="bca")
y_up <- append(y_up, r$bca[5])
y_down <- append(y_down, r$bca[4])
y <- append(y, (r$bca[4] + r$bca[5]) / 2)


results <- boot(data=Treemap, statistic=LogError, R=499)
r <- boot.ci(results, type="bca")
y_up <- append(y_up, r$bca[5])
y_down <- append(y_down, r$bca[4])
y <- append(y, (r$bca[4] + r$bca[5]) / 2)


x <- c('Bar', 'Pie', 'Treemap')
errbar(x = x, y = y, yplus = y_up, yminus = y_down, ylim = c(2,4))