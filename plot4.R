source("readData.R")
sccCoal <- SCC[grep("Coal", SCC$EI.Sector),]
coalCodes <- sccCoal$SCC
coalEmissions <- NEI[NEI$SCC %in% coalCodes,]
totalPerYear <- aggregate(coalEmissions$Emissions, by=list(year=coalEmissions$year), FUN=sum)
png(file="plot4.png")
plot(totalPerYear, type="l", ylab = "Emissions", main="Total Coal Combustion Emissions across US")
dev.off()