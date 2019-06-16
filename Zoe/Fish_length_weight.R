##### June 15, 2019. Dumagete - Philippines   #########
#         Eric Garcia's Script for                    #
#   Analizing relationship between fish lenght,       #
#   weight, egg mass, and egg size.                   #
###  ><((º> ############################## <º))><   ###

rm(list=ls())
getwd()
#set working directory to location of this script
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
getwd()

# load the library
library(ggplot2)

# Loading Zoe's data on Siganus fuscescens
zoe <- read.csv("Data_Sheet_ZR_Sfuscescens.csv", header = TRUE)
?read.csv

# What are the varible names?
colnames(zoe)

#I added two fake individuals in "zoe" to prove a point (explained below)
#Zoe's real data is represnted in "zoedata" by removing these 2 extra samples=
zoedata = zoe[-c(35,36),]

# plot sample frequency distribution  (histogram) of Standard lenght with bins of 1 cm
ggplot(data = zoedata) + 
  aes(x = Standard.Length..cm.) + 
  geom_histogram(binwidth = 1)

# saved this file as Zoesampledist

# However, how well represented is the entire size range of this species 
# if max lenght is 40 cm according to FishBase?

# Plot frequency distribution  (histogram) of Standard lenght, using 40 bins
# 40 bc I want bins to be 1 cm and the max lenght is 40
ggplot(data = zoe) + 
  aes(x = Standard.Length..cm.) + 
  geom_histogram(bins = 40)

# you can achieve the same plot by specifying the with of bins. In this case = 1 cm
ggplot(data = zoe) + 
  aes(x = Standard.Length..cm.) + 
  geom_histogram(binwidth = 1)

# saved this plot as Truesampledist

# Is there a correlation between weight and length?
# Make a scatterplot using weight and length in Zoe's actual data

# Simple scatterplot using plot
Sfu_L_vs_W <- plot(zoedata$Standard.Length..cm., zoedata$Total.Weight..g.)

# Fit a line in the scatterplot
Sfu_L_vs_W <-  lm(Total.Weight..g.~Standard.Length..cm., data=zoedata)
plot(zoedata$Standard.Length..cm., zoedata$Total.Weight..g.)
abline(Sfu_L_vs_W)
