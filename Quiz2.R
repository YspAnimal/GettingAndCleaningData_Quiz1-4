# setwd("C:/Users/soloveynv/Documents/R Scripts/GettingAndCleaningData_Quiz2")
# URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
# destFile <- "Quiz2Dataset.csv"
# if (!file.exists(destFile)){
#   download.file(URL, destfile = destFile, mode='wb')
# }
# dateDownloaded <- date()
# 
# library(data.table)
# library(sqldf)
# acs <- fread("Quiz2Dataset.csv")
# sqldf("select pwgtp1 from acs where AGEP < 50") 
# sqldf("select unique AGEP from acs") 
# sqldf("select distinct AGEP from acs")
# unique(acs$AGEP)


library(XML)
url <- "http://biostat.jhsph.edu/~jleek/contact.html"
con <- url(url)
readFile <- readLines(con)
close(con)
destFile <- "Quiz24.html"
download.file(url, destfile = destFile, mode='wb')
readf <- file(destFile)
nchar(readFile[10])
nchar(readFile[20])
nchar(readFile[30])
nchar(readFile[100])


install.packages("readr")
library(readr)
x <- read.fwf(
  file=url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"),
  skip=4,
  widths=c(12, 7,4, 9,4, 9,4, 9,4))

cumsum(x[, 4])

















