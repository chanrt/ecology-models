# alterable parameters
r = 3.25
skip_gens = 2

x_inits = seq(from = 0, to = 1, by = 0.01)
x_final = c()
  
for(x_init in x_inits) {
  x = x_init
  i = 0
  while(i < skip_gens) {
    # define your function here
    x = r * x * (1 - x)
    i = i + 1
  }
  x_final = c(x_final, x)
}

title_string = paste("Return map for separated by ", toString(skip_gens), " generations", sep = "")
y_label = paste("x_t+", toString(skip_gens), sep = "")
plot(x_inits, x_final, main = title_string, xlab = "x_t", ylab = y_label, type="l")
lines(c(0, 5), c(0, 5), type = "l")



