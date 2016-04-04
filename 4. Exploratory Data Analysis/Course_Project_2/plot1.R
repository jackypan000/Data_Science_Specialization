## Question 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.


source("load_data.R")
####################################################################
### 1. Derive the sum of emissions grouping by year for plotting ###
####################################################################

## Step 1. Assign year as factor for convenience in grouping variables
NEI$year <- factor(NEI$year, ordered = TRUE)

## Step 2. Grouping variables to derive sum of emissions by year
dv <- tapply(NEI$Emissions, NEI$year, sum)

#####################################
### 2. Base Plotting illustration ###
#####################################
png(file = "plot1.png", width = 1096, height = 480)

barplot(dv, border = FALSE, xlab = "Year", ylab = "Total Amount of PM2.5 emitted, in tons", main = "The total amount of PM2.5 emissions decreased from 1999 to 2008")

dev.off()

