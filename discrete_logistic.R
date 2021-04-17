# alterable parameters
x0 = 0.5
r = 3
num_iterations = 50

x = numeric(num_iterations)
x[1] = x0

for(i in 2:num_iterations) {
  x[i] = r * x[i-1] * (1 - x[i-1])
}

iterations = seq(from = 1, to = num_iterations, by = 1)
plot(iterations, x, main = "Simulation of Discrete Logistic Growth Model", type="l")