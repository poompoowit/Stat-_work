find_hypothesis_testing <-function(matrix) {
  row = length(matrix)
  col = 0
  multotal = TRUE
  total = list()
  sample_size = list()
  for (i in 1:row){
    col = lengths(matrix[i])
    sample_size = append(sample_size,sum(unlist(matrix[i])))
    if(multotal){
      total = list(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
      multotal = FALSE
    }
    for (j in 1:lengths(matrix[i])){
      total[[j]] = matrix[[i]][[j]] +total[[j]]
    }
  }
  all_total = sum(unlist(total))
  expected = list()
  for (i in 1:row){
    buf = list()
    for (j in 1:col){
      buf = append(buf,sample_size[[i]]*total[[j]]/all_total)
    }
    expected = append(expected,list(buf))
  }
  
  test_statistic = 0
  for (i in 1:row){
    for (j in 1:col){
      n = matrix[[i]][[j]]
      e = expected[[i]][[j]]
      test_statistic = ((n-e)**2)/e +test_statistic
    }
  }
  return(test_statistic)
}



setwd("C:/Users/poomp/Jupyter/Stat_work/Week4")
library(readr)
hw2_data <- read_csv("hw2_data.csv")
data = list()
for (i in 2:6){
  ar = hw2_data[i]
  buf = list()
  for(x in 1:10){
    buf = append(buf,ar[[x,1]])
  }
  data = append(data,list(buf))
}

n = 5
for (i in 0:(n-1)){
  if ((i+1)<=(n-1)){
  for (j in (i+1):(n-1)){
    if ((j+1)<=(n-1)){
    for (k in (j+1):(n-1)){
      matrix = c()
      matrix = append(matrix,data[i+1])
      matrix = append(matrix,data[j+1])
      matrix = append(matrix,data[k+1])
      hypo = find_hypothesis_testing(matrix)
      print(sprintf("book %i,%i,%i,%f", i+1, j+1,k+1,hypo))
    }
    }
  }
  }
}
