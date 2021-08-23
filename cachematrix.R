## Two functions are used including cacheMatrix and cacheSolve
library(MASS)
makeCacheMatrix <- function(x = matrix()) {   ##assigning the function
  inv <- NULL                                ##inverse set as null
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x           ## function to get the matrix x
  setinv <- function(inverse) inv <<- inverse
  getinv <- function() {
    inver<-ginv(x)
    inver%*%x                  ## and function to obtain the inverse of the matrix
  }
   list(set = set, get = get,
       setmean = setinv,
       getmean = getinv)
}


## Write a short comment describing this function
## This function is used to get the cache data

cacheSolve <- function(x, ...) {         ##gets cache data
  inv <- x$getinv()
  if(!is.null(inv)) {                    ##checks if inverse is null
    message("getting cached data")
    return(inv)                            ##returns inverse value
  }
  data <- x$get()
  inv <- solve(data, ...)                 ##calculates the inverse value
  x$setinv(inv)
  m
}
