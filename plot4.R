library(ggplot2)
source("load_data.R")
source("merge_data.R")

plot4 <- function(){
    ## create subset any records with Coal in Short.Name
    matches <- grepl("coal", NEISCC$Short.Name, ignore.case = TRUE)
    subsetNEISCC <- NEISCC[matches, ]
    
    ## aggregate by sum the total emissions per year
    aggregateTotalsByYear <- aggregate(Emissions ~ year, data = subsetNEISCC, sum)
    
    ## ggplot
    g <- ggplot(
        aggregateTotalsByYear,
        aes( x      = aggregateTotalsByYear$year,
             y      = aggregateTotalsByYear$Emissions)) +
        geom_bar(stat = "identity") + 
        xlab("Year") +
        ylab("PM2.5 Emission")
    ggtitle("Total PM2.5 Coal Combustion Emissions in the US")
    print(g)
    
    ## create PNG device
    dev.copy(png, file = "plot4.png", width = 480, height = 480)
    dev.off()   
}

plot4()