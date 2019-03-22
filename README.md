# Deployment of an R ML model using Plumber
This is a very simple example of the creation of a REST API service exposing a previously trained classifier, which is loaded from an RDS file.
In addition, this project is using packrat as the Package Manager for R libraries.

Please have in mind that in order to run this REST API, you will have to execute the following commands:

> setwd("path_to_plumber_file")
> pr <- plumber::plumb("plumber.R") # this is the plumber file
> pr$run()
