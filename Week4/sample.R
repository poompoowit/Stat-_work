n<-20
p<-0.4
x<-seq(0,n,1)
pdf<-dbinom(x,size=n,prob=p)
barplot(pdf)

x11()
cdf<-pbinom(x,size=n,prob=p)
barplot(pdf)

x11()
x2<-seq(-5,5,0.1)
pdf2<-dnorm(x2,mean=0,sd=1)
plot(x2,pdf2,type="l",col="blue",xlab="X",ylab="P(X)")


qnorm(0.95,mean=0,sd=1)
qnorm(0.9,mean=0,sd=1)
qnorm(0.99,mean=0,sd=1)
qnorm(0.99,mean=0,sd=1,lower.tail = FALSE)

plants <-c(0,1,2,3,4)
observed <- c(9,9,10,14,6)
df <- data.frame(plants,observed,stringsAsFactors = FALSE)

n<-48
p <- dpois(2,lambda = 2.1)
n*p

k=5
m=1
qchisq(0.05,df=k-1 ,lower.tail=FALSE)
qchisq(0.05,df=k-1-m ,lower.tail=FALSE)


qchisq(0.1,df=k-1 ,lower.tail=FALSE)
qchisq(0.1,df=k-1-m ,lower.tail=FALSE)
