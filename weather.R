#
# get weather data from Canada
# using library 'weathercan' 
# https://github.com/ropensci/weathercan
#

# install package
install.packages("weathercan")

# load package
library("weathercan")

# find a station
st.t1 <- stations_search("Squamish", interval = "day") # 336
head(st.t1)

st.t2 <- stations_search("Pemberton", interval = "day") # 46747
head(st.t2)

# download data 
# Squamish data
w.Squam <- weather_dl(station_ids = 336, start = "2017-11-01", 
                      end = "2018-04-30", interval = "day")
str(w.Squam)
# Pemberton data
w.Pem <- weather_dl(station_ids = 536, start = "2017-11-01", 
                    end = "2018-04-30", interval = "day")
str(w.Pem)

plot(w.Squam$max_temp, w.Pem$max_temp, pch = 19, cex = 0.2)

