## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## This function is used to cahing a matrix


makeCacheMatrix<-function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}



## Write a short comment describing this function

## This function is used to calculate inverse of a matrix via cache.

cacheSolve <- function(x, ...) {
  m <- x$get()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$getinverse()
  m <- inverse(data, ...)
  x$setinverse(m)
  m
}
