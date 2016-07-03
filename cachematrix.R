## makeCacheMatrix function creates a special "matrix" object that can cache its inverse.
## The functon has following getter and setter methods to set the value
## setMatrix: Sets the Matrix to calculate inverse
## getMatrix: Gets the Matrix that has been set
## setInverse: Sets the inverse of Matrix
## getInverse: Gets the inverse of the Matrix

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


## The following function cacheSolve calculates the inverse of a inversable matrix.
## If the inverse has been already calculated, then it would get the cached
## value and will skip any further processing

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

