library("twitteR")
library("ROAuth")
library(rtweet)
library(revgeo)
api_key <- "TfNOdi7WVi9Et3xKXDY4q35m8"
api_secret <- "JMR4Cz2sZXdPjFhlZmNhd6ULJf5Vxnh6WzUNS6zVHwJcSNCN18"
access <- "1039892313823227906-DAVrNAPNZkX2QJOffEf6InWCCIZePL"
access_secret <- "QxOVJCTUwhwLf1EmanwluwdqGYfi08LlgpQA0A0znHrs4"
setup_twitter_oauth(api_key, api_secret, access, access_secret)
tweets <- search_tweets(q = "flu OR influenza OR cough OR seasonal.flu OR cold" , n = 10000,geocode = lookup_coords('usa'), lang = "en", since = '2019-01-01',include_rts = FALSE)

tweets.df <- as.data.frame(tweets)


register_google(key = "AIzaSyDmnwPgAvFj4WzLqLbEg1r2nEMepAy0Mac") 
unique_tw <- unique(tweets$location)
write.csv(unique_tw, "UNI.csv")
x <- read.csv2("UNI.csv", header = TRUE)

x.df <- as.matrix(x)
class(x)
loc <- gsub('[^a-zA-Z0-9 ]', ' ', x.df)
locations_df <- geocode(loc)
write.csv(locations_df, "XAll_LatLon_Locations.csv")
xall_file800 <- read.csv("xall_1-800.csv",header = TRUE)
xall_file1600 <- read.csv("xall_801-1600.csv",header = TRUE)
xall_file2400 <- read.csv("xall_1601-2400.csv",header = TRUE)
xall_file3200 <- read.csv("xall_2401-3200.csv",header = TRUE)

xall_first800 <- revgeo(longitude = xall_file800$lon, latitude = file800$lat, output = 'frame')

xall_second800 <- revgeo(longitude = xfile1600$lon, latitude = file1600$lat, output = 'frame')


xall_third800 <- revgeo(longitude = xfile2400$lon, latitude = file2400$lat, output = 'frame')

xall_last <- revgeo(longitude = xfilelast$lon, latitude = filelast$lat, output = 'frame')

xall_full <- rbind(xall_first800,xall_second800,xall_third800,xall_last)

xall_a <- table(xall_full$state)
write.csv(xall_a,"xall_freq.csv")

xall_a <- read.csv("xall_freq.csv",header = TRUE)



state_data <-map_data("state")

xall_a$region = tolower(xall_a$Var1)

xall_a_map <- merge(state_data, xall_a, by = "region", all.x = T)

xall_a_map <-xall_a_map[order(all_a_map$order), ]

ggplot(xall_a_map, aes(x=long,y=lat,group=group)) + 
  geom_polygon(aes(fill=Freq)) + 
  geom_path() + 
  scale_fill_gradient2(low = "white",mid="green", high = "red") + 
  coord_map() + 
  ggtitle("Heat Map Part 3 for all keywords") 
