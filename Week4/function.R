find_hypothesis_testing <-function(matrix) {
  row = length(matrix)
  col = 0
  multotal = TRUE
  total = list()
  sample_size = list()
  for (i in 1:row){
    col = length(matrix[i])
    sample_size = append(sample_size,sum(matrix[i]))
    if(multotal){
      total = length(matrix[i])
      multotal = FALSE
    }
    for (j in 1:length(matrix[i])){
      total[j] = matrix[i][j] +total[j]
    }
  }
  all_total = sum(total)
  
  expected = list()
  for (i in 1:row){
    buf = list()
    for (j in 1:col){
      buf = append(buf,sample_size[i]*total[j]/all_total)
    }
    expected = append(expected,list(buf))
  }
  
  test_statistic = 0
  for (i in 1:row){
    for (j in 1:col){
      n = matrix[i][j]
      e = expected[i][j]
      test_statistic = ((n-e)**2)/e +test_statistic
    }
  }
  return(test_statistic)
}
