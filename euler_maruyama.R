fn <- function()
{
  return (0)
}

gn <- function()
{
  return (0)
}

noise <- function()
{
  return (rnorm(1, mean, sd))
}

# initial conditions
x0 = 0

# noise parameters
mean = 0
sd = 1

# simulation parameters
T = 10
dt = 0.01
num_iterations = T / dt

x = numeric(num_iterations)
x[1] = x0
sqrt_dt = sqrt(dt)

for(i in 2:num_iterations)
{
  x[i] = x[i-1] + fn() * dt + gn() * noise() * sqrt_dt
}

t = seq(from = dt, to = T, by = dt)
plot(t, x, type = "l", main = "Euler Maruyama Method of Numerical Integration")