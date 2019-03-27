library(plumber)
r <- plumb("plumber.R")
print("Test service by going to: http://127.0.0.1/classify?Sepal_Length=5.1&Sepal_Width=3.5&Petal_Length=1.3&Petal_Width=0.3")
r$run(port=80, host="0.0.0.0")