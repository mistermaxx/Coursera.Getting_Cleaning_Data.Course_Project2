# |*****************************************************************************
# | Dwayne Macadangdang 9/10/2016
# | Coursera: Exploratory Data Analysis
# | Week 4 Programming Assignment: Plot 3

plot3 <- function()
{
  setwd("/Users/mistermaxx/Documents/work/personal/Coursera/Exp_Data_Anal/Week_4")
  library(ggplot2)
  
  # read in data from file
  nei.file.data <- readRDS("summarySCC_PM25.rds")
  
  # subset and aggregate total pm2.5 emissions for baltimore
  nei.baltimore.data <- nei.file.data[nei.file.data$fips == "24510",]
  
  ggplot.baltimore <- ggplot(nei.baltimore.data, aes(factor(year), Emissions, fill = type)) +
    geom_bar(stat = "identity") +
    theme_bw() + guides(fill = FALSE)+
    facet_grid(. ~ type, scales = "free", space = "free") + 
    labs(x = "year", y = expression("Total PM"[2.5]*" Emission (Tons)")) + 
    labs(title = expression("PM"[2.5] *" Emissions, Baltimore City 1999-2008 by Source Type"))
  
  print(ggplot.baltimore)
  
  dev.copy(png, file = "plot3.png")
  dev.off()
  
}