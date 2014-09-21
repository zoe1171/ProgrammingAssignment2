## This function intends to cache the inverse of a matrix

## This function creates a special "matrix" 
## object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y){
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  
  ## list the results of this function
  list(set = set, get = get,    
       setmean = setmean,
       getmean = getmean)

}


## This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getmean()
  
  ## if inverse has already been calculated
  ## return the cached mean
  if(!is.null(m)) {
    message("getting cached data")
    return (m)
  }
  
  ## calculate the inverse of the matrix
  ## if it is the first time to calculate
  data <- x$get()
  m <- solve(data, ...)
  x$setmean(m)
  m
}
