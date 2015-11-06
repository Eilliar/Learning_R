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

# Close all figures
graphics.off()

Fs <- 32 # in Hz

# load library
library(gdata)

#load a txt file
axData <- read.table("Data/Climb_stairs_MODEL/Accelerometer-2011-03-24-10-24-39-climb_stairs-f1.txt")
samples <- c(1:dim(axData)[1])*(1/freq)
colnames(axData) <- c("X (m/s.s)", "Y (m/s.s)", "Z (m/s.s)")
N <- length(samples)
freqVector <- seq(from = 0, to = Fs/2, by = Fs/N)

# Data Frame?
dataFrame <- data.frame(samples, axData)

# Plot a single run
dev.new()
par(mfrow = c(3,1))

plot(t(dataFrame[1]), t(dataFrame[2]), "l", main = "Acc. X")
plot(t(dataFrame[1]), t(dataFrame[3]), "l", main = "Acc. Y")
plot(t(dataFrame[1]), t(dataFrame[4]), "l", main = "Acc. Z")

##################################################################
endIndex <- length(t(dataFrame[1]))

dataFFT <- abs(fft(data.matrix(dataFrame[2])))
dev.new()
plot(t(dataFrame[1])[endID/2+1:endID-1], dataFFT[endID/2+1:endID-1], "l", main = "ABS(FFT) - Acc. X")
dev.new()
plot(t(dataFrame[1]), dataFFT, "l", main = "ABS(FFT) - Acc. X")

# Estimating PSD :http://www.mathworks.com/help/signal/ug/psd-estimate-using-fft.html
psdData <- (1/Fs*N)*dataFFT[endID/2+1:endID-1]^2
psdData[2:endIndex-1] <- 2*psdData[2:endIndex-1]

