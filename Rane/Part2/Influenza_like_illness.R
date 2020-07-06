library(ggplot2)

a <- read.csv("Influenza_like_illness.csv",header = TRUE)
yaxis <- a[,10]
xaxis <- (a[,1])
plot(xaxis, yaxis, type = 'o', col = 'blue', 
     main='Influenza-like Illness Season 2018-19',
     xlab = 'Week', ylab = '% of visits for ILI')
legend("top", inset = 0.04, legend=c("% of visits for ILI"),
       col="blue", lty=1:10, cex=0.6)
