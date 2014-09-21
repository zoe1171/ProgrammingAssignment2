## This function intends to cache the inverse of a matrix

## This function creates a special "matrix" 
## object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y){
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) i <<- inverse
  getInverse <- function() i
  
  ## list the results of this function
  list(set = set, get = get,    
       setInverse = setInverse,
       getInverse = getInverse)

}


## This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  i <- x$getInverse()
  
  ## if inverse has already been calculated
  ## return the cached mean
  if(!is.null(i)) {
    message("getting cached data")
    return (i)
  }
  
  ## calculate the inverse of the matrix
  ## if it is the first time to calculate
  data <- x$get()
  i <- solve(data, ...)
  x$setInverse(m)
  i
}
