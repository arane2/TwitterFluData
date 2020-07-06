a <- read.csv("Weekly.csv",header = TRUE)
library(ggplot2)
ggplot(data=a,aes(x=WEEK.NUMBER))+
  geom_bar(aes(y=PREVIOUS.WEEK.DEATHS),stat="identity",position ="identity",alpha=.3,fill='green4',color='green4') +
  geom_bar(aes(y=CURRENT.WEEK.DEATHS),stat="identity",position ="identity",alpha=.8,fill='lightblue4',color='lightblue4')+ 
  xlab("Week of death") + 
  ylab("Number of deaths")+
  ggtitle("Number of influenza associated deaths by week: \n 2015-16 to week of Jan 28th")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  coord_cartesian(ylim = c(00, 20))
