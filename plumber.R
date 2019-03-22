# plumber.R
# To execute as a Service use: 
# pr <- plumb("plumber.r")
# pr$run()

library(plumber)

#' Echo the parameter that was sent in
#' @param msg The message to echo back.
#' @get /echo
function(msg=""){
  list(msg = paste0("The message is: '", msg, "'"))
}

#' Classify Iris Species
#' @param Sepal_Length Sepal.Length
#' @param Sepal_Width Sepal.Width
#' @param Petal_Length Petal.Length
#' @param Petal_Width Petal.Width
#' @get /classify
function(Sepal_Length="", Sepal_Width="", Petal_Length="", Petal_Width=""){
  # Set 2 decimals per double value
  options(digits=2)
  
  features<-list(Sepal.Length=as.double(Sepal_Length),Sepal.Width=as.double(Sepal_Width),Petal.Length=as.double(Petal_Length),Petal.Width=as.double(Petal_Width))
  print(features)
  print("got features")
  # load the model
  super_model <- readRDS("./final_model.rds")
  print("Model Loaded")
  # make a predictions on "new data" using the final model
  # features <- list(Sepal.Length=5.1,Sepal.Width=3.5,Petal.Length=1.3,Petal.Width=0.3)
  PRED <- predict(super_model, features)
  
  print("Prediction made")

  list(features = paste0("The prediction is: '", PRED, "'"))
}

#' Plot out data from the iris dataset
#' @param spec If provided, filter the data to only this species (e.g. 'setosa')
#' @get /plot
#' @png
function(spec){
  myData <- iris
  title <- "All Species"
  
  # Filter if the species was specified
  if (!missing(spec)){
    title <- paste0("Only the '", spec, "' Species")
    myData <- subset(iris, Species == spec)
  }
  
  plot(myData$Sepal.Length, myData$Petal.Length,
       main=title, xlab="Sepal Length", ylab="Petal Length")
}

