library(RISmed)
library(ggplot2)

data_b <- read.csv("icd10cm_order_2018_1.csv",header = FALSE,se=",") ## reading file containing diseases

specific_diseases <- data_b[data_b[,2] == "K14617" || data_b[,2] == "K4617" || data_b[,2] == "K617"      ## search & entry of
                   ||data_b[,2] == "D14184" || data_b[,2] == "D4184" || data_b[,2] == "D184"        ## specific diseases
                   ||data_b[,2] == "S14617" || data_b[,2] == "S4617" || data_b[,2] == "S617"
                   ||data_b[,2] == "M14184" || data_b[,2] == "M4184" || data_b[,2] == "M184", ]

word <- specific_diseases[,4]

year1 <- QueryCount(EUtilsSummary(word[1], type = "esearch", db = "pubmed", mindate = 2014, maxdate = 2014, retmax=500)) ## pubmed search

year2 <- QueryCount(EUtilsSummary(word[1], type = "esearch", db = "pubmed", mindate = 2015, maxdate = 2015, retmax=500)) 

year3 <- QueryCount(EUtilsSummary(word[1], type = "esearch", db = "pubmed", mindate = 2016, maxdate = 2016, retmax=500))

year4 <- QueryCount(EUtilsSummary(word[1], type = "esearch", db = "pubmed", mindate = 2017, maxdate = 2017, retmax=500))

year5 <- QueryCount(EUtilsSummary(word[1], type = "esearch", db = "pubmed", mindate = 2018, maxdate = 2018, retmax=500))

total_papers <- c(year1,year2,year3,year4,year5)

names(total_papers) <- c("2014", "2015", "2016", "2017", "2018")

hist(total_papers) ## number of results
