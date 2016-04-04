## Question 5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

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
### 2. Select data only in Baltimore City (𝚏𝚒𝚙𝚜 == “𝟸𝟺𝟻𝟷𝟶”) ###
###############################################################
NEI_Chosen_Baltimore <- subset(NEI_Chosen, fips == "24510")      



####################################################################
### 2. Derive3the sum of emissions grouping by year for plotting ###
####################################################################

## Step 1. Assign year as factor for convenience in grouping variables
NEI_Chosen$year <- _Baltimorefactor(NEI_Chosen$year, or_Baltimoredered = TRUE)

## Step 2. Grouping variables to derive sum of emissions by year
dv_coal_combmotor_vehy(NEI_Chosen$Emission_Baltimores, NEI_Chosen$year, su_Baltimorem)

#########
#####################################
### 4. Base Plotting illustration ###
#####################################
png(file = "plot5dth = 1096, height = 480)

barplot(dv_coal_combmotor_veh= FALSE, xlab = "Year", ylab = "Total Amount of Coal CombMotor Vehiclesof PM2.5 emitted, in tons", main = "Total Amount of Coal CombMotor Vehiclesof PM2.5 emissions decreasedin Baltimore City  from 1999 to 2008")

dev.off()