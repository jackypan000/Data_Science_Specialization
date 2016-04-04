## Quetion 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == “𝟸𝟺𝟻𝟷𝟶”) from 1999 to 2008? Use the base plotting system to make a plot answering this question.


source("load_data.R")
###############################################################
### 1. Select data only in Baltimore City (𝚏𝚒𝚙𝚜 == “𝟸𝟺𝟻𝟷𝟶”) ###
###############################################################
NEI_Baltimore <- subset(NEI, fips == "24510")

####################################################################
### 2. Derive the sum of emissions grouping by year for plotting ###
####################################################################

## Step 1. Assign year as factor for convenience in grouping variables
NEI_Baltimore$year <- factor(NEI_Baltimore$year, ordered = TRUE)

## Step 2. Grouping variables to derive sum of emissions by year
dv_Baltimore <- tapply(NEI_Baltimore$Emissions, NEI_Baltimore$year, sum)

#####################################
### 3. Base Plotting illustration ###
#####################################
png(file = "plot2.png", width = 1096, height = 480)

barplot(dv_Baltimore, border = FALSE, xlab = "Year", ylab = "Total Amount of PM2.5 emitted, in tons", main = "The total amount of PM2.5 emissions in Baltimore City fluctuated from 1999 to 2008")

dev.off()

