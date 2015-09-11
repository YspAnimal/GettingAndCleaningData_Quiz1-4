# library(xlsx)
# download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", destfile = "dFile.xlsx", mode='wb')
# rowsnum <- 18:23
# colnum <- 7:15 
# data<-read.xlsx("dFile.xlsx", sheetIndex = 1,colIndex = colnum, rowIndex = rowsnum)

# library(XML)
# fURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
# doc <- xmlTreeParse(fURL, useInternal=TRUE)
# rootnode<- xmlRoot(doc)
# 
# zipcodes<- xpathApply(rootnode, "//zipcode", xmlValue)


library(data.table)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile = "dFile5.scv", mode='wb')
DT <- fread("dFile5.scv")
require(stats)
#system.time({mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)})
#system.time({rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]})
#system.time(mean(DT$pwgtp15,by=DT$SEX) )
Test1 <- head(replicate(100, system.time(tapply(DT$pwgtp15,DT$SEX,mean))), 1)
Test2 <- head(replicate(100, system.time(DT[,mean(pwgtp15),by=SEX])), 1)
Test3 <- head(replicate(100, system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))), 1)
Test1_av = cumsum(Test1) / seq_along(Test1)
Test2_av = cumsum(Test2) / seq_along(Test2)
Test3_av = cumsum(Test3) / seq_along(Test3)

topY = max(Test1_av, Test2_av, Test3_av) #making sure the y axis is the right height
lowY = min(Test1_av, Test2_av, Test3_av) #making sure the y axis is the right height
plot(Test1_av, type="l", col="#FF000099", ylim=c(lowY,topY), xlab="distance", ylab="average time")
lines(Test2_av, col="#0000FF99")
lines(Test3_av, col="#00000090")


