a <- read.csv("Mortality.csv",header = TRUE)
xaxis <- c(247:487)
yaxis <- a$Percent.of.Deaths.Due.to.Pneumonia.and.Influenza[247:487]

plot(xaxis, yaxis, col="red", type = "l", xlab = "MMWR Week", ylab = "% of All Deaths due to P&I",
     main="Pneumonia and Influenza mortality \n rate for week ending January 28")

par(new = TRUE)

yaxis2 <- a$Expected[247:487]

plot(xaxis,yaxis2,type = "l", xaxt = 'n', yaxt = 'n', ann = FALSE)
axis(1)

par(new = TRUE)

yaxis3 <- a$Threshold[247:487]

plot(xaxis,yaxis3,type = "l", xaxt = 'n', yaxt = 'n', ann = FALSE)

