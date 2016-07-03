source("load_data.R")

plot6 <- function(){
    ## create subset 
    subsetNEI <- NEI[(NEI$fips == "24510" | NEI$fips == "06037") & NEI$type == "ON-ROAD", ]
    
    ## aggregate by sum the total emissions per year
    aggregateTotalsByYearFips <- aggregate(Emissions ~ fips + year, data = subsetNEI, sum)
    aggregateTotalsByYearFips$fips[aggregateTotalsByYearFips$fips == "24510"] <- "Baltimore, MD"
    aggregateTotalsByYearFips$fips[aggregateTotalsByYearFips$fips == "06037"] <- "Los Angeles, CA"
    
    ## ggplot
    g <- ggplot(
        aggregateTotalsByYearFips,
        aes( x      = factor(aggregateTotalsByYearFips$year),
             y      = aggregateTotalsByYearFips$Emissions)) + 
        facet_grid(. ~ fips) +
        geom_bar(stat = "identity") + 
        xlab("Year") +
        ylab("PM2.5 Emission")
    ggtitle("Total PM2.5 Emissions from motor vehicle sources in Baltimore City, Maryland vs Los Angeles, CA")
    print(g)
    
    ## create PNG device
    dev.copy(png, file = "plot6.png", width = 480, height = 480)
    dev.off()   
}

plot6()