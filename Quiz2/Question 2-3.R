link <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

acs <- read.csv(url(link))

unique(acs$AGEP)
sqldf("select distinct AGEP from acs")
