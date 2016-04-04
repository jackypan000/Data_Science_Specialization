## Question 6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == “𝟶𝟼𝟶𝟹𝟽”). Which city has seen greater changes over time in motor vehicle emissions?

source("load_data.R")

##############################################################
###### 1. Select motor vehicle sources sources by SCC ########
###### EI.Sector = Mobile Sources; Keyword %in% Vehicle ######
##############################################################

# Step 1. Criteria selection
SCC_Chosen <- subset(SCC, SCC.Level.One == "Mobile Sources")
veh <- grepl("Vehicle", SCC_Chosen$SCC.Level.Two)
SCC_Chosen <- SCC_Chosen[veh,]

# Step 2. Derive the desire NEI data
NEI_Chosen <- NEI[which(NEI$SCC %in% SCC_Chosen$SCC),]

###############################################################
##### 2. Select data  in Baltimore City (𝚏𝚒𝚙𝚜 == “𝟸𝟺𝟻𝟷𝟶”) #####
####################  Los Angeles County(fips == "06037") #####
###############################################################
NEI_Chosen_Baltimore <- subset(NEI_Chosen, fips == "24510")      
NEI_Chosen_LosAngeles <- subset(NEI_Chosen, fips == "06037")


####################################################################
### 3. Derive the sum of emissions grouping by year for plotting ###
####################################################################

## Step 1. Assign year as factor for convenience in grouping variables
NEI_Chosen_Baltimore$year <- factor(NEI_Chosen_Baltimore$year, ordered = TRUE)
NEI_Chosen_LosAngeles$year <- factor(NEI_Chosen_LosAngeles$year, ordered = TRUE)

## Step 2. Grouping variables to derive sum of emissions by year
dv_motor_veh_Baltimore <- tapply(NEI_Chosen_Baltimore$Emissions, NEI_Chosen_Baltimore$year, sum)
dv_motor_veh_LosAngeles <- tapply(NEI_Chosen_LosAngeles$Emissions, NEI_Chosen_LosAngeles$year, sum)

#####################################
### 4. Base Plotting illustration ###
#####################################
png(file = "plot6.png", width = 1096, height = 480)

par(mfrow = c(1,2), oma = c(1,1,4,1))1,
bplot(dv_motor_veh_Baltimore, border = FALSE, ylab = "Txlab = "Year", otal Amount of PM2.5 emitted, in tons", main = "BaltimoreEmissions in  City", ylim = c(0, 7200))
barplot(dv_motor_veh_LosAngeles, border = FALSE,  main = "xlab = "Year" ,os AngelEmissions in es County", ylim = c(0, 7000), col = "red")
mtext("Loa Angeles County has seen greater changes over time in motor vehicle emissions?", side  3, outer = TRUE)

dev.of, cex = 2f(
