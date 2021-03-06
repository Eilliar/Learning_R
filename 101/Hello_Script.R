##################################################################

age <- c(1,3,5,2,11,9,3,9,12,3)
weight <- c(4.4,5.3,7.2,5.2,8.5,7.3,6.0,10.4,10.2,6.1)

# Mean value of a vector
mean(weight)

# Standard Deviation
sd(weight)

# Correlation
cor(age, weight)

# Plot data
dev.new()
plot(age, weight)

##################################################################
# From the dataset info file: Accelerometer specifications
#Type:		   tri-axial accelerometer
#Measurement range: [- 1.5g; + 1.5g]
#Sensitivity: 	   6 bits per axis
#Output data rate:  32 Hz
#Location:	   attached to the right wrist of the user with:
#		   - x axis: pointing toward the hand
#		   - y axis: pointing toward the left
#		   - z axis: perpendicular to the plane of the hand

freq = 32 # in Hz


# load library
library(gdata)

#load a txt file
axData <- read.table("Data/Climb_stairs_MODEL/Accelerometer-2011-03-24-10-24-39-climb_stairs-f1.txt")
samples <- c(1:dim(axData)[1])
colnames(axData) <- c("X (m/s.s)", "Y (m/s.s)", "Z (m/s.s)")

# Data Frame?
dataFrame <- data.frame(samples, axData)

# Plot a single run
dev.new()
par(mfrow = c(3,1))

plot(t(dataFrame[1]), t(dataFrame[2]), "l", main = "Acc. X")
plot(t(dataFrame[1]), t(dataFrame[3]), "l", main = "Acc. Y")
plot(t(dataFrame[1]), t(dataFrame[4]), "l", main = "Acc. Z")

##################################################################

