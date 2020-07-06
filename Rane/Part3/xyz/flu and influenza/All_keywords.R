library("twitteR")
library("ROAuth")
library(rtweet)
library(revgeo)
api_key <- "TfNOdi7WVi9Et3xKXDY4q35m8"
api_secret <- "JMR4Cz2sZXdPjFhlZmNhd6ULJf5Vxnh6WzUNS6zVHwJcSNCN18"
access <- "1039892313823227906-DAVrNAPNZkX2QJOffEf6InWCCIZePL"
access_secret <- "QxOVJCTUwhwLf1EmanwluwdqGYfi08LlgpQA0A0znHrs4"
setup_twitter_oauth(api_key, api_secret, access, access_secret)
tweets <- search_tweets(q = "flu OR influenza" , n = 10000,geocode = lookup_coords('usa'), lang = "en", since = '2019-01-01',include_rts = FALSE)

tweets.df <- as.data.frame(tweets)
write.csv(tweets.df$location, "flutweets_newest.csv")


register_google(key = "AIzaSyDmnwPgAvFj4WzLqLbEg1r2nEMepAy0Mac") 
unique_tw <- unique(tweets$location)
write.csv(unique_tw, "UNI.csv")
x <- read.csv2("UNI.csv", header = TRUE)

x.df <- as.matrix(x)
class(x)
loc <- gsub('[^a-zA-Z0-9 ]', ' ', x.df)
locations_df <- geocode(loc)
write.csv(locations_df, "All_LatLon_Locations.csv")
all_file800 <- read.csv("all_1-800.csv",header = TRUE)
all_file1600 <- read.csv("all_801-1600.csv",header = TRUE)
all_file2400 <- read.csv("all_1601-2400.csv",header = TRUE)
all_file3200 <- read.csv("all_2401-3200.csv",header = TRUE)

all_first800 <- revgeo(longitude = all_file800$lon, latitude = file800$lat, output = 'frame')

all_second800 <- revgeo(longitude = file1600$lon, latitude = file1600$lat, output = 'frame')


all_third800 <- revgeo(longitude = file2400$lon, latitude = file2400$lat, output = 'frame')

all_last <- revgeo(longitude = filelast$lon, latitude = filelast$lat, output = 'frame')

all_full <- rbind(all_first800,all_second800,all_third800,all_last)

all_a <- table(all_full$state)
write.csv(all_a,"all_freq.csv")

all_a <- read.csv("all_freq.csv",header = TRUE)



state_data <-map_data("state")

all_a$region = tolower(all_a$Var1)

all_a_map <- merge(state_data, all_a, by = "region", all.x = T)

all_a_map <-all_a_map[order(all_a_map$order), ]

ggplot(all_a_map, aes(x=long,y=lat,group=group)) + 
  geom_polygon(aes(fill=Freq)) + 
  geom_path() + 
  scale_fill_gradient2(low = "white",mid="green", high = "red") + 
  coord_map() + 
  ggtitle("Heat Map Part 3 for all keywords") 
