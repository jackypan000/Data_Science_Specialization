## Question 3. Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.


source("load_data.R")
###############################################################
### 1. Select data only in Baltimore City (𝚏𝚒𝚙𝚜 == “𝟸𝟺𝟻𝟷𝟶”) ###
###############################################################
NEI_Baltimore <- subset(NEI, fips == "24510")


#################################################################################
### 2. Indicate the emissions change from 199 to 2008 by four types of source ###
#################################################################################

## Step 1. Assign year as factor for convenience in grouping variables
NEI_Baltimore$year <- factor(NEI_Baltimore$year, ordered = TRUE)

## Step 2. Plot the types of source per chart using ggplot2
png(file = "plot3.png", width = 1096, height = 480)

library(ggplot2)
ggplot(NEI_Baltimore, aes(x = year, y = Emissions)) + 
        geom_bar(stat = "identity",aes(fill = type)) +
        facet_grid(. ~ type, scales = "free") + 
        scale_fill_manual(values = c("red","red","red","gray")) + 
        theme(legend.position = "none") + xlab("Year") +
        ylab("Total Amount of PM2.5 emitted, in tons") +
                ggtitle("The amount of PM2.5 emissions from types of source(NON-ROAD, NONPOINT & ON-ROAD) decreased from 1999 to 2008(The red part)\nand POINT source increased from 1999 to 2005 but decreased in 2008.") +
        theme(plot.title = element_text(lineheight = .8, face = "bold"))
# Select the decreased types and assign them into color "red"

 dev.off()