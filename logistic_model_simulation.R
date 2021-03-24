# alterable parameters
init_x = 0.5
r = 3.5
num_iterations = 50

i = 0
x = init_x

populations = c(x)
iterations = c(i)

while(i < num_iterations) {
  x = r * x * (1 - x)
  i = i + 1
  populations = c(populations, x)
  iterations = c(iterations, i)
}

plot(iterations, populations, xlab = "Generation", ylab = "Population Density", main = "Simulation of Logistic Growth Model", type="l")