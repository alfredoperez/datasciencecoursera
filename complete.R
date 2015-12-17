## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return a data frame of the form:
## id nobs
## 1  117
## 2  1041
## ...
## where 'id' is the monitor ID number and 'nobs' is the
## number of complete cases
complete <- function(directory, id = 1:332) {
  # all files
  files_list <- list.files(directory, full.names = TRUE)
  
  # column names
  cols = list(c(), c("id", "nobs"))
 
   # creating empty matrix
  dat <- matrix(ncol = 2, nrow = 0, dimnames = cols)
  
  for (i in id) {
    # Read File
    file <- read.csv(files_list[i])
    
    #Good rows count
    nrow <- nrow(file[!is.na(file$sulfate) & !is.na(file$nitrate),])
    
    #bind to data frame
    dat  <- rbind(dat, c(i, nrow))
  }
  
  #convert to data frame
  data.frame(dat)
}