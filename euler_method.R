fn <- function()
{
  return (0)
}

# initial conditions
x0 = 0

# simulation parameters
T = 10
dt = 0.01
num_iterations = T / dt

x = numeric(num_iterations)
x[1] = x0

for(i in 2:num_iterations)
{
  x[i] = x[i-1] + fn() * dt
}

t = seq(from = dt, to = T, by = dt)
plot(t, x, type = "l", main = "Euler Method of Numerical Integration")


