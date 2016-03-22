## Overall description: functions that can cache/change the value of the matrix and calculate/cache its inverse.

## Assuming that the matrix supplied is always invertible, so it is always square matrix.
## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
        s <- NULL                                       ## Set to 'NULL' the value of the 'solve' function
        setMatrix <- function(y= matrix()) {            ## Changes the value of the matrix
                x <<- y                                 ## New matrix value
                s <<- NULL                              ## Set to 'NULL' the value of the 'solve' function
        }
        getMatrix <- function() x                       ## Returns the matrix 'x' stored in the main function
        setInverse <- function(x) {                     ## Calculates inverse of 'x', argument must be the 'getMatrix'
                s <<- solve(x)
        }
        getInverse <- function() s                      ## Returns the inverse matrix of sub function 'setInverse'
        list(setMatrix=setMatrix, getMatrix = getMatrix, setInverse=setInverse, getInverse=getInverse)
        }

## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix or it calculates the inverse of the special "matrix".

cacheSolve <- function(x, ...) {
        s <- x$getInverse()                             ## Return matrix's inverse of 'makeCacheMatrix' function
        if(!is.null(s)) {                               ## If previous value of 'solve' exists, returned its value
                message("getting cached data")
                return(s)
                }
        data <- x$getMatrix()                           ## Else it is computed the inverse of special 'matrix'
        s <- solve(data, ...)                           
        x$setInverse(s)
        s
        }
