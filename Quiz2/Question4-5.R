library(XML)
### Q4
url_link <- "http://biostat.jhsph.edu/~jleek/contact.html"
html <- htmlTreeParse(url_link,useInternalNodes = TRUE)

connection <- url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlcode <- readLines(connection)
htmlcode1 <- htmlcode[c(10,20,30,100)]
lapply(htmlcode1,nchar)

### Q5

con1 <- url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for")
fwf_file <- read_fwf(file = con1, fwf_widths(c(12, 7, 4, 9, 4, 9, 4, 9, 4)), skip = 4)

fwf_file
