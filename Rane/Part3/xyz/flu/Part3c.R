library("twitteR")
library("ROAuth")
library(rtweet)
library(revgeo)
api_key <- "TfNOdi7WVi9Et3xKXDY4q35m8"
api_secret <- "JMR4Cz2sZXdPjFhlZmNhd6ULJf5Vxnh6WzUNS6zVHwJcSNCN18"
access <- "1039892313823227906-DAVrNAPNZkX2QJOffEf6InWCCIZePL"
access_secret <- "QxOVJCTUwhwLf1EmanwluwdqGYfi08LlgpQA0A0znHrs4"
setup_twitter_oauth(api_key, api_secret, access, access_secret)
tweets <- search_tweets(q = "flu" , n = 10000,geocode = lookup_coords('usa'), lang = "en", since = '2019-01-01',include_rts = FALSE)

tweets.df <- as.data.frame(tweets)
tab <- table(tweets.df)
write.csv(tweets.df$location, "flutweets_newest.csv")


register_google(key = "AIzaSyDmnwPgAvFj4WzLqLbEg1r2nEMepAy0Mac") 
unique_tw <- unique(tweets$location)
write.csv(unique_tw, "UNI.csv")
x <- read.csv2("UNI.csv", header = TRUE)

x.df <- as.matrix(x)
class(x)
loc <- gsub('[^a-zA-Z0-9 ]', ' ', x.df)
locations_df <- geocode(loc)
write.csv(locations_df, "LatLon_Locations.csv")
file800 <- read.csv("1-800.csv",header = TRUE)
file1600 <- read.csv("801-1600.csv",header = TRUE)
file2400 <- read.csv("1601-2400.csv",header = TRUE)
filelast <- read.csv("2401-last.csv",header = TRUE)

first800 <- revgeo(longitude = file800$lon, latitude = file800$lat, output = 'frame')
write.csv(first800,"first800.csv")
second800 <- revgeo(longitude = file1600$lon, latitude = file1600$lat, output = 'frame')
write.csv(second800,"second800.csv")

third800 <- revgeo(longitude = file2400$lon, latitude = file2400$lat, output = 'frame')
write.csv(third800,"third800.csv")
last <- revgeo(longitude = filelast$lon, latitude = filelast$lat, output = 'frame')
write.csv(last,"last.csv")
full <- rbind(first800,second800,third800,last)
write.csv(full,"Final_states.csv")
a <- table(full$state)
write.csv(a,"freq.csv")

a <- read.csv("freq.csv",header = TRUE)



state_data <-map_data("state")

a$region = tolower(a$Var1)

a_map <- merge(state_data, a, by = "region", all.x = T)

a_map <-a_map[order(a_map$order), ]

ggplot(a_map, aes(x=long,y=lat,group=group)) + 
  geom_polygon(aes(fill=Freq)) + # using polygon fill for each states depending on ACTIVITY.LEVEL
  geom_path() + # to show boundaries of each state
  scale_fill_gradient2(low = "white",mid="green", high = "red") + # manual color fill to discrete scale
  coord_map() + # mapping as per coordinate
  ggtitle("Heat Map Part 3 for flu") # defining title for the maps
