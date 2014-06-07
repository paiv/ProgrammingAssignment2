## Matrix inversion is usually a costly computation and there may be some
## benefit to caching the inverse of a matrix rather than compute it repeatedly.
##
## makeCacheMatrix creates a matrix that can cache its inverse.
##
## cacheSolve returns inverse of the matrix created by makeCacheMatrix,
## caching result for possible future calls.
##

## Creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y) {
		x <<- y
		m <<- NULL
	}
	get <- function() x
	setsolve <- function(solve) m <- solve
	getsolve <- function() m
	list(set=set, get=get, setsolve=setsolve, getsolve=getsolve)
}


## Returns a matrix that is the inverse of 'x'
cacheSolve <- function(x, ...) {
	m <- x$getsolve()
	if(!is.null(m)) {
		message("getting cached data")
		return(m)
	}
	data <- x$get()
	m <- solve(data, ...)
	x$setsolve(m)
	m
}
