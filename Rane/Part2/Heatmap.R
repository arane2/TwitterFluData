library(ggplot2)  
library(maps) 

data <- read.csv("StateDatabyWeekforMap_2018-19week40-4.csv")

# extracting states data from maps library
state_data <-map_data("state")

data$region = tolower(data$STATENAME)

data_map <- merge(state_data, data, by = "region", all.x = T)

data_map <-data_map[order(influenza_data_map$order), ]

colors = c("green","red","maroon","yellow2","yellow","orange","orangered1","orangered3","blue","pink","orange","black","white")

ggplot(data_map, aes(x=long,y=lat,group=group)) + 
  geom_polygon(aes(fill=ACTIVITY.LEVEL)) + 
  geom_path() + 
  scale_fill_manual(values =colors) + 
  coord_map() +
  ggtitle("A Weekly Influenza Surveillance Report\n for week ending January 28,2019") 
