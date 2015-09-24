# ##Question1
# library(data.table)
# library(sqldf)
# setwd("C:/Users/soloveynv/Documents/R Scripts/GettingAndCleaningData_Quiz1")
# URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
# destFile <- "Quiz3-1Dataset.csv"
# if (!file.exists(destFile)){
#    download.file(URL, destfile = destFile, mode='wb')
# }
# DT <- fread(destFile)
# agricultureLogical <- DT$ACR==3&DT$AGS==6
# which(agricultureLogical)
 

# ##Question2
# library(jpeg)
# SourceURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
# destFile <- "getdataFjeff.jpg"
# if (!file.exists(destFile)){
#   download.file(SourceURL, destfile = destFile, mode='wb')
# }
# 
# rjpg <- readJPEG(destFile, native = T)
# quantile(as.vector(rjpg), probs = c(0.3, 0.8))


##Question3-5
library(plyr)
library(ddplyr)
library(Hmisc)
setwd("C:/Users/soloveynv/Documents/R Scripts/GettingAndCleaningData_Quiz1")
Source1URL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
Source2URL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
countriesData <- "dataFGDP.csv"
eduData <- "EDSTATS_Country.csv"
if ((!file.exists(countriesData))&(!file.exists(eduData))){
 download.file(Source1URL, destfile = countriesData, mode='wb')
 download.file(Source2URL, destfile = eduData, mode='wb')
}
countriesDataSet <- read.csv(countriesData, skip = 4, nrows = 190, stringsAsFactors=FALSE)
eduDataSet <- read.csv(eduData, stringsAsFactors=FALSE)
names(countriesDataSet)<- c("CountryCode", "GDP", "Economy", "CountryName", "mUSd", 6:10)
arrange(countriesDataSet, desc(GDP))
table(countriesDataSet$CountryCode %in% eduDataSet$CountryCode)
cleantable <- join(countriesDataSet, eduDataSet, "CountryCode")
cleantable <- cleantable[!(complete.cases(cleantable)), ]
cleantable <- select(cleantable, GDP, Income.Group)
groupT <- group_by(cleantable, Income.Group)

summarize(groupT, GDP = mean(GDP, na.rm = T))
groupT$cut5Groups <- cut2(groupT$GDP, g = 5)
table(groupT$Income.Group, groupT$cut5Groups)




















