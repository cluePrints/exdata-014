source("readData.R")
sccVehicle <- SCC[grep("Vehicle", SCC$EI.Sector),]
vehicleCodes <- sccVehicle$SCC
vehicleEmissions <- NEI[NEI$SCC %in% vehicleCodes & NEI$fips == "24510",]
totalPerYear <- aggregate(vehicleEmissions$Emissions, by=list(year=vehicleEmissions$year), FUN=sum)
png(file="plot5.png")
plot(totalPerYear, type="l", ylab = "Emissions", main="Vehicle Emissions in Baltimore")
dev.off()
