source("load_data.R")

plot1 <- function(){
    ## aggregate by sum the total emissions per year
    aggregateTotalsByYear <- aggregate(Emissions ~ year, data = NEI, sum)
    
    ## barplot
    barplot(
        aggregateTotalsByYear$Emissions,
        names.arg = aggregateTotalsByYear$year,
        xlab      = "Year",
        ylab      = "PM2.5 Emission",
        main      = "Total PM2.5 Emission from All Sources"
    )
    
    ## create PNG device
    dev.copy(png, file = "plot1.png", width = 480, height = 480)
    dev.off()
}

plot1()