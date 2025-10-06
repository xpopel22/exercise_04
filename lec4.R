ReturnCoins <- function(M){
  while(M>0){
    if (M >= 50){
      c <- 50
    } else if (M >= 20){
      c <- 20
    } else if (M >= 10){
      c <- 10
    } else if (M >= 5){
      c <- 5
    } else if (M >= 2){
      c <- 2
    } else {
      c <- 1
    }
    n <- floor(M/c)
    print(paste("Give the customer the ", toString(n), " result of dividing ", toString(M), " by ", toString(c), " in ", toString(c), " CZK coins."))
    new_M <- M-n*c
    print(paste("Let ", toString(new_M), " be the remaining amount due the customer."))
    M <- new_M
  }
}

UniversalReturnCoins <- function(M, c){
  number_of_coins <- 0
  for (i in 1:length(c)){
    n <- floor(M/c[i])
    new_M <- M-n*c[i]
    number_of_coins <- number_of_coins + n
    M <- new_M
  }
  return(number_of_coins)
}

Chocolate <- function(M, r, c){
  if (r == nrow(M)){
    return(M[r, c])
  } else {
    bars <- M[r,c]
    down <- Chocolate(M, r + 1, c)
    diagonal <- Chocolate(M, r + 1, c + 1)
    return(max(down, diagonal) + bars)
  }
}

ChocolateIter <- function(M){
  r <- 1
  c <- 1
  bars <- M[r, c]
  while (r<nrow(M) && (c<ncol(M))){
    if (M[r + 1,c] > M[r + 1,c + 1]){
      r <- r + 1
    } else {
      r <- r + 1
      c <- c + 1
    }
    bars <- M[r, c] + bars
  }
  return(bars)
}

HanoiTowers <- function(n, fromPeg, toPeg){
  if (n == 1){
    print(paste("Move disc from peg ", toString(fromPeg), " to peg ", toString(toPeg)))
    return()
  }
  emptyPeg <- 6 - fromPeg - toPeg
  HanoiTowers((n - 1), fromPeg, emptyPeg)
  print(paste("Move disc from peg ", toString(fromPeg), " to peg ", toString(toPeg)))
  HanoiTowers((n - 1), emptyPeg, toPeg)
}

M <- 1899
c <- c(50, 30, 20, 10, 5, 2, 1)
ReturnCoins(M)
print(UniversalReturnCoins(M, c))
M <- matrix(c(3,1,5,1,0,4,3,2,0,0,0,6,0,0,0,7), nrow = 4, ncol = 4)
Chocolate(M, 1, 1)
ChocolateIter(M)
HanoiTowers(3, 1, 3)