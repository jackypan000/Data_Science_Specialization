## Question 4. Across the United States, how have emissions from coal combustion-related sources changed from 1999‚Äì2008?

source("load_data.R")

########################################################
### 1. Select coal combustion-related sources by SCC ###Ìø∂‚Äù) ###
########  Keyword: Coal, Lignite, Combustion  ##########
########################################################

# Step 1. Keyword Selection
Com <- grepl("Combustion", SCC$SCC.Level.One)
Coal <- grepl("Coal", SCC$SCC.Level.Three) | grepl("Coal", SCC$SCC.Level.Four)
Lignite <- grepl("Lignite", SCC$SCC.Level.Three)

# Step 2. Derive the corresbonding SCC
SCC_Chosen <- SCC[Com & (Lignite | Coal),]$SCC

# Step 3. Subset the desire dataframe
NEI_Chosen <- NEI[(NEI$SCC %in% SCC_Chosen),]

####################################################################
### 2. Derive the sum of emissions grouping by year for plotting ###
####################################################################

## Step 1. Assign year as factor for convenience in grouping variables
NEI_Chosen$year <- factor(NEI_Chosen$year, ordered = TRUE)

## Step 2. Grouping variables to derive sum of emissions by year
dv_coal_combus <- tapply(NEI_Chosen$Emissions, NEI_Chosen$year, sum)

#####################################
### 3. Base Plotting illustration ###
#####################################
png(file = "plot4.png", width = 1096, height = 480)

barplot(dv_coal_combus, border = FALSE, xlab = "Year", ylab = "Total Amount of Coal Combustion-related Sources of PM2.5 emitted, in tons", main = "Total Amount of Coal Combustion-related Sources of PM2.5 emissions decreased from 1999 to 2008")

dev.off()


