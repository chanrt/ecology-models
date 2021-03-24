# alterable parameters
init_x = 0.002
r = 0.2
num_iterations = 80

i = 0
x = init_x

iterations = c(i)
populations = c(init_x)

while(i < num_iterations) {
  x = x * exp(r * (1 - x))
  i = i + 1
  iterations = c(iterations, i)
  populations = c(populations, x)
}

plot(iterations, populations, xlab = "Generations", ylab = "Population Density", main = "Simulation of Ricker Model", type = "l")