# Natalie Gelderblom

# Statistical Computing: Practical One
#NOTE: the answers to the questions below should be placed into their own qmd file in a Quarto project on GitHub. This Quarto project (the rendered document itself, as well as the source code on GitHub) will be peer-assessed next week.

# first making it an R script
# then will convert it to Quatro

# 1.Find all rows in “airquality” that have missing values. Note that the airquality dataset in R is always available 
# type airquality in the console (or script) to see it

airquality 

# finds the location of missing values

NA.Ozone <- which(is.na(airquality$Ozone))
NA.Solar<-which(is.na(airquality$Solar.R))
NAwhich(is.na(airquality$Wind))
which(is.na(airquality$Temp))
which(is.na(airquality$Month))
which(is.na(airquality$Day))

rows.NA <- unique(sort(c(NA.Ozone,NA.Solar)))

rows.NA

class(airquality)



apply(airquailty, margin, ...)

#2. Find mean, sd, min, max for each of temperature and ozone level.

# ------------ define variables ------------------
temperature <-airquality$Temp

# Ozone has missing variables so you have to clean it before you can use the other functions like mean()
#  na.omit() returns the object with incomplete cases removed
Ozone.cleaned <-na.omit(airquality$Ozone)

#------------Get mean, sd, min, max---------------

summary(temperature)
sd(temperature)

summary(Ozone.cleaned)
sd(Ozone.cleaned)

# Alternative: get mean, min and max directly
mean(temperature)
max(temperature)
min(temperature)

mean(Ozone.cleaned)
max(Ozone.cleaned)
min(Ozone.cleaned)


#3. For linear regression, parameter estimates can be found as follows. 
# beta = inverse( Xtranspose X) Xtranspose Y

# The data gives the speed of cars and the distances taken to stop. 
# independent variable = speed
# dependent variable = stopping distance 

X = cbind(1, cars$speed)
Y = cars$dist
# design matrix needs to be a 2 column matrix to have the output calculate both the intercept and the coefficient
#Here, Y is the response variable, and X is the design matrix. The cars data (an R data set, also always available in R) contains two variables: speed and distance to stop. Fit a simple linear regression model to these data, i.e. find the  estimates, using the equation above, and matrix calcuations in R.


#-------------Matrix Operations-------------------------------
# t(matrix) # tranpose of a matrix 
# v1 %*% m1 #matrix multiplication
# solve(m1) # inverse of square matrix (m1) if possible 
beta_hat = solve(t(X) %*% X) %*% t(X) %*% Y
beta_hat

# Check that you get the same estimates as when fitting the linear regression model using lm() in R.
# using the built in regression function lm(dependent~independent,data)
cars.regression <-lm(Y~X)
summary(cars.regression)

#If you had not already defined X and Y
#m1 <- lm(dist ~ speed, data = cars)
#summary(m1)
