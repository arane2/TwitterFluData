file <- read.csv("Positive_Specimens.csv",header = TRUE)
data <- data.frame(file[9], file[8], file[7],
                   file[2], file[4], file[3], 
                   file[6])
xaxis <- file[1]
a <- as.matrix(data)
barplot(t(a),ylim = c(0,3500),beside = F,names.arg=t(xaxis), xlab = "week",
        ylab = "positive specimens",col = rainbow(7))
legend(c(3500), inset = 0.004, legend=c("B (Yamagata Lineage)",
                                         "B (Victoria Lineage)", 
                                         "B (lineage not found)", "H32NV", "A(H3N2)", "A(H1N1)", 
                                         "A(subtyping not performed)"),
       col=rainbow(8), lty=1:5, cex=0.6)
