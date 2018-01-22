library(fpp2)
library(GGally)
install.packages("devtools")
devtools::install_github("robjhyndman/forecast")

#2.1 ts objects
y <- ts(c(123,39,78,52,110), start=2012)
#Frequency options: 1= annual, 4=quarterly, etc
autoplot(melsyd[,"Economy.Class"]) + 
  ggtitle("Economy class passengers: Melbouirne-Syndey") +
  xlab("Year") + ylab("Thousand")
#autoplot gör en lämplig plot automatiskt

autoplot(a10) +
  ggtitle("Antidiabetic Drug Sales") +
  ylab("$ million") + xlab("Year")

ggseasonplot(a10,year.labels=TRUE, year.labels.left = TRUE) +
  ylab("$ million") + ggtitle("Seasonal plot: antidiabetic drug sales")

#Kan göra axlarna till polära
ggseasonplot(a10, polar=TRUE) +
  ylab("$ million") + ggtitle("Polar seasonal plot: antidiabetic drug sales")

#För att förtydliga säsongsskillnader

ggsubseriesplot(a10) + ylab("$ million") +
  ggtitle("Seasonal subseries plot: antidiabetic drug sales")

#Scatterplots 
month.breaks <- cumsum(c(0,31,28,31,30,31,30,31,31,30,31,30,31)*48)
autoplot(elecdemand[,c(1,3)],facet=TRUE) +
  xlab("Year:2014") + ylab("") +
  ggtitle("Half-hourly electricity demand: Victoria, Australia") +
  scale_x_continuous(breaks=2014+month.breaks/max(month.breaks),
                    minor_breaks=NULL, labels=c(month.abb,month.abb[1]))
#Jämför relationen mellan dem
qplot(Temperature,Demand,data=as.data.frame(elecdemand)) +
  ylab("Demand(GW)") + xlab("Temperat")

#Plotta i matris och sen jämföra med varandra
visnights <- vn #för matcha rätt version
autoplot(visnights[,1:5], facets=TRUE) +
  ylab("Number of visitor nights each quarter")

#För att se relationerna
#Correlations in upper half, density plots diagonally, scatterplots lower half
visnights[,1:5] %>% as.data.frame() %>% GGally::ggpairs

#Lag plots
#x-axis shows lagged values of the time series
#Each graph shows y(t) plotted against y(t-k) for
#different values of k

beer2 <- window(ausbeer,start=1992)
#window function extracts a portion of data, starting in 1992 here
gglagplot(beer2)
#Lag 4 and 8 show strong positive releationship, reflects
#strong quarterly seasonality in the data.
#negative relationship for lag 2 and lag 6, because peaks in Q4 are plotted against lows in Q2
ggseasonplot(beer2,year.labels=TRUE, year.labels.left = TRUE) +
  ylab("$ million") + ggtitle("Seasonal plot: beer sales")

#Autocorrelation
#För att räkna korrelationen mellan laggade
#värden av en tidsserie
ggAcf(beer2)
#Jämför resultat med gglagplot, lag 4 har värde nära 1 t.ex.
acfwlag <- Acf(beer2) #sparar i vektor

#Trend and seasonlity in ACF plots
#Finns trend brukar autokorrelationer med lite lag
#ha stora positiva värden

#Finns seasonality är acf större för seasonal lags (multiplar av seasonal frequency)
#Finns både trend och seasonlity, uppstår en kombination av denna effekt

aelec <- window(elec, start=1980)
autoplot(aelec) + xlab("Year") + ylab("GWh")

ggAcf(aelec,lag=48)
#I denna plot syns både trend och seasonality.
#Trend pga höga staplar bredvid varandra som sen minskar
#Seasonlity pga höga staplar var 12:e lag

#White Noise
#Tidssereier utan autokorrelation har white noise
set.seed(30)
y <- ts(rnorm(50))
autoplot(y) + ggtitle("White noise")
ggAcf(y)
#Här är acf nära 0 för alla
#Den blåa linjen motsvara cut-off för white noise
#Är många (>>5%) staplar utanför -> inte white noise
#Motsvarar 5% / 95% principen

#ÄNDRAR NÅNTING LOLOLOLO
awdad = 1
hehe= 1



