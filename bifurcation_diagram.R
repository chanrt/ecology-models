# function
fn <- function(x, r)
{
  return (r * x * (1 - x))
}

# simulation parameters
x0 = 0.5
num_iterations = 1000
num_consider = 300

# range of r
r_start = 2.5
r_stop = 4
r_step = 0.001

simulator <- function(r, x0, num_iterations, num_consider){

  x = numeric(num_iterations)
  x[1] = x0
  for(i in 2:num_iterations)
  {
    x[i] = fn(x[i-1], r)
  }

  x[c((num_iterations - num_consider):num_iterations)]
}
# compiling the above function for faster speed
require(compiler)
simulator = cmpfun(simulator)

r_vec = seq(from = r_start, to = r_stop, by = r_step)
equilibrium_values <- sapply(r_vec, simulator, x0, num_iterations, num_consider)

r = rep(r_vec, each = (num_consider + 1))
plot(r, equilibrium_values, pch=".", col = rgb(0, 0, 0, 0.1), main = "Bifurcation Diagram")