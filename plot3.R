datos <- read.table("household_power_consumption.txt", header=TRUE, sep = ";")
head(datos$Global_active_power)
datos$Date<-as.Date(datos$Date,format='%d/%m/%Y')
datos2007<-subset(datos, datos$Date=="2007-02-01" | datos$Date=="2007-02-02" )
head(datos2007)
write.csv(datos2007,file = "datos2007.csv", row.names = FALSE)
datos2007<-read.csv("datos2007.csv", header = TRUE)
t<-paste(datos2007$Date, datos2007$Time)
t<-strptime(t,format ="%Y-%m-%d %H:%M:%S")

#PLOT3
png("plot3.png", width=480,height=480,units="px",bg="white")
plot(t,datos2007$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab="")
points(t,datos2007$Sub_metering_2, type = "l", col="red")
points(t,datos2007$Sub_metering_3, type = "l", col="blue" )
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1, col=c("black","red","blue"),cex = 1.2)
dev.off()
