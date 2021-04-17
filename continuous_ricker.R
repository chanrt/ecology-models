# alterable parameters
x0 = 0.5
r = 3
T = 100
dt = 0.01
num_iterations = T / dt

x = numeric(num_iterations)
x[1] = x0

for(i in 2:num_iterations)
{
  x[i] = x[i-1] + exp(r * (1 - x[i-1])) * dt
}

time = seq(from = dt, to = T, by = dt)
plot(time, x, main = "Simulation of Continuous Ricker Model", type = "l")