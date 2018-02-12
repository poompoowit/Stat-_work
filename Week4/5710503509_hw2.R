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
      #print(total[[j]])
    }
  }
  all_total = sum(unlist(total))
  #print(all_total)
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
for (i in 1:n){
  for (j in i+1:n){
    for (k in j+1:n){
      matrix = c()
      matrix = append(matrix,data[i])
      matrix = append(matrix,data[j])
      matrix = append(matrix,data[k])
      find_hypothesis_testing(matrix)
      print('book ('+ i + ',' + j + ',' +k+')'+':'+find_hypothesis_testing(matrix))
    }
  }
}
