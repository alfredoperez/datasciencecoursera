## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'threshold' is a numeric vector of length 1 indicating the
## number of completely observed observations (on all
## variables) required to compute the correlation between
## nitrate and sulfate; the default is 0

## Return a numeric vector of correlations
## NOTE: Do not round the result!
corr <- function(directory, threshold = 0) {

   filesList     <- list.files(directory, full.names = TRUE)
   
   completeCases <- complete(directory)
   
   ## ids where the nobs is greater than  the threshold
   ids          <- completeCases[completeCases$nobs > threshold, "id"]
   
   ## create empty vector
   result <- c()
   
   for (i in ids) {
     
     # Read File
     file   <- read.csv(filesList[i])
     
     # Adding correlation to the result
     result <- c(result, cor(file$sulfate, file$nitrate, use = "complete.obs"))
   }
   result
}