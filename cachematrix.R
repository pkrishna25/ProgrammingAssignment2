## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

##The first function, makeCacheMatrix creates a special "vector", which is really a list containing a function to
##set the value of the vector
##get the value of the vector
##set the value of the inverse
##get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  j <- NULL
  set <- function(y) {
    x <<- y
    j <<- NULL
  }
  get <- function () x
  setInverse <- function(inverse) j <<- inverse
  getInverse <- function() j
  list(set = set , get = get , setInverse = setInverse,getInverse = getInverse)
}


## Write a short comment describing this function
##The following function calculates the mean of the special "vector" created with the above function. 
##However, it first checks to see if the mean has already been calculated. If so, it gets the mean from the cache and skips the computation. Otherwise, it calculates the mean of the data and sets the value of the mean in the cache via the setmean function.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  j <- x$getInverse()
  
  if (!is.null(j)){
    message("getting cached data")
    return(j)
  }
  data <- x$get()
  j <- solve(data)
  x$setInverse(j)
  j
}
