# alterable parameters
x0 = 0.002
r = 0.2
num_iterations = 80

x = numeric(num_iterations)
x[1] = x0

for(i in 2:num_iterations) {
  x[i] = x[i-1] * exp(r * (1 - x[i-1]))
}

iterations = seq(from = 1, to = num_iterations, by = 1)
plot(iterations, x, main = "Simulation of Discrete Ricker Model", type = "l")