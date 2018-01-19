library(fpp2)
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
