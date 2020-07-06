infl_test <- read.csv("data.csv")
infl_test

# BAR PLOT
data <- data.frame(infl_test[7], infl_test[6]) #extract required columns 
mat = as.matrix(data) # convert to matrix for barplot 
x <- infl_test[4] # x axis labels 

barplot(t(mat),ylim = c(0,25000),names.arg=t(x), xlab = "week", ylab = "positive specimens #")

par(new = TRUE) # over lay of plots 

# Line Plot 1 
y <- infl_test[8]
#plot(y, type = 'o', col = 'blue', ylim = c(0,30), xlim = c(0,17), xaxt = 'n', yaxt = 'n', ann = FALSE)
plot.ts(y, type = 'o', col='blue', xaxt='n', yaxt='n', ann=FALSE)
par(new = TRUE)

#Line Plot 2
y <- infl_test[9]

plot.ts(y, type='l', col = 'red', xaxt='n', yaxt='n', ann=FALSE)
par(new = TRUE)

#Line plot 3 
y <- infl_test[10]
#plot(y, type = 'l', col = 'black', ylim=c(0,30), xlim = c(0,17), xaxt = 'n',yaxt = 'n', ylab = "% Positive", ann = FALSE)
plot.ts(y, type='l', col='black', xaxt='n', yaxt='n', ann=FALSE)
# Y axis on the right side 
axis(side=4)
mtext("% Positive", side=4, line=-1)

#set Legend for the plot
legend("topright", inset = 0.02, legend=c("% positive", "%positive flu A","%positive flu B"),
       col=c("blue", "red", "black" ), lty=1:5, cex=0.8)