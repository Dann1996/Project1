datos <- read.table("household_power_consumption.txt", header=TRUE, sep = ";")
head(datos$Global_active_power)
datos$Date<-as.Date(datos$Date,format='%d/%m/%Y')
datos2007<-subset(datos, datos$Date=="2007-02-01" | datos$Date=="2007-02-02" )
head(datos2007)
write.csv(datos2007,file = "datos2007.csv", row.names = FALSE)
datos2007<-read.csv("datos2007.csv", header = TRUE)



#PLOT1
png("plot1.png", width=480,height=480,units="px",bg="white")
hist(datos2007$Global_active_power, col="red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
