library(dplyr)

mechaData <- read_csv("MechaCar_mpg.csv")
 
lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mechaData)

summary(lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mechaData))



suspensionCoilData <- read_csv("Suspension_Coil.csv")

total_summary <- suspensionCoilData %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI),SD=sd(PSI), .groups='keep')

lot_summary <- suspensionCoilData %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI),SD=sd(PSI), .groups='keep')

# t.test() to determine if PSI across all lots is statistically different from population mean of 1500 PSI
t.test(suspenisonCoilData$PSI, mu=1500)

# 3 more scripts using t.test and subset() to determine if PSI for each lot is statistically different
# from population mean of 1500 PSI

# Lot 1
t.test(subset(suspenisonCoilData,Manufacturing_Lot == 'Lot1')$PSI, mu=1500)

# Lot 2
t.test(subset(suspenisonCoilData,Manufacturing_Lot == 'Lot2')$PSI, mu=1500)

# lot 3
t.test(subset(suspenisonCoilData,Manufacturing_Lot == 'Lot3')$PSI, mu=1500)