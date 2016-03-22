## The purpose of this exercise was to write two functions.
## One function needed to create and temporarily store a square matrix,
## and the other function needed to calculate the inverse of that matrix. 

## FUNCTION 1: This function creates a square matrix (a matrix with an equal
## number of columns and rows and--for the purposes of testing this function--
## a unique value in each cell.

makeCacheMatrix <- function(x) {
  matrix(data=1:4,ncol=x,nrow=x)
  
}


## FUNCTION 2: This function uses function 1 internally, and it
## returns a matrix that is the inverse of the first matrix, using the 
## solve function.

cacheSolve <- function(x, ...) {
  solve(makeCacheMatrix(x))
}
