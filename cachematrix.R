## Put comments here that give an overall description of what your
## functions do


## this function returns a list that holds 4 functions.

## the set function helps set a diffrent matrix to invert
## it's y arrgument sets the x arrgument in it's parent(?) function
## also set function clears the value of the var m which holds the result of the 
## inverse of the matrix.

## the get function takes x as it's arrgument, when we call the function it will return
## the matrix.

## setinverse will be called in the cachSolve function and there it will recive
## the result of the matrix, after which it will assign to m var it's result.

## getinverse will return var m that holds the inverse matrix.

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) m <<- solve
    getinverse <- function() m
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)

}


## cachSolve takes in it's arrgument a list.
## the list has to be comprised of functions that makeCacheMatrix returns.

## the first var m takes the inverse matrix in the makeCacheMatrix m var.
## an if statment checks to see if me is NULL or not,
## if it isn't NULL it will return the inverse matrix and stops.

## if is NULL the function continues.
## var data takes the matrix in the list using the get function.
## var m takes the inverse matrix that is computed using the solve function on 
## the data var.

## than using the function setinverse in the list, the inverse matrix is assigned
## to the m var in makeCacheMatrix.
## cachSolve returns the m var inside it's own function.

cacheSolve <- function(x, ...) {
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
        ## Return a matrix that is the inverse of 'x'
}
