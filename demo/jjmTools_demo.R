# ------------------------------------------------------------------------
# Demo script ------------------------------------------------------------
# jjmTools: Graphics and diagnostics libraries for SPRFMO's JJM mo -------
# ------------------------------------------------------------------------

library(devtools)
#install_github(repo="imarpe/jjmTools")
library(jjmTools)

# Set parameters ----------------------------------------------------------

# Path of JJM repository (from current working directory)

reposDir =  "D:/JMSR/GitHub/jjmLocal/SPRFMO/admb/"

# Name of a model
model = "mod0.0"

# Names of models
compareList = paste0("mod0.", 1:3)

# Run models --------------------------------------------------------------

# Run single model
runJJM(model = model, path = reposDir)

# Run a list of models
#runJJM(model = compareList, path = reposDir)


# Reading -----------------------------------------------------------------

# OUTPUT Object
model = readJJM(model = model, path = reposDir)

# LIST OF OUTPUT Object

mod1 = readJJM(model = compareList[1], path = reposDir)
mod2 = readJJM(model = compareList[2], path = reposDir)
mod3 = readJJM(model = compareList[3], path = reposDir)

mod4 = mod2

# DIAG object
diagPlots = diagnostics(outputObject = model)


# Combine models ----------------------------------------------------------

mod1234 = combineModels(mod1, mod2, mod3, mod4)


# Integrating models ------------------------------------------------------

mod123 = combineStocks(mod1, mod2, mod3)

# Write new model ------------------------------------------------------

writeCombinedStocks(combinedModel = mod123)


# Print -------------------------------------------------------------------

# Output object
print(model)

# List of outputs 
print(mod1234)

# Diagnostics object
print(diagPlots)


# Get and print summaries -------------------------------------------------

# Output object
sumModel = summary(model)
print(sumModel)

# List of outputs object
sumList = summary(mod1234)
print(sumList)

# Diagnostics object
sumPlots = summary(diagPlots)
sumPlots


# Get and print plots -----------------------------------------------------

plot(diagPlots, what = "input")
plot(diagPlots, what = "fit")
plot(diagPlots, what = "projections")
plot(diagPlots, what = "ypr")


