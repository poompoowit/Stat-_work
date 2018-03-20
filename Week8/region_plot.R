setwd("C:")
library(dplyr)
library(plotly)
df <- read.csv("week7_region_data.csv", sep=",", header=T, fileEncoding="UTF-8-BOM")
attach(df)
df
year <- c('2543', '2553', '2558')
bangkok <- as.numeric(df[1:3,2])
central <- df$Central
north <- df$North
northeast <- df$Northeast
south <- df$South
data <- data.frame(year, bangkok, central, north, northeast, south)
data

#line graph (group by year)
p <- plot_ly(data, x = year, y = bangkok, name = 'Bangkok and suburbs',
             type = 'scatter', mode = 'lines+markers', marker = list(symbol='circle')) %>% 
  layout(title = "2543-2558 Thai Population", 
         xaxis = list(title = 'Year', showgrid = TRUE),
         yaxis = list(title = 'Population', 
                      range = c(5*10^6, 25*10^6),
                      dtick = 1*10^6,
                      showgrid = TRUE))%>%
  add_trace(y = central, name = 'Central', mode = 'lines+markers',
            marker = list(symbol='circle')) %>%
  add_trace(y = north , name = 'North ', mode = 'lines+markers', 
            marker = list(symbol='circle')) %>%
  add_trace(y = northeast , name = 'Northeast', mode = 'lines+markers', 
            marker = list(symbol='circle')) %>%
  add_trace(y = south , name = 'South', mode = 'lines+markers', 
            marker = list(symbol='circle'))
p

#bar graph
p <- plot_ly(data, x = year, y = bangkok, name = 'Bangkok and suburbs',
             type = 'bar') %>% 
  layout(title = "2543-2558 Thai Population", 
         xaxis = list(title = 'Year', showgrid = TRUE),
         yaxis = list(title = 'Population', 
                      range = c(5*10^6, 25*10^6),
                      dtick = 1*10^6,
                      showgrid = TRUE,
                      barmode = 'group'))%>%
  add_trace(y = central, name = 'Central')%>%
  add_trace(y = north , name = 'North ') %>%
  add_trace(y = northeast , name = 'Northeast') %>%
  add_trace(y = south , name = 'South') 
p


#bar graph (group by region)
region <- c('Bangkok and Suburb cities', 'Central', 'North', 'Northeast', 'South')
x2543 <- as.numeric(df[1,2:6])
x2553 <- as.numeric(df[2,2:6])
x2558 <- as.numeric(df[3,2:6])
data <- data.frame(region , x2543, x2553, x2558)
data

p <- plot_ly(data, x = region , y = x2543 , name = '2543',
             type = 'bar') %>% 
  layout(title = "2543-2558 Thai Population", 
         xaxis = list(title = 'Region', showgrid = TRUE),
         yaxis = list(title = 'Population', 
                      range = c(5*10^6, 25*10^6),
                      dtick = 1*10^6,
                      showgrid = TRUE,
                      barmode = 'group'))%>%
  add_trace(y = x2553, name = '2553')%>%
  add_trace(y = x2558, name = '2558')
p

sorted_x2558 <- sort(x2558,index.return=TRUE,decreasing = FALSE)
p <- plot_ly(data, x = region , y = x2558 , name = '2558',
             type = 'bar',color = region) %>% 
  layout(title = "2558 Thai Population", 
         xaxis = list(title = 'Region', categoryorder='array',categoryarray = region[sorted_x2558$ix]),
         yaxis = list(title = 'Population', 
                      range = c(0,25000000),
                      dtick = 5000000,
                      showgrid = TRUE))
p
