n<-20
p<-0.4
x<-seq(0,n,1)
pdf<-dbinom(x,size=n,prob=p)
barplot(pdf)

x11()
cdf<-pbinom(x,size=n,prob=p)
barplot(pdf)

