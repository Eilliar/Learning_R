age <- c(1,3,5,2,11,9,3,9,12,3)
weight <- c(4.4,5.3,7.2,5.2,8.5,7.3,6.0,10.4,10.2,6.1)

# Mean value of a vector
mean(weight)

# Standard Deviation
sd(weight)

# Correlation
cor(age, weight)

# Plot data
#plot(age, weight)

# load library
library(gdata)

#load a txt file
axData <- read.table("Data/Climb_stairs_MODEL/Accelerometer-2011-03-24-10-24-39-climb_stairs-f1.txt")
samples <- c(1:dim(axData)[1])
colnames(axData) <- c("X (m/s.s)", "Y (m/s.s)", "Z (m/s.s)")

par(mfrow = c(3,1))

plot(samples, t(axData[1]), "l", main = "Acc. X")
plot(samples, t(axData[2]), "l", main = "Acc. Y")
plot(samples, t(axData[3]), "l", main = "Acc. Z")
