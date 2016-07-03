source("load_data.R")

plot2 <- function(){
    ## create subset for baltimore city, md, fips == "24510"
    subsetNEI <- NEI[NEI$fips == "24510", ]
    
    ## aggregate by sum the total emissions per year
    aggregateTotalsByYear <- aggregate(Emissions ~ year, data = subsetNEI, sum)
    
    ## barplot
    barplot(
        aggregateTotalsByYear$Emissions,
        names.arg = aggregateTotalsByYear$year,
        xlab      = "Year",
        ylab      = "PM2.5 Emission",
        main      = "Total PM2.5 Emission in Baltimore City, Maryland"
    )
    
    ## create PNG device
    dev.copy(png, file = "plot2.png", width = 480, height = 480)
    dev.off()
}

plot2()