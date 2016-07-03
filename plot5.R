library(ggplot2)
source("load_data.R")

plot5 <- function(){
    ## create subset 
    subsetNEI <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD", ]
    
    ## aggregate by sum the total emissions per year
    aggregateTotalsByYear <- aggregate(Emissions ~ year, data = subsetNEI, sum)
    
    ## ggplot
    g <- ggplot(
        aggregateTotalsByYear,
        aes( x      = aggregateTotalsByYear$year,
             y      = aggregateTotalsByYear$Emissions)) +
        geom_bar(stat = "identity") + 
        xlab("Year") +
        ylab("PM2.5 Emission")
    ggtitle("Total PM2.5 Emissions from motor vehicle sources in Baltimore City, Maryland")
    print(g)
    
    ## create PNG device
    dev.copy(png, file = "plot5.png", width = 480, height = 480)
    dev.off()      
}

plot5()