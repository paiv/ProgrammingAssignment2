
test.makeCacheMatrix <- function() {
	m <- matrix( sample(rnorm(1000), 16), 4,4)
	x <- makeCacheMatrix(m)
	checkTrue(is.list(x))
	checkTrue(is.function(x$set))
	checkTrue(is.function(x$get))
	checkTrue(is.function(x$setsolve))
	checkTrue(is.function(x$getsolve))
}


test.cacheSolve <- function() {
	m <- matrix( sample(rnorm(1000), 16), 4,4)
	x <- makeCacheMatrix(m)
	r <- cacheSolve(x)
 	checkIdentical(r, solve(m))
}
