url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
if (!file.exists("exdata-data-NEI_data.zip")) {
        download.file(url, destfile = "exdata-data-NEI_data.zip", method = "curl")
        unzip("exdata-data-NEI_data.zip")
}
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")