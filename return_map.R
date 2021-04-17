# function
fn <- function(r, x)
{
  return (r * x * (1 - x))
}

# alterable parameters
r = 3.25
skip_gens = 2
x_start = 0
x_end = 1
x_step = 0.01

x_inits = seq(from = x_start, to = x_end, by = x_step)
num_points = abs((x_end - x_start)/x_step) + 1
x_final = numeric(num_points)
  
for(i in 1:num_points) {
  x = x_inits[i]
  gen = 0
  while(gen < skip_gens) {
    x = fn(r, x)
    gen = gen + 1
  }
  x_final[i] = x
}

title_string = paste("Return map for separated by ", toString(skip_gens), " generation(s)", sep = "")
y_label = paste("x_t+", toString(skip_gens), sep = "")

plot(x_inits, x_final, main = title_string, xlab = "x_t", ylab = y_label, type="l")
lines(c(0, 5), c(0, 5), type = "l")



