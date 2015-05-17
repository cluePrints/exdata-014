source("readData.R")
sccVehicle <- SCC[grep("Vehicle", SCC$EI.Sector),]
vehicleCodes <- sccVehicle$SCC
vehicleEmissions <- NEI[NEI$SCC %in% vehicleCodes & NEI$fips %in% c("24510","06037"),]
vehicleEmissions$city <- ifelse (vehicleEmissions$fips == "24510", "Baltimore", "Los Angeles County")

totalPerYear <- aggregate(vehicleEmissions$Emissions, 
                          by=list(year=vehicleEmissions$year, city=vehicleEmissions$city), 
                          FUN=sum)
ggplot(totalPerYear, aes(year, x)) + geom_line() + facet_grid(. ~ city) + ylab("Total emissions")
ggsave(filename="plot6.png", width = 3, height = 1.5)