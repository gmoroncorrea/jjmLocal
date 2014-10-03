# ------------------------------------------------------------------------
# Demo script ------------------------------------------------------------
# jjmTools: Graphics and diagnostics libraries for SPRFMO's JJM mo -------
# ------------------------------------------------------------------------

library(devtools)
install_github(repo="imarpe/jjmTools")
library(jjmTools)

# Set parameters ----------------------------------------------------------

# Path of JJM repository (from current working directory)

reposDir =  "../admb/"

# Name of a model
modelName = "mod0.0"

# Names of models
compareList = paste0("mod0.", 1:3)

# Run models --------------------------------------------------------------

# Run single model
runJJM(modelName = modelName, path = reposDir)

# Run a list of models
runJJM(modelName = compareList, path = reposDir)


# Reading -----------------------------------------------------------------

# OUTPUT Object
model = readJJM(modelName = modelName, path = reposDir)

# LIST OF OUTPUT Object

mod1 = readJJM(modelName = compareList[1], path = reposDir)
mod2 = readJJM(modelName = compareList[2], path = reposDir)
mod3 = readJJM(modelName = compareList[3], path = reposDir)

mod4 = mod2

# DIAG object
diagPlots = diagnostics(outputObject = model)


# Combine models ----------------------------------------------------------

mod1234 = combineModels(mod1, mod2, mod3, mod4)


# Integrating models ------------------------------------------------------

mod12 = combineStocks(mod1, mod2, model = "mod2s_12")


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


