## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

#Here I create the function that create a list that
#has a function to store the initial matrix
#has a function to get that matrix
#has a function to set the value of the inverse matrix
#has a function to get that inverse matrix 
makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinv <- function(inverse) inv <<- inverse
        getinv <- function() inv
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## Write a short comment describing this function

#Here I create a fuction that
#first looks into the object created by makeCacheMatrix to see
#if the inverse matrix is already available.
#It does that basically by checkink if the value of the object getinv in the 
#the list created by the makeCacheMatrix is not null.

#If that is the case then the fuction print "getting cached data" and print
#the value of the object getinv of the list created by the makeCacheMatrix
#that has now been assigned to the object inv.

#If that is not the case then the fuction get the matrix from the object
#get created by makeCacheMatrix and call it data
#The fucntion then create the object inv by calculation the inverse matrix
#of data
#It then store the inverse matrix in the object setinv originally created 
#by makeCacheMatrix
#Finally it returns the inverse matrix (which is called inv here)
#if that is the case the 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinv()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinv(inv)
        inv
}

