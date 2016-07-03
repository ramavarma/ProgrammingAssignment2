# Introduction

Matrix inversion is usually a costly computation and there may be some benefit to caching the inverse of a matrix rather than compute it repeatedly (there are also alternatives to matrix inversion that we will not discuss here). Your assignment is to write a pair of functions that cache the inverse of a matrix.

# Caching the Inverse of a Matrix
### makeCacheMatrix
makeCacheMatrix function creates a special "matrix" object that can cache its inverse. The functon has following getter and setter methods to set the value 
- setMatrix: Sets the Matrix 
- getMatrix: Gets the Matrix that has been set
- setInverse: Sets the inverse of Matrix
- getInverse: Gets the inverse of the Matrix
 
        makeCacheMatrix <- function(x = matrix()) {
        
              invrse <- NULL
              setMatrix <- function(y){
                    message("Set Matrix called")
                    x <<- y
                    invrse <<- NULL
              }
              
              getMatrix <- function(){
                    message("Get Matrix called")
                    x
              }
              
              setInverse <- function(inverse) {
                    message("Set Inverse called")
                    invrse <<- inverse
                    return(inverse)
              }
              getInverse <- function() {
                    message("Get Inverse called")
                    invrse     
              }
              
              list(setMatrix = setMatrix,
                   getMatrix = getMatrix,
                   setInverse = setInverse,
                   getInverse = getInverse)
        }


### cacheSolve
The following function cacheSolve calculates the inverse of a inversable matrix. If the inverse has been already calculated, then it would get the cached value and will skip any further processing.

    cacheSolve <- function(x, ...) {
          invrse <- x$getInverse()
    
          if (!is.null(invrse)){
                message("Inverse available, providing cached data")
                return(invrse)
          }
          message("Inverse not available, hence calculating inverse")
          invMat <-x$getMatrix()
          invrse <- solve(invMat)
          x$setInverse(invrse)
          invrse
    }
## Executing the Functions to obtain inverse of a Matrix

> Create a Square matrix that in inversable. Solve handles only square matrix. For non-square systems use qr.solve

        z <- makeCacheMatrix(matrix(1:4, nrow=2, ncol=2))
> To Display the Matrix created

        z$getMatrix()
#### Output
    Get Matrix called
            [,1] [,2]
    [1,]    1    3
    [2,]    2    4

> To check if inverse exists

        z$getInverse()
#### Output

    Get Inverse called
    NULL

> NULL Indicates inverse does not exist, So cacheSolve(z) should set the cache

    cacheSolve(z)
#### Output

    Get Inverse called
    Inverse not available, hence calculating inverse
    Get Matrix called
    Set Inverse called
         [,1] [,2]
    [1,]   -2  1.5
    [2,]    1 -0.5
As expected, inverse is not available hence it calculated the inverse and then sets the inverse

> Let's check if inverse is set by calling z$getInverse()

    z$getInverse()
#### Output

    Get Inverse called
         [,1] [,2]
    [1,]   -2  1.5
    [2,]    1 -0.5

>Verified that inverse is set. Now when we call cacheSolve(z), Inverse will not be calculated, and the function will return previously calculated Inverse

    cacheSolve(z)

#### Output

    Get Inverse called
    Inverse available, providing cached data
         [,1] [,2]
    [1,]   -2  1.5
    [2,]    1 -0.5
Messages from respective functions prove that inverse was returned from cache

