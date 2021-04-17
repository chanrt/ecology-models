# function
fn <- function(r, x)
{
  return (r * x * (1 - x))
}

# alterable parameters
x0 = 0.5
r = 3.1
num_iterations = 1000
start_gen = 1
skip_gens = 1

x = numeric(num_iterations)
x[1] = x0

for(i in 2:num_iterations) 
{
  x[i] = fn(r, x[i-1])
}

x_coords = c()
y_coords = c()
 
for(i in skip_gens+1:num_iterations)
{
  x_coords = c(x_coords, populations[i - skip_gens])
  y_coords = c(y_coords, populations[i])
}

title = paste("Return map of a time series with skip = ", toString(skip_gens), sep = "")
plot(x_coords, y_coords, xlab = "X_t", ylab = "X_t+skip", main = title)