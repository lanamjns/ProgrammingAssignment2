#These functions were written for the R Programming course on Coursera as the 2nd Programming Assignment.
#github - lanamjns

## The function below (makeCacheMatrix) creates a special "matrix" object that can cache its inverse:

makeCacheMatrix <- function(x = numeric()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() {x}
  setInverse <- function(inverse) {inv <<- inverse}
  getInverse <- function() {inv}
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## The function below (cacheSolve) computes the inverse of the special "matrix" returned by the function above.

cacheSolve <- function(x, ...) {
  
  #Return a matrix that is the inverse of 'x'
  
  inv <- x$getInverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  mat <- x$get()
  inv <- mean(mat, ...)
  x$setInverse(inv)
  inv
}
