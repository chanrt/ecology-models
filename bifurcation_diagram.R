# modified from https://magesblog.com/post/2012-03-17-logistic-map-feigenbaum-diagram/

# range of R0
my.R0 <- seq(0, 2.685, by = 0.001);

# alterable parameters
init_pop <- 0.1; 
num_iterations <- 1000; 
M <- 300;

discrete.logistic <- function(R0, x0, N, M){
  z <- 1:N;
  z[1] <- x0;
  for(i in c(1:(N-1))){
    # Type function here
    # z[i+1] <- R0 *z[i]  * (1 - z[i]);
    z[i+1] <- z[i] * exp(R0 * (1 - z[i]))
  }
  z[c((N-M+1):N)];
}

library(compiler) 
discrete.logistic <- cmpfun(discrete.logistic)

yfinal <- sapply(my.R0, discrete.logistic, init_pop, num_iterations, M)
yfinal <- as.vector(yfinal)
R0 <- sort(rep(my.R0, M)) 

plot(yfinal ~ R0, pch = '.', col = rgb(1,0,0,0.05), ylab = 'Final state')
