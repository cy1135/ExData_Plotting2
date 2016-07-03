library(ggplot2)
source("load_data.R")

plot3 <- function(){
    ## create subset for baltimore city, md, fips == "24510"
    subsetNEI <- NEI[NEI$fips == "24510", ]
    
    ## aggregate by sum the total emissions per year
    aggregateTotalsByYearType <- aggregate(Emissions ~ year + type, data = subsetNEI, sum)
    
    ## ggplot
    g <- ggplot(
        aggregateTotalsByYearType,
        aes( x      = aggregateTotalsByYearType$year,
             y      = aggregateTotalsByYearType$Emissions, 
             colour = type)) +
             geom_line() + 
             xlab("Year") +
             ylab("PM2.5 Emission")
             ggtitle("Total PM2.5 Emission in Baltimore City, Maryland")
    print(g)
    
    ## create PNG device
    dev.copy(png, file = "plot3.png", width = 480, height = 480)
    dev.off()    
}

plot3()